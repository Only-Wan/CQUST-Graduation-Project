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
   id                   int not null comment '主键id',
   addr                 varchar(200) not null comment '地址',
   userId               int comment '用户主键',
   primary key (id)
);

alter table t_address comment '购物收货地址';

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

alter table t_admin comment '管理员';

/*==============================================================*/
/* Table: t_cart                                                */
/*==============================================================*/
create table t_cart
(
   id                   int not null comment '主键',
   total                double comment '总金额',
   userId               int not null comment '用户id',
   primary key (id)
);

alter table t_cart comment '购物车';

/*==============================================================*/
/* Table: t_cartItem                                            */
/*==============================================================*/
create table t_cartItem
(
   主键id                 int not null comment '主键',
   count                int not null comment '商品数量',
   subTotal             double not null comment '商品金额小计',
   cartId               int not null comment '购物车id',
   pid                  int not null comment '商品id',
   primary key (主键id)
);

alter table t_cartItem comment '购物项';

/*==============================================================*/
/* Table: t_category                                            */
/*==============================================================*/
create table t_category
(
   id                   int not null comment '主键',
   categoryName         varchar(50) not null comment '分类 蔬菜、水果、肉类、熟食、小吃等',
   primary key (id)
);

alter table t_category comment '食材分类：蔬菜、水果、肉类、熟食、小吃等
';

/*==============================================================*/
/* Table: t_content                                             */
/*==============================================================*/
create table t_content
(
   id                   int not null comment '主键',
   userId               int not null comment '会员编号',
   dietitianId          int not null comment '营养师编号',
   zxTime               date not null comment '咨询时间',
   zxText               varchar(200) not null comment '资讯内容',
   is_read              int not null comment '0：未阅读、1：已阅读',
   zxIdentity           int not null comment '1：营养师回复、0：会员回复',
   primary key (id)
);

alter table t_content comment '高级会员向营养师咨询留言';

/*==============================================================*/
/* Table: t_dietApplication                                     */
/*==============================================================*/
create table t_dietApplication
(
   id                   int not null comment '主键',
   userId               int not null comment '用户id',
   userName             varchar(50) not null comment '姓名',
   uID                  varchar(20) not null comment '身份证号',
   dietLicense          varchar(50) not null comment '营养师执照',
   sqDate               date not null comment '申请日期',
   sqStatus             int not null comment '申请状态 0：未成功，1：申请成功 ，3：待审核',
   primary key (id)
);

alter table t_dietApplication comment '营养师申请表';

/*==============================================================*/
/* Table: t_dietPlan                                            */
/*==============================================================*/
create table t_dietPlan
(
   id                   int not null,
   foodPartId           varbinary(64) not null comment '计划表中某餐的食物组成的一部分',
   foodName             varchar(200) not null comment '食物名称',
   foodWeight           double not null comment '食物分量',
   actualWeight         double not null comment '实际完成情况',
   foodId               int not null comment '食物id',
   primary key (id)
);

alter table t_dietPlan comment '饮食计划表中具体体现';

/*==============================================================*/
/* Table: t_dietitian                                           */
/*==============================================================*/
create table t_dietitian
(
   id                   int not null comment '主键',
   userId               int not null comment '用户id',
   userName             varchar(50) not null comment '姓名',
   uID                  varchar(20) not null comment '身份证号',
   dietLicense          varchar(50) not null comment '营养师执照',
   sqDate               date not null comment '申请日期',
   sqStatus             int not null comment '1：可使用、0：不可使用',
   primary key (id)
);

alter table t_dietitian comment '营养师表';

/*==============================================================*/
/* Table: t_dietitionComment                                    */
/*==============================================================*/
create table t_dietitionComment
(
   id                   int not null,
   comText              varchar(200) not null comment '评论内容',
   comLevel             int not null comment '评论星级1-5级',
   userId               int not null comment '用户id',
   userName             varchar(50) not null comment '用户名',
   primary key (id)
);

alter table t_dietitionComment comment '营养师评价';

