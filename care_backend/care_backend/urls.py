"""care_backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from api import views as my_view
from api.router import router
from django.conf.urls.static import static
from django.conf import settings
from django.conf.urls import url
from django.views.generic import TemplateView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('api/token/', my_view.TokenView.as_view()),
    url(r'^password-reset/confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        TemplateView.as_view(template_name="user/password_reset_confirm.html"),
        name='password_reset_confirm'),
    path('api/rest-auth/', include('rest_auth.urls')),
    #Paths del core
    path('', include('core.urls')),
    #Paths del affiliate_business
    path('', include('affiliate_business.urls')),
    #Paths del vehicle
    path('', include('vehicle.urls')),
    #Paths del user
    path('', include('user.urls')),
    path('upload/', my_view.PPUploadView.as_view()),
]

if settings.DEBUG:
  urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
