SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;

--Menu
SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_4.json')  AS properties where $group_id=4;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_3.json')  AS properties where $group_id=3;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_2.json')  AS properties where $group_id=2;



--Titre
 select 
    'title'   as component,
    'Notre boutique SEGPA' as contents,
    TRUE as center,
    3         as level;
    
-- Enregistrer un produit
INSERT INTO produits(lot, produits, description, categorie_id, nombre, reste, vente, prix, DDM)
SELECT 
    $lot as lot,
    :produits as produits,
    :description as description,
    :categorie as categorie_id,
    :nombre as nombre,  
        :nombre as reste,   
    coalesce(:vente,0) as vente,
    :prix as prix,
    :DDM as DDM
    WHERE :produits is not Null; 
    
       

-- Liste des produits
select 
    'button' as component,
    'sm'     as size,
    'pill'   as shape;
select 
    'Ajouter un produit' as title,
    '/catalogue/form_divers.sql' as link,
    'square-rounded-plus' as icon,
    'green' as outline;
            
SELECT 'table' as component,
    TRUE    as sort,
    TRUE    as search,
    'Aucun produit disponoble pour le moment' as empty_description,
    'Prix (€)' as align_right,
    'Produits' as markdown,
    'Quantité' as markdown,
    'Photo' as markdown,
    'Outils' as markdown,
    'Dispo' as markdown;
SELECT 
    id as _sqlpage_id,
    '[
    ![miniature]('||image_url||')
]()' as Photo,
    lot as Lot,
    produits||CHAR(10)||CHAR(10)||coalesce(description,'pas de description') as Produits,
    (SELECT categorie FROM categories WHERE id=categorie_id) as Catégorie,
    DDM as DDM,
    nombre as Total,
    CASE WHEN vente=1
    THEN '[
    ![](./icons/select.svg)
](/catalogue/indisponible.sql?id='||produits.id||')' 
ELSE '[
    ![](./icons/square.svg)
](/catalogue/disponible.sql?id='||produits.id||')' 
END as Dispo,
    coalesce(reste-vendus,reste)||'[
    ![](./icons/circle-plus.svg)
](/catalogue/ajouter_produit.sql?id='||produits.id||' "Ajouter un produit de cette gamme")
     [
    ![](./icons/circle-minus.svg)
](/catalogue/enlever_produit.sql?id='||produits.id||' "Retirer un produit de cette gamme")
' as Quantité,
'[
    ![](./icons/camera-plus.svg)
](/catalogue/ajouter_image_form.sql?id='||produits.id||' "Ajouter une photo")
[
    ![](./icons/pencil.svg)
](/catalogue/form_edit.sql?id='||produits.id||' "Modifier")' as Outils,
    printf("%.2f", prix) as Prix
FROM produits LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles;   
    
    





