/*==============================================================*/
/* Table: "Orders"                                               */
/*==============================================================*/
create table Orders
(
    Id          int             auto_increment,
    OrderDate   DATETIME        not null 	default CURRENT_TIMESTAMP(),
    OrderNumber nvarchar(10)    null,
    CustomerId  int             not null,
    TotalAmount decimal(12,2)   null default 0,
    constraint PK_ORDER primary key (Id)
);