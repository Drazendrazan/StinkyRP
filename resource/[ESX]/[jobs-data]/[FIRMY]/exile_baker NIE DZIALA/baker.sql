INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_baker', 'baker', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_baker', 'baker', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_baker', 'baker', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('baker', 'Baker House', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('baker',0,'prospect','Rekrut ',250,'{}','{}'),
    ('baker',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('baker',2,'prospect','Pracownik ',450,'{}','{}'),
    ('baker',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('baker',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('baker',5,'prospect','Specjalista ',750,'{}','{}'),
    ('baker',6,'boss','Koordynator ',850,'{}','{}'),
    ('baker',7,'boss','Szef',950,'{}','{}')
;