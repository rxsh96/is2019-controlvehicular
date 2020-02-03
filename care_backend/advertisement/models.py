from django.db import models
from api.models import Advertisement,Affiliate_business,ProductNotifications
from django.dispatch import receiver
from fcm_django.models import FCMDevice
from django.db.models.signals import post_save

"""
# Create your models here.
@receiver(post_save, sender=ProductNotifications)
def notify_product_notification(sender, instance, **kwargs):
    if kwargs.get('created',False):
        sd = ProductNotifications.objects.get(id=instance.service_details.id)
        sd.assigned = True
        sd.status = 'EN CURSO'
        if sd.req_service.service_type == 'CUSTODIA':
            sd.total_cost = instance.total_cost
            sd.save(update_fields=['assigned','status','total_cost'])
        else:
            sd.save(update_fields=['assigned','status'])

        device_id = instance.service_details.device_id
        device = FCMDevice.objects.filter(device_id=device_id)
        employee_device = FCMDevice.objects.filter(device_id=instance.phone.device_id)
        if instance.employee != None:
            employee_name = str(instance.employee.name)
            employee_last_name = str(instance.employee.last_name)
            employee_work_position = str(instance.employee.work_position)
            employee_id_number = str(instance.employee.id_number)
        else:
            employee_name = ''
            employee_last_name = ''
            employee_work_position = ''
            employee_id_number = ''
        # client message
        device.send_message(body="Su servicio ha sido aceptado!",
        data={
            "service_name": str(instance.service),
            "service_time": str(instance.service_details.start_time),
            "service_date": str(instance.service_details.date),
            "service_cost": str(sd.total_cost),
            "service_payment": str(instance.service_details.payment_method),
            "service_status": str(instance.service_details.status),
            "employee_name": employee_name,
            "employee_last_name": employee_last_name,
            "employee_work_position": employee_work_position,
            "employee_id_number": employee_id_number,
            "user_name": str(sd.user_id.name),
            "user_last_name": str(sd.user_id.last_name)
            })
"""