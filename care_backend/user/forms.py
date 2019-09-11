from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from user.models import User


class UserUpdateForm(BSModalForm):
  class Meta:
      model = User
      fields = ['email','name','lastname','phone_number','is_active','is_staff']