-- =====================================================================
-- 1. CREATION DE LA BASE
-- =====================================================================
DROP DATABASE IF EXISTS exo_contacts;
CREATE DATABASE exo_contacts;
USE exo_contacts;

-- =====================================================================
-- 2. TABLE PAYS
-- =====================================================================
CREATE TABLE pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(40) NOT NULL
);

-- =====================================================================
-- 3. INSERTION DES PAYS (EXTRAIT ANNEXE)
-- =====================================================================
INSERT INTO pays (iso_3, nom, iso_2, nationalite) VALUES
('AFG','Afghanistan','AF','Afghane'),
('ALB','Albanie','AL','Albanaise'),
('DZA','Algérie','DZ','Algérienne'),
('AGO','Angola','AO','Angolaise'),
('ARG','Argentine','AR','Argentine'),
('ARM','Arménie','AM','Arménienne'),
('AUS','Australie','AU','Australienne'),
('AUT','Autriche','AT','Autrichienne'),
('AZE','Azerbaïdjan','AZ','Azerbaïdjanaise'),
('BLR','Biélorussie','BY','Biélorusse'),
('BEL','Belgique','BE','Belge'),
('BOL','Bolivie','BO','Bolivienne'),
('BIH','Bosnie-Herzégovine','BA','Bosniaque'),
('BRA','Brésil','BR','Brésilienne'),
('BGR','Bulgarie','BG','Bulgare'),
('KHM','Cambodge','KH','Cambodgienne'),
('CMR','Cameroun','CM','Camerounaise'),
('CAN','Canada','CA','Canadienne'),
('CHL','Chili','CL','Chilienne'),
('CHN','Chine','CN','Chinoise'),
('COL','Colombie','CO','Colombienne'),
('COG','République du Congo','CG','Congolaise'),
('CUB','Cuba','CU','Cubaine'),
('CYP','Chypre','CY','Chypriote'),
('CZE','République tchèque','CZ','Tchèque');

-- =====================================================================
-- 4. TABLE CONTACTS
-- =====================================================================
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    date_de_naissance DATE,
    sexe VARCHAR(2),
    adresse VARCHAR(100),
    cp VARCHAR(10),
    ville VARCHAR(40),
    pays_iso_3 VARCHAR(3),
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

-- =====================================================================
-- 5. INSERTION DE 10 CONTACTS
-- =====================================================================
INSERT INTO contacts (nom, prenom, date_de_naissance, sexe, adresse, cp, ville, pays_iso_3) VALUES
('Dupont', 'Alice', '1995-03-12', 'F', '12 rue des Lilas', '75001', 'Paris', 'FRA'),
('Martin', 'Lucas', '1990-07-22', 'M', '5 avenue du Centre', '69000', 'Lyon', 'BEL'),
('Bernard', 'Emma', '1988-11-03', 'F', '8 rue Victor Hugo', '13000', 'Marseille', 'CAN'),
('Petit', 'Hugo', '2000-01-15', 'M', '22 boulevard Sud', '31000', 'Toulouse', 'BRA'),
('Durand', 'Léa', '1999-09-09', 'F', '14 rue des Fleurs', '06000', 'Nice', 'ARG'),
('Leroy', 'Jules', '1985-05-18', 'M', '10 rue Nationale', '59000', 'Lille', 'CHL'),
('Moreau', 'Chloé', '1997-02-28', 'F', '3 avenue du Parc', '44000', 'Nantes', 'AUT'),
('Fournier', 'Mathis', '2002-12-01', 'M', '18 rue Est', '35000', 'Rennes', 'CUB'),
('Girard', 'Sarah', '1994-10-05', 'F', '7 rue de la Gare', '21000', 'Dijon', 'KHM'),
('Roux', 'Tom', '1993-04-30', 'M', '11 rue Verte', '80000', 'Amiens', 'COL');

-- =====================================================================
-- 6. TABLE TELEPHONE
-- =====================================================================
CREATE TABLE telephone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    type INT,
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

-- =====================================================================
-- 7. INSERTION DE 10 NUMEROS DE TELEPHONE
-- =====================================================================
INSERT INTO telephone (id_contact, numero, type) VALUES
(1, '0611223344', 1),
(2, '0622334455', 1),
(3, '0633445566', 2),
(4, '0644556677', 1),
(5, '0655667788', 2),
(6, '0666778899', 1),
(7, '0677889900', 1),
(8, '0688990011', 2),
(9, '0699001122', 1),
(10, '0700112233', 2);

