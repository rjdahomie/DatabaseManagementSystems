--Find the total number of parts supplied by each supplier
SELECT S.sname, COUNT(*) as partCount  --I am adding sname so that it is clear what supplier we are talking about when outputting
FROM suppliers S, catalog C, parts P
WHERE (P.pid = C.pid) AND (S.sid = C.sid)
GROUP BY S.sid;

--Find the total number of parts supplied by each supplier who supplies at least 3 parts
SELECT S.sname, COUNT(*) as partCount--I am adding sname so that it is clear what supplier we are talking about when outputting
FROM suppliers S, catalog C, parts P
WHERE (P.pid = C.pid) AND (S.sid = C.sid)
GROUP BY S.sid
HAVING 2 < (SELECT COUNT(*)
	    FROM Suppliers S2, catalog C2, parts P2
	    WHERE (P2.pid = C2.pid) AND (S2.sid = C2.sid) AND (S.sid = S2.sid));

--For every supplier that supplies only green parts, print the name of the supplier and the total number of parts that he supplies
SELECT S.sname, COUNT(*) as partCount
FROM suppliers S, catalog C, parts P
WHERE (P.pid = C.pid) AND (S.sid = C.sid)
GROUP BY S.sid
HAVING EVERY(P.color = 'Green');

--For every supplier that supplies green part and red part, print the name of the supplier and the price of the most expensive part that he supplies

SELECT S.sname, MAX(C.cost)
FROM suppliers S, catalog C, parts P,
(SELECT S.sid, S.sname
FROM suppliers S, catalog C, parts P
WHERE (P.pid = C.pid) AND (S.sid = C.sid) AND (P.color = 'Red')
GROUP BY S.sid
INTERSECT
SELECT S2.sid, S2.sname
FROM suppliers S2, catalog C2, parts P2
WHERE (P2.pid = C2.pid) AND (S2.sid = C2.sid) AND (P2.color = 'Green')
GROUP BY S2.sid) rgsupplier
WHERE (S.sid = C.sid) AND (rgsupplier.sid = C.sid) AND (P.pid = C.pid)
GROUP BY S.sid;



