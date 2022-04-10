INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_milkman', 'milkman', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_milkman', 'milkman', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_milkman', 'milkman', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
    ('milkman', 'Milkman', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('milkman',0,'prospect','Rekrut ',250,'{}','{}'),
    ('milkman',1,'prospect','Nowicjusz ',350,'{}','{}'),
    ('milkman',2,'prospect','Pracownik ',450,'{}','{}'),
    ('milkman',3,'prospect','Fachowiec ',550,'{}','{}'),
    ('milkman',4,'prospect','Zawodowiec ',650,'{}','{}'),
    ('milkman',5,'prospect','Specjalista ',750,'{}','{}'),
    ('milkman',6,'boss','Koordynator ',850,'{}','{}'),
    ('milkman',7,'boss','Szef',950,'{}','{}')
;