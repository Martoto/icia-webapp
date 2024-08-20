from django.urls import path, include


from . import views

app_name = "agents"
urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
]