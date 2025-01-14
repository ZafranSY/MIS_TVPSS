package com.tvpss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tvpss.model.crewTask;
import com.tvpss.repository.CrewDAO;
import com.tvpss.repository.CrewTaskDAO;

@Service
public class crewTaskService {
	
    @Autowired
    private CrewTaskDAO crewRepository;

    
	public List<crewTask> getPendingApplicantsbySchool(int adminSchoolID) {
        return crewRepository.findByApplicationStatusAndAdminSchoolId("Pending", adminSchoolID);
    }

    public List<crewTask> getApprovedApplicantsbySchool(int adminSchoolID) {
        return crewRepository.findByApplicationStatusAndAdminSchoolId("Approved", adminSchoolID);
    }
 // Fetch tasks by CrewID
    public List<crewTask> getTasksByCrewID(int crewID) {
        return crewRepository.findAllTasksByCrewID(crewID);
    }
    public List<crewTask>getAllTaskbyCrewID(int crewID)
    {
    	return crewRepository.findAllTasksByCrewID(crewID);
    }
    public List<crewTask> getPendingTaskStatusbyCrewID(int crewID)
    {
    	return crewRepository.findTaskbyStatus("Pending",crewID);
    }
    public List<crewTask> getCompleteTaskStatus( int crewID)
    {
    	return crewRepository.findTaskbyStatus("Complete",crewID);
    }
    
}
