package com.tvpss.service;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tvpss.model.crewTask;
import com.tvpss.model.Crew;
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
    public List<Crew> getAllApplicantsbySchool(int adminSchoolID) {
        return crewRepository.findAllByApplicationStatusAndAdminSchoolId( adminSchoolID);
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
    public crewTask getTaskByID(int taskID) {
        return crewRepository.findTaskByID(taskID);
    }
    public void deleteTask(int taskId) {
    	crewRepository.deleteTask(taskId);
    }
    public void CreateTask(String taskTitle, String taskDescription, Date taskDueDate, int crewId) {
        crewRepository.createTask(taskTitle, taskDescription, taskDueDate, crewId);
    }
    public void updateTask(String taskTitle, String taskDescription, Date taskDueDate, int taskId) {
        crewRepository.updateTask(taskTitle, taskDescription, taskDueDate, taskId);
    }


    
}
