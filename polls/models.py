import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class Question(models.Model):
    question_text = models.TextField(max_length=5000)
    pub_date = models.DateTimeField("date published")
    available = models.BooleanField(default=True)
    def get_voting_agents(self):
        ret = []
        for c in self.choice_set.all():
            for v in c.vote_set.all():
                ret.append(v.agent)
        for c in self.classification_set.all():
            for v in c.estimate_set.all():
                ret.append(v.agent)        
        return ret
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

class Vote(models.Model):
    agent = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE)
    description = models.TextField(null=True, max_length=200)

class Classification(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    range = models.DecimalField(max_digits=5,decimal_places=2, default=100.00)
    score = models.BigIntegerField(default=1)
    def get_estimate(self):
        estimates = self.estimate_set.all()
        return sum(estimate.value for estimate in estimates)/(estimates.len)

class Estimate(models.Model):
    agent = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    classification = models.ForeignKey(Classification, on_delete=models.CASCADE)
    value = models.DecimalField(max_digits=5,decimal_places=2,default=50.00)
    description = models.TextField(null=True, max_length=200)

class AgentPost(models.Model):
    owner = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    likes = models.ManyToManyField(Agent, related_name="like_set")
    text = models.CharField(max_length=500)
    pub_date = models.DateTimeField("date published")
    def was_published_recently(self):
        return timezone.now() - datetime.timedelta(days=1) <= self.pub_date <= timezone.now()



    

