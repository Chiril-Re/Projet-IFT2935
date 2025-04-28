package bibliomanager;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

// HibernateUtil crée et configure la SessionFactory Hibernate.
// getSessionFactory() te permet d’ouvrir des sessions propres et sûres.
// C’est indispensable pour que Hibernate fonctionne derrière ExecuterRequete.java.

public class HibernateUtil {
    private static final SessionFactory sessionFactory = buildSessionFactory();
    private static SessionFactory buildSessionFactory() {
        try {
            return new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Échec de la création de SessionFactory." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        getSessionFactory().close();
    }
}
