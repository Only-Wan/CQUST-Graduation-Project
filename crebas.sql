/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16.12.8 12:54:46                             */
/*==============================================================*/


drop table if exists t_address;

drop table if exists t_admin;

drop table if exists t_cart;

drop table if exists t_cartItem;

drop table if exists t_category;

drop table if exists t_content;

drop table if exists t_dietApplication;

drop table if exists t_dietPlan;

drop table if exists t_dietitian;

drop table if exists t_dietitionComment;

drop table if exists t_foodNutrition;

drop table if exists t_healthInfo;

drop table if exists t_healthRemind;

drop table if exists t_order;

drop table if exists t_orderItem;

drop table if exists t_orderStatistics;

drop table if exists t_pComment;

drop table if exists t_permission;

drop table if exists t_product;

drop table if exists t_role;

drop table if exists t_role_permission;

drop table if exists t_season;

drop table if exists t_seasonInfor;

drop table if exists t_sportsOption;

drop table if exists t_storeApplication;

drop table if exists t_storeComment;

drop table if exists t_storeInfo;

drop table if exists t_storeTuiSong;

drop table if exists t_storeType;

drop table if exists t_userDietPlan;

drop table if exists t_userHealthInfo;

drop table if exists t_userInfo;

drop table if exists t_userLog;

drop table if exists t_userSportsPlan;

drop table if exists t_userStatistics;

drop table if exists t_user_role;

drop table if exists t_vipApplication;

drop table if exists t_vipDietApplication;

/*==============================================================*/
/* Table: t_address                                             */
/*==============================================================*/
create table t_address
(
   id                   int not null comment '����id',
   addr                 varchar(200) not null comment '��ַ',
   userId               int comment '�û�����',
   primary key (id)
);

alter table t_address comment '�����ջ���ַ';

/*==============================================================*/
/* Table: t_admin                                               */
/*==============================================================*/
create table t_admin
(
   id                   int not null,
   adminName            varchar(20) not null,
   adminPsswd           varchar(20) not null,
   primary key (id)
);

alter table t_admin comment '����Ա';

/*==============================================================*/
/* Table: t_cart                                                */
/*==============================================================*/
create table t_cart
(
   id                   int not null comment '����',
   total                double comment '�ܽ��',
   userId               int not null comment '�û�id',
   primary key (id)
);

alter table t_cart comment '���ﳵ';

/*==============================================================*/
/* Table: t_cartItem                                            */
/*==============================================================*/
create table t_cartItem
(
   ����id                 int not null comment '����',
   count                int not null comment '��Ʒ����',
   subTotal             double not null comment '��Ʒ���С��',
   cartId               int not null comment '���ﳵid',
   pid                  int not null comment '��Ʒid',
   primary key (����id)
);

alter table t_cartItem comment '������';

/*==============================================================*/
/* Table: t_category                                            */
/*==============================================================*/
create table t_category
(
   id                   int not null comment '����',
   categoryName         varchar(50) not null comment '���� �߲ˡ�ˮ�������ࡢ��ʳ��С�Ե�',
   primary key (id)
);

alter table t_category comment 'ʳ�ķ��ࣺ�߲ˡ�ˮ�������ࡢ��ʳ��С�Ե�
';

/*==============================================================*/
/* Table: t_content                                             */
/*==============================================================*/
create table t_content
(
   id                   int not null comment '����',
   userId               int not null comment '��Ա���',
   dietitianId          int not null comment 'Ӫ��ʦ���',
   zxTime               date not null comment '��ѯʱ��',
   zxText               varchar(200) not null comment '��Ѷ����',
   is_read              int not null comment '0��δ�Ķ���1�����Ķ�',
   zxIdentity           int not null comment '1��Ӫ��ʦ�ظ���0����Ա�ظ�',
   primary key (id)
);

alter table t_content comment '�߼���Ա��Ӫ��ʦ��ѯ����';

/*==============================================================*/
/* Table: t_dietApplication                                     */
/*==============================================================*/
create table t_dietApplication
(
   id                   int not null comment '����',
   userId               int not null comment '�û�id',
   userName             varchar(50) not null comment '����',
   uID                  varchar(20) not null comment '���֤��',
   dietLicense          varchar(50) not null comment 'Ӫ��ʦִ��',
   sqDate               date not null comment '��������',
   sqStatus             int not null comment '����״̬ 0��δ�ɹ���1������ɹ� ��3�������',
   primary key (id)
);

