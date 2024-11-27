--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

-- Planification des créneaux  
SELECT 
    'form' as component,
    'Valider' as validate,
    'def_repas.sql' as action;
SELECT 'Date' as label, 'date_rep' AS name, 'date' as type, 1 as step, 3 as width, TRUE as required;
SELECT 'Formule' as label, 'formule' AS name, 'select' as type, 3 as width, TRUE as required, json_group_array(json_object("label", formule, "value", id)) as options FROM formules;
SELECT 'Service' as label, 'service' AS name, 'select' as type, 3 as width, TRUE as required, json_group_array(json_object("label", service, "value", id)) as options FROM services;
SELECT 'Nombre de repas proposés' as label, 'total' AS name, 'number' as type, 0 as min, 1 as step, 3 as width, TRUE as required;
