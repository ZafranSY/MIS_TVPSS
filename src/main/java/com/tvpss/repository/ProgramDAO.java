package com.tvpss.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tvpss.model.Program;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class ProgramDAO {

    @PersistenceContext
    private EntityManager entityManager;

    // Get program by ID
    public Program getProgramById(int id) {
        return entityManager.find(Program.class, id);
    }

    // Get all programs
    public List<Program> getAllPrograms() {
        return entityManager.createQuery("SELECT p FROM Program p", Program.class).getResultList();
    }

    // Save a new program
    public void addProgram(Program program) {
        entityManager.persist(program);
    }

    // Update an existing program
    public void updateProgram(Program program) {
        entityManager.merge(program);
    }

    // Delete a program by ID
    public void deleteProgram(int id) {
        Program program = getProgramById(id);
        if (program != null) {
            entityManager.remove(program);
        }
    }
}
