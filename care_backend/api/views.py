from rest_framework import viewsets, generics, authentication, permissions
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings
from api.serializers import *
from rest_framework.exceptions import ParseError
from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from PIL import Image

from api import models as api_model

class UserView(viewsets.ModelViewSet):
    """Create a new user in the system"""
    queryset = api_model.User.objects.all()
    serializer_class = UserSerializer

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

class VehicleView(viewsets.ModelViewSet):
    """Create a new vehicle in the system"""
    queryset = api_model.Vehicle.objects.all()
    serializer_class = VehicleSerializer

class Affiliate_businessView(viewsets.ModelViewSet):
    """Create a new Affiliate_business in the system"""
    queryset = api_model.Affiliate_business.objects.all()
    serializer_class = Affiliate_businessSerializer

class ImageUploadParser(FileUploadParser):
    media_type = 'image/*'

class PPUploadView(APIView):
    parser_class = (ImageUploadParser,)

    def post(self, request, *args, **kwargs):

      file_serializer = ProfilePictureSerializer(data=request.data)

      if file_serializer.is_valid():
          file_serializer.save()
          return Response(file_serializer.data, status=status.HTTP_201_CREATED)
      else:
          return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)