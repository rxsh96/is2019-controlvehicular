from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from business_owner.models import User
from django.core import validators
from django.utils.translation import ugettext as _
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth.forms import UserCreationForm


class UserOwnerCreateForm(forms.ModelForm):
  password = forms.CharField(label='Contraseña', widget=forms.PasswordInput)
  password2 = forms.CharField(label='Confirmación contraseña', widget=forms.PasswordInput)

  class Meta:
    model = User
    exclude = ('created','updated','is_active')
    widgets = {
      'email': forms.EmailInput(attrs={'class':'form-control'}),
      'name': forms.TextInput(attrs={'class':'form-control'}),
      'lastname': forms.TextInput(attrs={'class':'form-control'}),
      'phone_number': forms.TextInput(attrs={'class':'form-control'}),
      #'password': forms.PasswordInput(attrs={'class':'form-control'}),
      #'password2': forms.PasswordInput(attrs={'class':'form-control'}),
    }
  
  def clean_password2(self):
    password = self.cleaned_data.get("password")
    password2 = self.cleaned_data.get("password2")
    if password and password2 and password != password2:
      raise forms.ValidationError("Contraseña no coincide")
    return password2

  def save(self, commit=True):
    user = super().save(commit=False)
    user.set_password(self.cleaned_data["password"])
    if commit:
      user.save()
    return user

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

  def clean_email(self):
    email = self.cleaned_data.get("email")
    if User.objects.filter(email=email).exists():
      raise forms.ValidationError(_("El email ya está registrado, prueba con otro."))
    return email
  
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
