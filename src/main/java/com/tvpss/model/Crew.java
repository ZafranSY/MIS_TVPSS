package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Crew")
public class Crew {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CrewID")
	private Integer crewID;

	@OneToOne
	@JoinColumn(name = "UserID", nullable = false)
	private User user;

	@Column(name = "Role")
	private String role;

	@Column(name = "ApplicationStatus")
	private String applicationStatus;

	@Column(name = "SchoolName") // New field
	private String schoolName;

	@Column(name = "Address") // New field
	private String address;

	@ManyToOne
	@JoinColumn(name = "AdminSchoolID", nullable = true) // Ensure the column name matches the DB schema
	private AdminSchool adminSchool;

	@Column(name = "ICNumber") // New field
	private String ICNumber;

	public String getICNumber() {
		return ICNumber;
	}

	public void setICNumber(String iCNumber) {
		ICNumber = iCNumber;
	}

	@Column(name = "ReasonToJoin") // New field
	private String ReasonToJoin;

	public String getReasonToJoin() {
		return ReasonToJoin;
	}

	public void setReasonToJoin(String reasonToJoin) {
		ReasonToJoin = reasonToJoin;
	}

	// Getters and Setters
	public Integer getCrewID() {
		return crewID;
	}

	public void setCrewID(Integer crewID) {
		this.crewID = crewID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
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

	public AdminSchool getAdminSchool() {
		return adminSchool;
	}

	public void setAdminSchool(AdminSchool adminSchool) {
		this.adminSchool = adminSchool;
	}

	@Override
	public String toString() {
		return "Crew{" + "crewID=" + crewID + ", userID=" + (user != null ? user.getUserId() : "null") + ", role='"
				+ role + '\'' + ", applicationStatus='" + applicationStatus + '\'' + '}';
	}
}
