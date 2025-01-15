package com.tvpss.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "School")
public class School {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "schoolID")
    private Long schoolID;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @ManyToOne
    @JoinColumn(name = "districtID", referencedColumnName = "districtID", nullable = false)
    private District district;  // Assuming you have a District class

    @OneToMany(mappedBy = "school")
    private List<Program> programs;  // One-to-many relationship with Program

    // Getters and Setters
    public Long getSchoolID() {
        return schoolID;
    }

    public void setSchoolID(Long schoolID) {
        this.schoolID = schoolID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public List<Program> getPrograms() {
        return programs;
    }

    public void setPrograms(List<Program> programs) {
        this.programs = programs;
    }
}
