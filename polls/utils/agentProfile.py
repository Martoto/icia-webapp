from enum import Enum
from polls.models import Agent, QuestionGroup
from skfuzzy import gaussmf

#Use recall and precision
#Differentiate fraud and safe answers 
class fraudProfiles(Enum):
    #Accurate and precise
    SUPER_PREDICTOR = 1
    #Accurate not precise overall
    GOOD_PREDICTOR = 2
    #Not accurate for safe emails
    PARANOID_PREDICTOR = 3
    #Not accurate for fraud emails
    NAIVE_PREDICTOR = 4
    #Low scoring
    RANDOM_PREDICTOR = 5
    #Negative scoring
    BAD_PREDICTOR = 6
    #Perfect negative scoring
    MALICIOUS_PREDICTOR = 7


def getAgentProfile(agent):
    tp = fp = tn = fn = 0
    p_certainty = []
    f_certainty = []
    for est in agent.estimate_set.all():
        if est.get_correct():
            p_certainty.append(abs(est.value - est.classification.range/2))
            if est.get_side(): tp+=1
            else: tn +=1
        else:
            f_certainty.append(abs(est.value - est.classification.range/2))
            if est.get_side(): fp+=1
            else: fn +=1
    precision = tp / (tp+fp)
    recall = tp / (tp + fn)
    f1 = 2*tp/(2*tp + fp + fn)
    p_certainty =  sum(p_certainty) / len(p_certainty)
    f_certainty = sum(f_certainty) / len(f_certainty)
    return precision, recall, f1, p_certainty, f_certainty


    