from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from user.models import User
from user.forms import UserUpdateForm, UserCreateForm
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
from api.decorators import admin_required, business_owner_required
# Create your views here.


# USERS
@method_decorator([login_required,admin_required], name='dispatch')
class UserListView(ListView):
  model = User
  template_name = 'user/user_list.html'

@method_decorator([login_required,admin_required], name='dispatch')
class UserCreateView(CreateView):
  model = User
  template_name = 'user/user_create.html'
  form_class = UserCreateForm
  def form_valid(self,form):
    self.object = form.save(commit=False)
    self.object.save()
    return HttpResponseRedirect(reverse_lazy('usuario'))

@method_decorator([login_required,admin_required], name='dispatch')
class UserDetailView(BSModalReadView):
  model = User  
  template_name = 'user/user_detail.html'

@method_decorator([login_required,admin_required], name='dispatch')
class UserUpdateView(BSModalUpdateView):
  model = User
  template_name = 'user/user_update.html'
  form_class = UserUpdateForm
  success_message = 'Éxito: Usuario actualizado.'
  success_url = reverse_lazy('usuario')

@method_decorator([login_required,admin_required], name='dispatch')
class UserDeleteView(BSModalDeleteView):
    model = User
    template_name = 'user/user_delete.html'
    success_message = 'Éxito: Usuario eliminado.'
    success_url = reverse_lazy('usuario')