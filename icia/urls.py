from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic.base import TemplateView 
from django.conf.urls.i18n import i18n_patterns

urlpatterns = [
    path('admin/', admin.site.urls),
    path('polls/', include('polls.urls')),
    path("accounts/", include("accounts.urls")),  
    path("accounts/", include("django.contrib.auth.urls")),  
    path("", TemplateView.as_view(template_name="home.html"), name="home"),
    path("about", TemplateView.as_view(template_name="about.html"), name="about"),
    path('agents/', include('agents.urls')),
    path('api-auth/', include('rest_framework.urls')),
    path('i18n/', include('django.conf.urls.i18n')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


