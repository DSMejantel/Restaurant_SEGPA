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


--Titre
 select 
    'title'   as component,
    'Notre boutique SEGPA' as contents,
    TRUE as center,
    3         as level;
    

-- Vérification produits disponibles à la vente    
SET ouvert = coalesce((SELECT 1 FROM produits WHERE vente>0),0); 
-- Message d'attente
SELECT 'alert' as component,
    'Boutique fermée' as title,
    'Aucun produit n''est actuellement en vente'  as description_md,
    'info-square-rounded' as icon,
    TRUE              as important,
    'green' as color
WHERE $ouvert=0;

-- Caisse :  enregistrer une vente
/*
SELECT 'form' as component,
    'Commande' as title,
    'Valider' as validate,
    'green' as validate_color,
    'order_insert.sql' as action WHERE $ouvert=1;


SELECT 'Name' as name, 'Nom' as label, TRUE as required, 'Nom du client' AS placeholder, 6 as width  WHERE $ouvert=1;

--
select 
    'paiement' as name,
    'radio' as type,
    1       as value,
    'Espèces' as label,
    3 as width WHERE $ouvert=1;
select 
    'paiement'  as name,
    'radio'  as type,
    2        as value,
    'Chèque' as label,
    3 as width WHERE $ouvert=1;
*/
SELECT 'webstore' as component,
    'Commande' as title,
    'Valider' as validate,
    'green' as validate_color,
    'index_panier_validation.sql?id=' || $id as action WHERE $ouvert=1;
  
-- We include the product ids in the form as hidden fields, so that we can use them for the insertion.
SELECT 'product_id[]' AS name, '' AS label, 'hidden' AS type, id as value
FROM produits LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles WHERE vente=1  and coalesce(reste-vendus,reste)>0 ORDER BY produits;

SELECT 
    'product_quantity[]' AS name,
    produits AS title,
    description as description,
    coalesce(reste-vendus,reste) as stock,
    printf("%.2f", prix) as price,
    0 as min,
    coalesce(reste-vendus,reste) as max,
    coalesce(image_url,'/css/default.png') as image_url
FROM produits LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles WHERE vente=1 and coalesce(reste-vendus,reste)>0 ORDER BY produits;





