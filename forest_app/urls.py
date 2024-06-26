from django.urls import path
from forest_app import views
urlpatterns = {
    path('', views.login, name="login"),
    path('addofficer', views.addofficer, name="addofficer"),
    path('addofficerpost', views.addofficerpost, name="addofficerpost"),
    path('editofficercode', views.editofficercode, name="editofficercode"),
    path('manageofficer', views.manageofficer, name="manageofficer"),
    path('officersearch', views.officersearch, name="officersearch"),
    path('searchrep', views.searchrep, name="searchrep"),
    path('detsearch', views.detsearch, name="detsearch"),
    path('cosearch', views.cosearch, name="cosearch"),
    path('complaintsearch', views.complaintsearch, name="complaintsearch"),
    path('notificationsearch', views.notificationsearch, name="notificationsearch"),
    path('editofficer/<int:id>', views.editofficer, name="editofficer"),
    path('sendreplycode', views.sendreplycode, name="sendreplycode"),
    path('deleteofficer/<int:id>', views.deleteofficer, name="deleteofficer"),
    path('complaint', views.complaint, name="complaint"),
    path('sendreply/<int:id>', views.sendreply, name="sendreply"),
    path('view_report_from_officer', views.view_report_from_officer, name="view_report_from_officer"),
    path('view_forest_fire_notification', views.view_forest_fire_notification, name="view_forest_fire_notification"),
    path('view_animal_dedection', views.view_animal_dedection, name="view_animal_dedection"),
    path('adminhome', views.adminhome, name="Adminhome"),
    path('logout', views.logout, name="logout"),
    path('loginpost', views.loginpost, name="loginpost"),
    path('addcamera', views.addcamera, name="addcamera"),
    path('addcameraa', views.addcameraa, name="addcameraa"),
    path('managecamera', views.managecamera, name="managecamera"),
    path('delete_camera/<int:id>', views.delete_camera, name="delete_camera"),
    path('view_animal_dedection_search', views.view_animal_dedection_search, name="view_animal_dedection_search"),
    # path('viewofficer',views.viewofficer,name="viewofficer"),

    # officer______________________________________________________________________________

    path('officerhome', views.officerhome, name="officerhome"),
    path('send_reports', views.send_reports, name="send_reports"),
    path('view_complaint_from_user_and_send_reply', views.view_complaint_from_user_and_send_reply,
         name="view_complaint_from_user_and_send_reply"),
    path('send_complaints_and_view_reply', views.send_complaints_and_view_reply, name="send_complaints_and_view_reply"),
    path('view_forestfire_notification_officer', views.view_forestfire_notification_officer,
         name="view_forestfire_notification_officer"),
    path('view_animal_detection_officer', views.view_animal_detection_officer, name="view_animal_detection_officer"),
    path('logout_officer', views.logout_officer, name="logout_officer"),
    path('send_complaint', views.send_complaint, name="send_complaint"),
    path('add_copm', views.add_copm, name="add_copm"),
    path('add_reports', views.add_reports, name="add_reports"),
    path('view_report', views.view_report, name="view_report"),
    path('sendreply_to_user/<int:id>', views.sendreply_to_user, name="sendreply_to_user"),
    path('view_forestfire_notification_officer_search', views.view_forestfire_notification_officer_search,
         name="view_forestfire_notification_officer_search"),

    # path('login_code', views.login_code, name="login_code"),
    path('registration', views.registration, name="registration"),
    # path('send_complaint_app', views.send_complaint_app, name="send_complaint_app"),
    path('send_notification', views.send_notification, name="send_notification"),
    path('reply_app', views.reply_app, name="reply_app"),
    path('notification', views.notification, name="notification"),
    path('forestfirenotification', views.forestfirenotification, name="forestfirenotification"),
    path('notification_insert',views.notification_insert,name='notification_insert'),
    path('checkservice',views.checkservice,name='checkservice'),
    path('sendreplycodeuser',views.sendreplycodeuser,name='sendreplycodeuser'),
    path('sendreply_to_userr',views.sendreply_to_userr,name='sendreply_to_userr'),
    path('reg',views.reg,name='reg'),
    path('userhome',views.userhome,name='userhome'),
    path('reply_appsearch',views.reply_appsearch,name='reply_appsearch'),
    path('sndcomp',views.sndcomp,name='sndcomp'),
    path('compcode',views.compcode,name='compcode'),
    path('view_animal_dedectionuser',views.view_animal_dedectionuser,name='view_animal_dedectionuser'),
    path('view_animal_dedection_searchuser',views.view_animal_dedection_searchuser,name='view_animal_dedection_searchuser'),

}



