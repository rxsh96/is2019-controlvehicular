from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from user.models import User
from django.core import validators
from django.contrib.auth.password_validation import validate_password


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

  def clean_phone_number(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    phone_number = self.cleaned_data['phone_number']
    val = validators.RegexValidator(regex='^(09)[0-9]{8}$',message="Número de teléfono no válido, intente nuevamente")
    val(phone_number)
    if User.objects.filter(phone_number=phone_number).exists():
      raise forms.ValidationError(_("El número de teléfono ya está registrado, prueba con otro."))
    return phone_number

  def clean_password(self):
        password = self.cleaned_data.get('password')
        try:
          validate_password(password, self.instance)
        except forms.ValidationError as error:
            # Method inherited from BaseForm
          self.add_error('password', error)
        return password
  
  def clean_name(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    name = self.cleaned_data['name']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Nombre no válido, no debe contener números")
    val(name)
    return name
  
  def clean_lastname(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    lastname = self.cleaned_data['lastname']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Nombre no válido, no debe contener números")
    val(lastname)
    return lastname

class UserUpdateForm(BSModalForm):
  class Meta:
    model = User
    fields = ['email','name','lastname','phone_number','is_active','is_staff']

  def clean_phone_number(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    phone_number = self.cleaned_data['phone_number']
    val = validators.RegexValidator(regex='^[0-9]{10}(001)$',message="Número de teléfono no válido, intente nuevamente")
    val(phone_number)
    if User.objects.filter(phone_number=phone_number).exists():
      raise forms.ValidationError(_("El número de teléfono ya está registrado, prueba con otro."))
    return phone_number
  
  def clean_name(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    name = self.cleaned_data['name']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Nombre no válido, no debe contener números")
    val(name)
    return name
  
  def clean_lastname(self):
    #cleaned_data = super(BusinessCreateForm, self).clean()
    lastname = self.cleaned_data['lastname']
    val = validators.RegexValidator(regex='^[a-zA-Z\s]+$',message="Nombre no válido, no debe contener números")
    val(lastname)
    return lastname