-- Enregistrement du menu 
INSERT INTO menu(repas_id, entree, plat, dessert, prix) SELECT :id as id, :entree as entree, :plat as plat, :dessert as dessert, :prix as prix where :prix is not Null


RETURNING
'redirect' as component,
'def_repas.sql' as link;




