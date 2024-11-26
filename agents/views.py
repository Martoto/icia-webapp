from django.db.models import F
from django.forms import ValidationError
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse, Http404
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.core.exceptions import PermissionDenied
from django.contrib.auth.mixins import LoginRequiredMixin
from agents.models import AgentClient, AutoAgent, AutoVote, ClientSettings
from polls.views import Vote
from django.utils.translation import gettext as _
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import openai

from polls.models import Agent, Estimate, Question, QuestionGroup


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
 
        return context
    
class VotingView(LoginRequiredMixin, generic.DetailView ):
    model = AgentClient
    template_name = "agents/vote.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        if (self.request.GET.get('question', None) is not None):
                    context['active_question'] = QuestionGroup.objects.filter(pk=self.request.GET.get('question', None))
        if (self.request.GET.get('settings', None) is not None):
                    context['active_settings'] = ClientSettings.objects.filter(pk=self.request.GET.get('settings', None))            
        context['settingsList'] = ClientSettings.objects.filter(client=super().get_object())
        context['questions'] = QuestionGroup.objects.all()
 
        return context
    

@login_required
def autonomous_vote(request, agent):
    if request.method == 'POST':
        question_group = QuestionGroup.objects.get(pk=request.POST.get('question_id', None))
        question_list = question_group.questions.all()
        autonomous_vote = AutoVote.objects.create(question_group=question_group, client_settings=ClientSettings.objects.get(pk=request.POST.get('settings_id', None)))
        auto_agent = AutoAgent.objects.create(autovote=autonomous_vote, agent=Agent.objects.create(), label=request.POST.get('label', ''))
        messages.info(request, str(_("The agent has begun answering")))
        prompt = request.POST.get('prompt', None) 
        if prompt == None or prompt == "":
            prompt = Agent.objects.get(pk=request.POST.get('agent_id', None)).default_prompt 
        for q in question_list:
            query = f"{prompt or ''}{q.question_text or ''}"
            print("Querying AI: " + query[0:50])
            response = QueryAgent(query, agent, request.POST.get('settings_id', None))
            answer = str(response.content.decode('utf-8'))
            answer = float(answer) if answer.isnumeric() else None
            i = 0
            while answer is None:
                i += 1
                response = QueryAgent(query, agent, request.POST.get('settings_id', None))
                answer = str(response.content.decode('utf-8')).strip()
                print("Resposta IA: " + answer)
                answer = float(answer) if answer.isnumeric() else None
                if i > 5 and answer is None:
                    raise Http404(_("The AI could not answer the question"))


            estimate = Estimate.objects.create(agent=auto_agent.agent, classification=q.classification_set.first(), value=float(answer))
            autonomous_vote.save()
            auto_agent.save()
            estimate.save()

        return redirect("polls:test_resultAdmin", slug=question_group.slug)
    else:
        raise Http404("Method not allowed")
    


        
    
def QueryAgent(query, agent, client_settings=None):
    agentClient = get_object_or_404(AgentClient, slug=agent)
    client_settings = ClientSettings.objects.get(pk=client_settings, client=agentClient)


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
    return HttpResponse(answer, status=200)




