from django.urls import path
from business_owner.views import UserOwnerListView,UserOwnerCreateView,UserOwnerDetailView,VehicleClientListView,MaintenanceDetailView,ClientOwnerAddView

urlpatterns = [
  path('owner/', UserOwnerListView.as_view(), name="usuario_owner"),
  path('owner/create', UserOwnerCreateView.as_view(), name="crear_usuario_owner"),
  path('user/add_client', ClientOwnerAddView.as_view(), name="añadir_cliente"),
  path('owner/<int:pk>',UserOwnerDetailView.as_view(), name="detalle_usuario_owner"),
  path('owner/vehicle_client/<int:pk>',VehicleClientListView.as_view(), name="vehiculos_cliente"),
  path('owner/vehicle_client/Mantenimiento/<int:pk>',MaintenanceDetailView.as_view(), name="detalle_mantenimiento"),
]