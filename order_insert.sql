-- create a temporary table to preprocess the data
create temporary table if not exists panier_actu(product_id,inventaire,id INTEGER PRIMARY KEY);
delete  from panier_actu; 
insert into panier_actu(product_id,inventaire)
SELECT produits.id, reste-vendus-panier.quantity
FROM panier LEFT JOIN produits on panier.product_id=produits.id LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles WHERE reste-vendus-panier.quantity<0 and panier_id=$id;

UPDATE panier_id SET customer_name=:Name, customer_mode=:paiement WHERE id=$id;

SELECT 'redirect' AS component,
        'order_error.sql?id='||$id||'&error=1' AS link
 WHERE EXISTS (SELECT 1 FROM panier_actu WHERE inventaire<0);

INSERT INTO orders(customer_name, customer_mode, traitement,reglement) 
VALUES (:Name, :paiement,0,0);

SET order_id=last_insert_rowid();

INSERT INTO order_items(order_id, product_id, quantity)
SELECT
    $order_id,
    product_id,
    quantity
    FROM panier WHERE panier_id=$id;

delete from panier_id where id = $id;    
delete from panier where panier_id = $id

RETURNING
    'order.sql?id=' || $order_id as link,
    'redirect' as component;
