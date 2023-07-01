from django.core.paginator import Paginator
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from database.models import Book, BookCategory, User


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
    book_list = Book.objects.filter(is_delete=0)
    paginator = Paginator(book_list, 8)  # 每页显示10条记录
    page = request.GET.get('page')  # 获取当前页码
    books = paginator.get_page(page)  # 获取指定页码的记录列表

    # return render(request, 'Front/book_list.html', {'books': books})
    # books = Book.objects.filter(id__lt=9)
    users = User.objects.filter()
    bookbategorys = BookCategory.objects.filter()
    return render(request, 'Front/index.html', {'books': books, 'users': users, 'bookbategorys': bookbategorys})


@csrf_exempt
@login_required
def book(request):
    if request.method == 'GET':
        """根据id跳转到对于页面"""
        id = request.GET.get('id')
        if id == str(120000000000000000):
            """最新分类"""
            name = '最新书籍'  # 获取对应类型名字
            bookbategorys = BookCategory.objects.filter()  # 获取所有类型

            books = Book.objects.filter(is_delete=0).order_by('-created_time')[:8]  # 获取该类型的所有书籍
            return render(request, 'Front/book.html',
                          {'books': books, 'name': name, 'bookbategorys': bookbategorys})
        else:
            name = BookCategory.objects.get(id=id).name  # 获取对应类型名字
            bookbategorys = BookCategory.objects.filter()  # 获取所有类型
            book_list = Book.objects.filter(category_id=id, is_delete=0)  # 获取该类型的所有书籍
            paginator = Paginator(book_list, 8)  # 每页显示10条记录
            page = request.GET.get('page')  # 获取当前页码
            books = paginator.get_page(page)  # 获取指定页码的记录列表
            return render(request, 'Front/book.html', {'books': books, 'name': name, 'bookbategorys': bookbategorys})


@login_required
def update_user(request):
    """修改用户信息"""
    if request.method == 'GET':
        """根据id跳转到对于页面"""
        bookbategorys = BookCategory.objects.filter()  # 获取所有类型
        id = request.session.get('id')
        user = User.objects.get(id=id)
        return render(request, 'Front/user_message.html', {'user': user, 'bookbategorys': bookbategorys})

    if request.method == 'POST':
        """更具需求更改书籍信息"""
        # # 获取ID信息
        id = request.POST.get('id')
        user = User.objects.get(id=id)
        user.email = request.POST.get('email')
        user.password = request.POST.get('password')
        user.save()
        return HttpResponse('Image uploaded successfully.')
    else:
        return render(request, 'After/update_book.html')


@csrf_exempt
@login_required
def select_book(request):
    if request.method == 'POST':
        content = request.POST.get('content')
        query = Q(bookname__icontains=content) | Q(author__icontains=content)
        books = Book.objects.filter(query, is_delete=0)
        bookbategorys = BookCategory.objects.filter()  # 获取所有类型
        return render(request, 'Front/select.html', {'bookbategorys': bookbategorys, 'books': books})
    else:
        return JsonResponse({'status': 'error'})


@login_required
def book_list(request):
    if request.method == 'GET':
        id = request.GET.get('id')
        book = Book.objects.get(id=id)
        # print(id,book.bookname)
        bookbategorys = BookCategory.objects.filter()  # 获取所有类型
        return render(request, 'Front/book_list.html', {'bookbategorys': bookbategorys, 'book': book})


@login_required
def quit(request):
    del request.session["id"]
    return render(request, 'login.html')
