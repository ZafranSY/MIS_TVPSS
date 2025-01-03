package com.tvpss.service;

import com.tvpss.model.User;
import com.tvpss.repository.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    /**
     * Authenticate a user by checking the database for matching username and password.
     *
     * @param username User's username
     * @param password User's password
     * @return User object if credentials are valid, otherwise null
     */
    @Transactional
    public User authenticateUser(String username, String password) {
        return userDAO.findByUsernameAndPassword(username, password);
    }

    /**
     * Get the count of users by their role.
     *
     * @param role Role to filter users
     * @return Count of users with the specified role
     */
    @Transactional
    public long countUsersByRole(String role) {
        return userDAO.countUsersByRole(role);
    }

    /**
     * Find a user by their username.
     *
     * @param username User's username
     * @return User object if found, otherwise null
     */
    @Transactional
    public User findUserByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    /**
     * Save or update a user.
     *
     * @param user User object to save or update
     */
    @Transactional
    public void saveUser(User user) {
        userDAO.save(user);
    }

    /**
     * Delete a user by their username.
     *
     * @param username Username of the user to delete
     */
    @Transactional
    public void deleteUserByUsername(String username) {
        userDAO.deleteByUsername(username);
    }

    /**
     * Find all users.
     *
     * @return List of all users
     */
    @Transactional
    public List<User> findAllUsers() {
        return userDAO.findAllUsers();
    }
}
