-- Effacer les anciens tableaux
DROP TABLE IF EXISTS emprunt CASCADE;
DROP TABLE IF EXISTS commande CASCADE;
DROP TABLE IF EXISTS exemplaire CASCADE;
DROP TABLE IF EXISTS livre CASCADE;
DROP TABLE IF EXISTS adherent CASCADE;

--1. Création de la table Livre
CREATE TABLE livre (
    cote VARCHAR(20) PRIMARY KEY,
    genre VARCHAR(50),
    auteur VARCHAR(100),
    titre VARCHAR(200)
);

-- 2. Création de la table Exemplaire
CREATE TABLE exemplaire (
    no_ex INTEGER,
    cote VARCHAR(20),
    PRIMARY KEY (no_ex, cote),
    FOREIGN KEY (cote) REFERENCES livre(cote)
);

-- 3. Création de la table Adherent
CREATE TABLE adherent (
    id_adherent INTEGER PRIMARY KEY,
    adh_no_rue VARCHAR(10),
    adh_rue VARCHAR(100),
    adh_ville VARCHAR(50),
    adh_codePostal VARCHAR(10),
    adh_prenom VARCHAR(50),
    adh_nomDeFamille VARCHAR(50)
);

-- 4. Création de la table Commande
CREATE TABLE commande (
    cote VARCHAR(20),
    id_adherent INTEGER,
    commande_date DATE,
    statut VARCHAR(20),
    PRIMARY KEY (cote, id_adherent, commande_date),
    FOREIGN KEY (cote) REFERENCES livre(cote),
    FOREIGN KEY (id_adherent) REFERENCES adherent(id_adherent)
);

-- 5. Création de la table Emprunt
CREATE TABLE emprunt (
    no_ex INTEGER,
    cote VARCHAR(20),
    id_adherent INTEGER,
    date_emprunt DATE,
    date_retour DATE,
    PRIMARY KEY (no_ex, cote, id_adherent, date_emprunt),
    FOREIGN KEY (cote) REFERENCES livre(cote),
    FOREIGN KEY (id_adherent) REFERENCES adherent(id_adherent),
    FOREIGN KEY (no_ex, cote) REFERENCES exemplaire(no_ex, cote)
);

---------------------------------------------------------
-- Insertion de données dans la table Livre 
INSERT INTO livre (cote, genre, auteur, titre) VALUES
('L001', 'Roman', 'Auteur A', 'Titre 1'),
('L002', 'Science', 'Auteur B', 'Titre 2'),
('L003', 'Histoire', 'Auteur C', 'Titre 3'),
('L004', 'Philosophie', 'Auteur D', 'Titre 4'),
('L005', 'Poésie', 'Auteur E', 'Titre 5'),
('L006', 'Roman', 'Auteur F', 'Titre 6'),
('L007', 'Thriller', 'Auteur G', 'Titre 7'),
('L008', 'Biographie', 'Auteur H', 'Titre 8'),
('L009', 'Science-fiction', 'Auteur I', 'Titre 9'),
('L010', 'Fantastique', 'Auteur J', 'Titre 10'),
('L011', 'Roman', 'Auteur K', 'Titre 11');

-----------------------------------------------------------
-- Insertion de données dans la table Exemplaire 
INSERT INTO exemplaire (no_ex, cote) VALUES
(1, 'L001'),
(2, 'L001'),
(1, 'L002'),
(2, 'L002'),
(1, 'L003'),
(1, 'L004'),
(2, 'L004'),
(1, 'L005'),
(1, 'L006'),
(2, 'L006'),
(3, 'L006'),
(1, 'L007'),
(1, 'L008'),
(2, 'L008'),
(1, 'L009'),
(1, 'L010'),
(2, 'L010'),
(1, 'L011');

-----------------------------------------------------------
-- Insertion de données dans la table Adherent 
INSERT INTO adherent (id_adherent, adh_no_rue, adh_rue, adh_ville, adh_codePostal, adh_prenom, adh_nomDeFamille) VALUES
(1001, '12', 'rue 1ere',    'Montreal',  '75002', 'Alice',   'Rouge'),
(1002, '34', 'avenue 2e',    'Laval',     '69001', 'Bob',     'Blanc'),
(1003, '56', 'avenue 3e',    'Brossard',  '75006', 'Claire',  'Bleu'),
(1004, '78', 'rue 1ere',    'Montreal',  '13001', 'David',   'Jaune'),
(1005, '90', 'avenue 2e',    'Laval',     '44000', 'Emma',    'Vert'),
(1006, '11', 'avenue 3e',    'Brossard',  '59000', 'Felix', 'Gris'),
(1007, '22', 'rue 1ere',    'Montreal',  '75004', 'George',  'Orange'),
(1008, '33', 'avenue 2e',    'Laval',     '33000', 'Hugo',    'Mauve'),
(1009, '44', 'avenue 3e',    'Brossard',  '67000', 'Isabelle','Rose'),
(1010, '55', 'rue 1ere',    'Montreal',  '35000', 'Julie',  'Violet'),
(1011, '66', 'avenue 2e',    'Laval',     '06000', 'Kenny',  'Maron');

