from rest_framework import routers
from api import views as myapi_views

router = routers.DefaultRouter()
router.register(r'users', myapi_views.UserView)
router.register(r'vehicle', myapi_views.VehicleView)
router.register(r'mantenimiento', myapi_views.MaintenanceView)
router.register(r'mantenimientoDetails', myapi_views.MaintenanceDetailsView)
router.register(r'mantenimientoTipo', myapi_views.MaintenanceTypeView)
router.register(r'affiliatebusiness', myapi_views.Affiliate_businessView)
router.register(r'profilePicture', myapi_views.PPUploadView)
router.register(r'brand', myapi_views.BrandView)
router.register(r'model', myapi_views.ModelView)
router.register(r'travel', myapi_views.TravelView)
router.register(r'expense', myapi_views.ExpenseView)