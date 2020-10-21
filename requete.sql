1 -------------------------

SELECT d.d_matricule AS matricule, d.d_nom AS nom, d.d_prenom AS prenom, t.t_nom_fr_fr AS nom_technologie
FROM developpeur d
INNER JOIN technologie t ON t.t_id = d.d_fk_technologie
LEFT JOIN developpeur_technologie dt
ON d.d_id = dt.dt_fk_d_matricule
WHERE dt.dt_fk_d_matricule IS NULL

2 -------------------------

SELECT d.d_matricule AS Matricule, d.d_nom AS Nom, d.d_prenom AS Prenom, COUNT(dt.dt_fk_t_code) AS nombre_techno
FROM developpeur d
LEFT JOIN developpeur_technologie dt
ON d.d_id = dt.dt_fk_d_matricule
GROUP BY d.d_matricule, d.d_nom, d.d_prenom
HAVING COUNT(dt.dt_fk_t_code) > 1

3 ------------------------

SELECT d.d_matricule AS matricule, d.d_nom AS nom, d.d_prenom AS prenom, t.t_nom_en AS nom_technologie_apprise
FROM developpeur d
LEFT JOIN developpeur_technologie dt
ON d.d_id = dt.dt_fk_d_matricule
INNER JOIN technologie t ON t.t_id = dt.dt_fk_t_code
WHERE dt.dt_fk_t_code 
In( 
	SELECT a.dt_fk_t_code
	FROM developpeur_technologie a
	GROUP BY a.dt_fk_t_code
	HAVING COUNT(*)> 1
	)
