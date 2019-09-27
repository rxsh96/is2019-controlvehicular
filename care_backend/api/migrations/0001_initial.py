# Generated by Django 2.2.4 on 2019-09-27 00:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(max_length=255, unique=True)),
                ('name', models.CharField(max_length=255)),
                ('lastname', models.CharField(max_length=255)),
                ('phone_number', models.CharField(max_length=10)),
                ('is_active', models.BooleanField(blank=True, default=True)),
                ('is_staff', models.BooleanField(blank=True, default=False)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Fecha de edición')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Affiliate_business',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ruc', models.CharField(max_length=13, unique=True)),
                ('business_name', models.CharField(max_length=255)),
                ('description', models.TextField(blank=True, max_length=255, null=True)),
                ('business_phone', models.CharField(max_length=13)),
                ('city', models.CharField(max_length=255)),
                ('legal_representative_name', models.CharField(max_length=255)),
                ('legal_representative_lastname', models.CharField(max_length=255)),
                ('address', models.CharField(max_length=255)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Fecha de edición')),
            ],
        ),
        migrations.CreateModel(
            name='Maintenance',
            fields=[
                ('description', models.TextField(default='', max_length=255)),
                ('m_type', models.CharField(max_length=255, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Vehicle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brand', models.CharField(max_length=30)),
                ('model', models.CharField(max_length=255)),
                ('plate', models.CharField(max_length=10)),
                ('color', models.CharField(max_length=20)),
                ('year', models.CharField(max_length=4)),
                ('description', models.TextField(default='', max_length=255)),
                ('km', models.CharField(max_length=20)),
                ('is_active', models.BooleanField(default=True)),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de creación')),
                ('updated', models.DateTimeField(auto_now=True, verbose_name='Fecha de edición')),
                ('owner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ProfilePicture',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('file', models.ImageField(upload_to='profilepic')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='MaintenanceDetails',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('price', models.DecimalField(blank=True, decimal_places=2, max_digits=6, null=True)),
                ('local', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='api.Affiliate_business')),
                ('maintenance', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Maintenance')),
                ('vehicle', models.ManyToManyField(to='api.Vehicle')),
            ],
        ),
    ]