alter table t_dietApplication comment 'Ӫ��ʦ�����';

/*==============================================================*/
/* Table: t_dietPlan                                            */
/*==============================================================*/
create table t_dietPlan
(
   id                   int not null,
   foodPartId           varbinary(64) not null comment '�ƻ�����ĳ�͵�ʳ����ɵ�һ����',
   foodName             varchar(200) not null comment 'ʳ������',
   foodWeight           double not null comment 'ʳ�����',
   actualWeight         double not null comment 'ʵ��������',
   foodId               int not null comment 'ʳ��id',
   primary key (id)
);

alter table t_dietPlan comment '��ʳ�ƻ����о�������';

/*==============================================================*/
/* Table: t_dietitian                                           */
/*==============================================================*/
create table t_dietitian
(
   id                   int not null comment '����',
   userId               int not null comment '�û�id',
   userName             varchar(50) not null comment '����',
   uID                  varchar(20) not null comment '���֤��',
   dietLicense          varchar(50) not null comment 'Ӫ��ʦִ��',
   sqDate               date not null comment '��������',
   sqStatus             int not null comment '1����ʹ�á�0������ʹ��',
   primary key (id)
);

alter table t_dietitian comment 'Ӫ��ʦ��';

/*==============================================================*/
/* Table: t_dietitionComment                                    */
/*==============================================================*/
create table t_dietitionComment
(
   id                   int not null,
   comText              varchar(200) not null comment '��������',
   comLevel             int not null comment '�����Ǽ�1-5��',
   userId               int not null comment '�û�id',
   userName             varchar(50) not null comment '�û���',
   primary key (id)
);

alter table t_dietitionComment comment 'Ӫ��ʦ����';

/*==============================================================*/
/* Table: t_foodNutrition                                       */
/*==============================================================*/
create table t_foodNutrition
(
   id                   int not null comment '����',
   timeName             varchar(64) comment '����ʱ��',
   foodName             varchar(32) comment '����',
   eatPart              varchar(32) comment '��ʳ�ò���ÿһ�ٿ�',
   energy               varchar(32) comment '����',
   waterContent         varchar(32) comment 'ˮ��',
   protein              varchar(32) comment '������',
   fat                  varchar(32) comment '֬��',
   dietaryFiber         varchar(32) comment '��ʳ��ά',
   carbohydrate         varchar(32) comment '̼ˮ����',
   vitaminsA            varchar(32) comment 'ά����A',
   vitaminsB1           varchar(32) comment 'ά����B1',
   vitaminsB2           varchar(32) comment 'ά����B2',
   vitaminsC            varchar(32) comment 'ά����C',
   vitaminsE            varchar(32) comment 'ά����E',
   niacin               varchar(32) comment '����',
   na                   varchar(32) comment '��',
   calcium              varchar(32) comment '��',
   iron                 varchar(32) comment '��',
   category             varchar(32) comment '���',
   cholesterol          varchar(32) comment '���̴�
            ',
   primary key (id)
);

alter table t_foodNutrition comment 'ʳ��Ӫ����';

/*==============================================================*/
/* Table: t_healthInfo                                          */
/*==============================================================*/
create table t_healthInfo
(
   id                   int not null,
   createTime           date not null comment '����ʱ��',
   updateTime           date not null comment '�޸�ʱ��',
   inforText            varchar(2000) not null comment '��Ѷ����',
   primary key (id)
);

alter table t_healthInfo comment '������Ѷ';

/*==============================================================*/
/* Table: t_healthRemind                                        */
/*==============================================================*/
create table t_healthRemind
(
   id                   int not null,
   txText               varchar(200) not null comment '��������',
   txUserId             int not null comment '���ѻ�Ա',
   primary key (id)
);

