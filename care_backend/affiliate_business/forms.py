from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from api.models import Affiliate_business



class BusinessUpdateForm(BSModalForm):
  class Meta:
    model = Affiliate_business
    fields = '__all__'

class BusinessCreateForm(forms.ModelForm):
  class Meta:
    model = Affiliate_business
    exclude = ('created','updated',)
    widgets = {
      'ruc': forms.TextInput(attrs={'class':'form-control'}),
      'business_name': forms.TextInput(attrs={'class':'form-control'}),
      'description': forms.Textarea(attrs={'class':'form-control','rows':5}),
      'business_phone': forms.TextInput(attrs={'class':'form-control'}),
      'city': forms.TextInput(attrs={'class':'form-control'}),
      'legal_representative_name': forms.TextInput(attrs={'class':'form-control'}),
      'legal_representative_lastname': forms.TextInput(attrs={'class':'form-control'}),
      'address': forms.TextInput(attrs={'class':'form-control'}),
    }

  def clean_ruc(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    ruc = self.cleaned_data.get("ruc")
    if Affiliate_business.objects.filter(ruc=ruc).exists():
      raise forms.ValidationError("El RUC ya está registrado, prueba con otro.")
    return ruc