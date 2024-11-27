

-- Liste des modèles
SELECT 'list' as component;
SELECT 
CASE WHEN lim>1 THEN 
lim||' jours' 
ELSE 
lim||' jour'
END as description
 FROM limite;
