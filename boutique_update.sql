SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;


    
-- Mettre à jour un produit
UPDATE produits
SET 
    lot=:lot,
    produits=:produits,
    description=:description,
    categorie_id=:categorie,
    nombre=:nombre,  
    reste=    :nombre,   
    vente=coalesce(:vente,0),
    prix=:prix,
    DDM=:DDM
    WHERE produits.id=$id 
    
RETURNING
'redirect' as component,
'boutique.sql' as link;
       

    
    





