import datetime
from django.db import models
from django.utils import timezone

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
    def was_published_recently(self):
        return timezone.now() - datetime.timedelta(days=1) <= self.pub_date <= timezone.now()

class Agent(models.Model):
    score = models.BigIntegerField(decimal_places=2)

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

class Vote():
    agent = models.ForeignKey(Agent, on_delete=models.CASCADE)
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE)
