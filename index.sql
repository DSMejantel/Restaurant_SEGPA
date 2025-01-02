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

-- Boutons
select 
    'card' as component,
    2      as columns;
select 
    'Restaurant d''application' as title,
    'Retrouvez nos **menus** ainsi que les **plats** à emporter préparés par nos élèves des ateliers SEGPA' as footer_md,
    '/illustrations/table.png' as top_image,
        '/index_reservation.sql' as link;
select 
    '/index_panier.sql' as link,
    'Retrouvez nos **objets** confectionnés par les élèves des ateliers HABITAT et ALIMENTATION/SERVICES en classes de 3ème et 4ème SEGPA' as footer_md,
    'Objets confectionnés' as title,
    '/illustrations/cadeaux.png' as top_image;     
/*    
select 
    'button' as component,
    'center' as justify,
    'lg'     as size,
    'pill'   as shape;
select 
    '/index_reservation.sql' as link,
    'Restaurant d''application' as title,
    '/illustrations/table.png' as image; 
select 
    '/index_panier.sql' as link,
    'Objets confectionnés' as title,
    '/illustrations/cadeaux.png' as image; 
*/
