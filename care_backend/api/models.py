from django.db import models
from api.manager import UserManager
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, \
                                        PermissionsMixin


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
	city = models.CharField(max_length=255)
	legal_representative_name = models.CharField(max_length=255)
	legal_representative_lastname = models.CharField(max_length=255)
	address = models.CharField(max_length=255)
	""" contact_name = models.CharField(max_length=255)
	contact_lastname = models.CharField(max_length=255)
	contact_work_position = models.CharField(max_length=255)
	contact_phone_number = models.CharField(max_length=13) """
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

class Vehicle(models.Model):
	owner = models.ForeignKey(User, on_delete = models.CASCADE, null=True, blank=True)
	brand = models.CharField(max_length=30)
	model = models.CharField(max_length=255)
	plate = models.CharField(max_length=10)
	color = models.CharField(max_length=20)
	""" engine = models.CharField(max_length=25,default="") """
	year = models.CharField(max_length=4)
	description = models.TextField(max_length=255, default="")
	km = models.CharField(max_length=20)
	is_active = models.BooleanField(default=True)
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

class Maintenance(models.Model):
	description = models.TextField(max_length=255, default="")
	m_type = models.CharField(max_length=255, primary_key=True)

class MaintenanceDetails(models.Model):
	maintenance = models.ForeignKey(Maintenance, on_delete = models.CASCADE)
	vehicle = models.ManyToManyField(Vehicle)
	local = models.ForeignKey(Affiliate_business, null=True, blank=True, on_delete = models.CASCADE)
	date =  models.DateTimeField()
	price = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)