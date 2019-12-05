from django.urls import path
from advertisement.views import AdvertisementListView, AdvertisementCreateView

urlpatterns = [
  path('advertisement/', AdvertisementListView.as_view(), name="anuncios"),
  path('advertisement/create', AdvertisementCreateView.as_view(), name="crear_anuncio"),
]