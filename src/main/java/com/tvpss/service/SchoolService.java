package com.tvpss.service;

import com.tvpss.model.School;
import com.tvpss.repository.SchoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolService {

    @Autowired
    private SchoolDAO schoolDAO;

    public List<School> getAllSchools() {
        return schoolDAO.getAllSchools();  // Fetch schools from the database
    }

	public List<School> getSchoolByDistrict(Long districtID) {
		// TODO Auto-generated method stub
		return schoolDAO.getSchoolByDistrict(districtID);
	}
}
