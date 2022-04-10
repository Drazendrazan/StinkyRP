INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_grower', 'grower', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_grower', 'grower', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_grower', 'grower', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('grower', 'Sadownik', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('grower',0,'prospect','Rekrut ',250,'{}','{}'),
    ('grower',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('grower',2,'prospect','Pracownik ',450,'{}','{}'),
    ('grower',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('grower',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('grower',5,'prospect','Specjalista ',750,'{}','{}'),
    ('grower',6,'boss','Koordynator ',850,'{}','{}'),
    ('grower',7,'boss','Szef',950,'{}','{}')
;