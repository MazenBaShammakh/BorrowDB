SET VERIFY OFF;
SET SERVEROUTPUT ON;

-- procedure 1
CREATE OR REPLACE PROCEDURE user_profile
(u_id IN peer.user_id%TYPE)
IS
    u_name peer.name%TYPE;
    address peer.address%TYPE;
    borrowed borrower.no_of_borrowings%TYPE;
    lent lender.no_of_loans%TYPE;
    borrower_rating borrower.rating%TYPE;
    lender_rating lender.rating%TYPE; 
    overall_rating lender.rating%TYPE; -- avg rating of borrower & lender
BEGIN
    SELECT peer.name, address
    INTO u_name, address
    FROM peer
    WHERE user_id = u_id;
    
    SELECT rating, no_of_borrowings
    INTO borrower_rating, borrowed
    FROM borrower
    WHERE borrower_id = u_id;
    
    SELECT rating, no_of_loans
    INTO lender_rating, lent
    FROM lender
    WHERE lender_id = u_id;
    
    IF borrower_rating IS NULL AND lender_rating IS NULL THEN
        overall_rating := -1;
    ELSIF borrower_rating IS NULL THEN
        overall_rating := lender_rating;
    ELSIF lender_rating IS NULL THEN
        overall_rating := borrower_rating;
    ELSE
        overall_rating := (lender_rating + borrower_rating) / 2;
    END IF;
    
    IF borrowed IS NULL THEN
        borrowed := 0;
    END IF;
    
    IF lent IS NULL THEN
        lent := 0;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('----------------------');
    DBMS_OUTPUT.PUT_LINE('User ID: '||u_id);
    DBMS_OUTPUT.PUT_LINE('Name: '||u_name);
    DBMS_OUTPUT.PUT_LINE('Address: '||address);
    DBMS_OUTPUT.PUT_LINE('Borrowed: '||borrowed||' times');
    DBMS_OUTPUT.PUT_LINE('Lent: '||lent||' times');
    IF overall_rating = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Rating: '||'NOT RATED');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Rating: '||overall_rating||'/5.0');
    END IF;
    DBMS_OUTPUT.PUT_LINE('----------------------');
END;

ACCEPT u_id PROMPT 'Enter user ID:';
DECLARE
BEGIN
    user_profile(&u_id);
END;


-- procedure 2
CREATE OR REPLACE PROCEDURE borrow_item
(i_id item.item_id%TYPE,
b_id borrower.borrower_id%TYPE,
l_id lender.lender_id%TYPE,
no_of_days NUMBER)
IS
    item_availability NUMBER(1);
    ids peer.user_id%TYPE;
BEGIN
    SELECT isAvailable
    INTO item_availability
    FROM item
    WHERE item_id = i_id;
    
    IF item_availability = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Item not available for borrowing. Try again later.');
    ELSE        
        SELECT item_id
        INTO ids
        FROM item
        WHERE item_id = i_id;
        
        SELECT borrower_id
        INTO ids
        FROM borrower
        WHERE borrower_id = b_id;
        
        SELECT lender_id
        INTO ids
        FROM lender
        WHERE lender_id = l_id;
        
        UPDATE item
        SET isAvailable = 0
        WHERE item_id = i_id;
        
        INSERT INTO borrowing
        VALUES (borrowing_borrowing_id_seq.nextval, i_id, b_id, l_id, SYSDATE, SYSDATE + no_of_days);
        
        DBMS_OUTPUT.PUT_LINE('Borrowing transaction recorderd.');
        DBMS_OUTPUT.PUT_LINE('Enjoy your borrowing :)');
    END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Invalid item/borrower/lender ID... Try again.');
END;

ACCEPT i_id PROMPT 'Enter item ID:';
ACCEPT b_id PROMPT 'Enter borrower ID:';
ACCEPT l_id PROMPT 'Enter lender ID:';
ACCEPT dys PROMPT 'How many days you want to borrow the item?';
BEGIN
    borrow_item(&i_id,&b_id,&l_id,&dys);
END;