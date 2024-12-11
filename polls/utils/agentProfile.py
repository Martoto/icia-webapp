from enum import Enum
import random
import traceback
from django.contrib.auth.models import User
from polls.models import Agent, AgentMetrics, Crowd, QuestionGroup
from dataclasses import dataclass
from skfuzzy import gaussmf
import numpy as np
from django.utils.translation import gettext as _


class ProfileReading(Enum):
    SUPER_PREDICTOR = (
        _("Congratulations! You are a very accurate predictor of fraud and definitely very able to discern fraudulent information apart from safe info"),
        _("You almost classified as a super predictor! You are great at telling apart what is real and what is fake"),
        _("Super")
    )
    GOOD_PREDICTOR = (
        _("You did a great job. You are not as accurate as a machine but you provided great human insight"),
        _("You were undeniably good, better than most"),
        _("Good")
    )
    PARANOID_PREDICTOR = (
        _("You are so wary of fraud to the point of ruling out safe information. Not everyone is out to get you, try to be more positive"),
        _("You are too sensitive to possible frauds. Lighten up!"),
        _("Paranoid")
    )
    NAIVE_PREDICTOR = (
        _("You are too trusting of all sorts of information. Perhaps you should leave some of your optimism behind and be more wary of frauds"),
        _("You are too relaxed around possible frauds. Be more aware!"),
        _("Naive")
    )
    RANDOM_PREDICTOR = (
        _("You were too uncertain and lacked confidence. Did you skip the test or are you too afraid to pick a side?"),
        _("You lacked confidence. Try to analyze each question more and pick a side based on evidence"),
        _("Random")
    )
    BAD_PREDICTOR = (
        _("You are not so good at classifying e-mails. Perhaps you didn't understand the instructions very well. "),
        _("You were not accurate at classifying. Apply yourself more"),
        _("Bad")
    )    
    MALICIOUS_PREDICTOR = (
        _("You are an agent of chaos deliberately trying to sabotage the test. That is the only explanation for your predictions!"),
        _("You were so innacurate that we belive you could be sabotaging the test"),
        _("Evil")
    )


def getDistances(profile):
    profile_data = np.array([[value for value in profile] for profile in profile.fraud_profiles.values()])
    profile_names = list(profile.fraud_profiles.keys())
    agent_profile = np.array(
        [float(profile.precision), 
        float(profile.recall), 
        float(profile.f1), 
        float(profile.p_certainty), 
        float(profile.f_certainty)])
    distances = np.linalg.norm(profile_data.astype(float) - agent_profile.astype(float), axis=1)
    return {name: float(distance) for name, distance in zip(profile_names, distances)}

class AgentProfile():
    fraud_profiles = {
        "SUPER_PREDICTOR": [1.0, 1.0, 1.0, 0.95, 0.0],
        "GOOD_PREDICTOR": [0.80, 0.85, 0.82, 0.85, 0.80],
        "PARANOID_PREDICTOR": [0.50, 0.95, 0.66, 0.60, 0.50],
        "NAIVE_PREDICTOR": [0.90, 0.50, 0.55, 0.70, 0.50],
        "RANDOM_PREDICTOR": [0.0, 0.0, 0.5, 0.01, 0.01],
        "BAD_PREDICTOR": [0.20, 0.30, 0.24, 0.30, 0.25],
        "MALICIOUS_PREDICTOR": [0.05, 0.10, 0.07, 0.10, 1.0]
    }

    precision: float
    recall: float
    f1: float
    p_certainty: float
    f_certainty: float
    flavorText = ""
    def __init__(self, precision, recall, f1, p_certainty, f_certainty):
        self.precision = precision
        self.recall = recall
        self.f1 = f1
        self.p_certainty = p_certainty
        self.f_certainty = f_certainty
    def __init__(self, agent):
        precision, recall, f1, p_certainty, f_certainty = getAgentProfile(agent)
        self.precision = precision
        self.recall = recall
        self.f1 = f1
        self.p_certainty = p_certainty
        self.f_certainty = f_certainty


def percentile_rank(scores, score):    
    rank = scores.index(score) + 1
    
    percentile = (rank / len(scores)) * 100.0
    
    return percentile


def getAgentProfile(agent):
    tp = fp = tn = fn = 0
    p_certainty = []
    f_certainty = []
    for est in agent.estimate_set.all():
        if est.get_correct():
            p_certainty.append(abs(est.value - est.classification.range/2)/50)
            if est.get_side(): tp+=1
            else: tn +=1
        else:
            f_certainty.append(abs(est.value - est.classification.range/2)/50)
            if est.get_side(): fp+=1
            else: fn +=1
    precision = tp / (tp+fp) if (tp+fp) > 0 else 0.0
    recall = tp / (tp + fn) if (tp+fn) > 0 else 0.0
    f1 = 2*tp/(2*tp + fp + fn) if (2*tp + fp + fn) >0 else 0.0
    p_certainty =  (sum(p_certainty) / len(p_certainty)) if len(p_certainty) > 0 else 0.0
    f_certainty = (sum(f_certainty) / len(f_certainty)) if len(f_certainty) > 0 else 0.0
    return precision, recall, f1, p_certainty, f_certainty

def updateAllProfiles():
    for agent in Agent.objects.all():
        profile, _ = AgentMetrics.objects.get_or_create(agent=agent)
        ap = AgentProfile(agent)
        profile.precision = ap.precision
        profile.recall = ap.recall
        profile.f1_score = ap.f1
        profile.p_certainty = ap.p_certainty
        profile.n_certainty = ap.f_certainty

        sortedDistances = dict(sorted(getDistances(ap).items(), key=lambda item: item[1]))
        dists = list(sortedDistances)
        profile.main_personality = ProfileReading[dists[0]].value[2]
        profile.secondary_personality = ProfileReading[dists[1]].value[2]
        profile.save()
        agent.save()

def delimitValue(value, upperLimit, lowerLimit):
    if value > upperLimit:
        return upperLimit
    if value < lowerLimit:
        return lowerLimit
    return value


def load_agents_fromCSV():
    import csv
    with open('polls/utils/agents.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        user = User.objects.get(pk=1)
        for row in reader:
            agent = Agent()
            crowd = Crowd()
            try:
                agent = Agent.objects.create(user=user)
                crowd = Crowd.objects.create(agent=agent, age=row['age'], name=row['name'], sex=row['sex'], duration=random.gauss(float(232,75), 100), email=row['email'])  
                for q in QuestionGroup.objects.first().questions.all():
                    for c in q.classification_set.all():
                        random_number = random.gauss(float(c.benchmark), 40)
                        agent.estimate_set.create(classification=c, value=delimitValue(random_number,100,0))
                agent.save()
                crowd.save()
                print(f"Agent {crowd.name} created")
            except Exception as e:
                if agent.pk:
                    agent.delete()
                if crowd.pk:
                    crowd.delete()
                print(f"Error creating agent {crowd.name}")
                print(e)

def clean_agents_fromCSV():
    import csv
    with open('polls/utils/agents.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        user = User.objects.get(pk=1)
        Agent.objects.filter(score=0).delete()
        for row in reader:
            try:
                crowd = Crowd.objects.get(email=row['email'])  
                crowd.agent.delete()
            except Exception as e:
                print(f"Error cleaning agent {row['name']}")
                print(e)
