from django.db import models
from django.contrib.auth.models import User


class AgentClient(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    api_key= models.CharField(),
    base_url= models.URLField(),  
    def get_score(self):
        return sum(v.choice.score for v in self.vote_set.all())