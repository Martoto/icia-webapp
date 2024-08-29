from enum import Enum
from polls.models import Agent, QuestionGroup

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
    tp,tn = 0
    fp,fn = 0
    for est in agent.estimate_set.all():
        if est.get_correct():
            if est.get_side(): tp+=1
            else: tn +=1
        else:
            if est.get_side(): fp+=1
            else: fn +=1
    precision = tp / (tp+fp)
    recall = tp / (tp + fn)
    f1 = 2*tp/(2*tp + fp + fn)
    return precision, recall, f1


    