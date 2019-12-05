from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from advertisement.models import Advertisement, Affiliate_business
from advertisement.forms import AdvertisementCreateForm
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


# Advertisement
@method_decorator([login_required,admin_required], name='dispatch')
class AdvertisementListView(ListView):
  model = Advertisement
  template_name = 'advertisement/advertisement_list.html'

@method_decorator([login_required,admin_required], name='dispatch')
class AdvertisementCreateView(CreateView):
  model = Advertisement
  template_name = 'advertisement/advertisement_create.html'
  form_class = AdvertisementCreateForm
  #success_url = reverse_lazy('negocio')
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('anuncios'))
