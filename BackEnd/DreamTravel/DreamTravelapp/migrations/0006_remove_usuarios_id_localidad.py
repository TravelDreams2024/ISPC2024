# Generated by Django 5.0.6 on 2024-05-13 02:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('DreamTravelapp', '0005_usuarios_id_localidad'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuarios',
            name='id_localidad',
        ),
    ]