--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

select 'dynamic' as component, sqlpage.run_sql('parametres_menu.sql') as properties;
