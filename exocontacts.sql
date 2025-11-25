-- Création de la base
CREATE DATABASE exo_contacts;
USE exo_contacts;

-- =====================================
-- TABLE : pays
-- =====================================
CREATE TABLE pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(40) NOT NULL
);

-- =====================================
-- INSERTION DES PAYS (Annexe 1)
-- =====================================
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

-- =====================================
-- TABLE : contacts
-- =====================================
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

    CONSTRAINT fk_contact_pays
        FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- =====================================
-- TABLE : telephone
-- =====================================
CREATE TABLE telephone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    type INT,

    CONSTRAINT fk_tel_contact
        FOREIGN KEY (id_contact) REFERENCES contacts(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
