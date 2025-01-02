SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;
        
-- Formulaire pour ajouter un service
SELECT 'form' as component, 
'def_limite.sql' as action,
'Modifier' as validate,
    'green'           as validate_color;

SELECT 'Délai de réservation' AS 'label', 'number' as type, 'calendar' as prefix_icon, (SELECT lim from limite) as value, 1 as step, 'lim' AS name, 8 as width, TRUE as required;

