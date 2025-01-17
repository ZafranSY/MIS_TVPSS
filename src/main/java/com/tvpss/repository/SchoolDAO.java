package com.tvpss.repository;

import com.tvpss.model.School;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class SchoolDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public List<School> getAllSchools() {
        return entityManager.createQuery("SELECT s FROM School s", School.class).getResultList();
    }
    public List<School> getSchoolByDistricta(Long districtID)
    {
    	String query ="SELECT * FROM School s WHERE s.district.districtID := districtID";
    	return entityManager.createQuery(query,School.class).setParameter("districtID", districtID).getResultList();
    }
    public List<School> getSchoolByDistrict(Long districtID) {
    	 try {
             if (districtID == null) {
                 throw new IllegalArgumentException("District ID cannot be null");
             }
             
             String query = "SELECT s FROM School s WHERE s.district.districtID = :districtID";
             return entityManager.createQuery(query, School.class)
                 .setParameter("districtID", districtID)
                 .getResultList();
         } catch (Exception e) {
             // Log the error appropriately
             throw new RuntimeException("Error fetching schools for district: " + districtID, e);
         }
    }
}
