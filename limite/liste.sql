SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;

SELECT 'text' as component,
'Réglage actuel :' as contents;

-- Liste des modèles
SELECT 'list' as component;
SELECT 
CASE WHEN lim>1 THEN 
lim||' jours' 
ELSE 
lim||' jour'
END as description
 FROM limite;
