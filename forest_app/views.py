import json
from datetime import datetime
import _thread
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from forest_app.models import *


def login(request):
    # _thread.start_new_thread(main_code, ())
    return render(request, "loginindex.html")


def logout(request):
    auth.logout(request)
    return render(request, "loginindex.html")


def loginpost(request):
    print(request.POST)
    username = request.POST['textfield']
    password = request.POST['textfield2']
    try:
        login_obj = login_table.objects.get(username=username, password=password)
        if login_obj.type == "admin":
            ob=auth.authenticate(username='admin',password='admin')
            if ob is not None:
                auth.login(request,ob)
            request.session['lid'] = login_obj.id
            return HttpResponse('''<script>alert("welcome");window.location="adminhome"</script>''')

        elif login_obj.type == "officer":
            ob = auth.authenticate(username='admin', password='admin')
            if ob is not None:
                auth.login(request, ob)
            request.session['lid'] = login_obj.id
            ob3=officer_table.objects.get(LOGIN=login_obj.id)
            request.session["name"]=ob3.fname +' '+ ob3.lname


            return HttpResponse('''<script>alert("welcome");window.location="officerhome"</script>''')
        elif login_obj.type == "user":

                ob = auth.authenticate(username='admin', password='admin')
                if ob is not None:
                    auth.login(request, ob)
                request.session['lid'] = login_obj.id
                return HttpResponse('''<script>alert("welcome");window.location="userhome"</script>''')
        else:
            return HttpResponse('''<script>alert("invalid username or password");window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert("invalid username or password");window.location="/"</script>''')


@login_required(login_url='/')
def addofficer(request):
    return render(request, "admin/addofficer.html")

@login_required(login_url='/')
def addofficerpost(request):
    fname = request.POST['textfield']
    lname = request.POST['textfield2']
    place = request.POST['textfield3']
    post = request.POST['textfield4']
    pin = request.POST['textfield5']
    gender = request.POST['radiobutton']
    email = request.POST['textfield6']
    phone = request.POST['textfield7']
    photo = request.FILES['file']
    fs = FileSystemStorage()
    fn = fs.save(photo.name, photo)
    username = request.POST['textfield8']
    password = request.POST['textfield9']

    ob = login_table()
    ob.username = username
    ob.password = password
    ob.type = 'officer'
    ob.save()

    obj = officer_table()
    obj.LOGIN = ob
    obj.fname = fname
    obj.lname = lname
    obj.place = place
    obj.post = post
    obj.pin = pin
    obj.gender = gender
    obj.phone = phone
    obj.email = email
    obj.photo = fn
    obj.save()
    return HttpResponse('''<script>alert("added succesfully");window.location="manageofficer"</script>''')

@login_required(login_url='/')
def manageofficer(request):
    ob = officer_table.objects.all().order_by('-id')
    return render(request, "admin/manageofficer.html", {"val": ob})

@login_required(login_url='/')
def officersearch(request):
    name = request.POST['textfield']
    ob = officer_table.objects.filter(fname__istartswith=name)
    return render(request, "admin/manageofficer.html", {"val": ob, 'name': name})

@login_required(login_url='/')
def editofficercode(request):
    try:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        gender = request.POST['radiobutton']
        email = request.POST['textfield6']
        phone = request.POST['textfield7']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fn = fs.save(photo.name, photo)

        obj = officer_table.objects.get(id=request.session['eo'])
        obj.fname = fname
        obj.lname = lname
        obj.place = place
        obj.post = post
        obj.pin = pin
        obj.gender = gender
        obj.phone = phone
        obj.email = email
        obj.photo = fn
        obj.save()
        return HttpResponse('''<script>alert("Edited succesfully");window.location="/manageofficer#about"</script>''')
    except:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        gender = request.POST['radiobutton']
        email = request.POST['textfield6']
        phone = request.POST['textfield7']

        obj = officer_table.objects.get(id=request.session['eo'])
        obj.fname = fname
        obj.lname = lname
        obj.place = place
        obj.post = post
        obj.pin = pin
        obj.gender = gender
        obj.phone = phone
        obj.email = email
        obj.save()
        return HttpResponse('''<script>alert("Edited succesfully");window.location="/manageofficer#about"</script>''')

@login_required(login_url='/')
def editofficer(request, id):
    request.session['eo'] = id
    ob = officer_table.objects.get(id=id)
    return render(request, "admin/editofficer.html", {"val": ob})

@login_required(login_url='/')
def deleteofficer(request, id):
    ob = login_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted succesfully");window.location="/manageofficer#about"</script>''')

@login_required(login_url='/')
def complaint(request):
    ob = complaint_app_table.objects.all().order_by('-id')
    return render(request, "admin/complaint.html", {"val": ob})

