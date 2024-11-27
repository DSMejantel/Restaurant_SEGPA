--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;


-- Saisie des plats et du prix 
SET MAJ=(SELECT 1 WHERE EXISTS (SELECT prix FROM menu WHERE menu.repas_id=$id));
SELECT 
    'form' as component,
    CASE WHEN $MAJ=1
    THEN 'Mettre à jour' ELSE 'Valider' END as validate,
    CASE WHEN $MAJ=1
    THEN 'def_repas_menu_maj.sql' ELSE 'def_repas_menu_confirm.sql' END as action;
SELECT 'Entrée' as label, 'entree' AS name, 'text' as type, 'salad' as prefix_icon, 12 as width, (SELECT entree FROM menu WHERE menu.repas_id=$id) as value;
SELECT 'Plat' as label, 'plat' AS name, 'text' as type, 'meat' as prefix_icon, 12 as width, (SELECT plat FROM menu WHERE menu.repas_id=$id) as value;
SELECT 'Dessert' as label, 'dessert' AS name, 'text' as type, 'cheese' as prefix_icon, 12 as width, (SELECT dessert FROM menu WHERE menu.repas_id=$id) as value;
SELECT 'Prix' as label, 'prix' AS name, 'number' as type, 0.5 as step, 'currency-euro' as prefix_icon, 12 as width, TRUE as required, (SELECT prix FROM menu WHERE menu.repas_id=$id) as value;
SELECT 'hidden' as type, 'id' as name, $id as value;





