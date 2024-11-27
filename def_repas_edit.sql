--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;


-- Saisie des plats et du prix
SELECT 
    'form' as component,
    'Mettre à jour'  as validate,
    'def_repas_maj.sql' as action;
    

SELECT 'Date' as label, 'date_rep' AS name, 'date' as type, 1 as step, 3 as width, TRUE as required, (SELECT jour FROM repas WHERE id=$id) as value;
SELECT 'Formule' as label, 'formule' AS name, 'select' as type, 3 as width, TRUE as required, (SELECT formule_id FROM repas WHERE id=$id) as value, json_group_array(json_object("label", formule, "value", id)) as options FROM formules;
SELECT 'Service' as label, 'service' AS name, 'select' as type, 3 as width, TRUE as required, (SELECT service_id FROM repas WHERE id=$id) as value, json_group_array(json_object("label", service, "value", id)) as options FROM services;
SELECT 'Nombre de repas proposés' as label, 'total' AS name, 'number' as type, 1 as step, 3 as width,coalesce((SELECT resa FROM repas WHERE id=$id),0) as min, (SELECT total FROM repas WHERE id=$id) as value, TRUE as required;
SELECT 'hidden' as type, 'id' as name, $id as value;





