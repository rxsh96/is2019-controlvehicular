from django.urls import path
from affiliate_business.views import BusinessListView,BusinessCreateView,BusinessDetailView,BusinessUpdateView,BusinessDeleteView

urlpatterns = [
  path('business/', BusinessListView.as_view(), name="negocio"),
  path('business/create', BusinessCreateView.as_view(), name="crear_negocio"),
  path('business/<int:pk>',BusinessDetailView.as_view(), name="detalle_negocio"),
  path('business/update/<int:pk>',BusinessUpdateView.as_view(), name="actualizar_negocio"),
  path('business/delete/<int:pk>',BusinessDeleteView.as_view(), name="eliminar_negocio"),
]