from django.urls import path
from business_owner.views import UserOwnerListView,UserOwnerCreateView,UserOwnerDetailView

urlpatterns = [
  path('user/', UserOwnerListView.as_view(), name="usuario_owner"),
  path('user_owner/create', UserOwnerCreateView.as_view(), name="crear_usuario_owner"),
  path('user/<int:pk>',UserOwnerDetailView.as_view(), name="detalle_usuario_owner"),
]