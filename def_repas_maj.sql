-- Mise àjour du menu 
UPDATE repas SET jour=:date_rep, formule_id=:formule, service_id=:service, total=:total, reste=:total-resa where id=:id

RETURNING
'redirect' as component,
'def_repas.sql' as link;




