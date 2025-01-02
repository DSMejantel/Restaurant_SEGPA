SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 
SELECT 'redirect' AS component,
        'index.sql?restriction=1' AS link
        WHERE $group_id<2;

--Détails et rappel du choix

SELECT 
    'columns' as component;

select 
    12 as size,
    strftime('%d/%m/%Y',jour)           as title,

    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    printf("%.2f",prix)||' euros' as small_text,
  json_group_array(json_object(
      'icon', plats.icon,
      'color', plats.color,
      'description', plats.name
    )) as item,

    '/index.sql' as link,
    'Retour à l''accueil' as button_text,
    'orange' as button_color
    FROM repas JOIN menus on menus.repas_id=repas.id JOIN plats on menus.plat_id=plats.id WHERE repas.id=$id;
