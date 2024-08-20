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


class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "agents/index.html"
    context_object_name = "agent_list"

    def get_queryset(self):
        return AgentClient.objects.all()[
            :5
        ]

def CallAgent(request):
    client   = openai.OpenAI(
    api_key  = "107101460497365119020_eb0cf277026af427",
    base_url = "https://chat.maritaca.ai/api",   
    )

    messages = [
        {"role": "user", "content": "Quanto é 25 + 27?"},
    ]

    response = client.chat.completions.create(
        model="sabia-3",   
        messages=messages,
        temperature=0.7,
        max_tokens=512,
    )
    answer = response.choices[0].message.content
    return JsonResponse({'resposta': answer}, status=200)


