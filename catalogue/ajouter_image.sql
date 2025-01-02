SELECT 'redirect' AS component,
        'signin.sql?error' AS link
 WHERE NOT EXISTS (SELECT 1 FROM login_session WHERE id=sqlpage.cookie('session'));
SET group_id = (SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session'));

set file_path = sqlpage.uploaded_file_path('Image');
set file_name = sqlpage.random_string(10)||'.png';
set mv_result = sqlpage.exec('mv', $file_path, './produits_photos/'||$file_name);

 UPDATE produits SET image_url='/produits_photos/'||$file_name WHERE id=$id
 RETURNING 
 'redirect' as component,
 '../boutique.sql#'||$id as link;
