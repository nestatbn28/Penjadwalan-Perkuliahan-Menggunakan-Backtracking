from django.db import models

class Kelas(models.Model):
    nama = models.CharField(max_length=8)
    kapasitas=models.IntegerField(default=0)

    def __str__(self):
        return "{}....{}".format(self.nama,self.kapasitas)


class Sesi(models.Model):
    nama=models.CharField(max_length=255)

    def __str__(self):
        return "{}".format(self.nama)


class Kategori(models.Model):
    nama=models.CharField(max_length=255)
    
    def __str__(self):
        return "{}".format(self.nama)

class Pengajar(models.Model):
    nama=models.CharField(max_length=255)
    kategori=models.ForeignKey(Kategori,on_delete=models.CASCADE)
    def __str__(self):
        return "{}".format(self.nama)

class Matkul(models.Model):
    kode=models.CharField(max_length=255)
    nama=models.CharField(max_length=255)
    sks=models.IntegerField()
    kategori=models.ForeignKey(Kategori,on_delete=models.CASCADE)

    def __str__(self):
        return "{}....{}....kategori=>{}".format(self.kode,self.nama,self.kategori)

class Akun(models.Model):
    nama=models.CharField(max_length=255)
    kapasitas=models.IntegerField()

    def __str__(self):
        return "{}".format(self.nama)



class Pengajar_Matkul_Kelas(models.Model):
    no_pengajar=models.ForeignKey(Pengajar,on_delete=models.CASCADE)
    no_matkul=models.ForeignKey(Matkul,on_delete=models.CASCADE)
    no_kelas=models.ForeignKey(Kelas,on_delete=models.CASCADE)
    def __str__(self):
        return "{}....{}".format(self.no_pengajar,self.no_matkul)


class Hari(models.Model):
    nama=models.CharField(max_length=10)
    
    def __str__(self):
        return "{}".format(self.nama)

class Jadwal(models.Model):
    no_Pengajar=models.ForeignKey(Pengajar,on_delete=models.CASCADE)
    no_Hari=models.ForeignKey(Hari,on_delete=models.CASCADE)
    no_Sesi=models.ForeignKey(Sesi,on_delete=models.CASCADE)
    no_Matkul=models.ForeignKey(Matkul,on_delete=models.CASCADE)
    no_Kelas=models.ForeignKey(Kelas,on_delete=models.CASCADE)
    no_Akun=models.ForeignKey(Akun,on_delete=models.CASCADE, null=True)



class JadwalKuliah(models.Model):
    matkul=models.CharField(max_length=255)
    pengajar=models.CharField(max_length=255)
    kelas=models.CharField(max_length=255)
    hari=models.CharField(max_length=255)
    sesi=models.CharField(max_length=255)
    akun=models.CharField(max_length=255)

    class Meta:
        db_table="jadwalperkuliahan"
