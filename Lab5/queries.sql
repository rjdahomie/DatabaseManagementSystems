SELECT C.pid
FROM catalog C
WHERE C.cost < 10;

SELECT P.pname
FROM parts P, catalog C
WHERE (C.cost < 10) AND (P.pid = C.pid);

SELECT S.address
FROM suppliers S, catalog C, parts P
WHERE (P.pname = 'Fire Hydrant Cap') AND (P.pid = C.pid) AND (S.sid = C.sid);

SELECT S.sname
FROM suppliers S, catalog C, parts P
WHERE (P.color = 'Green') AND (S.sid = C.sid) AND (P.pid = C.pid);

SELECT S.sname, P.pname
FROM suppliers S, catalog C, parts P
WHERE (P.pid = C.pid) AND (S.sid = C.sid);


--EXTRA PRACTICE
SELECT S.sid
FROM Suppliers S, Parts P, Catalog C
WHERE NOT EXISTS (SELECT S2.sid
FROM Suppliers S2, Parts P2, Catalog C2 
WHERE  (S2.sid = C2.sid) AND (P2.pid = C2.pid)
	AND (P2.color != ‘Red’) AND (S.sid = S2.sid));

