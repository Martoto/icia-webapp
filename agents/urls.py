from django.urls import path, include


from . import views

app_name = "agents"
urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
    path("<slug:slug>/", views.DetailView.as_view(), name="detail"),
    path("<slug:agent>/autovote/", views.autonomous_vote, name="autovote"),

]