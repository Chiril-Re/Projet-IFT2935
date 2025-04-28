package bibliomanager;

import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;

// MainMenu affiche 4 boutons (Question 1 à 4)
// Chaque bouton appelle une fonction de SceneLoader
// Quand tu cliques -> ça cache les autres boutons et affiche la question avec un bouton de retour

public class MainMenu extends VBox {

    public MainMenu(MainApp app) {
        setAlignment(Pos.CENTER);
        setSpacing(20);

        Button q1Button = new Button("Question 1");
        Button q2Button = new Button("Question 2");
        Button q3Button = new Button("Question 3");
        Button q4Button = new Button("Question 4");

        q1Button.setOnAction(e -> app.getPrimaryStage().setScene(new SceneLoader().loadQuestion1(app)));
        q2Button.setOnAction(e -> app.getPrimaryStage().setScene(new SceneLoader().loadQuestion2(app)));
        q3Button.setOnAction(e -> app.getPrimaryStage().setScene(new SceneLoader().loadQuestion3(app)));
        q4Button.setOnAction(e -> app.getPrimaryStage().setScene(new SceneLoader().loadQuestion4(app)));

        getChildren().addAll(q1Button, q2Button, q3Button, q4Button);
    }
}
