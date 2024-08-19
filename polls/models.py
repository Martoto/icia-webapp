import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date published")
    def was_published_recently(self):
        return timezone.now() - datetime.timedelta(days=1) <= self.pub_date <= timezone.now()

class Agent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    def get_score(self):
        return sum(v.choice.score for v in self.vote_set.all())

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    score = models.BigIntegerField(default=1)
    def get_votes(self):
        return self.vote_set.all().len

class Vote():
    agent = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE)

