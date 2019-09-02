from rest_framework import routers
from api import views as myapi_views

router = routers.DefaultRouter()
router.register(r'users', myapi_views.UserView)