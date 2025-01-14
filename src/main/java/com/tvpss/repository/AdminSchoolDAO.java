package com.tvpss.repository;

import com.tvpss.model.AdminSchool;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class AdminSchoolDAO {

    @PersistenceContext
    private EntityManager entityManager;

    /**
     * Find an AdminSchool by its ID
     */
    
    public AdminSchool findById(int userId) {
        String query = "SELECT a FROM schooladmin a WHERE a.userID = :userId";
        return entityManager.createQuery(query, AdminSchool.class)
                            .setParameter("userId", userId)
                            .getSingleResult();
    }
   

    /**
     * Find an AdminSchool by its school name
     */
    public AdminSchool findBySchoolName(String schoolName) {
        try {
            String query = "SELECT a FROM schooladmin a WHERE a.schoolName = :schoolName";
            return entityManager.createQuery(query, AdminSchool.class)
                    .setParameter("schoolName", schoolName)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null; // No AdminSchool found
        }
    }

    /**
     * Save or update an AdminSchool
     */
    public void saveOrUpdate(AdminSchool adminSchool) {
        if (adminSchool.getAdminSchoolID() == null) {
            entityManager.persist(adminSchool);
        } else {
            entityManager.merge(adminSchool);
        }
    }

    /**
     * Delete an AdminSchool
     */
    public void delete(AdminSchool adminSchool) {
        AdminSchool toDelete = entityManager.find(AdminSchool.class, adminSchool.getAdminSchoolID());
        if (toDelete != null) {
            entityManager.remove(toDelete);
        }
    }
    public AdminSchool findByUserId(int userId) {
        String query = "SELECT a FROM AdminSchool a WHERE a.userID = :userId";
        try {
            return entityManager.createQuery(query, AdminSchool.class)
                                .setParameter("userId", userId)
                                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    public Integer findSchoolAdminIDByUserId(int userId) {
        String query = "SELECT a.adminSchoolID FROM AdminSchool a WHERE a.userID = :userId";
        try {
            return entityManager.createQuery(query, Integer.class)
                                .setParameter("userId", userId)
                                .getSingleResult();
        } catch (NoResultException e) {
            return null; // Return null if no result is found
        }
    }



}
