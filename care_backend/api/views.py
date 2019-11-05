from rest_framework import viewsets, filters, generics, authentication, permissions
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings
from api.serializers import *
from rest_framework.exceptions import ParseError
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from api import models as api_model

from filters.mixins import (
    FiltersMixin,
)

class UserView(FiltersMixin, viewsets.ModelViewSet):
    """Create a new user in the system"""
    # queryset = api_model.User.objects.prefetch_related(
    #     'lastname'  # use prefetch_related to minimize db hits.
    # ).all()
    queryset = api_model.User.objects.all()
    serializer_class = UserSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'email', 'is_active' )
    ordering = ('id','is_active',)

    filter_mappings = {
        'id': 'id',
        'email': 'email',
        'name': 'name',
        'lastname': 'lastname',
        'phone_number': 'phone_number',
        'is_active': 'is_active',
        'is_staff': 'is_staff',
        'created': 'created',
        'updated': 'updated',
    }

class TokenView(ObtainAuthToken):
    """Create a new auth token for the user"""
    serializer_class = AuthTokenSerializer
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES

class MaintenanceView(viewsets.ModelViewSet):
    """Create a new Maintenance in the system"""
    queryset = api_model.Maintenance.objects.all()
    serializer_class = MaintenanceSerializer

class MaintenanceDetailsView(viewsets.ModelViewSet):
    """Create a new MaintenanceDetails in the system"""
    queryset = api_model.MaintenanceDetails.objects.all()
    serializer_class = MaintenanceDetailsSerializer

class VehicleView(FiltersMixin, viewsets.ModelViewSet):
    """Create a new vehicle in the system"""
    queryset = api_model.Vehicle.objects.prefetch_related(
        'owner'  # use prefetch_related to minimize db hits.
    ).all()

    # queryset = api_model.Vehicle.objects.all()
    serializer_class = VehicleSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'owner', 'plate')
    ordering = ('id',)

    filter_mappings = {
        'owner': 'owner',
        'brand': 'brand',
        'model': 'model',
        'plate': 'plate',
        'color': 'color',
        'year': 'year',
        'description': 'description',
        'km': 'km',
        'is_active': 'is_active',
        'created': 'created',
        'updated': 'updated',
        'imageURL': 'imageURL',
    }

class Affiliate_businessView(viewsets.ModelViewSet):
    """Create a new Affiliate_business in the system"""
    queryset = api_model.Affiliate_business.objects.all()
    serializer_class = Affiliate_businessSerializer

    
class ImageUploadParser(FileUploadParser):
    media_type = 'image/*'

class PPUploadView(viewsets.ModelViewSet):
    parser_class = (ImageUploadParser,)
    queryset = api_model.ProfilePicture.objects.all()
    serializer_class = ProfilePictureSerializer

class BrandView(viewsets.ModelViewSet):
    queryset = api_model.Brand.objects.all()
    serializer_class = BrandSerializer

class ModelView(viewsets.ModelViewSet):
    queryset = api_model.Model.objects.all()
    serializer_class = ModelSerializer