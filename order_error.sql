SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 

--Menu
SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_4.json')  AS properties where $group_id=4;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_3.json')  AS properties where $group_id=3;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_2.json')  AS properties where $group_id=2;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_1.json')  AS properties where $group_id=1;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_0.json')  AS properties where $group_id=0;

-- create a temporary table to preprocess the data
create temporary table if not exists panier_actu(product_id,inventaire,id INTEGER PRIMARY KEY);
delete  from panier_actu; 
insert into panier_actu(product_id,inventaire)
SELECT produits.id, reste-vendus-panier.quantity
FROM panier LEFT JOIN produits on panier.product_id=produits.id LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles WHERE reste-vendus<0 and panier_id=$id;

select 
    'alert'              as component,
    'Problème'              as title,
    'Il semblerait que certains articles ne soient plus disponibles. Vous pouvez mettre à jour votre commande depuis cette page.' as description,
    'alert-circle'       as icon,
    'red'                as color
    WHERE $error=1;
    
 --Finalisation
select 
    'card' as component,
     2      as columns;
select 
    '/panier/panier_error.sql?_sqlpage_embed&id='||$id as embed;
select 
    '/panier/validation.sql?_sqlpage_embed&id='||$id as embed;
