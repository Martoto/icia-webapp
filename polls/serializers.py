from rest_framework import serializers
from .models import Question

class QuestionSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Question
        choices = Question.choice_set.all()
        fields = ["question_text", "pub_date"]