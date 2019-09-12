from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from vehicle.models import Vehicle
from django.core import validators


class VehicleUpdateForm(BSModalForm):
  class Meta:
      model = Vehicle
      fields = '__all__'
  def clean_plate(self):
    plate = self.cleaned_data['plate']
    val = validators.RegexValidator(regex='^[A-Z]{3}-[0-9]{4}$', message ="Placa no valida! intente nuevamente")
    val(plate)
    return plate

class VehicleCreateForm(forms.ModelForm):
  class Meta:
    model = Vehicle
    fields = '__all__'
    widgets = {
      'owner': forms.Select(attrs={'class':'form-control'}),
      'brand': forms.TextInput(attrs={'class':'form-control'}),
      'model': forms.TextInput(attrs={'class':'form-control'}),
      'plate': forms.TextInput(attrs={'class':'form-control'}),
      'color': forms.TextInput(attrs={'class':'form-control'}),
      'year': forms.TextInput(attrs={'class':'form-control'}),
      'description': forms.Textarea(attrs={'class':'form-control','rows':5}),
      'km': forms.TextInput(attrs={'class':'form-control'}),
    }

  def clean_plate(self):
    plate = self.cleaned_data['plate']
    val = validators.RegexValidator(regex='^[A-Z]{3}-[0-9]{4}$', message ="Placa no valida! intente nuevamente")
    val(plate)
    return plate