SET VERIFY OFF;
SET SERVEROUTPUT ON;

-- function 1
CREATE OR REPLACE FUNCTION days_left
(b_id borrowing.borrowing_id%TYPE)
RETURN NUMBER
IS
    br_date borrowing.borrow_date%TYPE;
    rt_date borrowing.return_date%TYPE;
    dys NUMBER;
BEGIN
    SELECT borrow_date, return_date
    INTO br_date, rt_date
    FROM borrowing
    WHERE borrowing_id = b_id;
    
    dys := rt_date - br_date;

    RETURN dys;
END;

ACCEPT b_id PROMPT 'Enter borrowing ID:';
DECLARE
    dys NUMBER;
    id_check borrowing.borrowing_id%TYPE;
    i_id item.item_id%TYPE;
    i_name item.item_name%TYPE;
BEGIN
    SELECT borrowing_id
    INTO id_check
    FROM borrowing
    WHERE borrowing_id = &b_id;
    
    SELECT item_id
    INTO i_id
    FROM borrowing
    WHERE borrowing_id = &b_id;
    
    SELECT item_name
    INTO i_name
    FROM item
    WHERE item_id = i_id;
    
    dys := days_left(&b_id);
    DBMS_OUTPUT.PUT_LINE('You still have '||dys||' day(s) to return the '||i_name||'.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Invalid borrowing ID... Try again.');
END;

-- function 2
CREATE OR REPLACE PROCEDURE update_rating_borrower
(b_id borrower.borrower_id%TYPE)
IS
    id_check borrower.borrower_id%TYPE;
BEGIN
    SELECT borrower_id
    INTO id_check
    FROM borrower
    WHERE borrower_id = b_id;
    
    UPDATE borrower
    SET rating = (SELECT AVG(stars) FROM rating r JOIN peer p ON r.rated_user_id = p.user_id AND p.user_id = b_id)
    WHERE borrower_id = b_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User is not a borrower :)');
END;

CREATE OR REPLACE PROCEDURE update_rating_lender
(l_id lender.lender_id%TYPE)
IS
    id_check lender.lender_id%TYPE;
BEGIN
    SELECT lender_id
    INTO id_check
    FROM lender
    WHERE lender_id = l_id;
    
    UPDATE lender
    SET rating = (SELECT AVG(stars) FROM rating r JOIN peer p ON r.rated_user_id = p.user_id AND p.user_id = l_id)
    WHERE lender_id = l_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User is not a lender :)');
END;

CREATE OR REPLACE FUNCTION update_rating
(u_id IN peer.user_id%TYPE)
RETURN VARCHAR
IS
    u_name peer.name%TYPE;
BEGIN
    SELECT peer.name
    INTO u_name
    FROM peer
    WHERE user_id = u_id;
    
    update_rating_borrower(u_id);
    update_rating_lender(u_id);
    
    RETURN 'Ratings updated for '||u_name||'.';
END;

ACCEPT u_id PROMPT 'Enter user ID:';
DECLARE
    txt VARCHAR2(255);
BEGIN
    txt := update_rating(&u_id);
    DBMS_OUTPUT.PUT_LINE(txt);
END;