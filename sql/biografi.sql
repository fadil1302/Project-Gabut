/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     02/01/2023 22.06.58                          */
/*==============================================================*/




/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN 
(
   ID_ADMIN             integer                        not null,
   NAMA_ADM             varchar(200)                   null,
   ALAMAT_ADM           long varchar                   null,
   constraint PK_ADMIN primary key (ID_ADMIN)
);

/*==============================================================*/
/* Index: ADMIN_PK                                              */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
ID_ADMIN ASC
);

/*==============================================================*/
/* Table: BIOGRAFI                                              */
/*==============================================================*/
create table BIOGRAFI 
(
   ID_BIOGRAFI          integer                        not null,
   ID_V                 integer                        null,
   ID_ORGANISASI        integer                        null,
   ID_PENDIDIKAN        integer                        null,
   ID_ADMIN             integer                        null,
   NAMA_BIO             varchar(100)                   null,
   TENTANG              long varchar                   null,
   BIODATA              long varchar                   null,
   HOBI                 long varchar                   null,
   SKILS                long varchar                   null,
   constraint PK_BIOGRAFI primary key (ID_BIOGRAFI)
);

/*==============================================================*/
/* Index: BIOGRAFI_PK                                           */
/*==============================================================*/
create unique index BIOGRAFI_PK on BIOGRAFI (
ID_BIOGRAFI ASC
);

/*==============================================================*/
/* Table: ORGANISASI                                            */
/*==============================================================*/
create table ORGANISASI 
(
   ID_ORGANISASI        integer                        not null,
   NAMA_ORG             varchar(60)                    null,
   TGL_ML               date                           null,
   TGL_AKH              date                           null,
   JABATAN              varchar(60)                    null,
   DESCRIPTION          long varchar                   null,
   constraint PK_ORGANISASI primary key (ID_ORGANISASI)
);

/*==============================================================*/
/* Index: ORGANISASI_PK                                         */
/*==============================================================*/
create unique index ORGANISASI_PK on ORGANISASI (
ID_ORGANISASI ASC
);

/*==============================================================*/
/* Table: PENDIDIKIAN                                           */
/*==============================================================*/
create table PENDIDIKIAN 
(
   ID_PENDIDIKAN        integer                        not null,
   TAHUN_MULAI          integer                        null,
   TAHUN_AKHIR          integer                        null,
   INSTANSI             varchar(200)                   null,
   constraint PK_PENDIDIKIAN primary key (ID_PENDIDIKAN)
);

/*==============================================================*/
/* Index: PENDIDIKIAN_PK                                        */
/*==============================================================*/
create unique index PENDIDIKIAN_PK on PENDIDIKIAN (
ID_PENDIDIKAN ASC
);

/*==============================================================*/
/* Table: VOLUNTEER                                             */
/*==============================================================*/
create table VOLUNTEER 
(
   ID_V                 integer                        not null,
   TGL_MULAI            date                           null,
   TGL_AKHIR            date                           null,
   NM_ORGANISASI        varchar(60)                    null,
   DESKRIPSI            long varchar                   null,
   JABATAN_ORG          varchar(60)                    null,
   constraint PK_VOLUNTEER primary key (ID_V)
);

/*==============================================================*/
/* Index: VOLUNTEER_PK                                          */
/*==============================================================*/
create unique index VOLUNTEER_PK on VOLUNTEER (
ID_V ASC
);

alter table BIOGRAFI
   add constraint FK_BIOGRAFI_RELATIONS_ADMIN foreign key (ID_ADMIN)
      references ADMIN (ID_ADMIN)
      on update restrict
      on delete restrict;

alter table BIOGRAFI
   add constraint FK_BIOGRAFI_RELATIONS_VOLUNTEE foreign key (ID_V)
      references VOLUNTEER (ID_V)
      on update restrict
      on delete restrict;

alter table BIOGRAFI
   add constraint FK_BIOGRAFI_RELATIONS_ORGANISA foreign key (ID_ORGANISASI)
      references ORGANISASI (ID_ORGANISASI)
      on update restrict
      on delete restrict;

alter table BIOGRAFI
   add constraint FK_BIOGRAFI_RELATIONS_PENDIDIK foreign key (ID_PENDIDIKAN)
      references PENDIDIKIAN (ID_PENDIDIKAN)
      on update restrict
      on delete restrict;

