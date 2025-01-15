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
}
