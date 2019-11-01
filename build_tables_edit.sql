/* Replace 'identity' with auto_increment*/
/* Remove go -- replace \)\ngo with );
/* Replace Orders code
/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
    Id          int             auto_increment,
    FirstName   nvarchar(40)    not null,
    LastName    nvarchar(40)    not null,
    City        nvarchar(40)    null,
    Country     nvarchar40)     null,
    Phone       nvarchar(20)    null,
    constraint PK_CUSTOMER primary key (Id)
);

/*==============================================================*/
/* Index: IndexCustomerName                                     */
/*==============================================================*/
create index IndexCustomerName on Customer (
    LastName ASC,
    FirstName ASC
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order"
(
    Id          int             auto_increment,
    OrderDate   datetime        not null default getdate(),
    OrderNumber nvarchar(10)    null,
    CustomerId  int             not null,
    TotalAmount decimal(12,2)   null default 0,
    constraint PK_ORDER primary key (Id)
);

        /*==============================================================*/
        /* Index: IndexOrderCustomerId                                  */
        /*==============================================================*/
        create index IndexOrderCustomerId on "Order" (
CustomerId ASC
);

        /*==============================================================*/
        /* Index: IndexOrderOrderDate                                   */
        /*==============================================================*/
        create index IndexOrderOrderDate on "Order" (
OrderDate ASC
);

        /*==============================================================*/
        /* Table: OrderItem                                             */
        /*==============================================================*/
        create table OrderItem
        (
            Id int
            auto_increment,
    OrderId int not null,
    ProductId int not null,
    UnitPrice decimal
            (12,2) not null default 0,
    Quantity int not null default 1,
    constraint PK_ORDERITEM primary key
            (Id)
);

            /*==============================================================*/
            /* Index: IndexOrderItemOrderId                                 */
            /*==============================================================*/
            create index IndexOrderItemOrderId on OrderItem (
OrderId ASC
);

            /*==============================================================*/
            /* Index: IndexOrderItemProductId                               */
            /*==============================================================*/
            create index IndexOrderItemProductId on OrderItem (
ProductId ASC
);

            /*==============================================================*/
            /* Table: Product                                               */
            /*==============================================================*/
            create table Product
            (
                Id int
                auto_increment,
    ProductName nvarchar
                (50) not null,
    SupplierId int not null,
    UnitPrice decimal
                (12,2) null default 0,
    Package nvarchar
                (30) null,
    IsDiscontinued bit not null default 0,
    constraint PK_PRODUCT primary key
                (Id)
);

                /*==============================================================*/
                /* Index: IndexProductSupplierId                                */
                /*==============================================================*/
                create index IndexProductSupplierId on Product (
SupplierId ASC
);

                /*==============================================================*/
                /* Index: IndexProductName                                      */
                /*==============================================================*/
                create index IndexProductName on Product (
ProductName ASC
);

                /*==============================================================*/
                /* Table: Supplier                                              */
                /*==============================================================*/
                create table Supplier
                (
                    Id int
                    auto_increment,
    CompanyName nvarchar
                    (40) not null,
    ContactName nvarchar
                    (50) null,
    ContactTitle nvarchar
                    (40) null,
    City nvarchar
                    (40) null,
    Country nvarchar
                    (40) null,
    Phone nvarchar
                    (30) null,
    Fax nvarchar
                    (30) null,
    constraint PK_SUPPLIER primary key
                    (Id)
);

                    /*==============================================================*/
                    /* Index: IndexSupplierName                                     */
                    /*==============================================================*/
                    create index IndexSupplierName on Supplier (
CompanyName ASC
);

                    /*==============================================================*/
                    /* Index: IndexSupplierCountry                                  */
                    /*==============================================================*/
                    create index IndexSupplierCountry on Supplier (
Country ASC
);

                    alter table "Order"
   add constraint FK_ORDER_REFERENCE_CUSTOMER foreign key (CustomerId)
      references Customer (Id);

                    alter table OrderItem
   add constraint FK_ORDERITE_REFERENCE_ORDER foreign key (OrderId)
      references "Order" (Id);

                    alter table OrderItem
   add constraint FK_ORDERITE_REFERENCE_PRODUCT foreign key (ProductId)
      references Product (Id);

                    alter table Product
   add constraint FK_PRODUCT_REFERENCE_SUPPLIER foreign key (SupplierId)
      references Supplier (Id);