SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<3;

-- Liste des modèles
SELECT 'list' as component;
SELECT categorie as description
 FROM categories ORDER by categorie;
