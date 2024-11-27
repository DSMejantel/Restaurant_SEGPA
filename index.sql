--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

-- Message de confirmation de réservation
SELECT 'alert' as component,
    'Commande validée' as title,
    'Votre réservation a bien été prise en compte.' ||CHAR(10) || CHAR(10)||
    'Le montant de votre commande s''élèvera à : '||printf("%.2f",$addition)||' euros'
    as description_md,
    'info-square-rounded' as icon,
    TRUE              as important,
    TRUE              as dismissible,
    'green' as color
WHERE $confirme=1;

-- Choix des repas  
SELECT 
    'columns' as component;

select 
    4 as size,
    strftime('%d/%m/%Y',jour)           as title,
    --prix               as value,
    --'Euros' as small_text,
    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    CASE WHEN coalesce(reste,total)<2 
    THEN '### '||(SELECT service from services WHERE service_id=services.id)||' - **'||coalesce(reste,total) ||'** disponible '
    ELSE '### '||(SELECT service from services WHERE service_id=services.id)||' - **'||coalesce(reste,total) ||'** disponibles ' END as description_md,
    CASE WHEN entree is not Null THEN json_object('icon','salad','color','green','description',entree) END as item,
    CASE WHEN plat is not Null THEN json_object('icon','meat','color','red','description',plat) END as item,
    CASE WHEN dessert is not Null THEN json_object('icon','cheese','color','orange','description',dessert) END as item,
    json_object('icon','receipt-2','color','vk','description',printf("%.2f",prix)||' euros') as item,
    CASE WHEN coalesce(reste,total)>0 THEN 'reservation.sql?id='||id 
    ELSE '' END as link,
    CASE WHEN coalesce(reste,total)>0 THEN 'Réserver' ELSE 'Complet' END as button_text,
    CASE WHEN coalesce(reste,total)>0 THEN 'green' ELSE 'red' END as button_color
    FROM repas JOIN menu on menu.repas_id=repas.id WHERE jour> datetime(date('now'), '+'||(SELECT lim from limite)||' day') ORDER BY jour;