-----------------------------------------------------------
-- Insertion de données dans la table Commande 
INSERT INTO commande (cote, id_adherent, commande_date, statut) VALUES
('L001', 1001, '2025-04-01', 'En attente'),
('L002', 1002, '2025-04-02', 'Confirmée'),
('L003', 1003, '2025-04-03', 'Annulée'),
('L004', 1004, '2025-04-04', 'En attente'),
('L005', 1005, '2025-04-05', 'Confirmée'),
('L006', 1006, '2025-04-06', 'Confirmée'),
('L007', 1007, '2025-04-07', 'En attente'),
('L008', 1008, '2025-04-08', 'Confirmée'),
('L009', 1009, '2025-04-09', 'Confirmée'),
('L010', 1010, '2025-04-10', 'En attente'),
('L011', 1011, '2025-04-11', 'Confirmée'),
('L001', 1002, '2025-04-12', 'Confirmée');

-----------------------------------------------------------
-- Insertion de données dans la table Emprunt 
INSERT INTO emprunt (no_ex, cote, id_adherent, date_emprunt, date_retour) VALUES
(1, 'L001', 1001, '2025-04-01', '2025-04-05'),
(2, 'L001', 1002, '2025-04-02', '2025-04-06'),
(1, 'L002', 1003, '2025-04-03', '2025-04-07'),
(2, 'L002', 1004, '2025-04-04', '2025-04-08'),
(1, 'L003', 1005, '2025-04-05', '2025-04-09'),
(1, 'L004', 1006, '2025-04-06', '2025-04-10'),
(2, 'L004', 1007, '2025-04-07', '2025-04-11'),
(1, 'L005', 1008, '2025-04-08', '2025-04-12'),
(1, 'L006', 1009, '2025-04-09', '2025-04-13'),
(2, 'L006', 1010, '2025-04-10', '2025-04-14'),
(3, 'L006', 1011, '2025-04-11', '2025-04-15'),
(1, 'L007', 1001, '2025-04-12', '2025-04-16'),
(1, 'L008', 1002, '2025-04-13', '2025-04-17'),
(2, 'L008', 1003, '2025-04-14', '2025-04-18'),
(1, 'L009', 1004, '2025-04-15', '2025-04-19');


-----------------------------------------------------------
-- Réponses aux requêtes (Partie 5)

-- Question 1 : Quel est le nombre total d’emprunts, le genre le plus emprunté et la moyenne d’emprunt par adhérent, pour chaque ville ?
SELECT 
  a.adh_ville AS ville,
  COUNT(e.*) AS nb_emprunts,
  mode() WITHIN GROUP (ORDER BY l.genre) AS genre_plus_emprunte,
  ROUND(COUNT(e.*)::numeric / COUNT(DISTINCT a.id_adherent), 2) AS moyenne
FROM emprunt e
JOIN livre l ON e.cote = l.cote
JOIN adherent a ON e.id_adherent = a.id_adherent
GROUP BY a.adh_ville;


-- Question 2 :  Quels adhérents ont atteint leur limite de commande (3 commandes actives non annulées) ?
-------------------------------------------------------------------
-- Ajouter des commandes supplémentaires.
INSERT INTO commande (cote, id_adherent, commande_date, statut)
VALUES ('L005', 1002, '2025-04-16', 'Confirmée');
INSERT INTO commande (cote, id_adherent, commande_date, statut)
VALUES 
    ('L006', 1004, '2025-04-17', 'Confirmée'),
    ('L007', 1004, '2025-04-18', 'En attente');
-------------------------------------------------------------------
SELECT 
  a.adh_prenom,
  a.adh_nomDeFamille
FROM commande c
JOIN adherent a ON c.id_adherent = a.id_adherent
WHERE c.statut != 'Annulée'
GROUP BY a.id_adherent, a.adh_prenom, a.adh_nomDeFamille
HAVING COUNT(*) >= 3;


-- Question 3 : Quels sont le genre de livres le plus emprunté et son nombre d’emprunts ?
-------------------------------------------------------------------
-- Rajouter des emprunts supplementaires pour le genre Roman.
INSERT INTO emprunt (no_ex, cote, id_adherent, date_emprunt, date_retour)
VALUES 
  (3, 'L006', 1001, '2025-04-12', '2025-04-19'),  -- L006 est Roman
  (1, 'L011', 1003, '2025-04-13', '2025-04-20');  -- L011 est aussi Roman
-------------------------------------------------------------------
SELECT genre, nb_emprunts
FROM (
  SELECT l.genre, COUNT(*) AS nb_emprunts
  FROM emprunt e
  JOIN livre l ON e.cote = l.cote
  GROUP BY l.genre
  ORDER BY nb_emprunts DESC
  LIMIT 1
) AS genre_top;

-- Question 4 : Quels sont les livres dont tous les exemplaires sont empruntés, et qui sont leurs emprunteurs ?
-------------------------------------------------------------------
-- Rendre tout les exmplaires de  L001 empruntés .
UPDATE emprunt 
SET date_retour = '2025-05-01'
WHERE cote = 'L001';
-------------------------------------------------------------------
WITH non_rendus AS (
  SELECT no_ex, cote FROM exemplaire
  EXCEPT
  SELECT no_ex, cote FROM emprunt WHERE date_retour >= CURRENT_DATE
),
livres_complets AS (
  SELECT DISTINCT cote FROM exemplaire
  EXCEPT
  SELECT cote FROM non_rendus
)
SELECT 
  l.titre,
  a.adh_prenom,
  a.adh_nomDeFamille
FROM livres_complets lc
JOIN livre l ON lc.cote = l.cote
JOIN emprunt e ON l.cote = e.cote
JOIN adherent a ON e.id_adherent = a.id_adherent;

