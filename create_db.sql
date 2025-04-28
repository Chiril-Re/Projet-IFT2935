-- Crée la base de données bibliomanager
DROP DATABASE IF EXISTS bibliomanager;
CREATE DATABASE bibliomanager;
\c bibliomanager

-- Exécute le script d'implémentation
\i Implementation1.1.sql
