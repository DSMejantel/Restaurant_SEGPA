
-- Formulaire pour ajouter un service
SELECT 'form' as component, 
'def_limite.sql' as action,
'Modifier' as validate,
    'green'           as validate_color;

SELECT 'Délai de réservation' AS 'label', 'number' as type, 'calendar' as prefix_icon, (SELECT lim from limite) as value, 1 as step, 'lim' AS name, 8 as width, TRUE as required;

