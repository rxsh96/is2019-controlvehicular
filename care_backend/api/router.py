from rest_framework import routers
from api import views as myapi_views
#from fcm_django.api.rest_framework import FCMDeviceViewSet

router = routers.DefaultRouter()
router.register(r'devices',  myapi_views.FCMDeviceViewSet)
router.register(r'users', myapi_views.UserView)
router.register(r'vehicle', myapi_views.VehicleView)
router.register(r'mantenimiento', myapi_views.MaintenanceView)
router.register(r'mantenimientoDetails', myapi_views.MaintenanceDetailsView)
router.register(r'affiliatebusiness', myapi_views.Affiliate_businessView)
router.register(r'profilePicture', myapi_views.PPUploadView)
router.register(r'brand', myapi_views.BrandView)
router.register(r'model', myapi_views.ModelView)
router.register(r'travel', myapi_views.TravelView)
router.register(r'expense', myapi_views.ExpenseView)
router.register(r'affiliatebusinessClient', myapi_views.Affiliate_business_ClientsView)
router.register(r'suggestions', myapi_views.SuggestionView)
router.register(r'notifications', myapi_views.NotificationsView)
router.register(r'maintenanceItem', myapi_views.MaintenanceItemView)
router.register(r'advertisement', myapi_views.AdvertisementView)
router.register(r'userDevice', myapi_views.UDeviceView)
router.register(r'fine', myapi_views.FineView)