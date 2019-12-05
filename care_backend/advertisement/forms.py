from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from advertisement.models import Advertisement
from django.utils.translation import ugettext as _
from django.core import validators



class AdvertisementCreateForm(forms.ModelForm):
  class Meta:
    model = Advertisement
    exclude = ('created','updated','banner')
    widgets = {
      'affiliate_business': forms.TextInput(attrs={'class':'form-control'}),
      'description': forms.TextInput(attrs={'class':'form-control','rows':5}),      
    }