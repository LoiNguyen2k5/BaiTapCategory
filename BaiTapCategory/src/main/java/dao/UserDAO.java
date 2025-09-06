package dao;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import jpa.JpaConfig;

public class UserDAO {
    public User findByUsernameAndPassword(String username, String password) {
        EntityManager em = JpaConfig.getEntityManager();
        String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("username", username);
        query.setParameter("password", password); // Lưu ý: trong thực tế nên mã hóa mật khẩu
        
        try {
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null; // Không tìm thấy user
        } finally {
            em.close();
        }
    }
}