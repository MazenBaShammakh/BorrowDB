DROP TABLE peer CASCADE CONSTRAINTS;
DROP TABLE lender CASCADE CONSTRAINTS;
DROP TABLE borrower CASCADE CONSTRAINTS;
DROP TABLE item CASCADE CONSTRAINTS;
DROP TABLE borrowing CASCADE CONSTRAINTS;
DROP TABLE rating CASCADE CONSTRAINTS;

CREATE TABLE peer (
    user_id NUMBER(3),
    username VARCHAR2(30) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    dob DATE,
    email VARCHAR2(30) NOT NULL,
    passwd VARCHAR2(30) NOT NULL,
    address VARCHAR2(30) NOT NULL,
    identification_card VARCHAR2(12) NOT NULL,
    phone VARCHAR2(12) NOT NULL,
    CONSTRAINT PK_User PRIMARY KEY (user_id)
);

CREATE TABLE lender (
    lender_id NUMBER(3),
    rating NUMBER(2,1),
    no_of_loans NUMBER(2),
    CONSTRAINT PK_Lender PRIMARY KEY (lender_id),
    CONSTRAINT FK_Lender_User FOREIGN KEY (lender_id) REFERENCES peer (user_id) ON DELETE CASCADE
);

CREATE TABLE borrower (
    borrower_id NUMBER(3),
    rating NUMBER(2,1),
    no_of_borrowings NUMBER(2),
    CONSTRAINT PK_Borrower PRIMARY KEY (borrower_id),
    CONSTRAINT FK_Borrower_User FOREIGN KEY (borrower_id) REFERENCES peer (user_id) ON DELETE CASCADE
);

CREATE TABLE item (
    item_id NUMBER(3),
    item_name VARCHAR2(30) NOT NULL,
    item_category VARCHAR2(30) NOT NULL,
    date_posted DATE DEFAULT SYSDATE,
    isAvailable NUMBER(1) DEFAULT 1,
    address VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_Item PRIMARY KEY (item_id)
);

CREATE TABLE borrowing (
    borrowing_id NUMBER(3) NOT NULL,
    item_id NUMBER(3) NOT NULL,
    borrower_id NUMBER(3) NOT NULL,
    lender_id NUMBER(3) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    CONSTRAINT PK_Borrowing PRIMARY KEY (borrowing_id),
    CONSTRAINT FK_Borrowing_Item FOREIGN KEY (item_id) REFERENCES item (item_id) ON DELETE CASCADE,
    CONSTRAINT FK_Borrowing_Borrower FOREIGN KEY (borrower_id) REFERENCES borrower (borrower_id) ON DELETE CASCADE,
    CONSTRAINT FK_Borrowing_Lender FOREIGN KEY (lender_id) REFERENCES lender (lender_id) ON DELETE CASCADE
);

CREATE TABLE rating (
    rating_id NUMBER(3),
    rating_user_id NUMBER(3) NOT NULL,
    rated_user_id NUMBER(3) NOT NULL,
    stars NUMBER(2,1) NOT NULL,
    comments VARCHAR2(30),
    CONSTRAINT PK_Rating PRIMARY KEY (rating_id),
    CONSTRAINT FK_Rating_User_1 FOREIGN KEY (rating_user_id) REFERENCES peer (user_id) ON DELETE CASCADE,
    CONSTRAINT FK_Rating_User_2 FOREIGN KEY (rated_user_id) REFERENCES peer (user_id) ON DELETE CASCADE
);
