from django.db import models

# Create your models here.


class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)




class officer_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.IntegerField()
    gender=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)
    photo=models.FileField()


class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.IntegerField()
    gender=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)
    photo=models.FileField()


class complaint_table(models.Model):
    complaints=models.CharField(max_length=1000)
    reply=models.CharField(max_length=1000)
    date=models.DateField()
    OFFICER = models.ForeignKey(officer_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)

class camera_table(models.Model):
    latitude=models.FloatField()
    longitude=models.FloatField()
    camerano=models.CharField(max_length=100)

class report_table(models.Model):
    report=models.FileField()
    date=models.DateField()
    OFFICER = models.ForeignKey(officer_table, on_delete=models.CASCADE)



class notification_table(models.Model):
    date=models.DateField()
    time=models.TimeField()
    image=models.FileField()
    CAMERA = models.ForeignKey(camera_table, on_delete=models.CASCADE)
    type = models.CharField(max_length=100)


class notistatus(models.Model):
    nid=models.ForeignKey(notification_table,on_delete=models.CASCADE)
    lid=models.ForeignKey(login_table,on_delete=models.CASCADE)

class complaint_app_table(models.Model):
    OFFICER = models.ForeignKey(officer_table, on_delete=models.CASCADE)
    complaints = models.CharField(max_length=1000)
    date = models.DateField()
    reply = models.CharField(max_length=1000)



