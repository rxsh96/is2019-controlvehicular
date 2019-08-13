from django.db import models
from restfulapi.manager import UserManager
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, \
                                        PermissionsMixin


class User(AbstractBaseUser, PermissionsMixin):
	'''Custom User Model that supports using email instead of username'''
	email=models.EmailField(max_length=255, unique=True)
	name=models.CharField(max_length=255)
	lastname=models.CharField(max_length=255)
	phone_number=models.CharField(max_length=10)
	is_active=models.BooleanField(default=True)
	is_staff=models.BooleanField(default=False)
	objects=UserManager()
	USERNAME_FIELD='email'
