from django import forms
from django.utils.translation import gettext as _

class CrowdForm(forms.Form):
    name = forms.CharField(label=_("Name"), max_length=30)
    email = forms.EmailField(label=_("E-mail"), required=True)
