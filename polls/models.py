import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.text import slugify



class Question(models.Model):
    question_query = models.TextField(null="true")
    question_text = models.TextField(max_length=5000)
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

    
class QuestionGroup(models.Model):
    questions = models.ManyToManyField(Question)
    label = models.CharField(max_length=30, null=True)
    slug = models.SlugField(unique=True, blank=True, editable=False)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.label)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.label

    

class Agent(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    score = models.IntegerField(default=0)

    def is_human(self):
        return not hasattr(self, 'agentclient')

    def update_score(self):
        self.score =  sum(v.choice.score for v in self.vote_set.all()) 
        self.score += sum(v.classification.score - abs(v.value - v.classification.benchmark) for v in self.estimate_set.all())
        self.save()

class Crowd(models.Model):
    agent = models.OneToOneField(Agent, on_delete=models.CASCADE)
    email = models.EmailField(primary_key=True)
    name = models.CharField(max_length=30)
    age = models.IntegerField(null=True)
    sex = models.CharField(null=True)
    duration = models.IntegerField(null=True)


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
    classification_text = models.CharField(max_length=200, null=True)
    range = models.DecimalField(max_digits=5,decimal_places=2, default=100.00)
    score = models.BigIntegerField(default=100)
    benchmark = models.DecimalField(max_digits=5,decimal_places=2, default=100.00)

    def get_estimate(self):
        estimates = self.estimate_set.all()
        return sum(estimate.value for estimate in estimates)/(estimates.count())
    #True if over 50%
    def get_side(self):
        return True if self.benchmark > self.range/2 else False
    

class Estimate(models.Model):
    agent = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    classification = models.ForeignKey(Classification, on_delete=models.CASCADE)
    value = models.DecimalField(max_digits=5,decimal_places=2,default=50.00)
    description = models.TextField(null=True, max_length=200) 

    def get_score(self):
        self.classification.score - abs(self.value - self.classification.benchmark)
    #True if over 50%
    def get_side(self):
        return True if self.value > self.classification.range/2 else False
    
    def get_correct(self):
        return True if self.get_side() == self.classification.get_side() else False
    
class AgentPost(models.Model):
    owner = models.ForeignKey(Agent, on_delete=models.CASCADE, db_index=True)
    likes = models.ManyToManyField(Agent, related_name="like_set")
    text = models.CharField(max_length=500)
    pub_date = models.DateTimeField("date published")
    def was_published_recently(self):
        return timezone.now() - datetime.timedelta(days=1) <= self.pub_date <= timezone.now()


@receiver(post_save, sender=Vote)
def update_agent_score(sender, instance, **kwargs):
    instance.agent.update_score()

@receiver(post_save, sender=Estimate)
def update_agent_score(sender, instance, **kwargs):
    instance.agent.update_score()
    

