-- Mise àjour du menu 
UPDATE menu SET entree=:entree, plat=:plat, dessert=:dessert, prix=:prix where repas_id=:id



RETURNING
'redirect' as component,
'def_repas.sql' as link;




