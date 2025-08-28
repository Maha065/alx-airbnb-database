/*==============================================================*/
/* Nom de SGBD :  MySQL 4.0                                     */
/* Date de création :  28/08/2025 22:39:25                      */
/*==============================================================*/


drop index ASSOCIATION_2_FK on BOOKING;

drop index ASSOCIATION_4_FK on BOOKING;

drop index ASSOCIATION_6_FK on MESSAGE;

drop index ASSOCIATION_7_FK on MESSAGE;

drop index ASSOCIATION_8_FK on PAYMENT;

drop index ASSOCIATION_1_FK on PROPERTY;

drop index ASSOCIATION_3_FK on REVIEW;

drop index ASSOCIATION_5_FK on REVIEW;

drop table if exists BOOKING;

drop table if exists MESSAGE;

drop table if exists PAYMENT;

drop table if exists PROPERTY;

drop table if exists REVIEW;

drop table if exists USER;

/*==============================================================*/
/* Table : BOOKING                                              */
/*==============================================================*/
create table BOOKING
(
   BOOKING_ID                     int                            not null,
   USER_ID                        varchar(36)                    not null,
   PROPERTY_ID                    int                            not null,
   START_DATE                     date,
   END_DATE                       date,
   TOTAL_PRICE                    decimal,
   STATUS                         char(10),
   CREATED_AT                     datetime,
   ATTRIBUT_22                    char(10),
   primary key (BOOKING_ID)
)
type = InnoDB;

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create index ASSOCIATION_2_FK on BOOKING
(
   PROPERTY_ID
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create index ASSOCIATION_4_FK on BOOKING
(
   USER_ID
);

/*==============================================================*/
/* Table : MESSAGE                                              */
/*==============================================================*/
create table MESSAGE
(
   MESSAGE_ID                     int                            not null,
   SENDER_ID                        varchar(36)                    not null,
   RECIPIENT_ID                    varchar(36)                    not null,
   MESSAGE_BODY                   text,
   SENT_AT                        datetime,
   primary key (MESSAGE_ID)
)
type = InnoDB;

/*==============================================================*/
/* Index : ASSOCIATION_6_FK                                     */
/*==============================================================*/
create index ASSOCIATION_6_FK on MESSAGE
(
   USE_USER_ID
);

/*==============================================================*/
/* Index : ASSOCIATION_7_FK                                     */
/*==============================================================*/
create index ASSOCIATION_7_FK on MESSAGE
(
   USER_ID
);

/*==============================================================*/
/* Table : PAYMENT                                              */
/*==============================================================*/
create table PAYMENT
(
   PAYMENT_ID                     int                            not null,
   BOOKING_ID                     int                            not null,
   AMOUNT                         decimal,
   PAYMENT_DATE                   datetime,
   PAYMENT_METHOD                 char(10),
   primary key (PAYMENT_ID)
)
type = InnoDB;

/*==============================================================*/
/* Index : ASSOCIATION_8_FK                                     */
/*==============================================================*/
create index ASSOCIATION_8_FK on PAYMENT
(
   BOOKING_ID
);

/*==============================================================*/
/* Table : PROPERTY                                             */
/*==============================================================*/
create table PROPERTY
(
   PROPERTY_ID                    int                            not null,
   HOST_ID                        varchar(36)                    not null,
   NAME                           varchar(100),
   DESCRIPTION                    text,
   LOCATION                       varchar(200),
   PRICEPERNIGHT                  decimal,
   CREATED_AT                     datetime,
   UPDATED_AT                     datetime,
   primary key (PROPERTY_ID)
)
type = InnoDB;

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create index ASSOCIATION_1_FK on PROPERTY
(
   USER_ID
);

/*==============================================================*/
/* Table : REVIEW                                               */
/*==============================================================*/
create table REVIEW
(
   REVIEW_ID                      char(10)                       not null,
   PROPERTY_ID                    int                            not null,
   USER_ID                        varchar(36)                    not null,
   RATING                         int,
   COMMENT                        text,
   CREATED_AT                     datetime,
   primary key (REVIEW_ID)
)
type = InnoDB;

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create index ASSOCIATION_3_FK on REVIEW
(
   PROPERTY_ID
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create index ASSOCIATION_5_FK on REVIEW
(
   USER_ID
);

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   USER_ID                        varchar(36)                    not null,
   FIRST_NAME                     varchar(100),
   LAST_NAME                      varchar(100),
   EMAIL                          varchar(100),
   PASSWORD_HASH                  varchar(500),
   PHONE_NUMBER                   varchar(20),
   ROLE                           char(10),
   CREATED_AT                     datetime,
   primary key (USER_ID)
)
type = InnoDB;

alter table BOOKING add constraint FK_ASSOCIATION_2 foreign key (PROPERTY_ID)
      references PROPERTY (PROPERTY_ID) on delete restrict on update restrict;

alter table BOOKING add constraint FK_ASSOCIATION_4 foreign key (USER_ID)
      references USER (USER_ID) on delete restrict on update restrict;

alter table MESSAGE add constraint FK_ASSOCIATION_6 foreign key (RECIPIENT_ID)
      references USER (USER_ID) on delete restrict on update restrict;

alter table MESSAGE add constraint FK_ASSOCIATION_7 foreign key (SENDER_ID)
      references USER (USER_ID) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_ASSOCIATION_8 foreign key (BOOKING_ID)
      references BOOKING (BOOKING_ID) on delete restrict on update restrict;

alter table PROPERTY add constraint FK_ASSOCIATION_1 foreign key (HOST_ID)
      references USER (USER_ID) on delete restrict on update restrict;

alter table REVIEW add constraint FK_ASSOCIATION_3 foreign key (PROPERTY_ID)
      references PROPERTY (PROPERTY_ID) on delete restrict on update restrict;

alter table REVIEW add constraint FK_ASSOCIATION_5 foreign key (USER_ID)
      references USER (USER_ID) on delete restrict on update restrict;



