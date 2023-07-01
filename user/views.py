from django.http import HttpResponse
from django.shortcuts import render, redirect
from database.models import User
from django.views.decorators.cache import never_cache
from datetime import datetime
from after import views as after
from front import views as front


# Create your views here.
@never_cache
def register(request):
    """注册界面"""
    result = {"type": True, "msg": ''}
    if request.method == 'POST':
        name = request.POST.get('re_name')  # 设为唯一值
        username = request.POST.get('re_username')
        email = request.POST.get('re_email')  # 设为唯一值
        password = request.POST.get('re_password')
        data = User.objects.all()
        for i in data:
            """已经注册过此账号"""
            if username == i.username:
                result["msg"] = '你的账号已被注册'
                result["type"] = False
        if result["type"]:
            """插入数据"""
            User(username=username,
                 email=email,
                 password=password,
                 name=name,
                 created_time=datetime.now(),
                 identity_id=1).save()
            result["msg"] = '注册成功！'
            result["type"] = False
    return render(request, 'login.html', {'result': result})


def login(request):
    """登陆界面"""
    result = {'username': request.session.get('username') if request.session.get('username') else '',
              'password': request.session.get('password') if request.session.get('password') else '',
              'type': True,
              'msg': ''}

    if request.method == 'POST':
        username = request.POST.get('lo_username')
        password = request.POST.get('lo_password')
        role = request.POST.get('radio')
        remember = request.POST.get('remember')

        # 记住密码
        if remember:
            """设置记住密码"""
            print(1223)
            request.session["username"] = username
            request.session["password"] = password
        else:
            try:
                del request.session["username"]
                del request.session["password"]
            except:
                pass

        # 登陆判定
        try:
            print(username, password)
            data = User.objects.get(username=username, password=password)
            if data.identity.name == '全部':
                if role == 'user':
                    request.session["id"] = data.id
                    return redirect('front:index')
                else:
                    request.session["id"] = data.id
                    return redirect('after:index')
            elif data.identity.name == '用户' and role == 'user':
                request.session["id"] = data.id
                return redirect('front:index')
            elif data.identity.name == '管理员' and role == 'manager':
                request.session["id"] = data.id
                return redirect('after:index')
            else:
                result['type'] = False
                result['msg'] = '你无权限登陆'
        except:
            """无此用户"""
            result['type'] = False
            result['msg'] = '账号或密码输入错误!'

        # print('username:', username)
        # print('password:', password)
        # print('role:', role)
        # print('remember:', remember)
    return render(request, 'login.html', {'result': result})
