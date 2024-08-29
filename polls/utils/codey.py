from polls.models import Agent
from polls.utils.agentProfile import AgentProfile, getDistances

profile = AgentProfile(Agent.objects.last())
getDistances(profile)