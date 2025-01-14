package com.tvpss.model;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(name = "schooladmin")
public class AdminSchool {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AdminSchoolID")
    private Integer adminSchoolID;

    @Column(name = "UserID", nullable = false)
    private Integer userID;

    @Column(name = "SchoolName", nullable = false)
    private String schoolName;

    @Column(name = "Address")
    private String address;

    // Getters and Setters
    public Integer getAdminSchoolID() {
        return adminSchoolID;
    }

    public void setAdminSchoolID(Integer adminSchoolID) {
        this.adminSchoolID = adminSchoolID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