@login_required(login_url='/')
def complaintsearch(request):
    name = request.POST['textfield']
    ob = complaint_app_table.objects.filter(date=name)
    return render(request, "admin/complaint.html", {"val": ob, 'name': name})

@login_required(login_url='/')
def sendreply(request, id):
    request.session['sr'] = id
    return render(request, "admin/sendreply.html")

@login_required(login_url='/')
def sendreplycode(request):
    reply = request.POST['textarea']
    ob = complaint_app_table.objects.get(id=request.session['sr'])
    ob.reply = reply
    ob.save()
    return HttpResponse('''<script>alert("Reply Send");window.location="/complaint#about"</script>''')

@login_required(login_url='/')
def view_report_from_officer(request):
    ob = report_table.objects.all().order_by('-id')
    return render(request, "admin/view_report_from_officer.html", {'val': ob})
@login_required(login_url='/')
def searchrep(request):
    dt=request.POST['textfield']
    ob = report_table.objects.filter(date=dt).order_by('-id')
    return render(request, "admin/view_report_from_officer.html", {'val': ob,'dt':str(dt)})

@login_required(login_url='/')
def view_forest_fire_notification(request):
    ob = notification_table.objects.filter(type="fire")
    return render(request, "admin/view_forest_fire_notification.html", {"val": ob})

@login_required(login_url='/')
def notificationsearch(request):
    name = request.POST['textfield']
    ob = notification_table.objects.filter(date=name, type="fire")
    return render(request, "admin/view_forest_fire_notification.html", {"val": ob, 'name': name})

@login_required(login_url='/')
def view_animal_dedection(request):
    ob = notification_table.objects.filter(type="animal").order_by('-id')
    return render(request, "admin/view_animal_dedection.html", {'val': ob})

@login_required(login_url='/')
def view_animal_dedection_search(request):
    date = request.POST['textfield']
    ob = notification_table.objects.filter(type="animal", date=date)
    return render(request, "admin/view_animal_dedection.html", {'val': ob,'dt':str(date)})

@login_required(login_url='/')
def adminhome(request):
    return render(request, "admin/adminindex.html")

@login_required(login_url='/')
def addcamera(request):
    return render(request, "admin/addcamera.html")

@login_required(login_url='/')
def addcameraa(request):
    camera = request.POST['textfield']
    latitude = request.POST['textfield2']
    longitude = request.POST['textfield3']

    ob = camera_table()
    ob.camerano = camera
    ob.latitude = latitude
    ob.longitude = longitude
    ob.save()
    return HttpResponse('''<script>alert("Added Succesfully");window.location="managecamera#about"</script>''')

@login_required(login_url='/')
def managecamera(request):
    ob = camera_table.objects.all().order_by('-id')
    return render(request, "admin/managecamera.html", {'val': ob})

@login_required(login_url='/')
def delete_camera(request, id):
    ob = camera_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("Deleted succesfully");window.location="/managecamera#about"</script>''')


# _________________________OFFICER_______________________________



@login_required(login_url='/')
def send_complaints_and_view_reply(request):
    ob=complaint_app_table.objects.filter(OFFICER__LOGIN=request.session["lid"]).order_by('-id')
    return render(request, "officer/sendcomplaintandviewreply.html",{'val':ob})

@login_required(login_url='/')
def sendreply_to_user(request,id):
    request.session['cid']=id
    return render(request, "officer/send_reply.html")
    # return render(request, "officer/sendreply.html")
    return redirect('/sendreply_to_userr')

@login_required(login_url='/')
def sendreply_to_userr(request):
    return render(request, "officer/send_reply.html")

@login_required(login_url='/')
def send_complaint(request):
    return render(request, "officer/sendcomplaint.html")


@login_required(login_url='/')
def add_copm(request):
    comp=request.POST['textarea']
    ob=complaint_app_table()
    ob.complaints=comp
    ob.date=datetime.now()
    ob.reply='pending'
    ob.OFFICER=officer_table.objects.get(LOGIN__id= request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Sended Succesfully");window.location="/send_complaints_and_view_reply#about"</script>''')


@login_required(login_url='/')
def view_complaint_from_user_and_send_reply(request):
    ob=complaint_table.objects.filter(OFFICER__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request, "officer/viewcomplaintfromuser.html",{'val':ob})
@login_required(login_url='/')
def cosearch(request):
    dt=request.POST['textfield']
    ob=complaint_table.objects.filter(OFFICER__LOGIN__id=request.session['lid'],date=dt).order_by('-id')
    return render(request, "officer/viewcomplaintfromuser.html",{'val':ob,'dt':str(dt)})

