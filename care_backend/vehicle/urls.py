from django.urls import path
from vehicle.views import VehicleListView,VehicleCreateView,VehicleDetailView,VehicleUpdateView,VehicleDeleteView

urlpatterns = [
  path('vehicle/', VehicleListView.as_view(), name="vehiculo"),
  path('vehicle/create', VehicleCreateView.as_view(), name="crear_vehiculo"),
  path('vehicle/<int:pk>',VehicleDetailView.as_view(), name="detalle_vehiculo"),
  path('vehicle/update/<int:pk>',VehicleUpdateView.as_view(), name="actualizar_vehiculo"),
  path('vehicle/delete/<int:pk>',VehicleDeleteView.as_view(), name="eliminar_vehiculo"),
]