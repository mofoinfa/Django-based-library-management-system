import uuid

from django.core.files.storage import FileSystemStorage
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect
from database.models import Book, BookCategory, User
from django.views.decorators.csrf import csrf_exempt
import datetime


# Create your views here.

def login_required(view_func):
    def wrapper(request, *args, **kwargs):
        if 'id' in request.session:
            return view_func(request, *args, **kwargs)
        else:
            return redirect('user:login')

    return wrapper


@login_required
def index(request):
    """首页"""
    id = request.session.get('id')
    user = User.objects.get(id=id)
    return render(request, 'After/index.html', {'user': user})


@login_required
def book_manage(request):
    books = Book.objects.filter(is_delete=0)
    return render(request, 'After/book_manage.html', {'books': books})
    # return render(request, 'After/book_manage.html')


@csrf_exempt
@login_required
def add_book(request):
    """添加书籍"""
    if request.method == 'GET':
        """跳转书籍页面"""
        bookcategory = BookCategory.objects.all()
        return render(request, 'After/add_book.html', {'bookcategory': bookcategory})
    if request.method == 'POST':
        """添加书籍信息"""
        name = request.POST.get('name')
        author = request.POST.get('author')
        price = request.POST.get('price')
        category = request.POST.get('category')
        publisher = request.POST.get('publisher')
        description = request.POST.get('description')
        bookImage = FileSystemStorage(location='static/images/cover/').save(f'{category}.jpg',
                                                                            request.FILES.get('cover'))
        createtime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')  # 获取当前时间
        print(category, createtime, bookImage, description, publisher, price, author, name, sep='\n')
        # 添加书籍
        book = Book(bookname=name,
                    is_delete=0,
                    descrition=description,
                    category_id=category,
                    author=author,
                    bookImage=bookImage,
                    bookprice=price,
                    created_time=createtime,
                    inventory=10,
                    press=publisher)
        book.save()
        return HttpResponse()


@csrf_exempt
@login_required
def update_book(request):
    """修改书籍"""
    if request.method == 'GET':
        """根据id跳转到对于页面"""
        id = request.GET.get('id')
        book = Book.objects.get(id=id)
        return render(request, 'After/update_book.html', {'book': book})

    if request.method == 'POST':
        """更具需求更改书籍信息"""
        # 获取ID信息
        id = request.POST.get('id')
        book = Book.objects.get(id=id)
        # 如果上传过图片，则修改本地图片
        if request.FILES.get('cover'):
            book.bookImage = FileSystemStorage(location='static/images/cover/').save(f'{id}.jpg',
                                                                                     request.FILES.get('cover'))

        # 修改数据库信息

        book.bookname = request.POST.get('name')
        book.author = request.POST.get('author')
        book.bookprice = request.POST.get('price')
        book.press = request.POST.get('publisher')
        book.descrition = request.POST.get('description')
        book.save()
        return HttpResponse('Image uploaded successfully.')
    else:
        return render(request, 'After/update_book.html')


@csrf_exempt
@login_required
def del_book(request):
    """删除书籍"""
    if request.method == 'POST':
        """更具需求更改书籍信息"""
        # 获取ID信息
        id = request.POST.get('id')
        book = Book.objects.get(id=id)
        book.is_delete = 1
        book.save()
        return HttpResponse('Image uploaded successfully.')
    else:
        return render(request, 'After/update_book.html')


@login_required
def user_manage(request):

    users = User.objects.filter()
    return render(request, 'After/user_manage.html', {'users': users})


@login_required
def sy(request):
    return render(request, 'After/sy.html')

@login_required
def quit(request):
    del request.session["id"]
    return render(request, 'login.html')
