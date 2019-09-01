from django import forms
from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin
from bootstrap_modal_forms.forms import BSModalForm
from affiliate_business.models import Affiliate_business


class BusinessForm(BSModalForm):
  class Meta:
      model = Affiliate_business
      fields = '__all__'