/*==============================================================*/
/* Table: t_foodNutrition                                       */
/*==============================================================*/
create table t_foodNutrition
(
   id                   int not null comment '主键',
   timeName             varchar(64) comment '所属时令',
   foodName             varchar(32) comment '名称',
   eatPart              varchar(32) comment '可食用部分每一百克',
   energy               varchar(32) comment '能量',
   waterContent         varchar(32) comment '水分',
   protein              varchar(32) comment '蛋白质',
   fat                  varchar(32) comment '脂肪',
   dietaryFiber         varchar(32) comment '膳食纤维',
   carbohydrate         varchar(32) comment '碳水化物',
   vitaminsA            varchar(32) comment '维生素A',
   vitaminsB1           varchar(32) comment '维生素B1',
   vitaminsB2           varchar(32) comment '维生素B2',
   vitaminsC            varchar(32) comment '维生素C',
   vitaminsE            varchar(32) comment '维生素E',
   niacin               varchar(32) comment '烟酸',
   na                   varchar(32) comment '钠',
   calcium              varchar(32) comment '钙',
   iron                 varchar(32) comment '铁',
   category             varchar(32) comment '类别',
   cholesterol          varchar(32) comment '胆固醇
            ',
   primary key (id)
);

alter table t_foodNutrition comment '食物营养表';

/*==============================================================*/
/* Table: t_healthInfo                                          */
/*==============================================================*/
create table t_healthInfo
(
   id                   int not null,
   createTime           date not null comment '创建时间',
   updateTime           date not null comment '修改时间',
   inforText            varchar(2000) not null comment '资讯内容',
   primary key (id)
);

alter table t_healthInfo comment '健康资讯';

/*==============================================================*/
/* Table: t_healthRemind                                        */
/*==============================================================*/
create table t_healthRemind
(
   id                   int not null,
   txText               varchar(200) not null comment '提醒内容',
   txUserId             int not null comment '提醒会员',
   primary key (id)
);

alter table t_healthRemind comment '营养师会员提醒';

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   varchar(64) not null comment '主键',
   total                double not null comment '订单总金额',
   orderTime            date not null comment '下单时间',
   orderStates          int not null comment '订单状态 1:未付款  2：付款未发货  3：已发货  4：交易完成',
   userName             varchar(50) not null comment '收货人姓名',
   userPhone            varchar(20) not null comment '收货人电话',
   userAddr             varchar(200) not null comment '收货地址',
   userId               int not null comment '用户id',
   id_del               int comment '1:未删除可用、0：已删除不可用',
   primary key (id)
);

alter table t_order comment '订单';

/*==============================================================*/
/* Table: t_orderItem                                           */
/*==============================================================*/
create table t_orderItem
(
   id                   int not null comment '主键',
   count                int not null comment '商品数量',
   subtotal             double not null comment '商品小计',
   orderId              varchar(64) not null comment '所属订单好',
   pid                  int not null comment '商品id',
   primary key (id)
);

alter table t_orderItem comment '购物订单项';

/*==============================================================*/
/* Table: t_orderStatistics                                     */
/*==============================================================*/
create table t_orderStatistics
(
   id                   int not null,
   storeSqCount         int not null comment '商家申请量',
   totalOrderCount      int not null comment '每日订单总量',
   cancelOrderCount     int not null comment '每日取消订单总量',
   complOrderCount      int not null comment '每日交易完成量',
   totalAmount          double not null comment '每日成交额',
   primary key (id)
);

alter table t_orderStatistics comment '订单金额统计';

/*==============================================================*/
/* Table: t_pComment                                            */
/*==============================================================*/
create table t_pComment
(
   id                   int not null,
   comText              varchar(1000) not null comment '评论内容 文本',
   comType              int not null comment '评论等级 1：好评，2：中评，3：差评',
   comLevel             int not null comment '五星 1-5星',
   pId                  int not null comment '商品id',
   userName             varchar(50) not null comment '用户姓名',
   userId               int not null comment '用户id',
   primary key (id)
);

alter table t_pComment comment '商品评论';

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   id                   int not null comment '主键',
   name                 varchar(128) not null comment '资源名称',
   type                 varchar(128) not null comment '资源类型：menu,button,',
   url                  varchar(128) not null comment '访问url地址',
   percode              varchar(128) not null comment '权限代码字符串',
   parentid             int not null comment '父结点id',
   parentids            varchar(128) not null comment '父结点id列表串',
   sortstring           varchar(128) not null comment '排序号',
   available            int not null comment '是否可用,1：可用，0不可用',
   primary key (id)
);

alter table t_permission comment '资源权限表';

