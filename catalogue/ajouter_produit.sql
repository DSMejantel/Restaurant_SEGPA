SELECT 'redirect' AS component,
        'signin.sql?error' AS link
 WHERE NOT EXISTS (SELECT 1 FROM login_session WHERE id=sqlpage.cookie('session'));
SET group_id = (SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session'));

 UPDATE produits SET reste=reste+1 WHERE id=$id
 RETURNING 
 'redirect' as component,
 '../boutique.sql#'||$id as link;
