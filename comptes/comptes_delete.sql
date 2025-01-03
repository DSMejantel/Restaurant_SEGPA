SELECT 'redirect' AS component,
        'signin.sql?error' AS link
 WHERE NOT EXISTS (SELECT 1 FROM login_session WHERE id=sqlpage.cookie('session'));
SET group_id = (SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session'));
SELECT 'redirect' AS component,
        'index.sql?restriction' AS link
        WHERE $group_id<'4';

SELECT 'redirect' AS component,
        '/index.sql?restriction' AS link
        WHERE $group_id<>'4';

--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu_4.json') AS properties;


SELECT 
    'alert' as component,
    'Alerte' as title,
        'red' as color,
  'Ce compte va être supprimé. Toute suppression est définitive !' 
 as description;

select 
    'button' as component,
    'sm'     as size,
    'center' as justify,
    'pill'   as shape;
select 
    'Retour sans supprimer' as title,
    'comptes.sql' as link,
    'arrow-back' as icon,
    'green' as outline,
    TRUE as space_after;
select 
    'Supprimer' as title,
    'comptes_delete_confirm.sql?id='||$id as link,
    'trash' as icon,
    'red' as outline;
      
-- Isolement du compte dans une liste
SELECT 'table' as component,
    'Actions' as markdown;
   
SELECT 
nom AS Nom,
  prenom AS Prénom,
  groupe as Permissions,
      '[
    ![](/icons/trash.svg)
](comptes_delete_confirm.sql?id='||$id||' "Valider la suppression") ' as Actions
FROM user_info Where username=$id;


