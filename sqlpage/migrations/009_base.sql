CREATE TABLE produits(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lot TEXT NOT NULL,
    produits TEXT NOT NULL,
    categorie_id INTEGER,
    nombre INTEGER NOT NULL,
    reste INTEGER,
    vente BOOL DEFAULT 0,
    prix decimal (10, 2) NOT NULL,
    DDM TEXT,
        FOREIGN KEY (categorie_id) REFERENCES categories (id)
);

CREATE TABLE categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categorie TEXT NOT NULL
);


CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_mode INTEGER,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_total NUMERIC,
    traitement INTEGER,
    reglement INTEGER
);

CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES produits (id),
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE finances(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    operation TEXT,
    categorie TEXT,
    prix decimal (10, 2) NOT NULL,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    facture_id INTEGER,
    moyen TEXT
);
