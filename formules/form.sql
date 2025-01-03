SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<3;
        
-- Formulaire pour ajouter une formule
SELECT 'form' as component, 
'def_formules.sql' as action,
'Ajouter' as validate,
    'green'           as validate_color,
    'Effacer'           as reset;

SELECT 'Formules' AS 'label', 'text' as type, 'tools-kitchen-2' as prefix_icon, 'formule' AS name, 8 as width, TRUE as required;

