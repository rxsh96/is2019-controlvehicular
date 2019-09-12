from django.urls import path
from user.views import UserListView,UserDetailView,UserUpdateView,UserDeleteView,UserCreateView

urlpatterns = [
  path('user/', UserListView.as_view(), name="usuario"),
  path('user/create', UserCreateView.as_view(), name="crear_usuario"),
  path('user/<int:pk>',UserDetailView.as_view(), name="detalle_usuario"),
  path('user/update/<int:pk>',UserUpdateView.as_view(), name="actualizar_usuario"),
  path('user/delete/<int:pk>',UserDeleteView.as_view(), name="eliminar_usuario"),
]