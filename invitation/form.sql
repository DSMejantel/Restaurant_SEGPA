
-- Formulaire pour prendre une réservation
SELECT 'form' as component, 
'invitation_confirm.sql' as action,
'Réserver' as validate,
    'green'           as validate_color;

SELECT 'Votre nom' as label, 'user-question' as prefix_icon,
    'nom' as name, 'text' as type,
    true as required,
    'Indiquez votre nom et votre prénom' as placeholder,
    6 as width;
    
SELECT 'Courriel' as label, 'mail' as prefix_icon,
    'courriel' as name, 'text' as type,
    true as required,
    6 as width;
    
SELECT 'Téléphone' as label, 'phone' as prefix_icon,
    'tel' as name, 'text' as type,
    true as required,
    6 as width;

SELECT 'Nombre' AS label, 'tools-kitchen-2' as prefix_icon,
       'nombre' AS name, 'number' as type, 
       0 as value, 1 as step, 0 as min, 
       CASE WHEN :nombre<coalesce(reste,total) THEN :nombre ELSE coalesce(reste,total) END as max,
       6 as width, TRUE as required, 
       coalesce(reste,total) ||' disponibles ' as description FROM repas WHERE id=$id;
SELECT 'Message' AS label, 'Indiquez-nous vos demandes ou remarques particulières.' as description, 'message' as prefix_icon, 'infos' AS name, 12 as width;

SELECT 'hidden' as type, 'id' as name, $id as value;
SELECT 'hidden' as type, 'prix' as name, (SELECT prix from repas WHERE repas.id=$id) as value;

