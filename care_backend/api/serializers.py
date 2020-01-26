from django.contrib.auth import get_user_model, authenticate
from rest_framework import serializers
from django.utils.translation import ugettext_lazy as _
from api.models import *


class UserSerializer(serializers.ModelSerializer):
    """Serializer for the users object"""
    class Meta:
        model = User
        fields = ('id','name','lastname','phone_number','email', 'password', 'name','is_active')
        extra_kwargs = {'password': 
                            {'write_only': True, 
                            'min_length': 5, 
                            "style":{'input_type': 'password'},
                            "trim_whitespace":False,
                            }
                        }

    def create(self, validated_data):
        """Create a new user with encrypted password and return it"""
        return User.objects.create_user(**validated_data)

    def update(self, instance, validated_data):
	    """Update a user, setting the password correctly and return it"""
	    password = validated_data.pop('password', None)
	    user = super().update(instance, validated_data)
	    if password:
	        user.set_password(password)
	        user.save()
	    return user


class AuthTokenSerializer(serializers.Serializer):
    """Serializer for the user authentication object"""
    email = serializers.CharField()
    password = serializers.CharField(
        style={'input_type': 'password'},
        trim_whitespace=False
    )

    def validate(self, attrs):
        """Validate and authenticate the user"""
        email = attrs.get('email')
        password = attrs.get('password')
        user = authenticate(
            request=self.context.get('request'),
            username=email,
            password=password
        )
        if not user:
            msg = _('Unable to authenticate with provided credentials')
            raise serializers.ValidationError(msg, code='authorization')
        attrs['user'] = user
        return attrs

class MaintenanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Maintenance
        fields = '__all__'

class MaintenanceDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = MaintenanceDetails
        fields = '__all__'
        
class VehicleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehicle
        fields = '__all__'

class Affiliate_businessSerializer(serializers.ModelSerializer):
    class Meta:
        model = Affiliate_business
        fields = '__all__'

# class ImageSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Image
#         fields = ('image_file',)

class ProfilePictureSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfilePicture
        fields = "__all__"

class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = "__all__"

class ModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Model
        fields = "__all__"

class TravelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Travel
        fields = "__all__"

class AffiliateBusinessClientsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Affiliate_business_Clients
        fields = "__all__"

class ExpenseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Expense
        fields = "__all__"