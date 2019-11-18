from django.urls import path
from business_owner.views import UserOwnerListView,UserOwnerCreateView,UserOwnerDetailView,VehicleClientListView,MaintenanceDetailView

urlpatterns = [
  path('user/', UserOwnerListView.as_view(), name="usuario_owner"),
  path('user_owner/create', UserOwnerCreateView.as_view(), name="crear_usuario_owner"),
  path('user/<int:pk>',UserOwnerDetailView.as_view(), name="detalle_usuario_owner"),
  path('user/vehicle_client/<int:pk>',VehicleClientListView.as_view(), name="vehiculos_cliente"),
  path('user/vehicle_client/Mantenimiento/<int:pk>',MaintenanceDetailView.as_view(), name="detalle_mantenimiento"),
]