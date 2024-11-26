from django.contrib import admin

from .models import AgentClient, ClientSettings

class SettingsInline(admin.StackedInline):
    model = ClientSettings
    extra = 1


class ClientAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {"fields": ["owner","label", "default_prompt"]}),
        ("Connection information", {"fields": ["base_url", "api_key"], "classes": ["collapse"]})
    ]
    inlines = [SettingsInline]

admin.site.register(AgentClient, ClientAdmin)
admin.site.register(ClientSettings)