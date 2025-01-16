package com.tvpss.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.tvpss.model.Crew;

@Repository
@Transactional
public class CrewDAO {

    @PersistenceContext
    private EntityManager entityManager;
    


    public List<Crew> findByApplicationStatus(String status) {
        String query = "SELECT c FROM Crew c " +
                       "JOIN FETCH c.user u " +
                       "WHERE c.applicationStatus = :status";
        return entityManager.createQuery(query, Crew.class)
                .setParameter("status", status)
                .getResultList();
    }




//    public void updateApplicationStatus(int crewID, String newStatus) {
//        String query = "UPDATE Crew c SET c.applicationStatus = :newStatus WHERE c.crewID = :crewID";
//        int updatedCount = entityManager.createQuery(query)
//                .setParameter("newStatus", newStatus)
//                .setParameter("crewID", crewID)
//                .executeUpdate();
//        if (updatedCount == 0) {
//            System.out.println("No records updated for crewID: " + crewID);
//        }
//    }

    
    public Crew findCrewById(int crewID) {
        String query = "SELECT c FROM Crew c WHERE c.crewID = :crewID";
        return entityManager.createQuery(query, Crew.class)
                .setParameter("crewID", crewID)
                .getSingleResult();
    }

    public List<Crew> findAllApplicants() {
        String query = "SELECT * FROM Crew";
        return entityManager.createQuery(query, Crew.class).getResultList();
    }
    public Crew findCrewbyUserID(int userID) {
        String query = "SELECT c FROM Crew c WHERE c.user.userId = :userID";
        try {
            return entityManager.createQuery(query, Crew.class)
                    .setParameter("userID", userID)
                    .getSingleResult();
        } catch (NoResultException e) {
            // Return null if no result is found
            return null;
        }
    }

    /**
     * Update the application status for a given Crew ID
     * 
     * @param crewID The ID of the Crew
     * @param status New status to set (e.g., Approved, Rejected)
     */
    public void updateApplicationStatus(int crewID, String status) {
        Crew crew = entityManager.find(Crew.class, crewID);
        if (crew != null) {
            crew.setApplicationStatus(status);
            entityManager.merge(crew); // Update the entity in the database
        } else {
            throw new RuntimeException("Crew with ID " + crewID + " not found.");
        }
    }
    
    
    public List<Crew> findByAdminSchoolID(int adminSchoolID) {
        String query = "SELECT c FROM Crew c WHERE c.adminSchool.adminSchoolID = :adminSchoolID";
        return entityManager.createQuery(query, Crew.class)
                .setParameter("adminSchoolID", adminSchoolID)
                .getResultList();
    }
    public List<Crew> findByApplicationStatusAndAdminSchoolId(String status, Integer adminSchoolID) {
        String query = "SELECT c FROM Crew c WHERE c.applicationStatus = :status AND c.adminSchool.adminSchoolID = :adminSchoolID";
        System.out.println("Executing query:");
        System.out.println("ApplicationStatus: " + status);
        System.out.println("AdminSchoolID: " + adminSchoolID);

        List<Crew> results = entityManager.createQuery(query, Crew.class)
                                          .setParameter("status", status)
                                          .setParameter("adminSchoolID", adminSchoolID)
                                          .getResultList();

        System.out.println("Query Results: " + results.size());
        return results;
    }
    public void deleteCrew(Integer crewId) {  // Changed from DeleteCrew to deleteCrew
        String query = "DELETE FROM Crew c WHERE c.crewID = :crewId";
        entityManager.createQuery(query)
                    .setParameter("crewId", crewId)
                    .executeUpdate();
    }
    public void CrewRegistration(Crew crew)
    {
    	entityManager.persist(crew);
    }


}
