/*
===============================================================================
Création de la base de données et des schémas
===============================================================================
Objectif du script :
Ce script crée une nouvelle base de données nommée « DataWarehouse » après avoir vérifié si elle existe déjà.
Si la base de données existe, elle est supprimée puis recréée. De plus, le script met en place trois schémas
au sein de la base de données : « bronze », « silver » et « gold ».

AVERTISSEMENT :
L'exécution de ce script entraînera la suppression de la base de données « DataWarehouse » dans son intégralité si elle existe.
Toutes les données qu'elle contient seront définitivement supprimées. Procédez avec prudence
et assurez-vous de disposer de sauvegardes appropriées avant d'exécuter ce script.
*/

USE master;
GO

-- Supprimer et recréer la base de données 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Création de la base de données 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Création des couches
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
