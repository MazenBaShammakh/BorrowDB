-- peer table
DROP SEQUENCE peer_user_id_seq;

CREATE SEQUENCE peer_user_id_seq
INCREMENT BY 1
START WITH 100
MAXVALUE 199
NOCYCLE;

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Memo94', 'Muna Ahmed', NULL, 'muna@gmail.com', 'mem0512344442@', 'Gombak', '1234567890', '582-5484');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Mdx2000', 'Mohammed Nur', '12-MAR-00', 'mdx@gmail.com', '051141328$ab', 'Cheras', '5415241863', '547-6585');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Asdf32', 'Assaf Khaled', '26-OCT-99', 'assaf@gmail.com', '8jmmm838rhad', 'Gombak', '7458459652', '587-5451');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Al12', 'Alaa Mohammed', '12-DEC-92', 'alaa@gmail.com', 'f881as22fadg24', 'Gombak', '1234567890', '582-5484');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Fsmb92', 'Faisal Mohammed', '15-FEB-89', 'faisal@gmail.com', 'asdlfaj3r2fad', 'Petaling Jaya', '5416251863', '547-6485');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Majood1', 'Majed Abdullah', NULL, 'majed@gmail.com', 'addmajed233@3', 'Gombak', '1267664890', '582-1349');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Nini81', 'Noha Ibrahim', '30-JAN-81', 'noha@gmail.com', 'adf333322222mn', 'Cheras', '5411111863', '557-6745');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Nado19', 'Nada Salem', '13-AUG-82', 'nada@gmail.com', '8jmmm838rhad', 'Gombak', '7458459652', '587-5451');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Soso00', 'Sana Omar', NULL, 'sana@gmail.com', 'a;ldkfjfa3fadf', 'Gombak', '1236547890', '582-5374');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'azb42', 'Ali Baba', '15-MAR-89', 'ali@gmail.com', 'aldkfaho974hf', 'Petaling Jaya', '5358151863', '537-6485');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Mero29', 'Marwa Hassan', '07-FEB-85', 'marwa@gmail.com', 'mmmero233asdf', 'Petaling Jaya', '1758459652', '513-5451');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'S7s2003', 'Hassan Abdullah', '23-SEP-03', 'hassan@gmail.com', 'qwmmcidhg3993#', 'Gombak', '6746547890', '562-8574');

INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'Omda29', 'Emad Salem', '13-JUN-79', 'emad@gmail.com', 'jiec323edma$%d3', 'Petaling Jaya', '5358676863', '597-6675');


-- borrower table
INSERT INTO borrower (borrower_id)
VALUES (100);

INSERT INTO borrower (borrower_id)
VALUES (102);

INSERT INTO borrower (borrower_id)
VALUES (105);

INSERT INTO borrower (borrower_id, rating, no_of_borrowings)
VALUES (106, 5.0, 2);

INSERT INTO borrower (borrower_id)
VALUES (110);

INSERT INTO borrower (borrower_id, no_of_borrowings)
VALUES (107, 1);

INSERT INTO borrower (borrower_id, rating, no_of_borrowings)
VALUES (112, 3.9, 4);

INSERT INTO borrower (borrower_id, no_of_borrowings)
VALUES (104, 2);

INSERT INTO borrower (borrower_id, no_of_borrowings)
VALUES (103, 1);

INSERT INTO borrower (borrower_id, rating, no_of_borrowings)
VALUES (108, 2.2, 2);


-- lender table
INSERT INTO lender (lender_id, rating)
VALUES (102, 5.0);

INSERT INTO lender (lender_id, rating)
VALUES (100, 2.9);

INSERT INTO lender (lender_id, no_of_loans)
VALUES (108, 2);

INSERT INTO lender (lender_id, rating, no_of_loans)
VALUES (106, 3.0, 1);

INSERT INTO lender (lender_id, no_of_loans)
VALUES (103, 1);

INSERT INTO lender (lender_id, rating)
VALUES (101, 2.7);

INSERT INTO lender (lender_id)
VALUES (110);

INSERT INTO lender (lender_id, no_of_loans)
VALUES (107, 1);

INSERT INTO lender (lender_id, rating, no_of_loans)
VALUES (111, 4.8, 4);

INSERT INTO lender (lender_id, no_of_loans)
VALUES (112, 2);


-- item table
DROP SEQUENCE item_item_id_seq;

CREATE SEQUENCE item_item_id_seq
INCREMENT BY 1
START WITH 200
MAXVALUE 299
NOCYCLE;

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Rounded Table', 'Home', 'Gombak');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Dumbbells', 'Fitness', 'Cheras');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Balance', 'Fitness', 'Gombak');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Exercise Mat', 'Fitness', 'Petaling Jaya');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'PS5', 'Entertainment', 'Gombak');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Barbeque Set', 'Outdoor', 'Cheras');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Tent', 'Outdoor', 'Gombak');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Skateboard', 'Entertainment', 'Gombak');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'DSLR Camera', 'Electronics', 'Petaling Jaya');

INSERT INTO item (item_id, item_name, item_category, address)
VALUES (item_item_id_seq.nextval, 'Drill', 'Home', 'Cheras');


-- borrowing table
DROP SEQUENCE borrowing_borrowing_id_seq;

CREATE SEQUENCE borrowing_borrowing_id_seq
INCREMENT BY 1
START WITH 300
MAXVALUE 399
NOCYCLE;

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 201, 100, 111, SYSDATE, SYSDATE+3);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 200, 105, 112, SYSDATE, SYSDATE+1);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 202, 110, 102, SYSDATE, SYSDATE+1);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 203, 106, 100, SYSDATE, SYSDATE+2);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 205, 102, 106, SYSDATE, SYSDATE+1);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 204, 112, 103, SYSDATE, SYSDATE+3);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 208, 107, 108, SYSDATE, SYSDATE+7);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 207, 104, 110, SYSDATE, SYSDATE+3);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 209, 107, 101, SYSDATE, SYSDATE+2);

INSERT INTO borrowing
VALUES (borrowing_borrowing_id_seq.nextval, 206, 103, 107, SYSDATE, SYSDATE+1);


-- rating table
DROP SEQUENCE rating_rating_id_seq;

CREATE SEQUENCE rating_rating_id_seq
INCREMENT BY 1
START WITH 400
MAXVALUE 499
NOCYCLE;

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 101, 104, 4.8, 'So friendly');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 108, 112, 2.0, NULL);

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 104, 109, 1.1, 'Bad communication');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 104, 109, 5.0, 'Perfect');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 106, 107, 3.7, 'Moderate user');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 111, 112, 3.0, NULL);

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 102, 108, 4.4, 'Very good service');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 108, 111, 3.2, 'Not that good');

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 111, 102, 4.1, NULL);

INSERT INTO rating
VALUES (rating_rating_id_seq.nextval, 105, 100, 1.0, 'Very bad service');
