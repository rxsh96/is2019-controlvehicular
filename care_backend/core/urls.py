from django.urls import path
from .views import NavPageView

urlpatterns = [
    path('', NavPageView.as_view(), name="principal"),
]