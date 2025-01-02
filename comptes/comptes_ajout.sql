SELECT 'redirect' AS component,
        'signin.sql?error' AS link
 WHERE NOT EXISTS (SELECT 1 FROM login_session WHERE id=sqlpage.cookie('session'));

SET group_id = (SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session'));

SELECT 'redirect' AS component,
        '/index.sql?restriction' AS link
        WHERE $group_id<>'4';

--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu_4.json') AS properties;

-- Formulaire
SELECT 'form' AS component,
    'Nouveau compte utilisateur' AS title,
    'Créer le compte' as validate,
    'create_user.sql' as action,
    'green'           as validate_color;


SELECT 'username' AS name, 'Identifiant' as label, 4 as width, TRUE as required;
SELECT 'nom' AS name, 'Nom' as label, 4 as width, TRUE as required;
SELECT 'prenom' AS name, 'Prénom' as label, 4 as width, TRUE as required;
SELECT 'Identifiant ENT' AS label, 'cas' AS name, 4 as width;
SELECT 'Téléphone' AS label, 'tel' AS name, 3 as width;
SELECT 'Courriel' AS label, 'courriel' AS name, 3 as width;
SELECT 'groupe' AS name, 'Permissions' as label, 'select' as type, 3 as width, 1 as value,json_group_array(json_object("label", groupes, "value", groupes_id)) as options FROM (select * FROM permissions ORDER BY groupes_id ASC)
SELECT 'code' AS name, 'text' AS type, sqlpage.random_string(20) AS value, 'Code d''activation' as label, 6 as width;


