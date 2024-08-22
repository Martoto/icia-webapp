from django.db.models import F
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from agents.models import AgentClient
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
    agentClient = AgentClient.objects.get_object_or_404(slug=agent)

    client   = openai.OpenAI(
    api_key  = agentClient.api_key,
    base_url = agentClient.base_url,   
    )

    try:
        question = Question.objects.get(pk=request.POST['question_id'])
    except:
        return HttpResponse(status=404)
    
    query = question.question_query + question.question_text

    messages = [
        {"role": "user", 
        "content": query},
    ]

    response = client.chat.completions.create(
        model="sabia-3",   
        messages=messages,
        temperature=0.7,
        max_tokens=512,
    )
    answer = response.choices[0].message.content
    return JsonResponse({'resposta': answer}, status=200)


