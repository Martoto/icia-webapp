from django.db import models
from polls.models import Agent


class AgentClient(models.Model):
    agent = models.OneToOneField(Agent, on_delete=models.CASCADE)
    label = models.TextField()
    api_key = models.CharField(max_length=100)
    base_url = models.URLField()

    
class ClientSettings(models.Model):
    client = models.ForeignKey(AgentClient, on_delete=models.CASCADE)
    model = models.TextField(max_length=100)
    temperature = models.IntegerField(default=10.0)
