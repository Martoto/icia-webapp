from django.contrib import admin

from .models import Choice, Question, Agent, Classification, QuestionGroup


class ChoiceInline(admin.StackedInline):
    model = Choice
    extra = 2

class ClassificationInline(admin.StackedInline):
    model = Classification
    extra = 1 


class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {"fields": ["question_text"]})
    ]
    inlines = [ChoiceInline, ClassificationInline]



class GroupAdmin(admin.ModelAdmin):
    list_display = ('label',)
    filter_horizontal = ('questions',)

admin.site.register(QuestionGroup, GroupAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)
admin.site.register(Agent)