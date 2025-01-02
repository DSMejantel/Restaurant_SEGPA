CREATE TABLE services(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    service TEXT
);

CREATE TABLE formules(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    formule TEXT
);

CREATE TABLE allergenes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    allergene TEXT,
    icon TEXT
);

CREATE TABLE info_allergenes(
    repas_id INTEGER,
    allergene_id INTEGER
);

CREATE TABLE positions(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    position TEXT,
    rang INTEGER
);

CREATE TABLE limite(
    lim INTEGER
);


CREATE TABLE repas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    jour TIMESTAMP NOT NULL,
    service_id INTEGER  REFERENCES services(id),
    formule_id INTEGER  REFERENCES formules(id),
    total INTEGER,
    resa INTEGER,
    reste INTEGER,
    prix REAL DEFAULT 0.0
);

CREATE TABLE plats(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,         -- Nom du plat (e.g., "Salade au chèvre chaud")
    position_id INTEGER,
    repas_id INTEGER,
    description TEXT,           
    icon TEXT,                  -- Icon name for UI (e.g., "salad", "meat")
    color TEXT               -- Color for UI (e.g., "green", "red")
    
);

CREATE TABLE menus (
    repas_id INTEGER NOT NULL,       
    plat_id INTEGER NOT NULL,
    PRIMARY KEY (plat_id, repas_id),
    FOREIGN KEY (repas_id) REFERENCES repas(id),
    FOREIGN KEY (plat_id) REFERENCES plats(id)     
);


CREATE TABLE clients(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
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
