from django.urls import path
from front import views

app_name = 'front'
urlpatterns = [
    path('bookstore/', views.index, name='index'),
    path('bookstore/book/', views.book, name='book'),
    path('bookstore/update_user', views.update_user, name='update_user'),
    path('bookstore/select_book', views.select_book, name='select_book'),
    path('bookstore/quit', views.quit, name='quit'),
    path('bookstore/book_list', views.book_list, name='book_list'),
]
