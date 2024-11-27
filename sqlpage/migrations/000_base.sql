CREATE TABLE repas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    jour TIMESTAMP NOT NULL,
    service_id INTEGER,
    formule_id INTEGER,
    total INTEGER,
    resa INTEGER,
    reste INTEGER
);

CREATE TABLE services(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service TEXT
);

CREATE TABLE formules(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    formule TEXT
);

CREATE TABLE limite(
    lim INTEGER
);

CREATE TABLE menu(
    repas_id INTEGER,
    entree TEXT,
    plat TEXT,
    dessert TEXT,
    prix DECIMAL
);

CREATE TABLE clients(
    repas_id INTEGER,
    nom TEXT,
    courriel TEXT,
    tel TEXT,
    nombre INTEGER,
    infos TEXT,
    addition DECIMAL,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE login_session (
    id TEXT PRIMARY KEY,
    username TEXT NOT NULL REFERENCES user_info(username),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_cas TEXT,
    token TEXT
);
CREATE TABLE user_info (
	username	TEXT PRIMARY KEY,
	password_hash	TEXT,
	nom	TEXT,
	prenom	TEXT,
	tel	TEXT,
	courriel	TEXT,
	groupe	INTEGER,
	connexion	TIMESTAMP DEFAULT Null,
	activation	TEXT DEFAULT Null,
	CAS TEXT
);

CREATE TABLE cas_service(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    serveur TEXT,
    etat INTEGER
    );
