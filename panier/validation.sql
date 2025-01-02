SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 

-- Finalisation de la commande / fin du formulaire
SELECT 'form' as component,
    'Validation du panier' as title,
    'Valider' as validate,
    'green' as validate_color,
    'order_insert.sql?id=' || $id as action;


SELECT 'Name' as name, 'Nom' as label, TRUE as required, 'Nom du client' AS placeholder, 6 as width, (SELECT customer_name FROM panier_id WHERE id=$id) as value;

--
select 
    'paiement' as name,
    'radio' as type,
    1       as value,
    CASE WHEN (SELECT customer_mode FROM panier_id WHERE id=$id)=1 THEN 1 ELSE 0  END as checked,
    'Espèces' as label,
    3 as width;
select 
    'paiement'  as name,
    'radio'  as type,
    2        as value,
    CASE WHEN (SELECT customer_mode FROM panier_id WHERE id=$id)=2 THEN 1 ELSE 0 END as checked,
    'Chèque' as label,
    3 as width;


