create database Hastane

create table Doktor
(
[DoktorNo] int,
[DoktorAdSoyad] varchar(50), 
[DoktorTCNO] nchar(11),
[UzmanlýkAlani] varchar(50), 
[Unvani] varchar(50), 
[TelefonNumarasi] nchar(11),
[Adres] varchar(50), 
[DogumTarihi] varchar(50), 
[PoliklinikNo] int
)

create proc DListele
as begin 
select * from Doktor
end

create proc DEkle 
@DoktorAdSoyad varchar(50), 
@DoktorTCNO nchar(11),
@UzmanlýkAlani varchar(50), 
@Unvani varchar(50), 
@TelefonNumarasi nchar(11),
@Adres varchar(50), 
@DogumTarihi varchar(50), 
@PoliklinikNo int
as begin 
insert into Doktor(DoktorAdSoyad,DoktorTCNO,UzmanlýkAlani,Unvani,TelefonNumarasi,Adres,DogumTarihi,PoliklinikNo)
values(@DoktorAdSoyad,@DoktorTCNO,@UzmanlýkAlani,@Unvani,@TelefonNumarasi,@Adres,@DogumTarihi,@PoliklinikNo)
end

create proc DYenile
@DoktorNo int,
@DoktorAdSoyad varchar(50), 
@DoktorTCNO nchar(11),
@UzmanlýkAlani varchar(50), 
@Unvani varchar(50), 
@TelefonNumarasi nchar(11),
@Adres varchar(50), 
@DogumTarihi varchar(50), 
@PoliklinikNo int
as begin 
update Doktor set DoktorAdSoyad=@DoktorAdSoyad,DoktorTCNO=@DoktorTCNO,UzmanlýkAlani=@UzmanlýkAlani,Unvani=@Unvani,TelefonNumarasi=@TelefonNumarasi,Adres=@Adres,DogumTarihi=@DogumTarihi,PoliklinikNo=@PoliklinikNo where DoktorNo=@DoktorNo
end

create proc DSil
@DoktorNo int
as begin 
delete from Doktor where DoktorNo=@DoktorNo
end

create table Hastalar
(
[HastaNo] int,
[HastaAdiSoyadi] varchar(50), 
[HastaTCNO] nchar(11),
[DogumTarihi] varchar(50), 
[Boy] int,
[Yas] int,
[Recete] varchar(50), 
[RaporDurumu] varchar(50), 
[RandevuTarihi] varchar(50), 
[DoktorNo] int
)

create proc HListele
as begin 
select * from Hastalar
end

create proc HEkle 
@HastaAdiSoyadi varchar(50), 
@HastaTCNO nchar(11),
@DogumTarihi varchar(50), 
@Boy int,
@Yas int,
@Recete varchar(50), 
@RaporDurumu varchar(50), 
@RandevuTarihi varchar(50), 
@DoktorNo int
as begin 
insert into Hastalar(HastaAdiSoyadi,HastaTCNO,DogumTarihi,Boy,Yas,Recete,RaporDurumu,RandevuTarihi,DoktorNo)
values(@HastaAdiSoyadi,@HastaTCNO,@DogumTarihi,@Boy,@Yas,@Recete,@RaporDurumu,@RandevuTarihi,@DoktorNo)
end

create proc HYenile
@HastaNo int,
@HastaAdiSoyadi varchar(50), 
@HastaTCNO nchar(11),
@DogumTarihi varchar(50), 
@Boy int,
@Yas int,
@Recete varchar(50), 
@RaporDurumu varchar(50), 
@RandevuTarihi varchar(50), 
@DoktorNo int
as begin 
update Hastalar set HastaAdiSoyadi=@HastaAdiSoyadi,HastaTCNO=@HastaTCNO,DogumTarihi=@DogumTarihi,Boy=@Boy,Yas=@Yas,Recete=@Recete,RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo where HastaNo=@HastaNo
end

create proc HSil
@HastaNo int
as begin 
delete from Hastalar where HastaNo=@HastaNo
end


create table KayitOl
(
[SiraNo] int,
[KullaniciAdi] varchar(50), 
[Sifre] nchar(10),
[Email] varchar(50), 
[Telefon] nchar(11)
)

create proc KListele
as begin 
select * from Hastalar
end

create proc KEkle 
@KullaniciAdi varchar(50), 
@Sifre nchar(10),
@Email varchar(50), 
@Telefon nchar(11)
as begin 
insert into KayitOl(KullaniciAdi,Sifre,Email,Telefon)
values(@KullaniciAdi,@Sifre,@Email,@Telefon)
end

create proc KYenile
@SiraNo int,
@KullaniciAdi varchar(50), 
@Sifre nchar(10),
@Email varchar(50), 
@Telefon nchar(11)
as begin 
update KayitOl set KullaniciAdi=@KullaniciAdi,Sifre=@Sifre,Email=@Email,Telefon=@Telefon where SiraNo=@SiraNo
end

create proc KSil
@SiraNo int
as begin 
delete from KayitOl where SiraNo=@SiraNo
end


create table Poliklinik
(
[PoliklinikNo] int,
[PoliklinikAdi] varchar(50), 
[PoliklinikUzmanSayisi] int,
[PoliklinikBaskani] varchar(50), 
[PoliklinikBasHemsire] varchar(50), 
[YatakSayisi] int
)

create proc PListele
as begin 
select * from Poliklinik
end

create proc PEkle 
@PoliklinikAdi varchar(50), 
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50), 
@PoliklinikBasHemsire varchar(50), 
@YatakSayisi int
as begin 
insert into Poliklinik(PoliklinikAdi,PoliklinikUzmanSayisi,PoliklinikBaskani,PoliklinikBasHemsire,YatakSayisi)
values(@PoliklinikAdi,@PoliklinikUzmanSayisi,@PoliklinikBaskani,qPoliklinikBasHemsire,@YatakSayisi)
end

create proc PYenile
@PoliklinikNo int,
@PoliklinikAdi varchar(50), 
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50), 
@PoliklinikBasHemsire varchar(50), 
@YatakSayisi int
as begin 
update Poliklinik set PoliklinikAdi=@PoliklinikAdi,PoliklinikUzmanSayisi=@PoliklinikUzmanSayisi,PoliklinikBaskani=@PoliklinikBaskani,PoliklinikBasHemsire=@PoliklinikBasHemsire,YatakSayisi=@YatakSayisi where PoliklinikNo=@PoliklinikNo
end

create proc PSil
@PoliklinikNo int
as begin 
delete from Poliklinik where PoliklinikNo=@PoliklinikNo
end