from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from vehicle.models import Vehicle


class VehicleUpdateForm(BSModalForm):
  class Meta:
      model = Vehicle
      fields = '__all__'

class VehicleCreateForm(forms.ModelForm):
  class Meta:
      model = Vehicle
      fields = '__all__'#['brand','model','plate','color','year','description','km']