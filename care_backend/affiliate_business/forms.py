from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from affiliate_business.models import Affiliate_business, City
from django.utils.translation import ugettext as _
from django.core import validators



class BusinessUpdateForm(BSModalForm):
  class Meta:
    model = Affiliate_business
    fields = '__all__'

class BusinessCreateForm(forms.ModelForm):
  class Meta:
    model = Affiliate_business
    exclude = ('created','updated','lon','lat')
    widgets = {
      'ruc': forms.TextInput(attrs={'class':'form-control'}),
      'business_name': forms.TextInput(attrs={'class':'form-control'}),
      'description': forms.Textarea(attrs={'class':'form-control','rows':5}),
      'business_phone': forms.TextInput(attrs={'class':'form-control'}),
      'province': forms.Select(attrs={'class':'form-control'}),
      'city': forms.Select(attrs={'class':'form-control'}),
      'legal_representative_name': forms.TextInput(attrs={'class':'form-control'}),
      'legal_representative_lastname': forms.TextInput(attrs={'class':'form-control'}),
      'business_owner': forms.Select(attrs={'class':'form-control'}),
      'address': forms.TextInput(attrs={'class':'form-control'}),
    }
    
  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    self.fields['city'].queryset = City.objects.none()

    if 'province' in self.data:
      try:
        province_id = int(self.data.get('province'))
        self.fields['city'].queryset = City.objects.filter(province_id=province_id).order_by('city')
      except (ValueError, TypeError):
        pass  # invalid input from the client; ignore and fallback to empty City queryset
    elif self.instance.pk:
      self.fields['city'].queryset = self.instance.country.city_set.order_by('city')

  def clean_ruc(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    ruc = self.cleaned_data['ruc']
    val = validators.RegexValidator(regex='^[0-9]{10}(001)$',message="Ruc no válido, intente nuevamente")
    val(ruc)
    if Affiliate_business.objects.filter(ruc=ruc).exists():
      raise forms.ValidationError(_("El Ruc ya está registrado, prueba con otro."))
    return ruc

  def clean_legal_representative_name(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    legal_representative_name = self.cleaned_data['legal_representative_name']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Nombre no válido, no debe contener números")
    val(legal_representative_name)
    return legal_representative_name

  def clean_legal_representative_lastname(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    legal_representative_lastname = self.cleaned_data['legal_representative_lastname']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Apellido no válido, no debe contener números")
    val(legal_representative_lastname)
    return legal_representative_lastname