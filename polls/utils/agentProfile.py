from enum import Enum
from polls.models import Agent, QuestionGroup
from dataclasses import dataclass
from skfuzzy import gaussmf
import numpy as np

fraud_profiles = {
    "SUPER_PREDICTOR": [0.95, 0.90, 0.92, 0.95, 0.90],
    "GOOD_PREDICTOR": [0.80, 0.85, 0.82, 0.85, 0.80],
    "PARANOID_PREDICTOR": [0.50, 0.95, 0.66, 0.60, 0.70],
    "NAIVE_PREDICTOR": [0.90, 0.40, 0.55, 0.70, 0.50],
    "RANDOM_PREDICTOR": [0.50, 0.50, 0.50, 0.50, 0.50],
    "BAD_PREDICTOR": [0.20, 0.30, 0.24, 0.30, 0.25],
    "MALICIOUS_PREDICTOR": [0.05, 0.10, 0.07, 0.10, 0.15]
}


def getDistances(profile):
    profile_data = np.array([[value for value in profile] for profile in fraud_profiles.values()])
    profile_names = list(fraud_profiles.keys())
    agent_profile = np.array(
        [float(profile.precision), 
        float(profile.recall), 
        float(profile.f1), 
        float(profile.p_certainty), 
        float(profile.f_certainty)])
    distances = np.linalg.norm(profile_data.astype(float) - agent_profile.astype(float), axis=1)
    return {name: float(distance) for name, distance in zip(profile_names, distances)}

class AgentProfile():
    precision: float
    recall: float
    f1: float
    p_certainty: float
    f_certainty: float
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
    precision = tp / (tp+fp)
    recall = tp / (tp + fn)
    f1 = 2*tp/(2*tp + fp + fn)
    p_certainty =  (sum(p_certainty) / len(p_certainty)) if len(p_certainty) > 0 else 0.0
    f_certainty = (sum(f_certainty) / len(f_certainty)) if len(f_certainty) > 0 else 0.0
    return precision, recall, f1, p_certainty, f_certainty


    