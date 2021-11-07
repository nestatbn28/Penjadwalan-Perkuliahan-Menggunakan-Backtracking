from django.conf.urls import url
from django.urls import path
from . import views


urlpatterns = [

    url(r'^Jadwal/$',views.listjadwal,name='listjadwal'),

    url(r'^Sesi/$',views.list,name='list'),
    url(r'^Sesi/create/$',views.create,name='create'),
    path('Sesi/delete/<int:delete_id>',views.delete,name='delete'),
    path('Sesi/update/<int:update_id>',views.update,name='update'),


    url(r'^Pengajar/$',views.listpengajar,name='listpengajar'),
    url(r'^Pengajar/create/$',views.createpengajar,name='createpengajar'),
    path('Pengajar/delete/<int:delete_id>',views.deletepengajar,name='deletepengajar'),
    path('Pengajar/update/<int:update_id>',views.deletepengajar,name='updatepengajar'),


    url(r'^Kelas/$',views.listkelas,name='listkelas'),
    url(r'^Kelas/create/$',views.createkelas,name='createkelas'),
    path('Kelas/delete/<int:delete_id>',views.deletekelas,name='deletekelas'),
    path('Kelas/update/<int:update_id>',views.updatekelas,name='updatekelas'),


    url(r'^Matkul/$',views.listmatakuliah,name='listmatakuliah'),
    url(r'^Matkul/create/$',views.creatematakuliah,name='creatematakuliah'),
    path('Matkul/delete/<int:delete_id>',views.deletematakuliah,name='deletematakuliah'),
    path('Matkul/update/<int:update_id>',views.updatematakuliah,name='updatematakuliah'),


    url(r'^Akun/$',views.listakun,name='listakun'),
    url(r'^Akun/create/$',views.createakun,name='createakun'),
    path('Akun/delete/<int:delete_id>',views.deleteakun,name='deleteakun'),
    path('Akun/update/<int:update_id>',views.updateakun,name='updateakun'),

]
