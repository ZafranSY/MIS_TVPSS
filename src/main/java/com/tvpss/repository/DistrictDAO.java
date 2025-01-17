package com.tvpss.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.tvpss.model.*;
@Repository
@Transactional
public class DistrictDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<District>getAllDistrict()
	{
		String query = "SELECT d FROM District d";
		return entityManager.createQuery(query,District.class).getResultList();
	}
}
