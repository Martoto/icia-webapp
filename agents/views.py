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
    
class DetailView(LoginRequiredMixin, generic.DetailView):
    model = AgentClient
    template_name = "agents/detail.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['questions'] = Question.objects.all()
        context['active_question'] = get_object_or_404(Question,pk=self.request.GET.get('question', None))
 
        return context
    

@login_required
def autonomous_vote(request, agent):
    question = get_object_or_404(Question, pk=request.POST.get('question_id', None))
    
    #classification question loop
    for i,c in enumerate(question.classification_set.all()):
        query = f"{question.question_query or ''}{question.question_text or ''}{c.classification_text or ''}"
        answer = QueryAgent(query, agent)
        try:
            request.POST['classification'+str(i)] = answer.astype(float)
        except: 
            return render(request, "polls/detail.html", {
                "agent": agent,
                "error_message": "Couldn't parse AI classification response",
            })
        
    #multiple choice question query
    query = f"{question.question_query or ''}{question.question_text or ''}"
    for c in question.choice_set.all():
        query += str(c.pk) + ": " + c.choice_text
    try:
        request.POST['choice'] = answer.astype(int)
    except: 
        return render(request, "polls/detail.html", {
            "agent": agent,
            "error_message": "Couldn't parse AI classification response",
        })
        
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




