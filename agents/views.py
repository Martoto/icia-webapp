from django.db.models import F
from django.forms import ValidationError
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse, Http404
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from agents.models import AgentClient, ClientSettings
from polls.views import Vote
import openai

from polls.models import Question


class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "agents/index.html"
    context_object_name = "agent_list"

    def get_queryset(self):
        return AgentClient.objects.all()[
            :5
        ]

def AutonomousVote(request, agent):
    try:
        question = Question.objects.get(pk=request.POST['question_id'])
    except:
        raise Http404("AutoVote: Question not found")
    
    #classification question loop
    for i,c in enumerate(question.classification_set.all()):
        query = question.question_query + question.question_text + c.classification_text
        answer = QueryAgent(query, agent)
        try:
            request.POST['classification'+str(i)] = answer.astype(float)
        except: 
            raise ValidationError("AutoVote: AI response not adequate")
        
    #multiple choice question query
    query = question.question_query + question.question_text
    for c in question.choice_set.all():
        query += str(c.pk) + ": " + c.choice_text
    try:
        request.POST['choice'] = answer.astype(int)
    except: 
        raise ValidationError("AutoVote: AI response not adequate")
        
    Vote(request, question)

        
    
def QueryAgent(query, agent, client_settings=None):
    agentClient = AgentClient.objects.get_object_or_404(slug=agent)
    if client_settings == None:
        try:
            client_settings = ClientSettings.objects.get_object_or_404(agent=agent)
        except:     
            return JsonResponse({'resposta': 'ERRO',
                                 'erro': 'unconfigured AI client' }, status=400)

    client   = openai.OpenAI(
    api_key  = agentClient.api_key,
    base_url = agentClient.base_url,   
    )
    messages = [
        {"role": "icia_autovote", 
        "content": query},
    ]

    response = client.chat.completions.create(
        model=client_settings.model,   
        messages=messages,
        temperature=client_settings.temperature,
        max_tokens=512,
    )
    answer = response.choices[0].message.content
    return JsonResponse({'resposta': answer}, status=200)




