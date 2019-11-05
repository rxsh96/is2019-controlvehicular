import six

from filters.schema import base_query_params_schema
from filters.validations import (
    CSVofIntegers,
    IntegerLike,
    DatetimeWithTZ
)

# make a validation schema for players filter query params
'''vehicle_query_schema = base_query_param_schema.extend(
    {
        "id": IntegerLike(),
        "brand": six.text_type,  # Depends on python version
        "model": six.text_type, 
        "plate": six.text_type, 
        "color": six.text_type,
        "year": six.text_type, 
        "description": six.text_type, 
        "km": six.text_type, 
        "owner": CSVofIntegers(),  # /?team_id=1,2,3
        "created": DatetimeWithTZ(),
        "updated": DatetimeWithTZ(),
        "imageURL": six.text_type, 
    }
)'''

'''
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
    '''