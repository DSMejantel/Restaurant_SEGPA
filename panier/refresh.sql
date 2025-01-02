SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 


UPDATE panier SET quantity=(SELECT reste-vendus
FROM panier LEFT JOIN produits on panier.product_id=produits.id LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles
WHERE panier.panier_id=$id AND panier.product_id=$product) WHERE panier.panier_id=$id AND panier.product_id=$product

RETURNING
'redirect' as component,
'/order_error.sql?id='||$id as link;



