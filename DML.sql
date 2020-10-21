INSERT INTO technologie (t_code, t_nom_fr_fr, t_nom_en) VALUES
('CD_1' , 'Javascript' , 'Javascript'),
('CD_2' , 'Python' , 'Python'),
('CD_3' , 'Java' , 'Java'),
('CD_4' , 'C++' , 'C++');


INSERT INTO developpeur (d_matricule, d_nom, d_prenom, d_date_naissance, d_date_arrive, d_fk_technologie) VALUES
('M678Y6', 'Nehlig' , 'Néphéline' , TO_DATE('08/10/1995', 'DD/MM/YYYY')  , TO_DATE( '09/09/2019', 'DD/MM/YYYY'), (SELECT t.t_id FROM technologie t WHERE t.t_id = 3)),

('M245Q0', 'Kroll' , 'Luc' , TO_DATE('25/12/1992', 'DD/MM/YYYY')  , TO_DATE( '29/09/2019', 'DD/MM/YYYY'),  (SELECT t.t_id FROM technologie t WHERE t.t_id = 1)),

('M621B6', 'Delcourt' , 'Cyril' , TO_DATE('15/07/1995', 'DD/MM/YYYY')  , TO_DATE( '13/03/2020', 'DD/MM/YYYY'),  (SELECT t.t_id FROM technologie t WHERE t.t_id = 2));


INSERT INTO developpeur_technologie (dt_fk_d_matricule, dt_fk_t_code) VALUES
(
	(SELECT d.d_id FROM developpeur d WHERE d.d_id = 1),
	(SELECT t.t_id FROM technologie t WHERE t.t_id = 1)
),

(
	(SELECT d.d_id FROM developpeur d WHERE d.d_id = 3),
	(SELECT t.t_id FROM technologie t WHERE t.t_id = 3)
),

(
	(SELECT d.d_id FROM developpeur d WHERE d.d_id = 1),
	(SELECT t.t_id FROM technologie t WHERE t.t_id = 2)
),

(
	(SELECT d.d_id FROM developpeur d WHERE d.d_id = 3),
	(SELECT t.t_id FROM technologie t WHERE t.t_id = 2)
),

(
	(SELECT d.d_id FROM developpeur d WHERE d.d_id = 3),
	(SELECT t.t_id FROM technologie t WHERE t.t_id = 4)
);


