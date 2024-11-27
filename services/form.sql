
-- Formulaire pour ajouter un service
SELECT 'form' as component, 
'def_services.sql' as action,
'Ajouter' as validate,
    'green'           as validate_color,
    'Effacer'           as reset;

SELECT 'Services' AS 'label', 'text' as type, 'clock-hour-5' as prefix_icon, 'service' AS name, 8 as width, TRUE as required;

