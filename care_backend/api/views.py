from rest_framework import viewsets, generics, authentication, permissions
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings
from api.serializers import UserSerializer, AuthTokenSerializer

from api import models as api_model

class UserView(viewsets.ModelViewSet):
    """Create a new user in the system"""
    queryset = api_model.User.objects.all()
    serializer_class = UserSerializer

class TokenView(ObtainAuthToken):
    """Create a new auth token for the user"""
    serializer_class = AuthTokenSerializer
    renderer_classes = api_settings.DEFAULT_RENDERER_CLASSES
