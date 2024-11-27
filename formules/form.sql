
-- Formulaire pour ajouter une formule
SELECT 'form' as component, 
'def_formules.sql' as action,
'Ajouter' as validate,
    'green'           as validate_color,
    'Effacer'           as reset;

SELECT 'Formules' AS 'label', 'text' as type, 'tools-kitchen-2' as prefix_icon, 'formule' AS name, 8 as width, TRUE as required;