@login_required(login_url='/')
def sendreplycodeuser(request):
    reply = request.POST['textarea']
    ob = complaint_table.objects.get(id=request.session['cid'])
    ob.reply = reply
    ob.save()
    return HttpResponse('''<script>alert("Reply Send");window.location="/view_complaint_from_user_and_send_reply#about"</script>''')



@login_required(login_url='/')
def add_reports(request):
    report=request.FILES['file']
    fs=FileSystemStorage()
    fsave=fs.save(report.name,report)
    ob=report_table()
    ob.report=fsave
    ob.date=datetime.now()
    ob.OFFICER = officer_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Sended");window.location="/view_report#about"</script>''')

@login_required(login_url='/')
def send_reports(request):
    return render(request, "officer/sendreport.html")

@login_required(login_url='/')
def view_forestfire_notification_officer(request):
    ob = notification_table.objects.filter(type="fire")
    return render(request, "officer/viewforestfirenotification.html", {"val":ob})


@login_required(login_url='/')
def view_forestfire_notification_officer_search(request):
    cam_no=request.POST["textfield"]
    ob = notification_table.objects.filter(CAMERA__camerano=cam_no)
    return render(request, "officer/viewforestfirenotification.html", {"val":ob})

@login_required(login_url='/')
def view_animal_detection_officer(request):
    ob = notification_table.objects.filter(type="animal").order_by('-id')
    return render(request, "officer/view_animal_dedection.html", {'val': ob})
@login_required(login_url='/')
def detsearch(request):
    dt=request.POST['textfield']
    ob = notification_table.objects.filter(type="animal",date=dt).order_by('-id')
    return render(request, "officer/view_animal_dedection.html", {'val': ob,'dt':str(dt)})

@login_required(login_url='/')
def officerhome(request):
    return render(request, "officer/officerindex.html")
@login_required(login_url='/')
def logout_officer(request):
    return render(request, "officer/officerhome.html")
@login_required(login_url='/')
def view_report(request):
    ob =report_table.objects.filter(OFFICER__LOGIN=request.session['lid']).order_by('-id')
    return render(request,"officer/view_report.html",{'val':ob})
#_______________________USER_______________________________





def reg(request):
    return render(request,'index.html')

def registration(request):
    firstname = request.POST['first_name']
    lastname = request.POST['last_name']
    place = request.POST['Place']
    post_office = request.POST['Post']
    pin_code = request.POST['Pin']
    phone = request.POST['Phone']
    gender = request.POST['Gender']
    email_id = request.POST['Email']
    photo =request.FILES ['file']
    fp=FileSystemStorage()
    fm=fp.save(photo.name,photo)
    username = request.POST['Username']
    password = request.POST['Password']

    lob = login_table()
    lob.username = username
    lob.password = password
    lob.type = 'user'
    lob.save()

    user_obj = user_table()
    user_obj.fname = firstname
    user_obj.lname = lastname
    user_obj.place = place
    user_obj.post = post_office
    user_obj.pin = pin_code
    user_obj.phone = phone
    user_obj.gender = gender
    user_obj.photo = fm

    user_obj.email = email_id
    user_obj.LOGIN = lob
    user_obj.save()

    return HttpResponse('''<script>alert("Succesfully Registered");window.location="/"</script>''')
@login_required(login_url='/')
def userhome(request):
    return render(request,'user/userindex.html')

@login_required(login_url='/')

def reply_app(request):
    obj = complaint_table.objects.filter(USER__LOGIN__id=request.session['lid']).order_by('-id')
    return render(request,'user/sndcompandreply.html',{'val':obj})
@login_required(login_url='/')
def reply_appsearch(request):
    dt=request.POST['textfield']
    obj = complaint_table.objects.filter(USER__LOGIN__id=request.session['lid'],date=dt)
    return render(request,'user/sndcompandreply.html',{'val':obj,'dt':str(dt)})
@login_required(login_url='/')

def sndcomp(request):
    ob=officer_table.objects.all()
    print(ob)
    return render(request,'user/sendcomplaint.html',{'val':ob})
@login_required(login_url='/')
def compcode(request):
    co=request.POST['textarea']
    oid=request.POST['select']
    ob=complaint_table()
    ob.USER=user_table.objects.get(LOGIN_id=request.session['lid'])
    ob.OFFICER=officer_table.objects.get(id=oid)
    ob.complaints=co
    ob.reply="waiting"
    ob.date=datetime.now()
    ob.save()
    return HttpResponse('''<script>alert("Succesfully Sended");window.location="/reply_app#about"</script>''')
@login_required(login_url='/')

