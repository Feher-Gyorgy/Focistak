
DELETE
  FROM players;
DELETE
  FROM csapatok;
DELETE
  FROM posztok;




INSERT INTO posztok (id,posztNev)
  VALUES (1,'csatár'),
  (2,'középPályás'),
  (3,'védő'),
  (4,'kapus');

INSERT INTO csapatok (id,csapatNev)
  VALUES (1,'arsenal'), (2,'Manchester City FC'), (3,'Manchester United FC'), (4,'Tottenham Hotspur FC'), (5,'Newcastle United FC'), (6,'FC Barcelona'), (7,'Real Madrid') ;

# insert the focistak
INSERT INTO players (id ,focistaNev,posztId,csapatId)
  VALUES (1,'Xhaka, Granit',2,1), (2,'De Bruyne Kevin',2,2),(3,'Phil Jones',3,5),
  (4,'Perisic Ivan',1,4),
  (5,'Dubravka, Martin',4,5), 
(6, 'Lewandowski, Robert',1,6), (7,'Benzema Karim',1,7);


  #Selects
SELECT * FROM csapatok;
SELECT * FROM players;
SELECT * FROM posztok;