alter table t_healthRemind comment 'Ӫ��ʦ��Ա����';

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   varchar(64) not null comment '����',
   total                double not null comment '�����ܽ��',
   orderTime            date not null comment '�µ�ʱ��',
   orderStates          int not null comment '����״̬ 1:δ����  2������δ����  3���ѷ���  4���������',
   userName             varchar(50) not null comment '�ջ�������',
   userPhone            varchar(20) not null comment '�ջ��˵绰',
   userAddr             varchar(200) not null comment '�ջ���ַ',
   userId               int not null comment '�û�id',
   id_del               int comment '1:δɾ�����á�0����ɾ��������',
   primary key (id)
);

alter table t_order comment '����';

/*==============================================================*/
/* Table: t_orderItem                                           */
/*==============================================================*/
create table t_orderItem
(
   id                   int not null comment '����',
   count                int not null comment '��Ʒ����',
   subtotal             double not null comment '��ƷС��',
   orderId              varchar(64) not null comment '����������',
   pid                  int not null comment '��Ʒid',
   primary key (id)
);

alter table t_orderItem comment '���ﶩ����';

/*==============================================================*/
/* Table: t_orderStatistics                                     */
/*==============================================================*/
create table t_orderStatistics
(
   id                   int not null,
   storeSqCount         int not null comment '�̼�������',
   totalOrderCount      int not null comment 'ÿ�ն�������',
   cancelOrderCount     int not null comment 'ÿ��ȡ����������',
   complOrderCount      int not null comment 'ÿ�ս��������',
   totalAmount          double not null comment 'ÿ�ճɽ���',
   primary key (id)
);

alter table t_orderStatistics comment '�������ͳ��';

/*==============================================================*/
/* Table: t_pComment                                            */
/*==============================================================*/
create table t_pComment
(
   id                   int not null,
   comText              varchar(1000) not null comment '�������� �ı�',
   comType              int not null comment '���۵ȼ� 1��������2��������3������',
   comLevel             int not null comment '���� 1-5��',
   pId                  int not null comment '��Ʒid',
   userName             varchar(50) not null comment '�û�����',
   userId               int not null comment '�û�id',
   primary key (id)
);

alter table t_pComment comment '��Ʒ����';

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   id                   int not null comment '����',
   name                 varchar(128) not null comment '��Դ����',
   type                 varchar(128) not null comment '��Դ���ͣ�menu,button,',
   url                  varchar(128) not null comment '����url��ַ',
   percode              varchar(128) not null comment 'Ȩ�޴����ַ���',
   parentid             int not null comment '�����id',
   parentids            varchar(128) not null comment '�����id�б�',
   sortstring           varchar(128) not null comment '�����',
   available            int not null comment '�Ƿ����,1�����ã�0������',
   primary key (id)
);

alter table t_permission comment '��ԴȨ�ޱ�';

/*==============================================================*/
/* Table: t_product                                             */
/*==============================================================*/
create table t_product
(
   id                   int not null comment '����',
   pName                varchar(100) not null comment '��Ʒ����',
   pPrice               double not null comment '��Ʒ�۸�',
   pPic                 varchar(400) not null comment 'ͼƬ',
   pDesc                varchar(2000) not null comment '��Ʒ����',
   pCreatTime           date not null comment '�ϼ�ʱ��',
   id_hot               int not null comment '�Ƿ�������Ʒ 1:����  ��2����������',
   pStock               int not null comment '���',
   pSellNum             int not null comment '����',
   is_sell              int not null comment '���¼�  1���ϼܣ� 2���¼�',
   pType                varchar(50) not null comment '��Ʒ����',
   primary key (id)
);

alter table t_product comment '��Ʒ��Ϣ';

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   int not null,
   roleName             varchar(64) not null,
   available            int not null comment '�Ƿ����,1�����ã�0������',
   primary key (id)
);

alter table t_role comment '��ɫ�� ';

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   id                   int not null,
   roleId               int not null comment '��ɫid',
   permissId            int not null comment 'Ȩ��id',
   primary key (id)
);

alter table t_role_permission comment '��ɫȨ�ޱ�';

/*==============================================================*/
/* Table: t_season                                              */
/*==============================================================*/
create table t_season
(
   id                   int not null,
   timeName             varchar(50) not null comment 'ʱ������',
   startDate            date not null comment '��ʼʱ��',
   endDate              date not null comment '����ʱ��',
   primary key (id)
);

