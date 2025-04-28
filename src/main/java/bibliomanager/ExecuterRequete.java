package bibliomanager;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

// ExecuterRequete.executer(sql) ouvre une session Hibernate
// Il exécute ta requête SQL native (SELECT * FROM...)
// Il formate proprement les résultats pour affichage dans l'app

public class ExecuterRequete {

    public static String executer(String sql) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        StringBuilder result = new StringBuilder();

        try {
            tx = session.beginTransaction();
            List<Object[]> rows = session.createNativeQuery(sql).list();
            for (Object[] row : rows) {
                for (Object column : row) {
                    // Formater chaque colonne : aligné à gauche sur 15 caractères
                    result.append(String.format("%-15s", column));
                }
                result.append("\n");
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result.toString();
    }

}
