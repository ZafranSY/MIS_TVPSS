package com.tvpss.service;

import com.tvpss.model.Program;
import com.tvpss.repository.ProgramDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgramService {

    @Autowired
    private ProgramDAO programDAO;

    // Get program by ID
    public Program getProgramById(int id) {
        return programDAO.getProgramById(id);
    }

    // Get all programs
    public List<Program> getAllPrograms() {
        return programDAO.getAllPrograms();
    }

    // Save a new program
    public void addProgram(Program program) {
        programDAO.addProgram(program);
    }

    // Update an existing program
    public void updateProgram(Program program) {
        programDAO.updateProgram(program);
    }

    // Delete a program by ID
    public void deleteProgramById(int id) {
        programDAO.deleteProgram(id);
    }
}
