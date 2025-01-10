package com.tvpss.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.tvpss.model.crewTask;

@Repository
@Transactional
public class CrewTaskDAO {

	  @PersistenceContext
	  private EntityManager entityManager;
	  
	  public List<crewTask> findAlltaskByCrewID(int crewID)
	  {
		  String query ="SELECT c FROM crewTask c WHERE c.crewID := crewID";
		  return  entityManager.createQuery(query,crewTask.class).setParameter("crewID",crewID).getResultList();
	  }
}
