CREATE TABLE technologie (
	t_id SERIAL PRIMARY KEY NOT NULL,
	t_code varchar(50) NOT NULL,
	t_nom_fr_fr  varchar(36) NOT NULL,
t_nom_en  varchar(36) NOT NULL
);

CREATE UNIQUE INDEX unique_t_code ON technologie(t_code);


CREATE TABLE developpeur (
	d_id SERIAL PRIMARY KEY NOT NULL,
	d_matricule varchar(10) NOT NULL,
	d_nom varchar(36) NOT NULL,
	d_prenom varchar(32) NOT NULL,
	d_date_naissance DATE NOT NULL,
	d_date_arrive DATE NOT NULL,
	d_fk_technologie INT NOT NULL,
	CONSTRAINT fk_technologie
		FOREIGN KEY(d_fk_technologie) 
			REFERENCES technologie(t_id)
);

CREATE UNIQUE INDEX unique_d_matricule ON developpeur(d_matricule);


CREATE TABLE developpeur_technologie (
	dt_fk_d_matricule INT NOT NULL,
	dt_fk_t_code  INT NOT NULL,
	CONSTRAINT fk_t_technologie
		FOREIGN KEY (dt_fk_t_code)
			REFERENCES technologie(t_id),
	CONSTRAINT fk_d_matricule
		FOREIGN KEY (dt_fk_d_matricule)
			REFERENCES developpeur(d_id)
);
