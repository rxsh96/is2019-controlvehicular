from django.shortcuts import render
from django.views.generic.base import TemplateView
from django.views.generic.list import ListView

class NavPageView(TemplateView):
    template_name = "core/navs.html"
