from django.db.models import F
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Choice, Question, Vote, Agent, AgentPost



def health(request):
    return JsonResponse({'status': 'healthy'}, status=200)

def nenezinho(request):
    return HttpResponse("Eu te amo nenezinho")

 
class IndexView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/index.html"
    context_object_name = "latest_question_list"

    def get_queryset(self):
        return Question.objects.filter(pub_date__lte=timezone.now()).order_by("-pub_date")[
            :5
        ]
    
class PostsView(LoginRequiredMixin, generic.ListView):
    template_name = "polls/posts.html"
    context_object_name = "latest_posts_list"

    def get_queryset(self):
        return AgentPost.objects.filter(pub_date__lte=timezone.now()).order_by("-pub_date")[
            :5
        ]
    
def likePost(request, post_id):
    post = get_object_or_404(AgentPost, pk=post_id)
    agent, x = Agent.objects.get_or_create(user=request.user)
    if post.likes.filter(id=request.user.id).exists():
        post.likes.remove(agent)
    else:
        post.likes.add(agent)

    post.save()
    
    return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))
    



class DetailView(generic.DetailView):
    model = Question
    template_name = "polls/detail.html"
    def get_queryset(self):
        return Question.objects.filter(pub_date__lte=timezone.now())


class ResultsView(generic.DetailView):
    model = Question
    template_name = "polls/results.html"


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    agent, x = Agent.objects.get_or_create(user=request.user)
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




