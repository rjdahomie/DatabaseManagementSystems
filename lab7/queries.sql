-- Query #1
SELECT COUNT (*)
FROM part_nyc
WHERE on_hand > 70;

-- Query #2
SELECT SUM(on_hand)
FROM (
SELECT *
FROM part_nyc N, color C
WHERE (N.color = C.color_id) AND (C.color_name = 'Red')
UNION ALL
SELECT *
FROM part_sfo S, color C
WHERE (S.color = C.color_id) AND (C.color_name = 'Red')) AS R;

-- Query #3
SELECT DISTINCT(supplier_id, supplier_name)
FROM supplier S
WHERE ((SELECT SUM(N.on_hand)
	FROM part_nyc N
	WHERE (S.supplier_id = N.supplier)) 
	> 	
	(SELECT SUM(F.on_hand)
	FROM part_sfo F
	WHERE (S.supplier_id = F.supplier)));

--Query #4
SELECT DISTINCT(S.supplier_name)
FROM supplier S, part_nyc N
WHERE (S.supplier_id = N.supplier) AND (N.part_number IN
(SELECT DISTINCT (N.part_number)
FROM part_nyc N
EXCEPT
SELECT DISTINCT (F.part_number)
FROM part_sfo F));


--Query #5
UPDATE part_nyc
SET on_hand = on_hand-10
WHERE on_hand>=10;

--Query #6
DELETE FROM part_nyc
WHERE on_hand < 30;


