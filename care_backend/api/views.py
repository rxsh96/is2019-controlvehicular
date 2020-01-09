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

class MaintenanceView(FiltersMixin, viewsets.ModelViewSet):
    """Create a new Maintenance in the system"""
    #queryset = api_model.Maintenance.objects.all()
    queryset = api_model.Maintenance.objects.prefetch_related(
        'm_name'  # use prefetch_related to minimize db hits.
    ).all()
    serializer_class = MaintenanceSerializer

    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'm_name', 'brand','model')
    ordering = ('id',)

    filter_mappings = {
        'brand': 'brand',
        'model': 'model',
        'm_name': 'm_name',
        'month': 'month',
        'km_to_inspect': 'km_to_inspect',
        'description': 'description',
        'km': 'km',
        'is_change': 'is_change',
        'is_maintenance': 'is_maintenance',
        'description': 'description',
    }

class MaintenanceDetailsView(FiltersMixin, viewsets.ModelViewSet):
    """Create a new MaintenanceDetails in the system"""
    queryset = api_model.MaintenanceDetails.objects.prefetch_related(
        'item'  # use prefetch_related to minimize db hits.
    ).all()
    serializer_class = MaintenanceDetailsSerializer

    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'vehicle', 'local')
    ordering = ('id',)

    filter_mappings = {
        'item': 'item',
        'vehicle': 'vehicle',
        'local': 'local',
        'date': 'date',
        'price': 'price',
        'created': 'created',
    }
    
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

class Affiliate_businessView(FiltersMixin, viewsets.ModelViewSet):
    """Create a new Affiliate_business in the system"""
    queryset = api_model.Affiliate_business.objects.prefetch_related(
        'ruc'  # use prefetch_related to minimize db hits.
    ).all()
    serializer_class = Affiliate_businessSerializer

    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'ruc', 'business_name')
    ordering = ('id',)

    filter_mappings = {
        'ruc': 'ruc',
        'business_name': 'business_name',
        'business_phone': 'business_phone',
        'province': 'province',
        'city': 'city',
        'legal_representative_name': 'legal_representative_name',
        'description': 'description',
        'legal_representative_lastname': 'legal_representative_lastname',
        'business_owner': 'business_owner',
        'address': 'address',
        'created': 'created',
        'updated': 'updated',
        'lon': 'lon',
        'lat': 'lat',
    }

    
'''class ImageUploadParser(FileUploadParser):
    media_type = 'image/*'''

class PPUploadView(FiltersMixin, viewsets.ModelViewSet):
    #parser_class = (ImageUploadParser,)
    queryset = api_model.ProfilePicture.objects.all()
    serializer_class = ProfilePictureSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'user', 'creation_date')
    ordering = ('user')

    filter_mappings = {
        'user': 'user',
    }

class BrandView(viewsets.ModelViewSet):
    queryset = api_model.Brand.objects.all()
    serializer_class = BrandSerializer

class ModelView(viewsets.ModelViewSet):
    queryset = api_model.Model.objects.all()
    serializer_class = ModelSerializer

class TravelView(viewsets.ModelViewSet):
    queryset = api_model.Travel.objects.all()
    serializer_class = TravelSerializer

class Affiliate_business_ClientsView(viewsets.ModelViewSet):
    queryset = api_model.Affiliate_business_Clients.objects.all()
    serializer_class = AffiliateBusinessClientsSerializer

class ExpenseView(viewsets.ModelViewSet):
    queryset = api_model.Expense.objects.prefetch_related(
        'id'  # use prefetch_related to minimize db hits.
    ).all()
    serializer_class = ExpenseSerializer

    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ('id', 'expense_value', 'payment_method', 'date')
    ordering = ('id',)

    filter_mappings = {
        'expense_value': 'expense_value',
        'payment_method': 'payment_method',
        'local': 'local',
        'date': 'date',
        'address': 'address',
        'name': 'name',
    }
