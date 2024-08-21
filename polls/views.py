from collections.abc import Sequence
from typing import Any
from django.db.models import F
from django.db.models.query import QuerySet
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Choice, Question, Vote, Agent, AgentPost, Estimate, Classification



def health(request):
    return JsonResponse({'status': 'healthy'}, status=200)

def nenezinho(request):
    return HttpResponse("Eu te amo nenezinho")

 
class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/index.html"
    context_object_name = "latest_question_list"
    paginate_by = 6

    def get_queryset(self):
        return Question.objects.filter(pub_date__lte=timezone.now()).order_by("-pub_date")
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'], _ = Agent.objects.get_or_create(user=self.request.user)

        return context


    
class PostsView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/posts.html"
    context_object_name = "latest_posts_list"

    def get_queryset(self):
        return AgentPost.objects.filter(pub_date__lte=timezone.now()).order_by("-pub_date")[
            :5
        ]
    
    

class DetailView(LoginRequiredMixin, generic.DetailView):
    model = Question
    template_name = "polls/detail.html"
    def get_queryset(self):
        return Question.objects.filter(pub_date__lte=timezone.now()).filter()
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'], _ = Agent.objects.get_or_create(user=self.request.user)
 
        return context


class ResultsView(LoginRequiredMixin, generic.DetailView):
    model = Question
    template_name = "polls/results.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        context['active_agent'], _ = Agent.objects.get_or_create(user=self.request.user)
 
        return context
    
class LeaderboardView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/leaderboard.html"
    model = Agent
    paginate_by = 10
    ordering = ['score']
   
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['active_agent'], _ = Agent.objects.get_or_create(user=self.request.user)
        context['active_agent_pos'] = list(self.object_list).index(context['active_agent'])+1

        return context


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
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
