from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from business_owner.models import User,Vehicle,Brand, Model,MaintenanceDetails,Maintenance_Type,Maintenance
from business_owner.forms import UserOwnerCreateForm
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from bootstrap_modal_forms.generic import (BSModalCreateView,BSModalUpdateView,BSModalReadView,
BSModalDeleteView)
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponseRedirect
from api.decorators import business_owner_required

# Create your views here.

#USERS
@method_decorator([login_required,business_owner_required], name='dispatch')
class UserOwnerListView(ListView):
  model = User
  template_name = 'business_owner/user_list_owner.html'
  queryset = User.objects.filter(is_staff=False,is_business_owner=False,is_superuser=False)


@method_decorator([login_required,business_owner_required], name='dispatch')
class UserOwnerCreateView(CreateView):
  model = User
  template_name = 'business_owner/user_create_owner.html'
  form_class = UserOwnerCreateForm
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('usuario_owner'))

@method_decorator([login_required,business_owner_required], name='dispatch')
class UserOwnerDetailView(BSModalReadView):
  model = User  
  template_name = 'business_owner/user_detail_owner.html'


#VEHICLES
@method_decorator([login_required,business_owner_required], name='dispatch')
class VehicleClientListView(ListView):
  model = Vehicle
  template_name = 'business_owner/vehicle_list_owner.html'

  def get_queryset(self):
    return Vehicle.objects.filter(owner=self.kwargs['pk'])
  #queryset = User.objects.filter(owner=self.request.)

@method_decorator([login_required,business_owner_required], name='dispatch')
class MaintenanceDetailView(ListView):
  model = MaintenanceDetails  
  template_name = 'business_owner/maintenance_detail.html'

  def get_queryset(self):
    return MaintenanceDetails.objects.filter(vehicle=self.kwargs['pk'])