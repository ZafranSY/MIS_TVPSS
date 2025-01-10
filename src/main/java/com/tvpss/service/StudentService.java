package com.tvpss.service;

import com.tvpss.model.crewTask;
import com.tvpss.repository.CrewTaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class StudentService {
	
	@Autowired
	private CrewTaskDAO crewTaskDAO;
	
	@Transactional
	public crewTask findAlltaskByCrewID(int crewID) {
		return crewTaskDAO.findAlltaskByCrewID(crewID);
	}
	

}
