from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from affiliate_business.models import City, Province, Affiliate_business
from affiliate_business.forms import BusinessUpdateForm, BusinessCreateForm
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
class BusinessListView(ListView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_list.html'

class BusinessCreateView(CreateView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_create.html'
  form_class = BusinessCreateForm
  #success_url = reverse_lazy('negocio')
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('negocio'))

class BusinessDetailView(BSModalReadView):
  model = Affiliate_business  
  template_name = 'affiliate_business/business_detail.html'

class BusinessUpdateView(BSModalUpdateView):
  model = Affiliate_business
  template_name = 'affiliate_business/business_update.html'
  form_class = BusinessUpdateForm
  success_message = 'Éxito: Negocio actualizado.'
  success_url = reverse_lazy('negocio')

class BusinessDeleteView(BSModalDeleteView):
    model = Affiliate_business
    template_name = 'affiliate_business/business_delete.html'
    success_message = 'Éxito: Negocio eliminado.'
    success_url = reverse_lazy('negocio')

#Functions
def load_cities(request):
    province_id = request.GET.get('province')
    cities = City.objects.filter(province_id=province_id).order_by('city')
    return render(request, 'affiliate_business/city_dropdown_list_options.html', {'cities': cities})