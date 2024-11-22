from django.db.models import F
from django.forms import ValidationError
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse, Http404
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.core.exceptions import PermissionDenied
from django.contrib.auth.mixins import LoginRequiredMixin
from agents.models import AgentClient, ClientSettings
from polls.views import Vote
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import openai

from polls.models import Question


class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "agents/index.html"
    context_object_name = "agent_list"

    def get_queryset(self):
        return AgentClient.objects.all()[
            :5
        ]
    
class DetailView(LoginRequiredMixin, generic.DetailView ):
    model = AgentClient
    template_name = "agents/detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['questions'] = Question.objects.all()
        context['active_question'] = Question.objects.filter(pk=self.request.GET.get('question', None))
        print(context['active_question'])
 
        return context
    

@login_required
def autonomous_vote(request, agent):
    question = get_object_or_404(Question, pk=request.POST.get('question_id', None))
    prompt = request.GET.get('prompt', 'qual a chance entre 0 a 100 deste e-mail ser fraudulento? tire a conclusão inteiramente pelo seu conhecimento sem alucinar nem responder nada além de um número entre 0 e 100') 
    answer = ""
    #classification question loop
    for i in question.classification_set.all():
        query = f"{prompt or ''}{question.question_text or ''}"
        print("Querying AI: " + query[0:50])
        answer = QueryAgent(query, agent)
        try:
            request.POST['classification'+str(i)] = answer.astype(float)
        except: 
            messages.warning(request, str(answer.content))
        

    Vote(request, question)
    return redirect("agents:detail", slug=agent)


        
    
def QueryAgent(query, agent, client_settings=None):
    agentClient = get_object_or_404(AgentClient, slug=agent)
    client_settings = get_object_or_404(ClientSettings, client=agentClient)


    client   = openai.OpenAI(
    api_key  = agentClient.api_key,
    base_url = agentClient.base_url,   
    )
    messages = [
        {"role": "tool", 
        "content": query},
    ]

    response = client.chat.completions.create(
        model=client_settings.model,   
        messages=messages,
        temperature=client_settings.temperature,
        max_tokens=50,
    )
    answer = response.choices[0].message.content
    print("Resposta IA: " + answer)
    return JsonResponse({'resposta': answer}, status=200)




