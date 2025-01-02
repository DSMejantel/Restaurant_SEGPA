--Détails et rappel du choix

/*SELECT 'text' as component,
   'Allergènes :'||group_concat('![](/icons_allergenes/'||allergenes.icon||' "'||allergene||'")','')   as contents_md
   FROM allergenes JOIN info_allergenes on allergenes.id=info_allergenes.allergene_id WHERE repas_id=$id;
*/

SELECT 
    'columns' as component;
select 
    12 as size,
    strftime('%d/%m/%Y',jour)           as title,
    (SELECT 'Allergènes :'||group_concat('![](/icons_allergenes/'||allergenes.icon||' "'||allergene||'")','') FROM allergenes JOIN info_allergenes on allergenes.id=info_allergenes.allergene_id WHERE repas_id=$id GROUP BY repas_id) as description_md,
   
    (
    SELECT formule from formules WHERE formule_id=formules.id) as value,
    'INVITATION' as small_text,
  json_group_array(json_object(
      'icon', plats.icon,
      'color', plats.color,
      'description', plats.name
    )) as item,

    '/index.sql' as link,
    'Retour à l''accueil' as button_text,
    'orange' as button_color
    
    FROM repas JOIN menus on menus.repas_id=repas.id JOIN plats on menus.plat_id=plats.id 
    WHERE repas.id=$id;
