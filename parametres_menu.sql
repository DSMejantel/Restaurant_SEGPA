select 
    'big_number'          as component;


select 
    'Paramètres' as title,
    $page as value,
    'orange'    as color,
    json_array(
    json_object(
    'label', 'Paramètres',
    'link', '/parametres.sql'),
    json_object(
    'label', 'Gestion des Prestations ',
    'link', '/def_formules.sql'),
    json_object(
    'label', 'Gestions de Services',
    'link', '/def_services.sql'),
    json_object(
    'label', 'Limite de réservation',
    'link', '/def_limite.sql')
    )  as dropdown_item;