/*==============================================================*/
/* Table: t_product                                             */
/*==============================================================*/
create table t_product
(
   id                   int not null comment '主键',
   pName                varchar(100) not null comment '商品名称',
   pPrice               double not null comment '商品价格',
   pPic                 varchar(400) not null comment '图片',
   pDesc                varchar(2000) not null comment '商品描述',
   pCreatTime           date not null comment '上架时间',
   id_hot               int not null comment '是否热门商品 1:热门  ，2：不是热门',
   pStock               int not null comment '库存',
   pSellNum             int not null comment '销量',
   is_sell              int not null comment '上下架  1：上架， 2：下架',
   pType                varchar(50) not null comment '商品分类',
   primary key (id)
);

alter table t_product comment '商品信息';

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   int not null,
   roleName             varchar(64) not null,
   available            int not null comment '是否可用,1：可用，0不可用',
   primary key (id)
);

alter table t_role comment '角色表 ';

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   id                   int not null,
   roleId               int not null comment '角色id',
   permissId            int not null comment '权限id',
   primary key (id)
);

alter table t_role_permission comment '角色权限表';

/*==============================================================*/
/* Table: t_season                                              */
/*==============================================================*/
create table t_season
(
   id                   int not null,
   timeName             varchar(50) not null comment '时令名称',
   startDate            date not null comment '开始时间',
   endDate              date not null comment '结束时间',
   primary key (id)
);

alter table t_season comment '时令';

/*==============================================================*/
/* Table: t_seasonInfor                                         */
/*==============================================================*/
create table t_seasonInfor
(
   id                   int not null,
   careatTime           date not null comment '创建时间',
   season               varchar(20) not null comment '所属季节',
   inforText            varchar(2000) not null comment '资讯内容',
   updatedTime          date not null comment '修改时间',
   primary key (id)
);

alter table t_seasonInfor comment '季节资讯';

/*==============================================================*/
/* Table: t_sportsOption                                        */
/*==============================================================*/
create table t_sportsOption
(
   id                   varchar(64) not null,
   optionName           varchar(200) not null comment '计划项目名称',
   energy               double not null comment '消耗能量',
   actualOption         varchar(64) not null comment '实际完成项目名称',
   primary key (id)
);

alter table t_sportsOption comment '运动项目';

/*==============================================================*/
/* Table: t_storeApplication                                    */
/*==============================================================*/
create table t_storeApplication
(
   id                   int not null,
   userId               int not null comment '用户id',
   storeName            varchar(50) not null comment '商家名称',
   storeId              varchar(20) not null comment '身份id',
   storeAddr            varchar(200) not null comment '商家地址',
   storeLicense         varchar(200) not null comment '营业执照',
   storeType            varchar(50) not null comment '商家类型',
   sqDate               date not null comment '申请日期',
   sqStatus             int not null comment '申请状态 0：未成功，1：申请成功 ，3：待审核',
   primary key (id)
);

alter table t_storeApplication comment '商家申请表';

/*==============================================================*/
/* Table: t_storeComment                                        */
/*==============================================================*/
create table t_storeComment
(
   id                   int not null,
   commentText          varchar(200) comment '评论内容',
   commentLevel         int comment '评论星级 1-5星',
   userId               int not null comment '用户id',
   primary key (id)
);

alter table t_storeComment comment '用户对商家的评论';

/*==============================================================*/
/* Table: t_storeInfo                                           */
/*==============================================================*/
create table t_storeInfo
(
   id                   int not null comment '主键',
   storeName            varchar(200) not null comment '商家名称',
   sName                varchar(50) not null comment '店主姓名',
   sPhone               varchar(20) not null comment '电话',
   sID                  varchar(20) not null comment '身份证',
   sLicense             varchar(50) comment '营业执照',
   sAddr                varchar(200) not null comment '商家地址',
   is_check             int not null comment ' 是否审核 1：已审核、0：未审核',
   sType                varchar(50) not null comment '商家类型',
   primary key (id)
);

alter table t_storeInfo comment '商家信息';

/*==============================================================*/
/* Table: t_storeTuiSong                                        */
/*==============================================================*/
create table t_storeTuiSong
(
   id                   int not null,
   storeId              int not null comment '商家id',
   storeName            varchar(50) not null comment '商家名称',
   tsTime               date not null comment '推送时间',
   tsText               varchar(2000) not null comment '推送内容',
   primary key (id)
);

alter table t_storeTuiSong comment '商家推送';

/*==============================================================*/
/* Table: t_storeType                                           */
/*==============================================================*/
create table t_storeType
(
   id                   int not null comment '主键',
   storeType            varchar(50) not null comment '商家类型',
   primary key (id)
);

alter table t_storeType comment '商家类型：';

