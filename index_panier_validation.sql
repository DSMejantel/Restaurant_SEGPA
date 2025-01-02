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



-- Enregistrement provisoire du panier
INSERT INTO panier(panier_id, product_id, quantity)
SELECT
    $id,
    CAST(product.value AS INTEGER),
    CAST(quantity.value AS INTEGER)
FROM JSON_EACH(:product_quantity) quantity
INNER JOIN JSON_EACH(:product_id) product USING (key)
WHERE CAST(quantity.value AS INTEGER) > 0

 --Finalisation
select 
    'card' as component,
     2      as columns;
select 
    '/panier/panier.sql?_sqlpage_embed&id='||$id as embed;
select 
    '/panier/validation.sql?_sqlpage_embed&id='||$id as embed;
