from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from user.models import User


class UserCreateForm(forms.ModelForm):
  class Meta:
    model = User
    exclude = ('created','updated','is_active','is_staff')
    widgets = {
      'email': forms.EmailInput(attrs={'class':'form-control'}),
      'name': forms.TextInput(attrs={'class':'form-control'}),
      'lastname': forms.TextInput(attrs={'class':'form-control'}),
      'phone_number': forms.TextInput(attrs={'class':'form-control'}),
      'password': forms.PasswordInput(attrs={'class':'form-control'}),
    }

class UserUpdateForm(BSModalForm):
  class Meta:
      model = User
      fields = ['email','name','lastname','phone_number','is_active','is_staff']