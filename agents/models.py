from django.db import models
from django.contrib.auth.models import User
from cryptographic_fields.fields import EncryptedCharField


class AgentClient(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE),
    label = models.TextField(),
    api_key = EncryptedCharField(max_length=100),
    base_url = models.URLField(),  


    
class ClientSettings(models.Model):
    client = models.ForeignKey(AgentClient, on_delete=models.CASCADE),
    model = models.TextField(max_length=100),
    temperature = models.IntegerField(default=10.0)
