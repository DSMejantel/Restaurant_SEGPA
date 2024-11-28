


-- Enregistrer les éléments de la réservation
SET addition=SUM(:nombre * :prix);
INSERT INTO clients(repas_id,nom,courriel,tel,nombre,addition,infos)
	SELECT 
	:id as repas_id,
	:nom as nom,
	:courriel as courriel,
	:tel as tel,
	:nombre as nombre,
	$addition as addition,
	nullif(:infos, '') as infos
	WHERE :nom IS NOT NULL;

	
-- Mettre à jour le nombre de produits disponibles	
UPDATE repas SET resa=coalesce(resa,0)+CAST(:nombre AS INTEGER) WHERE id=:id AND :nombre is not Null;
UPDATE repas SET reste=total-resa  WHERE id=:id

RETURNING
'redirect' as component,
'/index.sql?confirme=1&addition='||$addition as link;


