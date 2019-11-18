from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from business_owner.models import User
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