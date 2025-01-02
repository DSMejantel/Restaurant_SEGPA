-- this table will store partially filled user forms
create table panier_id (
    id integer primary key autoincrement,
    customer_name VARCHAR(255),
    customer_mode INTEGER,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

create table panier (
    panier_id integer, 
    product_id integer, 
    quantity integer,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
