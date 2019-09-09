from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView
from user.models import User
from user.forms import UserForm
from django.urls import reverse_lazy
from bootstrap_modal_forms.generic import (BSModalCreateView,
                                           BSModalUpdateView,
                                           BSModalReadView,
                                           BSModalDeleteView)
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
# Create your views here.


# BUSINESS
class UserListView(ListView):
  model = User
  template_name = 'user/user_list.html'

class UserDetailView(BSModalReadView):
  model = User  
  template_name = 'user/user_detail.html'

class UserUpdateView(BSModalUpdateView):
  model = User
  template_name = 'user/user_update.html'
  form_class = UserForm
  success_message = 'Éxito: Usuario actualizado.'
  success_url = reverse_lazy('usuario')

class UserDeleteView(BSModalDeleteView):
    model = User
    template_name = 'user/user_delete.html'
    success_message = 'Éxito: Usuario eliminado.'
    success_url = reverse_lazy('usuario')