from django.db import models
from api.models import User
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.conf import settings
from django.dispatch import receiver
from django.db.models.signals import post_save
# Create your models here.
@receiver(post_save, sender=User)
def notify_service_details(sender, instance, **kwargs):
    if kwargs.get('created',False):
        text_content = render_to_string('registration/mail_post.txt')
        html_content = render_to_string('registration/mail_post.html')
        email = EmailMultiAlternatives('Bienvenida de CareApp', text_content, from_email=settings.EMAIL_HOST_USER, to=[instance.email])
        email.attach_alternative(html_content, "text/html")
        email.send()
