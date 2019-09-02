from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from vehicle.models import Vehicle


class VehicleForm(BSModalForm):
  class Meta:
      model = Vehicle
      fields = '__all__'