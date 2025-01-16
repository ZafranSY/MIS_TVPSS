package com.tvpss.service;

import java.util.List;

import javax.transaction.Transactional;

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
    public List<Crew> getApprovedApplicant()
    {
    	return crewRepository.findByApplicationStatus("Approved");
    }

//    // Update application status
//    public void updateApplicationStatus(int crewID, String status) {
//        Crew crew = crewRepository.findCrewById(crewID);
//        crew.setApplicationStatus(status);
//        crewRepository.save(crew);
//    }

    public void approveApplicant(int crewID) {
        crewRepository.updateApplicationStatus(crewID, "Approved");
    }

    public void rejectApplicant(int crewID) {
        crewRepository.updateApplicationStatus(crewID, "Rejected");
    }
    public Crew getApplicantDetails(int crewID) {
        return crewRepository.findCrewById(crewID);
    }
    public Crew getCrewValidationByUserID(int userID)
    {
    	return crewRepository.findCrewbyUserID(userID);
    }
    @Transactional
    public void updateApplicationStatus(int crewID, String status) {
    	crewRepository.updateApplicationStatus(crewID, status);
    }
    
    public List<Crew> getCrewsByAdminSchoolID(int adminSchoolID) {
        return crewRepository.findByAdminSchoolID(adminSchoolID);
    }
    public List<Crew> getPendingApplicantsbySchool(int adminSchoolID) {
        return crewRepository.findByApplicationStatusAndAdminSchoolId("Pending", adminSchoolID);
    }

    public List<Crew> getApprovedApplicantsbySchool(int adminSchoolID) {
        return crewRepository.findByApplicationStatusAndAdminSchoolId("Approved", adminSchoolID);
    }
    public void deleteCrew(Integer crewId)
    {
    	 crewRepository.deleteCrew(crewId);
    }
    @Transactional
    public void CrewRegistration(Crew crew)
    {
    	crewRepository.CrewRegistration(crew);
    }

}
