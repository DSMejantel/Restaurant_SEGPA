--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;
SET page='Formules'; 
select 'dynamic' as component, sqlpage.run_sql('parametres_menu.sql') as properties;

--Enregistrer une nouvelle valeur
INSERT into formules (formule) SELECT :formule WHERE :formule is not Null;

 --Paramétrage des formules
select 
    'card' as component,
     2      as columns;
select 
    '/formules/liste.sql?_sqlpage_embed' as embed;
select 
    '/formules/form.sql?_sqlpage_embed' as embed;
