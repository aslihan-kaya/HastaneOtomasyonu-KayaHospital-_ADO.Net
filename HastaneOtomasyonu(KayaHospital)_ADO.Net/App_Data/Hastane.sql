USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 19.11.2022 03:20:58 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hastane', N'ON'
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = OFF
GO
USE [Hastane]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdSoyad] [varchar](50) NULL,
	[DoktorTCNO] [nchar](11) NULL,
	[UzmanlıkAlani] [varchar](50) NULL,
	[Unvani] [varchar](50) NULL,
	[TelefonNumarasi] [nchar](11) NULL,
	[Adres] [varchar](50) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktor] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdiSoyadi] [varchar](50) NULL,
	[HastaTCNO] [nchar](11) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[Boy] [int] NULL,
	[Yas] [int] NULL,
	[Recete] [varchar](50) NULL,
	[RaporDurumu] [varchar](50) NULL,
	[RandevuTarihi] [varchar](50) NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KayitOl]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KayitOl](
	[SiraNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Telefon] [nchar](11) NULL,
 CONSTRAINT [PK_KayitOl] PRIMARY KEY CLUSTERED 
(
	[SiraNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinik]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinik](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikAdi] [varchar](50) NULL,
	[PoliklinikUzmanSayisi] [int] NULL,
	[PoliklinikBaskani] [varchar](50) NULL,
	[PoliklinikBasHemsire] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
 CONSTRAINT [PK_Poliklinik] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_Poliklinik] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinik] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktor] CHECK CONSTRAINT [FK_Doktor_Poliklinik]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Doktor] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktor] ([DoktorNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Doktor]
GO
/****** Object:  StoredProcedure [dbo].[DEkle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DEkle]

@DoktorAdSoyad varchar(50),
@DoktorTCNO nchar(11),
@UzmanlıkAlani varchar(50),
@Unvani varchar(50),
@TelefonNumarasi nchar(11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int
as begin
insert into Doktor
(DoktorAdSoyad,DoktorTCNO,UzmanlıkAlani,Unvani,TelefonNumarasi,Adres,DogumTarihi,PoliklinikNo)
values (@DoktorAdSoyad,@DoktorTCNO,@UzmanlıkAlani,@Unvani,@TelefonNumarasi,@Adres,@DogumTarihi,@PoliklinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DGuncelle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DGuncelle]
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTCNO nchar(11),
@UzmanlıkAlani varchar(50),
@Unvani varchar(50),
@TelefonNumarasi nchar(11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int
as begin
update Doktor set 
DoktorAdSoyad=@DoktorAdSoyad,DoktorTCNO=@DoktorTCNO,UzmanlıkAlani=@UzmanlıkAlani,Unvani=@Unvani,TelefonNumarasi=@TelefonNumarasi,Adres=@Adres,DogumTarihi=@DogumTarihi,PoliklinikNo=@PoliklinikNo
where DoktorAdSoyad=@DoktorAdSoyad
end
GO
/****** Object:  StoredProcedure [dbo].[DListele]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DListele]
as begin
select * from Doktor
end 
GO
/****** Object:  StoredProcedure [dbo].[HEkle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HEkle]

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
insert into Hastalar
(HastaAdiSoyadi,HastaTCNO,DogumTarihi,Boy,Yas,Recete,RaporDurumu,RandevuTarihi,DoktorNo)
values (@HastaAdiSoyadi,@HastaTCNO,@DogumTarihi,@Boy,@Yas,@Recete,@RaporDurumu,@RandevuTarihi,@DoktorNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HGuncelle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HGuncelle]
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
update Hastalar set 
HastaAdiSoyadi=@HastaAdiSoyadi,HastaTCNO=@HastaTCNO,DogumTarihi=@DogumTarihi,Boy=@Boy,Yas=@Yas,Recete=@Recete,RaporDurumu=@RaporDurumu,RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo
where HastaNo=@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HListele]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HListele]
as begin
select * from Hastalar
end 
GO
/****** Object:  StoredProcedure [dbo].[Kayit]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Kayit]
as begin 
select*from KayitOl
end 
GO
/****** Object:  StoredProcedure [dbo].[KEkle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KEkle]

@KullaniciAdi varchar(50),
@Sifre nchar(10),
@Email varchar(50),
@Telefon nchar(11)
as begin
insert into KayitOl
(KullaniciAdi,Sifre,Email,Telefon)
values (@KullaniciAdi,@Sifre,@Email,@Telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[PEkle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PEkle]
@PoliklinikNo int,
@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin
insert into Poliklinik
(PoliklinikAdi,PoliklinikUzmanSayisi,PoliklinikBaskani,PoliklinikBasHemsire,YatakSayisi)
values (@PoliklinikAdi,@PoliklinikUzmanSayisi,@PoliklinikBaskani,@PoliklinikBasHemsire,@YatakSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[PGuncelle]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PGuncelle]
@PoliklinikNo int,
@PoliklinikAdi varchar(50),
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBasHemsire varchar(50),
@YatakSayisi int
as begin
update Poliklinik set 
PoliklinikAdi=@PoliklinikAdi,PoliklinikUzmanSayisi=@PoliklinikUzmanSayisi,PoliklinikBaskani=@PoliklinikBaskani,PoliklinikBasHemsire=@PoliklinikBasHemsire,YatakSayisi=@YatakSayisi
where PoliklinikNo=@PoliklinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 19.11.2022 03:20:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PListele]
as begin
select * from Poliklinik
end 
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO
