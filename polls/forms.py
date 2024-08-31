from django import forms
from django.utils.translation import gettext as _

class CrowdForm(forms.Form):
    SEX_CHOICES = [
        (_('M'), _("Male")),
        (_('F'), _("Female")),
        ('O', _('Other')),
    ]
    name = forms.CharField(label=_("Name"), max_length=30)
    email = forms.EmailField(label=_("E-mail"), required=True)
    sex = forms.ChoiceField(choices=SEX_CHOICES) 
    age = forms.IntegerField(max_value=140, min_value=6)
