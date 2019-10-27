from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from vehicle.models import Vehicle, Brand, Model
from django.core import validators
import datetime


class VehicleUpdateForm(BSModalForm):
  class Meta:
      model = Vehicle
      fields = '__all__'
  def clean_plate(self):
    plate = self.cleaned_data['plate']
    val = validators.RegexValidator(regex='^[A-Z]{3}-[0-9]{4}$', message ="Placa no valida! intente nuevamente")
    val(plate)
    return plate

def year_choices():
  return [(r,r) for r in range(1984, datetime.date.today().year+1)]


def current_year():
    return datetime.date.today().year

class VehicleCreateForm(forms.ModelForm):
  class Meta:
    model = Vehicle
    fields = '__all__'
    widgets = {
      'owner': forms.Select(attrs={'class':'form-control'}),
      'brand': forms.Select(attrs={'class':'form-control'}),
      'model': forms.Select(attrs={'class':'form-control'}),
      'plate': forms.TextInput(attrs={'class':'form-control'}),
      'color': forms.TextInput(attrs={'class':'form-control'}),
      'description': forms.Textarea(attrs={'class':'form-control','rows':5}),
      'km': forms.TextInput(attrs={'class':'form-control'}),
    }
  
  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    self.fields['model'].queryset = Model.objects.none()

    if 'brand' in self.data:
      try:
        brand_id = int(self.data.get('brand'))
        self.fields['model'].queryset = Model.objects.filter(brand_id=brand_id).order_by('model')
      except (ValueError, TypeError):
        pass  # invalid input from the client; ignore and fallback to empty City queryset
    elif self.instance.pk:
      self.fields['model'].queryset = self.instance.country.city_set.order_by('model')

  def clean_plate(self):
    plate = self.cleaned_data['plate']
    val = validators.RegexValidator(regex='^[A-Z]{3}-[0-9]{4}$', message ="Placa no valida! intente nuevamente")
    val(plate)
    return plate