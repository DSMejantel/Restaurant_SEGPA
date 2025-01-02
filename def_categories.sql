SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<3;
--Menu
SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_4.json')  AS properties where $group_id=4;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_3.json')  AS properties where $group_id=3;


---
SET page='Categories'; 
select 'dynamic' as component, sqlpage.run_sql('parametres_menu.sql') as properties;

--Enregistrer une nouvelle valeur
INSERT into categories (categorie) SELECT :categorie WHERE :categorie is not Null;

 --Paramétrage des catégories
select 
    'card' as component,
     2      as columns;
select 
    '/categories/liste.sql?_sqlpage_embed' as embed;
select 
    '/categories/form.sql?_sqlpage_embed' as embed;
