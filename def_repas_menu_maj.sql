-- Mise àjour du menu 
UPDATE menu SET entree=nullif(:entree, ''), plat=nullif(:plat, ''), dessert=nullif(:dessert, ''), prix=:prix where repas_id=:id



RETURNING
'redirect' as component,
'def_repas.sql' as link;




