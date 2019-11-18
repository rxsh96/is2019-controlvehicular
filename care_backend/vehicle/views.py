from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from vehicle.models import Vehicle,Brand, Model
from vehicle.forms import VehicleUpdateForm, VehicleCreateForm
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from bootstrap_modal_forms.generic import (BSModalCreateView,
                                           BSModalUpdateView,
                                           BSModalReadView,
                                           BSModalDeleteView)
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponseRedirect
from api.decorators import admin_required
# Create your views here.


# VEHICLE
@method_decorator([login_required,admin_required], name='dispatch')
class VehicleListView(ListView):
  model = Vehicle
  template_name = 'vehicle/vehicle_list.html'
  paginate_by = 10

@method_decorator([login_required,admin_required], name='dispatch')
class VehicleCreateView(CreateView):
  model = Vehicle
  template_name = 'vehicle/vehicle_create.html'
  form_class = VehicleCreateForm
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('vehiculo'))

@method_decorator([login_required,admin_required], name='dispatch')
class VehicleDetailView(BSModalReadView):
  model = Vehicle  
  template_name = 'vehicle/vehicle_detail.html'

@method_decorator([login_required,admin_required], name='dispatch')
class VehicleUpdateView(BSModalUpdateView):
  model = Vehicle
  template_name = 'vehicle/vehicle_update.html'
  form_class = VehicleUpdateForm
  success_message = 'Éxito: Vehículo actualizado.'
  success_url = reverse_lazy('vehiculo')

@method_decorator([login_required,admin_required], name='dispatch')
class VehicleDeleteView(BSModalDeleteView):
    model = Vehicle
    template_name = 'vehicle/vehicle_delete.html'
    success_message = 'Éxito: Vehículo eliminado.'
    success_url = reverse_lazy('vehiculo')

#Functions
def load_models(request):
    brand_id = request.GET.get('brand')
    models = Model.objects.filter(brand_id=brand_id).order_by('model')
    return render(request, 'vehicle/model_dropdown_list_options.html', {'models': models})