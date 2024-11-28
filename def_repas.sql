--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

-- Planification des créneaux  
/*SELECT 
    'form' as component,
    'Valider' as validate;
SELECT 'Date' as label, 'date_rep' AS name, 'date' as type, 1 as step, 3 as width, TRUE as required;
SELECT 'Formule' as label, 'formule' AS name, 'select' as type, 3 as width, TRUE as required, json_group_array(json_object("label", formule, "value", id)) as options FROM formules;
SELECT 'Service' as label, 'service' AS name, 'select' as type, 3 as width, TRUE as required, json_group_array(json_object("label", service, "value", id)) as options FROM services;
SELECT 'Nombre de repas proposés' as label, 'total' AS name, 'number' as type, 1 as step, 3 as width, TRUE as required;
*/

-- Enregistrement d'un nouvelle prestation dans la base
INSERT INTO repas(jour,formule_id,service_id,total) SELECT :date_rep as jour, :formule as formule_id, :service as service_id, :total as total where :total is not Null;

-- Bouton Ajouter
select 
    'button' as component,
    'sm'     as size,
    'pill'   as shape;
select 
    'Ajouter' as title,
    'def_repas_ajout.sql' as link,
    'square-rounded-plus' as icon,
    'green' as outline;
-- Tableau
SELECT 'table' as component,
    'Nombre de repas' as title,
    'Menu' as markdown,
    'Administration' as markdown;
SELECT
    strftime('%d/%m/%Y',jour) as Date, 
    (SELECT formule from formules WHERE formule_id=formules.id) as Formule,
    (SELECT service from services WHERE service_id=services.id) as Service,
    group_concat((SELECT coalesce(entree,'') FROM menu WHERE menu.repas_id=repas.id)||CHAR(10) || CHAR(10) ||(SELECT coalesce(plat,'') FROM menu WHERE menu.repas_id=repas.id)||CHAR(10) || CHAR(10)|| (SELECT coalesce(dessert,'') FROM menu WHERE menu.repas_id=repas.id)) as Menu,
    coalesce((SELECT printf("%.2f",prix) FROM menu WHERE menu.repas_id=repas.id),'-')||'€' as Prix,
    --total as Nombre,
    coalesce(resa,0)||' / '||total as Réservés,
    --coalesce(reste, total) as Libres,
    '[![](/icons/salad.svg)
](def_repas_menu.sql?id='||id||' "Menu")
[![](/icons/pencil.svg)
](def_repas_edit.sql?id='||id||' "Modifier")' as Administration 
    from repas GROUP BY repas.id;
