package com.tvpss.model;

import javax.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "Program")
public class Program {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int programID;  // Auto-incremented Primary Key

    @Column(name = "TeacherID", nullable = false)
    private int teacherID;  // ID of the teacher who created the program

    @Column(name = "Title", nullable = false, length = 255)
    private String title;  // Title of the program

    @Column(name = "Description")
    private String description;  // Description of the program

    @Temporal(TemporalType.DATE)  // Ensures the SQL column stores date only (without time)
    @DateTimeFormat(pattern = "yyyy-MM-dd")  // Ensures Spring parses date format correctly
    @Column(name = "StartDate")
    private Date startDate;  // Program start date

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "EndDate")
    private Date endDate;  // Program end date

    @Column(name = "posted_by", length = 255)  // New column to store the name of the logged-in user
    private String postedBy;  // Name of the user who posted the program

    // Getters and setters
    public int getProgramID() {
        return programID;
    }

    public void setProgramID(int programID) {
        this.programID = programID;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPostedBy() {
        return postedBy;
    }

    public void setPostedBy(String postedBy) {
        this.postedBy = postedBy;
    }

    @Override
    public String toString() {
        return "Program{" +
                "programID=" + programID +
                ", teacherID=" + teacherID +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", postedBy='" + postedBy + '\'' +
                '}';
    }
}
