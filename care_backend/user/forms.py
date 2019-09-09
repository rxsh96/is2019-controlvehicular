from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from user.models import User


class UserForm(BSModalForm):
  class Meta:
      model = User
      fields = '__all__'