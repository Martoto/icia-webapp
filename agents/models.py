from django.db import models
from polls.models import Agent, Question, QuestionGroup
from django.utils.text import slugify


class AgentClient(models.Model):
    owner = models.ForeignKey('auth.User', related_name='clients', on_delete=models.CASCADE)
    label = models.CharField(max_length=100)
    default_prompt = models.TextField(default="", max_length=500)
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

class AutoVote(models.Model):
    client_settings = models.ForeignKey(ClientSettings, on_delete=models.CASCADE)
    question_group = models.ForeignKey(QuestionGroup, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    total_votes = models.IntegerField(default=0)
    vote_count = models.IntegerField(default=0)
    active = models.BooleanField(default=True)


class AutoAgent(models.Model):
    autovote = models.ForeignKey(AutoVote, on_delete=models.CASCADE)
    agent = models.OneToOneField(Agent, on_delete=models.CASCADE)
    label = models.CharField(max_length=100)
    