package com.tvpss.service;

import com.tvpss.model.AdminSchool;
import com.tvpss.repository.AdminSchoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class AdminSchoolService {

    @Autowired
    private AdminSchoolDAO adminSchoolDAO;

    /**
     * Get AdminSchool by ID
     */
    public AdminSchool findByUserId(int userId) {
        return adminSchoolDAO.findByUserId(userId);
    }
    public AdminSchool getAdminSchoolById(int adminSchoolID) {
        return adminSchoolDAO.findById(adminSchoolID);
    }

    /**
     * Get AdminSchool by school name
     */
    public AdminSchool getAdminSchoolBySchoolName(String schoolName) {
        return adminSchoolDAO.findBySchoolName(schoolName);
    }

    /**
     * Save or update AdminSchool
     */
    public void saveOrUpdateAdminSchool(AdminSchool adminSchool) {
        adminSchoolDAO.saveOrUpdate(adminSchool);
    }

    /**
     * Delete AdminSchool
     */
    public void deleteAdminSchool(int adminSchoolID) {
        AdminSchool adminSchool = adminSchoolDAO.findById(adminSchoolID);
        if (adminSchool != null) {
            adminSchoolDAO.delete(adminSchool);
        }
    }
    public Integer findSchoolAdminIDByUserId(int userId) {
        return adminSchoolDAO.findSchoolAdminIDByUserId(userId);
    }
    public Integer getAdminBySchoolName(String SchoolName)
    {
    	return adminSchoolDAO.getAdminBySchoolName(SchoolName);
    }
}
