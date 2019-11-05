from django.urls import path
from .views import NavPageView, HomePageView

urlpatterns = [
    path('', HomePageView.as_view(), name="home"),
    path('', NavPageView.as_view(), name="principal"),

]