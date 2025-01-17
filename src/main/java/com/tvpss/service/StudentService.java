package com.tvpss.service;

import com.tvpss.model.School;
import com.tvpss.model.crewTask;
import com.tvpss.repository.CrewTaskDAO;
import com.tvpss.repository.SchoolDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class StudentService {
	
	@Autowired
	private SchoolDAO schoolDAO;
	
	@Transactional
	public List  <School> findAlltaskByCrewID() {
		return schoolDAO.getAllSchools();
	}
	
	public List <School> getSchoolByDistrict(Long districtID)
	{
		return schoolDAO.getSchoolByDistrict(districtID);
	}

}
