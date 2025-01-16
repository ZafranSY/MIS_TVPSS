package com.tvpss.repository;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.tvpss.model.Crew;
import com.tvpss.model.crewTask;
@Repository
@Transactional
public class CrewTaskDAO {

	  @PersistenceContext
	  private EntityManager entityManager;
	  
//	  public List<crewTask> findAlltaskByCrewID(int crewID)
//	  {
//		  String query ="SELECT c FROM crewTask c WHERE c.crewID := crewID";
//		  return  entityManager.createQuery(query,crewTask.class).setParameter("crewID",crewID).getResultList();
//	  }
	  public List<crewTask> findByApplicationStatusAndAdminSchoolId(String status, Integer adminSchoolID) {
	        String query = "SELECT c FROM Crew c WHERE c.applicationStatus = :status AND c.adminSchool.adminSchoolID = :adminSchoolID";
	        System.out.println("Executing query:");
	        System.out.println("ApplicationStatus: " + status);
	        System.out.println("AdminSchoolID: " + adminSchoolID);
	        List<crewTask> results = entityManager.createQuery(query, crewTask.class)
	                                          .setParameter("status", status)
	                                          .setParameter("adminSchoolID", adminSchoolID)
	                                          .getResultList();

	        System.out.println("Query Results: " + results.size());
	        return results;
	    }
	  public List<Crew> findAllByApplicationStatusAndAdminSchoolId(int adminSchoolID) {
	        String query = "SELECT c FROM Crew c WHERE c.adminSchool.adminSchoolID = :adminSchoolID";
	        System.out.println("Executing query:");
	        System.out.println("AdminSchoolID: " + adminSchoolID);
	        List<Crew> results = entityManager.createQuery(query, Crew.class)
	                                          .setParameter("adminSchoolID", adminSchoolID)
	                                          .getResultList();

	        System.out.println("Query Results: " + results.size());
	        return results;
	    }
	  public List<crewTask> findAllTasksByCrewID(int crewID) {
		    String query = "SELECT t FROM crewTask t WHERE t.crew.crewID = :crewID";
		    return entityManager.createQuery(query, crewTask.class)
		                        .setParameter("crewID", crewID)
		                        .getResultList();
		}
	  
	  public List<crewTask> findTaskbyStatus(String status, int crewID)
	  {
		  String query = "SELECT c FROM crewTask c"+
	                      "JOIN FETCH c.Crew"+
				          "WHERE c.taskStatus = :status AND c.crew.crewID = :crewID";
		  
		  return entityManager.createQuery(query, crewTask.class).setParameter("status", status).getResultList();
	  }
	  public crewTask findTaskByID(int taskID) {
		    String query = "SELECT t FROM crewTask t WHERE t.taskId = :taskID";
		    return entityManager.createQuery(query, crewTask.class)
		                        .setParameter("taskID", taskID)
		                        .getSingleResult();
		}
	// CrewTaskDAO.java
	  public void deleteTask(int taskId) {
	      String query = "DELETE FROM crewTask t WHERE t.taskId = :taskId";
	      entityManager.createQuery(query)
	                  .setParameter("taskId", taskId)
	                  .executeUpdate();
	  }
	  
	  public void createTask(String taskTitle, String taskDescription, Date taskDueDate, int crewId) {
		    String query = "INSERT INTO crewTask (TaskTitle, TaskDescription, TaskDueDate, CrewID) VALUES (:title, :description, :dueDate, :crewID)";
		    entityManager.createNativeQuery(query)
		                 .setParameter("title", taskTitle)
		                 .setParameter("description", taskDescription)
		                 .setParameter("dueDate", taskDueDate)
		                 .setParameter("crewID", crewId)
		                 .executeUpdate();
		}
	  public void updateTask(String taskTitle, String taskDescription, Date taskDueDate, int taskId)
	  {
		  String query = "UPDATE crewTask SET TaskTitle =: taskTitle, TaskDescription := taskDescription, TaskDueDate := taskDueDate WHERE tasId := taskId";
		  entityManager.createNativeQuery(query)
          .setParameter("title", taskTitle)
          .setParameter("description", taskDescription)
          .setParameter("dueDate", taskDueDate)
          .setParameter("taskId", taskId)
          .executeUpdate();
	  }

}


