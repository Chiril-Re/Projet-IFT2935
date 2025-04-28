📚 Projet BiblioManager
Application JavaFX + Hibernate + PostgreSQL

Instructions du début:
Si vous avez ouvert le projet avec racine Projet_Groupe16 veuillez please l'ouvrir avec 
Projet_BiblioManager, j'ai placer le projet dans Projet_Groupe16 juste parce que c'est 
démandé. Like je travaillais avec Projet_BiblioManager comme racine, je ne veux pas
qu'il aille un fuck up quelque part parce que vous avez la mauvaise racine. 

📦 Contenu du projet
Project_BiblioManager/src/main/java/bibliomanager

MainApp.java // Lancement de l'application JavaFX

MainMenu.java // Interface graphique principale avec 4 boutons de questions

SceneLoader.java // Chargement dynamique des scènes/questions

ExecuterRequete.java // Exécution des requêtes SQL avec Hibernate

HibernateUtil.java // Configuration de la session Hibernate

main/resources/hibernate.cfg.xml // Configuration Hibernate

pom.xml Fichier Maven (gestion de dépendances)

create_db.sql // Script de création de la base "bibliomanager"

Implementation1.1.sql // Script d'implantation (tables, peuplement, requêtes)

README.md

⚙️ Prérequis
Java 21 installé
PostgreSQL 16.8 installé
IntelliJ IDEA (Community Edition)
Extension PostgreSQL "tablefunc" activée (pour utiliser "mode()" dans les requêtes)
📜 Instructions d'installation
Créer la base de données PostgreSQL:

(Dans le terminale écrivez les commandes suivantes)

psql -U postgres // Connection à PostgreSQL

password: passvord // le mot de passe

CREATE DATABASE bibliomanager; // création de la db

\c bibliomanager // Connection à la db

CREATE EXTENSION IF NOT EXISTS tablefunc; // Activation de l'extension tablefunc:

Exécuter les scripts SQL

(Toujour dans le psql)(remplacer chemin/vers par le vrai chemin)

\i chemin/vers/create_db.sql

\i chemin/vers/Implementation1.1.sql

🚀 Instructions d'exécution
Ouvrez le projet dans IntelliJ IDEA.

Assurez-vous que Maven installe automatiquement les dépendances (pom.xml).

Configuration Run/Debug :

Ajouter dans VM options pour que le module de JavaFX se trouve

--module-path "C:/Libraries/javafx-sdk-21.0.7/lib" --add-modules javafx.controls,javafx.fxml

(Remplacez le chemin vers JavaFX par le votre)

Ou4 ce trouve le Configuration Run/Debug?

1.En haut à droite de ton IntelliJ, tu vois ton bouton de run vert (▶️) avec "MainApp" à côté.

2.Clique sur la petite flèche à côté ➔ Edit Configurations...

3.Clique sur Modify options qui est sur la même ligne que Build and run et clique add VM options

Lancez MainApp.java.

ou

Ouvrir le terminal

java --module-path "C:/Libraries/javafx-sdk-21.0.7/lib" --add-modules javafx.controls,javafx.fxml -jar BiblioManager.jar

(Remplacez le chemin vers JavaFX par le votre)

🖥️ Utilisation
Application JavaFX avec 4 boutons :

Question 1 : Affiche ville, nombre d'emprunts, genre le plus emprunté et moyenne

Question 2 : Adhérents ayant atteint leur limite de commandes

Question 3 : Genre de livres le plus emprunté

Question 4 : Livres dont tous les exemplaires sont empruntés

Chaque réponse est affichée dans une nouvelle scène avec un bouton "Retour" pour retourner à la page avec les boutons.