alter table t_season comment 'ʱ��';

/*==============================================================*/
/* Table: t_seasonInfor                                         */
/*==============================================================*/
create table t_seasonInfor
(
   id                   int not null,
   careatTime           date not null comment '����ʱ��',
   season               varchar(20) not null comment '��������',
   inforText            varchar(2000) not null comment '��Ѷ����',
   updatedTime          date not null comment '�޸�ʱ��',
   primary key (id)
);

alter table t_seasonInfor comment '������Ѷ';

/*==============================================================*/
/* Table: t_sportsOption                                        */
/*==============================================================*/
create table t_sportsOption
(
   id                   varchar(64) not null,
   optionName           varchar(200) not null comment '�ƻ���Ŀ����',
   energy               double not null comment '��������',
   actualOption         varchar(64) not null comment 'ʵ�������Ŀ����',
   primary key (id)
);

alter table t_sportsOption comment '�˶���Ŀ';

/*==============================================================*/
/* Table: t_storeApplication                                    */
/*==============================================================*/
create table t_storeApplication
(
   id                   int not null,
   userId               int not null comment '�û�id',
   storeName            varchar(50) not null comment '�̼�����',
   storeId              varchar(20) not null comment '���id',
   storeAddr            varchar(200) not null comment '�̼ҵ�ַ',
   storeLicense         varchar(200) not null comment 'Ӫҵִ��',
   storeType            varchar(50) not null comment '�̼�����',
   sqDate               date not null comment '��������',
   sqStatus             int not null comment '����״̬ 0��δ�ɹ���1������ɹ� ��3�������',
   primary key (id)
);

alter table t_storeApplication comment '�̼������';

/*==============================================================*/
/* Table: t_storeComment                                        */
/*==============================================================*/
create table t_storeComment
(
   id                   int not null,
   commentText          varchar(200) comment '��������',
   commentLevel         int comment '�����Ǽ� 1-5��',
   userId               int not null comment '�û�id',
   primary key (id)
);

alter table t_storeComment comment '�û����̼ҵ�����';

/*==============================================================*/
/* Table: t_storeInfo                                           */
/*==============================================================*/
create table t_storeInfo
(
   id                   int not null comment '����',
   storeName            varchar(200) not null comment '�̼�����',
   sName                varchar(50) not null comment '��������',
   sPhone               varchar(20) not null comment '�绰',
   sID                  varchar(20) not null comment '���֤',
   sLicense             varchar(50) comment 'Ӫҵִ��',
   sAddr                varchar(200) not null comment '�̼ҵ�ַ',
   is_check             int not null comment ' �Ƿ���� 1������ˡ�0��δ���',
   sType                varchar(50) not null comment '�̼�����',
   primary key (id)
);

alter table t_storeInfo comment '�̼���Ϣ';

/*==============================================================*/
/* Table: t_storeTuiSong                                        */
/*==============================================================*/
create table t_storeTuiSong
(
   id                   int not null,
   storeId              int not null comment '�̼�id',
   storeName            varchar(50) not null comment '�̼�����',
   tsTime               date not null comment '����ʱ��',
   tsText               varchar(2000) not null comment '��������',
   primary key (id)
);

alter table t_storeTuiSong comment '�̼�����';

/*==============================================================*/
/* Table: t_storeType                                           */
/*==============================================================*/
create table t_storeType
(
   id                   int not null comment '����',
   storeType            varchar(50) not null comment '�̼�����',
   primary key (id)
);

alter table t_storeType comment '�̼����ͣ�';

/*==============================================================*/
/* Table: t_userDietPlan                                        */
/*==============================================================*/
create table t_userDietPlan
(
   id                   int not null comment 'id',
   userId               int not null comment '�û�id',
   dietitionId          int comment 'Ӫ��ʦid  ���ΪӪ��ʦ�ƶ��ļƻ� Ӫ��ʦid�������',
   dietDay              date not null comment '����',
   breakfast            varbinary(64) not null comment '�����ʳ',
   lunch                varbinary(64) not null comment '�����ʳ',
   dinner               varbinary(64) not null comment '�����ʳ',
   remarks              varchar(200) comment '��ע',
   primary key (id)
);

