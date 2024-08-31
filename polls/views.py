from collections.abc import Sequence
from typing import Any
from django.db import IntegrityError
from django.db.models import F
from django.db.models.query import QuerySet
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone, translation
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.utils.translation import gettext as _
from django.contrib.sessions.models import Session
from .models import Choice, Question, Vote, Agent, AgentPost, Estimate, Classification, Crowd, QuestionGroup
from .forms import CrowdForm
from .utils.agentProfile import AgentProfile, ProfileReading, getDistances, percentile_rank


def health(request):
    return JsonResponse({'status': 'healthy'}, status=200)

def nenezinho(request):
    return HttpResponse("Eu te amo nenezinho")

 
class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/index.html"
    context_object_name = "latest_question_list"
    paginate_by = 6

    def get_queryset(self):
        return Question.objects.all().order_by('pk')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'] = Agent.objects.filter(user=self.request.user)

        return context


    
class PostsView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/posts.html"
    context_object_name = "latest_posts_list"

    def get_queryset(self):
        return AgentPost.objects.filter(pub_date__lte=timezone.now()).order_by("-pub_date")[
            :5
        ]
    

class TestListView(generic.ListView):
    template_name = "polls/testList.html"
    context_object_name = "test_list"
    paginate_by = 6

    def get_queryset(self):
        return QuestionGroup.objects.all()
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        return context
class TestView(generic.DetailView):
    model = QuestionGroup
    template_name = "polls/test.html"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["form"] = CrowdForm()
        thisUser = Agent.objects.filter(pk=self.request.session.get('quizUser', None))
        if thisUser.exists(): 
            context['active_agent'] = thisUser.first()
        return context
    
def crowdsForm(request):
    if request.method == "POST":
        form = CrowdForm(request.POST)
        if form.is_valid():
            try:
                new_crowd = Crowd(agent = Agent(user=User.objects.filter(is_superuser=True).first()),
                    name=form.name, 
                    email=form.email,
                    session=request.session)
                new_crowd.save()
                return HttpResponseRedirect(reverse("polls:test"))
            except:
                return render(request, "polls/detail.html", {
                    "error_message": _("Fail"),
                })            
    else:
        form = CrowdForm()

    return render(request, "polls/crowdsForm.html", {"form": form})
    
    

class DetailView(LoginRequiredMixin, generic.DetailView):
    model = Question
    template_name = "polls/detail.html"
    def get_queryset(self):
        return Question.objects.all()
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'], _ = Agent.objects.filter(user=self.request.user)
 
        return context


class ResultsView(LoginRequiredMixin, generic.DetailView):
    model = Question
    template_name = "polls/results.html"
    paginate_by = 1

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'] = Agent.objects.filter(user=self.request.user).first()
 
        return context
    
class LeaderboardView(generic.ListView):
    template_name = "polls/leaderboard.html"
    model = Agent
    paginate_by = 10
    ordering = ['-score']

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        thisUser = Agent.objects.filter(pk=self.request.session.get('quizUser', None))
        if thisUser.exists(): 
            context['active_agent'] = thisUser.first()
            context['active_agent_pos'] = list(self.object_list).index(context['active_agent'])+1

        return context
    
class TestResultView(generic.DetailView):
    template_name = "polls/testResult.html"
    model = QuestionGroup

    def get_context_data(self, **kwargs):
        translation.activate(self.request.LANGUAGE_CODE)
        context = super().get_context_data(**kwargs)
        thisUser = Agent.objects.filter(pk=self.request.session.get('quizUser', None))
        if thisUser.exists(): 
            agent = thisUser.first()
            context['active_agent'] = agent
            context['agent_profile'] = AgentProfile(agent)
            context['profile_distances'] = getDistances(context['agent_profile'])
            sortedDistances = dict(sorted(context['profile_distances'].items(), key=lambda item: item[1]))
            dists = list(sortedDistances)
            context['main_personality'] = _(ProfileReading[dists[0]].value[0]) 
            context['second_personality'] = _(ProfileReading[dists[1]].value[1]) 
            context['personality'] = ProfileReading[dists[0]].value[2]
            context['personality_translated'] = _(ProfileReading[dists[0]].value[2])  
            scores = []
            for agent in Agent.objects.all().order_by('score'): scores.append(agent.score)
            context['n_answers'] = len(scores)
            context['top_percent'] = percentile_rank(scores, agent.score)

        return context

def submitTest(request, group_id, agent=None):
    group = get_object_or_404(QuestionGroup, pk=group_id)
    form = CrowdForm(request.POST)
    if form.is_valid():
        try:
            hasAnswered = request.session.get('answered'+str(group_id),False)
            if not hasAnswered:
                newAgent = Agent(user=User.objects.filter(is_superuser=True).first())
                newAgent.save()
                new_crowd = Crowd( 
                    agent = newAgent,               
                    name=form.cleaned_data['name'], 
                    email=form.cleaned_data['email'],
                    age=form.cleaned_data['age'],
                    sex=form.cleaned_data['sex']
                    )
                new_crowd.save()
                request.session['answered'+str(group_id)] = True
                request.session['quizUser'] = newAgent.pk
                for question in group.questions.all():
                    for c in question.classification_set.all():
                        estimate, x = Estimate.objects.get_or_create(agent=newAgent, 
                                                            classification=c, 
                                                            value=request.POST.get("classification"+str(question.pk), 50.0),
                                                            description=request.POST["description"+str(question.pk)],
                                                            )
                        estimate.save()
            return HttpResponseRedirect(reverse("polls:test_result", args=[group.slug,]))
        except TypeError as e:
            return render(request, "polls/test.html", {
                "form": CrowdForm(),
                "questiongroup": group,
                "error_message": e,
            })      
            
    return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))




def vote(request, question_id, agent=None):
    question = get_object_or_404(Question, pk=question_id)
    if agent == None:
        agent, x = Agent.objects.get_or_create(user=request.user)
    if question.classification_set.count() > 0:
        for c in question.classification_set.all():
            estimate, _ = Estimate.objects.get_or_create(agent=agent, classification=c, value=request.POST.get("classification"+str(c.pk), 50.0))
        return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))
    if question.choice_set.count() > 0:
        try:
            selected_choice = question.choice_set.get(pk=request.POST["choice"])
        except (KeyError, Choice.DoesNotExist):
            return render(request, "polls/detail.html", {
                "question": question,
                "error_message": "You didn't select a choice.",
            })
        else:
            vote, _ = Vote.objects.get_or_create(agent=agent, choice=selected_choice)

    return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))



################################ - API SPECS - #############################################

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions
from .serializers import QuestionSerializer

class TodoListApiView(APIView):
    # add permission to check if user is authenticated
    permission_classes = [permissions.IsAuthenticated]

    # 1. List all
    def get(self, request, *args, **kwargs):
        '''
        List all the Question items
        '''
        list = Question.objects.filter(available = True)
        serializer = QuestionSerializer(list, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    # 2. Create
    def post(self, request, *args, **kwargs):
        '''
        Create the Question with given Question data
        '''
        data = {
            'task': request.data.get('task'), 
            'completed': request.data.get('completed'), 
            'user': request.user.id
        }
        serializer = QuestionSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
