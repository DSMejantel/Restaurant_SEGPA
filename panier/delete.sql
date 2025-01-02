
UPDATE panier SET quantity=0
WHERE panier.panier_id=$id AND panier.product_id=$product

RETURNING
'redirect' as component,
'/order_error.sql?id='||$id as link;



