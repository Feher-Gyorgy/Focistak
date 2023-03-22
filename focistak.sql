
call genRandom();

DELETE
  FROM focistak;
DELETE
  FROM csapatok;
DELETE
  FROM posztok;





INSERT INTO posztok (id, posztId, posztNev)
  VALUES (1, 1, 'kozepPalyas'),
  (2,1, 'csatar'),
  (3,2, 'vedo'),
  (4,3, 'kapus');

INSERT INTO csapatok (id, csapatId, csapatNev)
  VALUES (1,7, 'arsenal'), (2,6, 'Manchester City FC'), (3,5, 'Manchester United FC'), (4,4, 'Tottenham Hotspur FC'), (5,3, 'Newcastle United FC'), (6,2, 'FC Barcelona'), (7,1, 'Real Madrid') ;

# insert the focistak
INSERT INTO focistak (id ,focistaNev,posztId,csapatId, posztNev, csapatNev)
  VALUES (1,'Xhaka, Granit',2,7,'középPályás','arsenal'), (2,'De Bruyne Kevin',2,3,'középPályás','Manchester City FC'),(3, 'Phil Jones',3,3,'vedo','Manchester United FC'),
  (4,'Perisic Ivan',1,4,'Tottenham Hotspur FC','csatar'),
  (5,'Dubravka, Martin',4,5,'Newcastle United FC','kapus'), 
(6, 'Lewandowski, Robert',2,6,'FC Barcelona','csatar'), (7,'Benzema Karim',2,7,'Real Madrid','csatar');


  #Selects
SELECT * FROM csapatok;
SELECT * FROM focistak;
SELECT * FROM posztok;
