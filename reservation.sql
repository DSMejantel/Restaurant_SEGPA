--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

 --Paramétrage des formules
select 
    'card' as component,
     2      as columns;
select 
    '/reservation/liste.sql?_sqlpage_embed&id='||$id as embed;
select 
    '/reservation/form.sql?_sqlpage_embed&id='||$id as embed;
