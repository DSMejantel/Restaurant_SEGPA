SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;
        
        
-- Saisie du prix 

SELECT 
    'form' as component,
    'Mettre à jour'  as validate,
    '/def_repas_prix_maj.sql'  as action;

SELECT 'Prix' as label, 'prix' AS name, 'number' as type, 0.5 as step, 'currency-euro' as prefix_icon, 12 as width, TRUE as required, (SELECT prix FROM repas WHERE repas.id=$id) as value;
SELECT 'hidden' as type, 'id' as name, $id as value;

