-- 优惠券表
create table shop_coupon (
    coupon_id varchar(32) not null primary key, -- 优惠券ID
    coupon_price number(10,2) default null, -- 优惠券金额
    user_id varchar(32) default null, -- 用户ID
    order_id varchar(32) default null, -- 订单ID
    is_use number(1) default null, -- 是否使用 0未使用 1已使用
    used_time date default null -- 使用时间
);
-- 商品表
create table shop_goods (
    goods_id varchar(32) not null primary key, -- 商品ID
    goods_name varchar2(32) default null, -- 商品名称
    goods_number number(12) default null, -- 商品库存
    goods_price number(10,2) default null, -- 商品价格
    goods_desc varchar(255) default null, -- 商品描述
    add_time date default null -- 添加时间
);
-- 下单日志
create table shop_goods_number_log (
    goods_id varchar(32) not null, -- 商品ID
    order_id varchar(32) not null, -- 订单ID
    goods_number number(12) default null, -- 库存数量
    log_time date default null -- 日志生成时间
);
alter table shop_goods_number_log add constraint shop_goods_number_log_pk primary key (goods_id, order_id);

-- mq消费者日志表
create table shop_mq_consumer_log (
    msg_id varchar(32) default null,
    group_name varchar(128) not null,
    msg_tag varchar(128) not null,
    msg_key varchar(128) not null,
    msg_body varchar2(255) default null,
    consumer_status number(1) default null, -- 0：正在处理 1：处理成功 2：处理失败
    consumer_times number(1) default null,
    consumer_date date default null,
    remark varchar2(255) default null
);
alter table shop_mq_consumer_log add constraint shop_mq_consumer_log_pk primary key (group_name, msg_tag, msg_key);
-- mq生产者日志表
create table shop_mq_producer_temp (
    id varchar(100) NOT NULL primary key,
    group_name varchar(100) DEFAULT NULL,
    msg_topic varchar(100) DEFAULT NULL,
    msg_tag varchar(100) DEFAULT NULL,
    msg_key varchar(100) DEFAULT NULL,
    msg_body varchar(500) DEFAULT NULL,
    msg_status number(1) DEFAULT NULL, -- '0:未处理;1:已经处理'
    create_time date DEFAULT sysdate
);


CREATE TABLE shop_order (
  order_id varchar(32) NOT NULL primary key, -- '订单ID',
  user_id varchar(32) DEFAULT NULL, -- '用户ID',
  order_status number(1) DEFAULT NULL, -- '订单状态 0未确认 1已确认 2已取消 3无效 4退款',
  pay_status number(1) DEFAULT NULL, -- '支付状态 0未支付 1支付中 2已支付',
  shipping_status number(1) DEFAULT NULL, -- '发货状态 0未发货 1已发货 2已收货',
  address varchar2(255) DEFAULT NULL, -- '收货地址',
  consignee varchar2(255) DEFAULT NULL, -- '收货人',
  goods_id varchar(32) DEFAULT NULL, -- '商品ID',
  goods_number number(12) DEFAULT NULL, -- '商品数量',
  goods_price number(10,2) DEFAULT NULL, -- '商品价格',
  goods_amount number(10,0) DEFAULT NULL, -- '商品总价',
  shipping_fee number(10,2) DEFAULT NULL, -- '运费',
  order_amount number(10,2) DEFAULT NULL, -- '订单价格',
  coupon_id varchar(32) DEFAULT NULL, -- '优惠券ID',
  coupon_paid number(10,2) DEFAULT NULL, -- '优惠券',
  money_paid number(10,2) DEFAULT NULL, -- '已付金额',
  pay_amount number(10,2) DEFAULT NULL, -- '支付金额',
  add_time date DEFAULT NULL, -- '创建时间',
  confirm_time date DEFAULT NULL, -- '订单确认时间',
  pay_time date DEFAULT NULL -- '支付时间'
);


CREATE TABLE shop_pay (
  pay_id varchar(32) NOT NULL primary key, -- '支付编号',
  order_id varchar(32) DEFAULT NULL, -- '订单编号',
  pay_amount number(10,2) DEFAULT NULL, -- '支付金额',
  is_paid number(1) DEFAULT NULL -- '是否已支付 1否 2是'
);

CREATE TABLE shop_user (
  user_id varchar(32) NOT NULL primary key,  -- '用户ID',
  user_name varchar2(255) DEFAULT NULL, -- '用户姓名',
  user_password varchar2(255) DEFAULT NULL, -- '用户密码',
  user_mobile varchar(16) DEFAULT NULL, -- '手机号',
  user_score number(11) DEFAULT NULL, -- '积分',
  user_reg_time date DEFAULT NULL, -- '注册时间',
  user_money number(10,0) DEFAULT NULL -- '用户余额'
); 

CREATE TABLE shop_user_money_log (
  user_id varchar(32) NOT NULL, -- '用户ID',
  order_id varchar(32) NOT NULL, -- '订单ID',
  money_log_type number(1) NOT NULL, -- '日志类型 1订单付款 2 订单退款',
  use_money number(10,2) DEFAULT NULL,
  create_time date DEFAULT NULL -- '日志时间'
);
alter table shop_user_money_log add constraint shop_user_money_log_pk primary key (user_id, order_id, money_log_type);

insert  into shop_goods(goods_id,goods_name,goods_number,goods_price,goods_desc,add_time) values ('345959443973935104','华为P30',999,5000.00,'夜间拍照更美',to_date('2019-07-09 20:38:00', 'yyyy-MM-dd hh24:mi:ss'));
insert  into shop_user(user_id,user_name,user_password,user_mobile,user_score,user_reg_time,user_money) values ('345963634385633280','刘备','123L','18888888888L',100,to_date('2019-07-09 13:37:03', 'yyyy-MM-dd hh24:mi:ss'),900);