def send_notification(request):
    image = request.FILES["image"]
    fp=FileSystemStorage()
    fm=fp.save(image.name,image)
    camera=request.POST['camera']
    type=request.POST['type']
    date = datetime.now()
    time = datetime.now()
    complaint_obj = notification_table()
    complaint_obj.time = time
    complaint_obj.date  = date
    complaint_obj.image = fm
    complaint_obj.CAMERA = camera_table.objects.get(id=camera)
    complaint_obj.type = type
    complaint_obj.save()
    data = {'task': 'success'}
    r = json.dumps(data)
    return HttpResponse(r)


def notification(request):
    complaint_obj = notification_table.objects.filter(type='animal')
    data = []
    for i in complaint_obj:
        row = {'time': str(i.time), 'image':str(i.image), 'Date': str(i.date),'camera':i.CAMERA.camerano,'type':i.type,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def forestfirenotification(request):
    complaint_obj = notification_table.objects.filter(type='fire')
    data = []
    for i in complaint_obj:
        row = {'time': str(i.time), 'image': str(i.image.url), 'Date': str(i.date),'camera':i.CAMERA.camerano,'type':i.type,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    print(r,"=======")
    return HttpResponse(r)

def checkservice(request):
    lid=request.POST['lid']
    # longi=request.POST['longi']
    # print(lati,longi)
    from math import sin, cos, sqrt, atan2, radians
    print(request.POST, "KKKKKKKKKK")
    lat1 = float(request.POST.get('lati', 0.0))
    lon1 = float(request.POST.get('longi', 0.0))
    lat1 = float(lat1)
    lon1 = float(lon1)
    ob=notistatus.objects.filter(lid__id=lid)
    r=[]
    for i in ob:
        r.append(i.nid.id)

    ob = notification_table.objects.filter(date=datetime.today()).exclude(id__in=r)
    print(ob, "LLLLLLLLLLLLLLLLL")
    r = []
    for i in ob:
        lat2 = i.CAMERA.latitude
        lon2 = i.CAMERA.longitude
        # Convert latitude and longitude to radians if they are in degrees
        lat2 = float(lat2)
        lon2 = float(lon2)
        dlon = lon2 - lon1
        dlat = lat2 - lat1
        a = sin(dlat / 2) * 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) * 2
        a = min(1.0, a)  # Ensure 'a' is not greater than 1 to avoid math domain error
        c = 2 * atan2(sqrt(a), sqrt(1 - a))
        print(c, "UUUUUUUUUUUUUUUUUUU")
        # Approximate radius of the Earth in kilometers
        R = 6373.0
        distance = R * c
        print(distance, "==================================")
        if distance < 1000:
            obb=notistatus()
            obb.nid=i
            obb.lid=login_table.objects.get(id=lid)
            obb.save()
            # for i in ob:
            data = {'task': 'yes','type':i.type}
            r = json.dumps(data)
            return HttpResponse(r)
    #         r.append(row)
    # print(r, "kkkkkkkkkkkkkkkkkkkkkkkkkk")
    # return JsonResponse(r, safe=False)
    data={'task':'no','type':"fire"}
    r=json.dumps(data)
    return HttpResponse(r)


def notification_insert(cid,fn):
    ob=notification_table.objects.filter(CAMERA__id=cid,date=datetime.today()).order_by('-id')
    if len(ob)==0:
        ob=notification_table()
        ob.CAMERA=camera_table.objects.get(id=cid)
        ob.date=datetime.today()
        ob.time=datetime.now()
        ob.image="/media/"+fn;
        ob.type='fire'
        ob.save()
    else:
        t=str(ob[0].time).split(".")[0]
        print(t,"=============")
        start = datetime.strptime(datetime.now().strftime("%H:%M:%S"), "%H:%M:%S")
        end = datetime.strptime(str(t), "%H:%M:%S")
        difference = start - end
        seconds = difference.total_seconds()
        print('difference in seconds is:', seconds)
        minutes = seconds / 60
        if minutes>5:
            ob = notification_table()
            ob.CAMERA = camera_table.objects.get(id=cid)
            ob.date = datetime.today()
            ob.time = datetime.now()
            # fs=FileSystemStorage()
            # fsave=fs.save(photo.name,photo)
            ob.image = "/media/" + fn;
            ob.type = 'fire'
            ob.save()


@login_required(login_url='/')
def view_animal_dedectionuser(request):
    ob = notification_table.objects.filter(type="animal").order_by('-id')
    return render(request, "user/view_animal_dedection.html", {'val': ob})

@login_required(login_url='/')
def view_animal_dedection_searchuser(request):
    date = request.POST['textfield']
    ob = notification_table.objects.filter(type="animal", date=date)
    return render(request, "user/view_animal_dedection.html", {'val': ob,'dt':str(date)})