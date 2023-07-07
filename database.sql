
CREATE DATABASE test_Database;
USE test_Database;
CREATE TABLE Merchant (
    Merchant_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Merchant_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Merchant_Site (
    Merchant_Site_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Shop_Name VARCHAR(255) NOT NULL,
    Merchant_ID BIGINT,
    Shop_Address VARCHAR(255),
    Shop_City VARCHAR(100),
    Shop_Postal_Code VARCHAR(20),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID)
);

CREATE TABLE Client_Verification (
    VerificationID BIGINT PRIMARY KEY AUTO_INCREMENT,
    VerificationStatus ENUM('verified', 'not verified')
);

CREATE TABLE Client (
    Client_Id BIGINT PRIMARY KEY AUTO_INCREMENT,
    Client_Username VARCHAR(255) NOT NULL,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    VerificationID BIGINT,
    FOREIGN KEY (VerificationID) REFERENCES Client_Verification(VerificationID)
);



CREATE TABLE Purchase_Item (
    Item_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Merchant_Site_ID BIGINT , 
    Item_Name VARCHAR(255),
    Item_Price DECIMAL(10, 2),
    Item_Description TEXT,
    FOREIGN KEY (Merchant_Site_ID) REFERENCES Merchant_Site(Merchant_Site_ID)
);

CREATE TABLE Bank (
    Bank_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Bank_Name VARCHAR(255) NOT NULL
);

CREATE TABLE Bank_Branch (
    BranchID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Bank_ID BIGINT,
    BranchName VARCHAR(255),
    Branch_Transaction_Settlement_API VARCHAR(255),
    FOREIGN KEY (Bank_ID) REFERENCES Bank(Bank_ID)
);
CREATE TABLE Transaction_Reviewer (
    Reviewer_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Reviewer_Username VARCHAR(255),
    Reviewer_First_Name VARCHAR(255),
    Reviewer_Last_Name VARCHAR(255),
    Account_Date_Created DATETIME
);

CREATE TABLE Transaction_Review (
    Transaction_Review_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Reviewer_ID BIGINT,
    Review_Date DATETIME,
    Review_Status VARCHAR(255),
    FOREIGN KEY (Reviewer_ID) REFERENCES Transaction_Reviewer(Reviewer_ID)
);


CREATE TABLE TRANSACTION_ORDER(
    ORDER_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    TRANSACTION_ID BIGINT ,
    Item_ID BIGINT , 

    Foreign Key (Item_ID) REFERENCES Purchase_Item(Item_ID)
);

CREATE TABLE CURRENCY(
    CURRENCY_CODE VARCHAR(10) PRIMARY KEY,
    CURRENCY_NAME VARCHAR(20),

    FOREIGN KEY (CURRENCY_CODE) REFERENCES Transaction(CURRENCY_CODE)
);
CREATE TABLE PAYMENT_CARD_BRAND(
    PAYMENT_CARD_BRAND_ID VARCHAR(10) PRIMARY KEY,
    PAYMENT_CARD_BRAND_NAME VARCHAR(10) 
);
CREATE TABLE PAYMENT(
    Payment_Id BIGINT PRIMARY KEY,
    TRANSACTION_ID BIGINT NOT NULL,
    CARD_TOKEN BIGINT NOT NULL,
    CARD_HOLDER_NAME VARCHAR(100) NOT NULL,
    EXPIRATION_MONTH INT,
    EXPIRATION_YEAR INT,
    CARD_CVV_TOKEN BIGINT NOT NULL,
    CARD_TYPE VARCHAR(10),

    PAYMENT_CARD_BRAND_ID VARCHAR(10),

    Foreign Key (PAYMENT_CARD_BRAND_ID) REFERENCES PAYMENT_CARD_BRAND(PAYMENT_CARD_BRAND_ID)
);

CREATE TABLE Transaction (
    Transaction_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Client_Unique_ID BIGINT,
    Bank_Branch_ID BIGINT,
    TRANSACTION_ORDER_ID BIGINT ,
    TRANSACTION_AMOUNT FLOAT,
    CURRENCY_CODE VARCHAR(10),
    SESSION_TOKEN VARCHAR(100),
    TRANSACTION_TYPE VARCHAR(10),
    Payment_Id BIGINT,
    INTERNAL_REQUEST_ID BIGINT,
    Verified BOOLEAN,
    DateTimePerformed DATETIME,
    DEVICE_PERFORMED_IP_ADDRESS VARCHAR(50),
    Settled_Status BOOLEAN,

    FOREIGN KEY (Client_Unique_ID) REFERENCES Client(Client_Id),
    FOREIGN KEY (Bank_Branch_ID) REFERENCES Bank_Branch(BranchID),
    FOREIGN KEY (TRANSACTION_ORDER_ID) REFERENCES TRANSACTION_ORDER(ORDER_ID),
    FOREIGN KEY (Payment_Id) REFERENCES PAYMENT(Payment_Id),

    INDEX(Client_Unique_ID),
    INDEX(Bank_Branch_ID),
    INDEX(TRANSACTION_ORDER_ID)
);


CREATE TABLE TRANSACTION_TRANSACTION_REVIEWS(
    TRANSACTION_ID BIGINT , 
    Transaction_Review_ID BIGINT,
    Primary KEY (TRANSACTION_ID , Transaction_Review_ID),
    Foreign Key (TRANSACTION_ID) REFERENCES Transaction(Transaction_ID),
    Foreign Key (Transaction_Review_ID) REFERENCES Transaction_Review(Transaction_Review_ID)
);


CREATE TABLE Transaction_Shipment (
    Shipment_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Transaction_ID BIGINT,
    Shipment_Date DATETIME,
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
);

CREATE TABLE Transaction_Cancellation (
    Cancellation_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Transaction_ID BIGINT,
    Date_Performed DATETIME,
    FOREIGN KEY (Transaction_ID) REFERENCES Transaction(Transaction_ID)
);

CREATE TABLE Refund_Request (
    Refund_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Transaction_Cancellation_ID BIGINT,
    Status VARCHAR(255),
    FOREIGN KEY (Transaction_Cancellation_ID) REFERENCES Transaction_Cancellation(Cancellation_ID)
);

