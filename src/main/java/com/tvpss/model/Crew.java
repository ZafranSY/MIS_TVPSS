package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity

@Table(name = "Crew")
public class Crew {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CrewID") // Explicitly map to the correct database column
    private Integer crewID;

    @OneToOne
    @JoinColumn(name = "UserID", nullable = false)
    private User user;

    @Column(name = "Role") // Explicitly map to the correct database column
    private String role;

    @Column(name = "ApplicationStatus") // Explicitly map to the correct database column
    private String applicationStatus;

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
    @Override
    public String toString() {
        return "Crew{" +
                "crewID=" + crewID +
                ", userID=" + (user != null ? user.getUserId() : "null") +
                ", role='" + role + '\'' +
                ", applicationStatus='" + applicationStatus + '\'' +
                '}';
    }
}
