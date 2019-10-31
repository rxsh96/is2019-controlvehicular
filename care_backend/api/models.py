from django.db import models
from model_utils.fields import StatusField
from model_utils import Choices
from django.utils import timezone
from api.manager import UserManager
from django.utils.translation import gettext as _
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, \
                                        PermissionsMixin
import datetime
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.translation import ugettext_lazy as _

class User(AbstractBaseUser, PermissionsMixin):
	'''Custom User Model that supports using email instead of username'''
	email=models.EmailField(max_length=255, unique=True)
	name=models.CharField(max_length=255)
	lastname=models.CharField(max_length=255)
	phone_number=models.CharField(max_length=10)
	is_active=models.BooleanField(default=True, blank=True)
	is_staff=models.BooleanField(default=False, blank=True)
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")
	
	objects=UserManager()
	USERNAME_FIELD='email'

class ProfilePicture(models.Model):
	creation_date = models.DateTimeField(auto_now_add=True, editable=False)
	modified_date = models.DateTimeField(auto_now=True)
	file = models.ImageField(blank=False, null=False, upload_to="profilepic")	
	user = models.ForeignKey(User,on_delete = models.CASCADE)

	def __str__(self):
		return self.file.name

class Province(models.Model):
	province = models.CharField(max_length=254)

	def __str__(self):
		return self.province

class City(models.Model):
	city = models.CharField(max_length=254)
	province = models.ForeignKey(Province, on_delete=models.CASCADE)
	
	def __str__(self):
		return self.city

class Brand(models.Model):
	brand = models.CharField(max_length=254)

	def __str__(self):
		return self.brand

class Model(models.Model):
	model = models.CharField(max_length=254)
	brand = models.ForeignKey(Brand, on_delete=models.CASCADE)

	def __str__(self):
		return self.model

"""class EmployeeAccount(models.Model):
	id_number = models.CharField(max_length=10, unique=True)
	name = models.CharField(max_length=255)
	last_name = models.CharField(max_length=255)
	dob = models.DateField()
	is_admin = models.BooleanField(default=False)
	profession = models.CharField(max_length=50, default="")
	account = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
"""
class Affiliate_business(models.Model):
	ruc = models.CharField(max_length=13, unique=True)
	business_name = models.CharField(max_length=255)
	description = models.TextField(max_length=255,null=True, blank=True)
	business_phone = models.CharField(max_length=13)
	province = models.ForeignKey(Province, on_delete=models.SET_NULL, null=True)
	city = models.ForeignKey(City, on_delete=models.SET_NULL, null=True)
	legal_representative_name = models.CharField(max_length=255)
	legal_representative_lastname = models.CharField(max_length=255)
	address = models.CharField(max_length=255)
	""" contact_name = models.CharField(max_length=255)
	contact_lastname = models.CharField(max_length=255)
	contact_work_position = models.CharField(max_length=255)
	contact_phone_number = models.CharField(max_length=13) """
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

	def __str__(self):
		return self.business_name

class Vehicle(models.Model):
	YEAR_CHOICES = [(y,y) for y in range(1960, (datetime.date.today().year)+2)]
	owner = models.ForeignKey(User, on_delete = models.CASCADE, null=True, blank=True)
	brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True)
	model = models.ForeignKey(Model, on_delete=models.SET_NULL, null=True)
	plate = models.CharField(max_length=10)
	color = models.CharField(max_length=20)
	""" engine = models.CharField(max_length=25,default="") """
	year = models.IntegerField(choices=YEAR_CHOICES,default=datetime.datetime.now().year,)
	description = models.TextField(max_length=255, default="")
	km = models.CharField(max_length=20)
	is_active = models.BooleanField(default=True)
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")
	imageURL = models.CharField(max_length=500, null=True, blank=True)

class Maintenance(models.Model):
	description = models.TextField(max_length=255, default="")
	m_type = models.CharField(max_length=255, primary_key=True)

class MaintenanceDetails(models.Model):
	maintenance = models.ForeignKey(Maintenance, on_delete = models.CASCADE)
	vehicle = models.ManyToManyField(Vehicle)
	local = models.ForeignKey(Affiliate_business, null=True, blank=True, on_delete = models.CASCADE)
	date =  models.DateTimeField()
	price = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)

class Travel(models.Model):
	vehicle = models.ForeignKey(Vehicle, null=True, blank=True, on_delete = models.CASCADE)
	description = models.TextField(max_length=255, default="")
	start_place = models.CharField(max_length=255)
	end_place = models.CharField(max_length=255)
	start_km = models.PositiveIntegerField(blank=True, null=True)
	final_km = models.PositiveIntegerField(blank=True, null=True)
	start_time = models.TimeField()
	end_time = models.TimeField(blank=True, null=True)	
	is_active = models.BooleanField(default=True)
	no_passanger = models.PositiveSmallIntegerField(blank=True, null=True, default=1)

class Expense(models.Model):
	STATUS = Choices('Gasolina', 'Alimentos', 'Peaje', 'Hospedaje', 'Otros')
	type_ex = StatusField()
	expense_value = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
	payment_method = models.CharField(max_length=255)
	date = models.DateTimeField(default=timezone.now)
	address = models.CharField(max_length=255, blank=True)
	name = models.CharField(max_length=255, blank=True)