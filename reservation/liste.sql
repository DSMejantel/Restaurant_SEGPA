--Détails et rappel du choix

SELECT 
    'columns' as component;

select 
    12 as size,
    strftime('%d/%m/%Y',jour)           as title,
    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    '### '||(SELECT service from services WHERE service_id=services.id) as description_md,

    --CASE WHEN coalesce(reste,total)<2 
    --THEN '## '||prix||' **€**'||' - '||'**'||coalesce(reste,total) ||'** disponible '
    --ELSE '### '||prix||' **€**'||' - '||'**'||coalesce(reste,total) ||'** disponibles ' END as description_md,
    CASE WHEN entree is not Null THEN json_object('icon','salad','color','green','description',entree) END as item,
    CASE WHEN plat is not Null THEN json_object('icon','meat','color','red','description',plat) END as item,
    CASE WHEN dessert is not Null THEN json_object('icon','cheese','color','orange','description',dessert) END as item,
    json_object('icon','receipt-2','color','vk','description',printf("%.2f",prix)||' euros') as item,
    '/index.sql' as link,
    'Retour à l''accueil' as button_text,
    'orange' as button_color
    FROM repas JOIN menu on menu.repas_id=repas.id WHERE id=$id;
