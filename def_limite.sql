--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;
SET page='Limite de réservation'; 
select 'dynamic' as component, sqlpage.run_sql('parametres_menu.sql') as properties;

--Enregistrer une nouvelle valeur
DELETE FROM limite WHERE :lim is not Null;
INSERT into limite (lim) SELECT :lim WHERE :lim is not Null;

 --Paramétrage du nombre de jours possibles pour une réservation avant la date programmée
select 
    'card' as component,
     2      as columns;
select 
    '/limite/liste.sql?_sqlpage_embed' as embed;
select 
    '/limite/form.sql?_sqlpage_embed' as embed;
