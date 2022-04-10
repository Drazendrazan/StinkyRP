INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_fisherman', 'fisherman', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_fisherman', 'fisherman', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_fisherman', 'fisherman', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('fisherman', 'fisherman', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('fisherman',0,'prospect','Rekrut ',250,'{}','{}'),
    ('fisherman',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('fisherman',2,'prospect','Pracownik ',450,'{}','{}'),
    ('fisherman',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('fisherman',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('fisherman',5,'prospect','Specjalista ',750,'{}','{}'),
    ('fisherman',6,'boss','Koordynator ',850,'{}','{}'),
    ('fisherman',7,'boss','Szef',950,'{}','{}')
;