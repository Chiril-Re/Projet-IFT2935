package bibliomanager;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

// MainApp démarre l'app JavaFX
// Il charge le MainMenu.java
// Quand tu cliques sur un bouton, il affiche la réponse de la question correspondante.

public class MainApp extends Application {

    private Stage primaryStage;

    @Override
    public void start(Stage primaryStage) {
        this.primaryStage = primaryStage;
        primaryStage.setTitle("BiblioManager");

        MainMenu mainMenu = new MainMenu(this);
        Scene scene = new Scene(mainMenu, 600, 400);

        primaryStage.setScene(scene);
        primaryStage.show();
    }
    public Stage getPrimaryStage() {
        return primaryStage;
    }
    public void showMainMenu() {
        MainMenu mainMenu = new MainMenu(this);
        Scene scene = new Scene(mainMenu, 600, 400);
        primaryStage.setScene(scene);
    }

    public static void main(String[] args) {
        launch(args);
    }
}
