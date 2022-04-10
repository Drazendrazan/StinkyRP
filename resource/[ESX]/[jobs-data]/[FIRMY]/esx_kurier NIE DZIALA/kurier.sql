INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_gopostal', 'gopostal', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_gopostal', 'gopostal', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_gopostal', 'gopostal', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('gopostal', 'Go Postal', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('gopostal',0,'prospect','Rekrut ',250,'{}','{}'),
    ('gopostal',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('gopostal',2,'prospect','Pracownik ',450,'{}','{}'),
    ('gopostal',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('gopostal',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('gopostal',5,'prospect','Specjalista ',750,'{}','{}'),
    ('gopostal',6,'boss','Koordynator ',850,'{}','{}'),
    ('gopostal',7,'boss','Szef',950,'{}','{}')
;