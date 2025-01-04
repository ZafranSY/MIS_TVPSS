package com.tvpss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tvpss.model.Crew;
import com.tvpss.repository.CrewDAO;

@Service
public class CrewService {

    @Autowired
    private CrewDAO crewRepository;

    public List<Crew> getPendingApplicants() {
        return crewRepository.findByApplicationStatus("Pending");
    }



    public void approveApplicant(int crewID) {
        crewRepository.updateApplicationStatus(crewID, "Approved");
    }

    public void rejectApplicant(int crewID) {
        crewRepository.updateApplicationStatus(crewID, "Rejected");
    }
    public Crew getApplicantDetails(int crewID) {
        return crewRepository.findCrewById(crewID);
    }
    
}
