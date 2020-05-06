--How can you isolate (or group) the transactions of each cardholder?
--isolating transaction for specific card holder by card holder id.
SELECT *
FROM transaction
WHERE card in
(
	SELECT card 
	FROM credit_card
	WHERE id_card_holder in
	(
		SELECT id 
		FROM card_holder
		WHERE id=7
	)
);


--Consider the time period 7:00 a.m. to 9:00 a.m. 
--What are the 100 highest transactions during this time period?
-- selecting the 100 highst transactions between 7am and 9am:
SELECT *
FROM transaction AS t
WHERE EXTRACT(HOUR FROM t.date) BETWEEN 7 AND 8
ORDER BY t.amount DESC
LIMIT 100;
--Do you see any fraudulent or anomalous transactions?
--YES
--explain why you think there might be fraudulent transactions during this time frame.



--number of transactions that are less than $2.00 per card_holder
SELECT  COUNT(t.card) AS count, ch.name
FROM transaction AS t
INNER JOIN credit_card AS c ON  t.card=c.card
INNER JOIN card_holder AS ch ON c.id_card_holder=ch.id
WHERE t.amount<2 
GROUP BY ch.name 
ORDER BY count DESC;

---number of transactions that are less than $2.00 by grouped by store
SELECT  COUNT(id_merchant) AS count, m.name AS store_name, mc.name AS merchant_category
FROM transaction AS t
INNER JOIN merchant AS m ON t.id_merchant=m.id
INNER JOIN merchant_category AS mc ON m.id_merchant_category=mc.id
WHERE t.amount<2
GROUP BY t.id_merchant,m.name,mc.name
ORDER BY count DESC, t.id_merchant DESC ;

---CREATING VIEWS
CREATE VIEW highest_100_morning_transactions AS 
SELECT *
FROM transaction AS t
WHERE EXTRACT(HOUR FROM t.date) BETWEEN 7 AND 8
ORDER BY t.amount DESC
LIMIT 100;


CREATE VIEW num_of_small_transactions_per_card_holder AS
SELECT   COUNT(t.card) as count, ch.name
FROM transaction as t
INNER JOIN credit_card AS c ON  t.card=c.card
INNER JOIN card_holder AS ch ON c.id_card_holder=ch.id
WHERE t.amount<2 
GROUP BY ch.name 
ORDER BY count DESC;

CREATE VIEW num_of_small_transactions_per_merchant AS
SELECT  COUNT(id_merchant) AS count, m.name AS store_name, mc.name AS merchant_category
FROM transaction AS t
INNER JOIN merchant AS m ON t.id_merchant=m.id
INNER JOIN merchant_category AS mc ON m.id_merchant_category=mc.id
WHERE t.amount<2
GROUP BY t.id_merchant,m.name,mc.name
ORDER BY count DESC, t.id_merchant DESC ;
