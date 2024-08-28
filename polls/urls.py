from django.urls import path, include


from . import views

app_name = "polls"
urlpatterns = [
    path("", views.IndexView.as_view(), name="index"),
    path("<int:pk>/", views.DetailView.as_view(), name="detail"),
    path("<int:pk>/results/", views.ResultsView.as_view(), name="results"),
    path("<int:question_id>/vote/", views.vote, name="vote"),
    path("leaderboard/", views.LeaderboardView.as_view(), name="leaderboard"),
    path('test/<slug:slug>', views.TestView.as_view(), name='test'),
    path('crowds/', views.crowdsForm, name='crowds'),
    path('health/', views.health, name='health'),
    path('nenezinho/', views.nenezinho, name='nenezinho'),
]