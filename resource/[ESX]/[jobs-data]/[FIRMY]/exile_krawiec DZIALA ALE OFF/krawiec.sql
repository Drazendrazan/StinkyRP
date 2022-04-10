INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_krawiec', 'krawiec', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_krawiec', 'krawiec', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_krawiec', 'krawiec', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('krawiec', 'Fly Beliodas', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('krawiec',0,'prospect','Rekrut ',250,'{}','{}'),
    ('krawiec',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('krawiec',2,'prospect','Pracownik ',450,'{}','{}'),
    ('krawiec',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('krawiec',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('krawiec',5,'prospect','Specjalista ',750,'{}','{}'),
    ('krawiec',6,'boss','Koordynator ',850,'{}','{}'),
    ('krawiec',7,'boss','Szef',950,'{}','{}')
;