/*==============================================================*/
/* Table: t_userDietPlan                                        */
/*==============================================================*/
create table t_userDietPlan
(
   id                   int not null comment 'id',
   userId               int not null comment '用户id',
   dietitionId          int comment '营养师id  如果为营养师制定的计划 营养师id必须存在',
   dietDay              date not null comment '日期',
   breakfast            varbinary(64) not null comment '早餐饮食',
   lunch                varbinary(64) not null comment '午餐饮食',
   dinner               varbinary(64) not null comment '晚餐饮食',
   remarks              varchar(200) comment '备注',
   primary key (id)
);

alter table t_userDietPlan comment '会员饮食计划';

/*==============================================================*/
/* Table: t_userHealthInfo                                      */
/*==============================================================*/
create table t_userHealthInfo
(
   id                   int not null,
   height               double not null comment '身高',
   weight               double not null comment '体重',
   sex                  int not null comment '性别 1:男 、2：女',
   birthday             date not null comment '出生日期',
   dietPrefe            varchar(200) not null comment '饮食偏好',
   notLikeFoos          varchar(200) not null comment '不喜欢食物',
   healStatus           varchar(20) not null comment '健康状况',
   medHis               varchar(200) not null comment '病史',
   SenFoods             varchar(200) not null comment '过敏食物',
   primary key (id)
);

/*==============================================================*/
/* Table: t_userInfo                                            */
/*==============================================================*/
create table t_userInfo
(
   id                   int not null comment '主键',
   userName             varchar(32) not null comment '用户名',
   passWord             varchar(64) comment '密码',
   name                 varchar(64) not null comment '会员姓名',
   phone                varchar(64) not null comment '电话',
   email                varchar(20) not null comment '邮箱',
   createdTime          date not null comment '创建时间',
   updatedTime          date not null comment '更新时间',
   state                int not null comment '激活状态  1:已激活  ，2：未激活',
   stateCode            varchar(64) not null comment '激活码',
   dietitianId          int not null comment '选择营养师id',
   is_vip               int comment '是否高级会员0:不是、1：高级会员',
   primary key (id)
);

alter table t_userInfo comment '会员信息';

/*==============================================================*/
/* Table: t_userLog                                             */
/*==============================================================*/
create table t_userLog
(
   id                   int not null comment 'z主键',
   loginDate            date not null comment '登录时间',
   loginIP              varchar(15) not null comment '登录ip',
   primary key (id)
);

/*==============================================================*/
/* Table: t_userSportsPlan                                      */
/*==============================================================*/
create table t_userSportsPlan
(
   id                   int not null,
   userId               int comment '会员id',
   dietitionId          int not null comment '营养师id',
   soprtsDate           date not null comment '日期',
   planSportsId         varchar(64) not null comment '运动项目id',
   remarks              varchar(200) comment '每天的备注',
   primary key (id)
);

alter table t_userSportsPlan comment '会员运动计划';

/*==============================================================*/
/* Table: t_userStatistics                                      */
/*==============================================================*/
create table t_userStatistics
(
   id                   int not null,
   dates                date not null comment 'id',
   accessCount          int not null comment '网站访问量',
   registerCount        int not null comment '用户注册量',
   loginCount           int not null comment '用户登录量',
   addVipUserCount      int not null comment '新增高级会员量',
   primary key (id)
);

alter table t_userStatistics comment '用户统计';

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   id                   int not null,
   userId               int not null comment '用户id',
   roleId               int not null comment '角色id',
   primary key (id)
);

alter table t_user_role comment '用户角色表';

/*==============================================================*/
/* Table: t_vipApplication                                      */
/*==============================================================*/
create table t_vipApplication
(
   id                   int not null,
   sqDate               date not null comment '申请日期',
   userId               int not null comment '会员id',
   userName             varchar(50) not null comment '会员姓名',
   sqStatus             int not null comment '申请状态 0：未成功，1：申请成功 ，3：待审核',
   primary key (id)
);

alter table t_vipApplication comment '高级会员申请表';

/*==============================================================*/
/* Table: t_vipDietApplication                                  */
/*==============================================================*/
create table t_vipDietApplication
(
   id                   int not null,
   userID               int not null comment '用户id',
   userName             varchar(20) not null comment '用户名',
   sqDate               date not null comment '申请时间',
   sqStatus             int not null comment '申请状态',
   dietitianId          int not null comment '营养师id',
   primary key (id)
);

alter table t_vipDietApplication comment '高级会员向营养师制定表申请';

