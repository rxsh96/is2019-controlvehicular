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
	is_staff=models.BooleanField(default=False, blank=True,verbose_name="Administrador")
	is_business_owner=models.BooleanField(default=False, blank=True,verbose_name="Dueño de Negocio")
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")
	#add_by = models.ForeignKey(Affiliate_business, on_delete=models.CASCADE, null=True, blank=True)
	
	objects=UserManager()
	USERNAME_FIELD='email'

	def __str__(self):
		return self.name+' '+self.lastname

class ProfilePicture(models.Model):
	creation_date = models.DateTimeField(auto_now_add=True, editable=False)
	modified_date = models.DateTimeField(auto_now=True)
	file = models.CharField(max_length=255)	
	user = models.ForeignKey(User, on_delete = models.CASCADE)

	def __str__(self):
		return self.user

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
	business_owner = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
	address = models.CharField(max_length=255)
	""" contact_name = models.CharField(max_length=255)
	contact_lastname = models.CharField(max_length=255)
	contact_work_position = models.CharField(max_length=255)
	contact_phone_number = models.CharField(max_length=13) """
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")
	lon = models.DecimalField(max_digits=22, decimal_places=16, null=True, blank=True)
	lat = models.DecimalField(max_digits=22, decimal_places=16, null=True, blank=True)

	def __str__(self):
		return self.business_name

class Affiliate_business_Clients(models.Model):
	client =  models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
	business = models.ForeignKey(Affiliate_business, on_delete=models.SET_NULL, null=True)
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación",null=True,blank=True)
	updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición",null=True,blank=True)

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
	registration = models.CharField(max_length=7, null=True)

	def __str__(self):
		return self.plate

class Maintenance_item(models.Model):
	item = models.CharField(max_length=255)
	itype = models.CharField(max_length=255,blank=True,null=True)

class Maintenance(models.Model):
	brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True)
	model = models.ForeignKey(Model, on_delete=models.SET_NULL, null=True)
	m_name = models.ForeignKey(Maintenance_item, on_delete=models.SET_NULL, null=True)
	km = models.CharField(max_length=20,null=True)
	month = models.CharField(max_length=3,null=True)
	km_to_inspect = models.CharField(max_length=20,null=True)
	is_change = models.BooleanField(default=False)
	is_maintenance = models.BooleanField(default=False)
	description = models.TextField(max_length=255, default="")

	def __str__(self):
		return self.m_name

""" class Maintenance_Type(models.Model):
	mt_name = models.CharField(max_length=255, primary_key=True)
	maintenance = models.ForeignKey(Maintenance, on_delete=models.SET_NULL, null=True)

	def __str__(self):
		return self.mt_name """

class MaintenanceDetails(models.Model):
	item = models.ForeignKey(Maintenance_item, null=True, blank=True, on_delete = models.CASCADE)
	#maintenance = models.ForeignKey(Maintenance, on_delete = models.CASCADE)
	#m_type = models.ForeignKey(Maintenance_Type, on_delete = models.CASCADE)
	vehicle = models.ForeignKey(Vehicle, on_delete = models.CASCADE, null=True)
	local = models.ForeignKey(Affiliate_business, null=True, blank=True, on_delete = models.CASCADE)
	date =  models.DateTimeField(default=timezone.now)
	price = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
	km = models.CharField(max_length=20, null=True)
	created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación",blank=True,null=True)


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
	#STATUS = Choices('Gasolina', 'Alimentos', 'Peaje', 'Hospedaje', 'Otros')
	#type_ex = StatusField()
	expense_value = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
	payment_method = models.CharField(max_length=255)
	date = models.DateTimeField(default=timezone.now)
	address = models.CharField(max_length=255, blank=True)
	name = models.CharField(max_length=255, blank=True)

class Advertisement(models.Model):
	affiliate_business = models.ForeignKey(Affiliate_business, null=True, blank=True, on_delete = models.CASCADE)
	description = models.CharField(max_length=255)
	banner = models.CharField(max_length=500, null=True, blank=True)

class Suggestion(models.Model):
    user_suggestion = models.ForeignKey(User, null=True, blank=True, on_delete = models.CASCADE)
    title = models.CharField(max_length=150,null=True, blank=True)
    comment_suggestion = models.CharField(max_length=255,null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True, null=True, blank=True, verbose_name="Fecha de creación")

class Notifications(models.Model):
	announcement = models.ForeignKey(Announcement, on_delete = models.CASCADE, null=True, blank=True)
	user = models.ForeignKey(User, on_delete = models.CASCADE, null=True, blank=True)

class UDevice(models.Model):
	user = models.ForeignKey(User, on_delete = models.CASCADE, null=True, blank=True)
	device_id = models.CharField(max_length=150, null=True, default=None)

class BusinessAnnouncement(models.Model):
	affiliate_business = models.ForeignKey(Affiliate_business, null=True, blank=True, on_delete = models.CASCADE)
	description = models.CharField(max_length=255)

class Announcement(models.Model):
	title = models.CharField(max_length=150,null=True, blank=True)
	description = models.CharField(max_length=255)

class Fine(models.Model):
	value = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
	date = models.DateTimeField(default=timezone.now)
	reason = models.CharField(max_length=255, blank=True)
	address = models.CharField(max_length=255, blank=True)
	agency = models.CharField(max_length=255, blank=True)
	agent = models.CharField(max_length=255, blank=True)
	user = models.ForeignKey(User, on_delete = models.CASCADE, null=True, blank=True)