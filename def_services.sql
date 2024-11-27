--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;
SET page='Services'; 
select 'dynamic' as component, sqlpage.run_sql('parametres_menu.sql') as properties;

--Enregistrer une nouvelle valeur
INSERT into services (service) SELECT :service WHERE :service is not Null;

 --Paramétrage des formules
select 
    'card' as component,
     2      as columns;
select 
    '/services/liste.sql?_sqlpage_embed' as embed;
select 
    '/services/form.sql?_sqlpage_embed' as embed;
