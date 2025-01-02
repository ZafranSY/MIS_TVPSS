package com.tvpss.repository;

import com.tvpss.model.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public long countUsersByRole(String role) {
        return sessionFactory.getCurrentSession()
                .createQuery("select count(u) from User u where u.role = :role", Long.class)
                .setParameter("role", role)
                .uniqueResult();
    }

    @Transactional
    public void save(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @Transactional
    public List<User> findAllUsers() {
        return sessionFactory.getCurrentSession()
                .createQuery("from User", User.class)
                .list();
    }

    @Transactional
    public User findByUsername(String username) {
        return sessionFactory.getCurrentSession()
                .createQuery("from User where username = :username", User.class)
                .setParameter("username", username)
                .uniqueResult();
    }

    @Transactional
    public void deleteByUsername(String username) {
        User user = findByUsername(username);
        if (user != null) {
            sessionFactory.getCurrentSession().delete(user);
        }
    }

    @Transactional
    public List<User> findByRole(String role) {
        return sessionFactory.getCurrentSession()
                .createQuery("from User where role = :role", User.class)
                .setParameter("role", role)
                .list();
    }
    @Transactional
    public User findByUsernameAndPassword(String username, String password) {
        return sessionFactory.getCurrentSession()
                .createQuery("from User where username = :username and password = :password", User.class)
                .setParameter("username", username)
                .setParameter("password", password)
                .uniqueResult();
    }

}
