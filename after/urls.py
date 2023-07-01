from django.urls import path
from after import views
from django.conf.urls import url

app_name = 'after'
urlpatterns = [
    path('manage/', views.index, name='index'),
    path('manage/book_manage/', views.book_manage, name='book_manage'),
    path('manage/user_manage/', views.user_manage, name='user_manage'),
    path('manage/sy', views.sy, name='sy'),
    path('manage/update_book', views.update_book, name='update_book'),
    path('manage/add_book', views.add_book, name='add_book'),
    path('manage/del_book', views.del_book, name='del_book'),
    path('manage/quit', views.quit, name='quit'),
]
