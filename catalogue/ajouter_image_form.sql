SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<3;

--Menu
SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_4.json')  AS properties where $group_id=4;

SELECT 'dynamic' AS component,
sqlpage.read_file_as_text('menu_3.json')  AS properties where $group_id=3;


  


    
-- Formulaire pour ajouter une image
select 'form' as component, 'Publier' as validate, 'ajouter_image.sql' as action;

SELECT 'hidden' as type, 'id' as name, $id as value;
select 'text' as type, 'produit' as name, 'Produit : ' as label, (SELECT produits FROM produits WHERE id=$id) as value, TRUE as readonly;
select 'file' as type, 'Image' as name, 'image/png, image/jpeg, image/jpg'  as accept, 'Illustration' as label, 'fichier png ou jpg avec une résolution de 640x480' as description, TRUE as required;


    


