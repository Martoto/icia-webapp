from django.db import models
from polls.models import Agent, Question
from django.utils.text import slugify


class AgentClient(models.Model):
    owner = models.ForeignKey('auth.User', related_name='clients', on_delete=models.CASCADE)
    label = models.CharField(max_length=100)
    slug = models.SlugField(unique=True, blank=True, editable=False)
    api_key = models.CharField(max_length=100)
    base_url = models.URLField()

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.label)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.label
    
class ClientSettings(models.Model):
    client = models.ForeignKey(AgentClient, on_delete=models.CASCADE)
    model = models.TextField(max_length=100)
    temperature = models.FloatField(default=1.0)

class AutoAgent(models.Model):
    agent = models.OneToOneField(Agent, on_delete=models.CASCADE)
    ClientSettings = models.ForeignKey(ClientSettings, on_delete=models.CASCADE)
    label = models.CharField(max_length=100)