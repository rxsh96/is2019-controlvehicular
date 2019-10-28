# Generated by Django 2.2 on 2019-10-27 22:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20191027_1628'),
    ]

    operations = [
        migrations.CreateModel(
            name='Brand_Vehicle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brand_vehicle', models.CharField(max_length=254)),
            ],
        ),
        migrations.CreateModel(
            name='Model_Vehicle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('model_vehicle', models.CharField(max_length=254)),
                ('brand_vehicle', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.Brand_Vehicle')),
            ],
        ),
    ]
