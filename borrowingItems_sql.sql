-- 6.2
SELECT item_category, COUNT(*) AS count_category
FROM item NATURAL JOIN borrowing 
GROUP BY item_category 
HAVING COUNT(*) = (
    SELECT MAX(count_category)
    FROM (
        SELECT item_category, COUNT(*) AS count_category
        FROM item NATURAL JOIN borrowing 
        GROUP BY item_category
    )
);







-- 6.9
UPDATE borrower
SET no_of_borrowings = (
    SELECT COUNT(*) 
    FROM borrowing 
    WHERE borrower_id = (
        SELECT borrower_id 
        FROM peer p JOIN borrower b 
        ON p.user_id = b.borrower_id 
        AND p.name = 'Nada Salem'
        )
    )
WHERE borrower_id = (
    SELECT borrower_id 
    FROM peer p JOIN borrower b 
    ON p.user_id = b.borrower_id 
    AND p.name = 'Nada Salem'
);

-- 6.8
UPDATE borrower
SET rating = (SELECT AVG(stars) FROM rating r JOIN peer p ON r.rated_user_id = p.user_id AND p.name = 'Emad Salem')
WHERE borrower_id = (SELECT user_id FROM peer WHERE peer.name = 'Emad Salem');

UPDATE lender
SET rating = (SELECT AVG(stars) FROM rating r JOIN peer p ON r.rated_user_id = p.user_id AND p.name = 'Emad Salem')
WHERE lender_id = (SELECT user_id FROM peer WHERE peer.name = 'Emad Salem');

-- 6.10
INSERT INTO peer
VALUES (peer_user_id_seq.nextval, 'azb42', 'Ali Baba', '15-MAR-89', 'ali@gmail.com', 'aldkfaho974hf', 'Petaling Jaya', 
    '5358151863', '537-6485');
INSERT INTO borrower (borrower_id)
VALUES (peer_user_id_seq.currval);

-- 6.7
DELETE FROM peer
WHERE user_id NOT IN (SELECT borrower_id FROM borrower) 
AND user_id NOT IN (SELECT lender_id FROM lender);
-- user_id 109 was removed

-- 6.6
SELECT b_i.item_name, p_l.lender_id, p_l.name
FROM (
    SELECT * 
    FROM borrowing b JOIN item i 
    ON b.item_id = i.item_id
) b_i 
    JOIN (
        SELECT * 
        FROM peer p JOIN lender l 
        ON p.user_id = l.lender_id
    ) p_l
ON b_i.lender_id = p_l.lender_id
AND b_i.borrower_id = (
    SELECT borrower_id 
    FROM peer p JOIN borrower b 
    ON p.user_id = b.borrower_id 
    AND p.name = 'Alaa Mohammed'
);

-- 6.5
SELECT p.user_id, p.name, p.address
FROM peer p JOIN (
    SELECT * 
    FROM lender l JOIN borrower b 
    ON l.lender_id = b.borrower_id
) ld_br
ON p.user_id = ld_br.lender_id;

desc peer;

-- 6.4
SELECT item_name
FROM item
WHERE isAvailable = 1
AND address = 'Gombak';

-- 6.3
SELECT comments
FROM rating JOIN peer
ON rating.rated_user_id = peer.user_id
AND peer.name = 'Ali Baba';

-- 6.1
SELECT address, COUNT(*)
FROM peer
GROUP BY address
ORDER BY address;