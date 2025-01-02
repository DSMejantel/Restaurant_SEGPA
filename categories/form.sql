SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<3;
        
-- Formulaire pour ajouter une formule
SELECT 'form' as component, 
'def_categories.sql' as action,
'Ajouter' as validate,
    'green'           as validate_color,
    'Effacer'           as reset;

SELECT 'Catégorie' AS 'label', 'text' as type, 'category-plus' as prefix_icon, 'categorie' AS name, 8 as width, TRUE as required;

