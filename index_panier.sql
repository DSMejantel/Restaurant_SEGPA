-- create a new empty partially_filled_users row, returning its id
insert into panier_id default values
returning
  'redirect' as component,
  'index_boutique.sql?id=' || id as link;
