# Generated by Django 3.2 on 2023-06-12 14:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('database', '0002_auto_20230612_2116'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='bookprice',
            field=models.FloatField(blank=True, default=0.0, null=True),
        ),
        migrations.AddField(
            model_name='book',
            name='created_time',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='book',
            name='inventory',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
    ]
