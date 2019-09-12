from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from vehicle.models import Vehicle
from vehicle.forms import VehicleUpdateForm, VehicleCreateForm
from django.urls import reverse_lazy
from bootstrap_modal_forms.generic import (BSModalCreateView,
                                           BSModalUpdateView,
                                           BSModalReadView,
                                           BSModalDeleteView)
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponseRedirect
# Create your views here.


# BUSINESS
class VehicleListView(ListView):
  model = Vehicle
  template_name = 'vehicle/vehicle_list.html'

class VehicleCreateView(CreateView):
  model = Vehicle
  template_name = 'vehicle/vehicle_create.html'
  form_class = VehicleCreateForm
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('vehiculo'))

class VehicleDetailView(BSModalReadView):
  model = Vehicle  
  template_name = 'vehicle/vehicle_detail.html'

class VehicleUpdateView(BSModalUpdateView):
  model = Vehicle
  template_name = 'vehicle/vehicle_update.html'
  form_class = VehicleUpdateForm
  success_message = 'Éxito: Vehículo actualizado.'
  success_url = reverse_lazy('vehiculo')

class VehicleDeleteView(BSModalDeleteView):
    model = Vehicle
    template_name = 'vehicle/vehicle_delete.html'
    success_message = 'Éxito: Vehículo eliminado.'
    success_url = reverse_lazy('vehiculo')