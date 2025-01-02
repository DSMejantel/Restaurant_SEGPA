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



 -- Formulaire pour ajouter un produit
SELECT 'form' as component, 
    'Ajouter un produit' as title, 
    '/boutique.sql' as action,
    'Ajouter' as validate,
    'green'   as validate_color;

    SELECT 'Produits : ' AS 'label', TRUE as required, 'text' as type, 'milk' as prefix_icon, 'produits' AS name, 3 as width;
    SELECT 'Description : ' AS 'label', 'text' as type, 'bubble-text' as prefix_icon, 'description' AS name, 6 as width;
    SELECT 'Catégorie :' AS 'label', 'select' as type, 'categorie' AS name, 3 as width, 'Catégorie :' as empty_option, json_group_array(json_object("label", categorie, "value", id)) as options FROM (select * FROM categories ORDER BY categorie ASC);
    SELECT 'Lot : ' AS 'label', TRUE as required, 'text' as type, 'barcode' as prefix_icon, 'lot' AS name, 3 as width;
    SELECT 'DDM' AS 'label', 'text' as type, 'calendar-cancel' as prefix_icon, 'DDM' AS name, 3 as width;
    SELECT 'number' as type, 1 as step, 0 as min, 'Quantité' AS 'label', 'shopping-cart' as prefix_icon,  'nombre' AS name, 3 as width;
    SELECT 'number' as type, 0.5 as step, 0 as min, 'Prix' AS 'label', TRUE as required, 'coin-euro' as prefix_icon,  'prix' AS name, 3 as width;
    SELECT 'En vente' AS label, 'vente' AS name, 'checkbox' as type, 1 as value, 4 as width; 



