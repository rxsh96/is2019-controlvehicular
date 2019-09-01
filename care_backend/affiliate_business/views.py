from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from affiliate_business.models import Affiliate_business
from affiliate_business.forms import BusinessForm
from django.urls import reverse_lazy
from bootstrap_modal_forms.generic import (BSModalCreateView,
                                           BSModalUpdateView,
                                           BSModalReadView,
                                           BSModalDeleteView)
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
# Create your views here.


# BUSINESS
class BusinessListView(ListView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_list.html'

class BusinessCreateView(CreateView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_create.html'
  fields = ['ruc','business_name','description','business_phone','city','legal_representative_name','legal_representative_lastname','address']
  success_url = reverse_lazy('negocio')

class BusinessDetailView(BSModalReadView):
  model = Affiliate_business  
  template_name = 'affiliate_business/business_detail.html'

class BusinessUpdateView(BSModalUpdateView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_update.html'
  form_class = BusinessForm
  success_message = 'Éxito: Negocio actualizado.'
  success_url = reverse_lazy('negocio')

class BusinessDeleteView(BSModalDeleteView):
    model = Affiliate_business
    template_name = 'affiliate_business/business_delete.html'
    success_message = 'Éxito: Negocio eliminado.'
    success_url = reverse_lazy('negocio')