alter table t_userDietPlan comment '��Ա��ʳ�ƻ�';

/*==============================================================*/
/* Table: t_userHealthInfo                                      */
/*==============================================================*/
create table t_userHealthInfo
(
   id                   int not null,
   height               double not null comment '���',
   weight               double not null comment '����',
   sex                  int not null comment '�Ա� 1:�� ��2��Ů',
   birthday             date not null comment '��������',
   dietPrefe            varchar(200) not null comment '��ʳƫ��',
   notLikeFoos          varchar(200) not null comment '��ϲ��ʳ��',
   healStatus           varchar(20) not null comment '����״��',
   medHis               varchar(200) not null comment '��ʷ',
   SenFoods             varchar(200) not null comment '����ʳ��',
   primary key (id)
);

/*==============================================================*/
/* Table: t_userInfo                                            */
/*==============================================================*/
create table t_userInfo
(
   id                   int not null comment '����',
   userName             varchar(32) not null comment '�û���',
   passWord             varchar(64) comment '����',
   name                 varchar(64) not null comment '��Ա����',
   phone                varchar(64) not null comment '�绰',
   email                varchar(20) not null comment '����',
   createdTime          date not null comment '����ʱ��',
   updatedTime          date not null comment '����ʱ��',
   state                int not null comment '����״̬  1:�Ѽ���  ��2��δ����',
   stateCode            varchar(64) not null comment '������',
   dietitianId          int not null comment 'ѡ��Ӫ��ʦid',
   is_vip               int comment '�Ƿ�߼���Ա0:���ǡ�1���߼���Ա',
   primary key (id)
);

alter table t_userInfo comment '��Ա��Ϣ';

/*==============================================================*/
/* Table: t_userLog                                             */
/*==============================================================*/
create table t_userLog
(
   id                   int not null comment 'z����',
   loginDate            date not null comment '��¼ʱ��',
   loginIP              varchar(15) not null comment '��¼ip',
   primary key (id)
);

/*==============================================================*/
/* Table: t_userSportsPlan                                      */
/*==============================================================*/
create table t_userSportsPlan
(
   id                   int not null,
   userId               int comment '��Աid',
   dietitionId          int not null comment 'Ӫ��ʦid',
   soprtsDate           date not null comment '����',
   planSportsId         varchar(64) not null comment '�˶���Ŀid',
   remarks              varchar(200) comment 'ÿ��ı�ע',
   primary key (id)
);

alter table t_userSportsPlan comment '��Ա�˶��ƻ�';

/*==============================================================*/
/* Table: t_userStatistics                                      */
/*==============================================================*/
create table t_userStatistics
(
   id                   int not null,
   dates                date not null comment 'id',
   accessCount          int not null comment '��վ������',
   registerCount        int not null comment '�û�ע����',
   loginCount           int not null comment '�û���¼��',
   addVipUserCount      int not null comment '�����߼���Ա��',
   primary key (id)
);

alter table t_userStatistics comment '�û�ͳ��';

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   id                   int not null,
   userId               int not null comment '�û�id',
   roleId               int not null comment '��ɫid',
   primary key (id)
);

alter table t_user_role comment '�û���ɫ��';

/*==============================================================*/
/* Table: t_vipApplication                                      */
/*==============================================================*/
create table t_vipApplication
(
   id                   int not null,
   sqDate               date not null comment '��������',
   userId               int not null comment '��Աid',
   userName             varchar(50) not null comment '��Ա����',
   sqStatus             int not null comment '����״̬ 0��δ�ɹ���1������ɹ� ��3�������',
   primary key (id)
);

alter table t_vipApplication comment '�߼���Ա�����';

/*==============================================================*/
/* Table: t_vipDietApplication                                  */
/*==============================================================*/
create table t_vipDietApplication
(
   id                   int not null,
   userID               int not null comment '�û�id',
   userName             varchar(20) not null comment '�û���',
   sqDate               date not null comment '����ʱ��',
   sqStatus             int not null comment '����״̬',
   dietitianId          int not null comment 'Ӫ��ʦid',
   primary key (id)
);

alter table t_vipDietApplication comment '�߼���Ա��Ӫ��ʦ�ƶ�������';

