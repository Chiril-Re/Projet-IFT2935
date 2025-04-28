package bibliomanager;

import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

// SceneLoader contient des méthodes pour chaque question
// Quand un bouton est cliqué, il utilise ExecuterRequete pour exécuter 
// la requête SQL et afficher le résultat.

public class SceneLoader {

    public Scene loadQuestion1(MainApp app) {
        return createQuestionScene(app, "Résultat Question 1",
                "SELECT a.adh_ville AS ville, COUNT(e.*) AS nb_emprunts, "
                + "mode() WITHIN GROUP (ORDER BY l.genre) AS genre_plus_emprunte, "
                + "ROUND(CAST(COUNT(e.*) AS numeric) / COUNT(DISTINCT a.id_adherent), 2) AS moyenne "
                + "FROM emprunt e "
                + "JOIN livre l ON e.cote = l.cote "
                + "JOIN adherent a ON e.id_adherent = a.id_adherent "
                + "GROUP BY a.adh_ville;");
    }

    public Scene loadQuestion2(MainApp app) {
        return createQuestionScene(app, "Résultat Question 2",
                "SELECT a.adh_prenom, "
                + "a.adh_nomDeFamille "
                + "FROM commande c "
                + "JOIN adherent a ON c.id_adherent = a.id_adherent "
                + "WHERE c.statut != 'Annulée' "
                + "GROUP BY a.id_adherent, a.adh_prenom, a.adh_nomDeFamille "
                + "HAVING COUNT(*) >= 3;");
    }

    public Scene loadQuestion3(MainApp app) {
        return createQuestionScene(app, "Résultat Question 3",
                "SELECT genre, nb_emprunts "
                + "FROM ( "
                + "SELECT l.genre, COUNT(*) AS nb_emprunts "
                + "FROM emprunt e "
                + "JOIN livre l ON e.cote = l.cote "
                + "GROUP BY l.genre "
                + "ORDER BY nb_emprunts DESC "
                + "LIMIT 1 "
                + ") AS genre_top;");
    }

    public Scene loadQuestion4(MainApp app) {
        return createQuestionScene(app, "Résultat Question 4",
                "WITH non_rendus AS ( "
                + "SELECT no_ex, cote FROM exemplaire "
                + "EXCEPT "
                + "SELECT no_ex, cote FROM emprunt WHERE date_retour >= CURRENT_DATE "
                + "), "
                + "livres_complets AS ( "
                + "SELECT DISTINCT cote FROM exemplaire "
                + "EXCEPT "
                + "SELECT cote FROM non_rendus "
                + ") "
                + "SELECT l.titre, "
                + "a.adh_prenom, "
                + "a.adh_nomDeFamille "
                + "FROM livres_complets lc "
                + "JOIN livre l ON lc.cote = l.cote "
                + "JOIN emprunt e ON l.cote = e.cote "
                + "JOIN adherent a ON e.id_adherent = a.id_adherent;");
    }

    private Scene createQuestionScene(MainApp app, String title, String sql) {
        VBox layout = new VBox(20);
        layout.setAlignment(Pos.CENTER);

        Label resultLabel = new Label(ExecuterRequete.executer(sql));

        Button retourButton = new Button("Retour");
        retourButton.setOnAction(e -> app.showMainMenu());

        layout.getChildren().addAll(resultLabel, retourButton);

        return new Scene(layout, 600, 400);
    }
}

