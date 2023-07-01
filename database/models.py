from django.db import models


# Create your models here.
class UserIdentity(models.Model):
    """身份表"""
    name = models.CharField(max_length=30)


class User(models.Model):
    """用户表"""
    username = models.CharField(max_length=50, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=128)
    created_time = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=50)
    birthday = models.DateField(null=True)
    identity = models.ForeignKey(UserIdentity, on_delete=models.PROTECT)


class BookCategory(models.Model):
    """图书分类表"""
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50, unique=True)


class Book(models.Model):
    """图书表"""
    author = models.CharField(max_length=128, null=True)
    bookname = models.CharField(max_length=128, null=True)
    category = models.ForeignKey(BookCategory, on_delete=models.PROTECT)
    is_delete = models.BooleanField(default=False)
    bookImage = models.ImageField(upload_to='images/', null=True)
    descrition = models.CharField(max_length=200, blank=True)
    bookprice = models.FloatField(default=0.0, blank=True, null=True)
    created_time = models.DateTimeField(auto_now_add=True, null=True)
    inventory = models.IntegerField(default=0, blank=True, null=True)
    press = models.CharField(max_length=200, blank=True, null=True)
