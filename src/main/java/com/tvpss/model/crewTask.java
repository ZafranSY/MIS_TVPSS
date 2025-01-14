package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "crewtask")
public class crewTask implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TaskID")
    private int taskId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CrewID", nullable = false)
    private Crew crew;

    @Column(name = "TaskTitle", nullable = false)
    private String taskTitle;

    @Column(name = "TaskDescription")
    private String taskDescription;

    @Column(name = "TaskDueDate")
    @Temporal(TemporalType.DATE)
    private Date taskDueDate;

    @Column(name = "TaskStatus", nullable = false)
    private String taskStatus = "Pending";

    @Column(name = "IsOverdue", nullable = false)
    private boolean isOverdue = false;


    // Getters and Setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public Crew getCrew() {
        return crew;
    }

    public void setCrew(Crew crew) {
        this.crew = crew;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public Date getTaskDueDate() {
        return taskDueDate;
    }

    public void setTaskDueDate(Date taskDueDate) {
        this.taskDueDate = taskDueDate;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    public boolean isOverdue() {
        return isOverdue;
    }

    public void setOverdue(boolean overdue) {
        isOverdue = overdue;
    }
}
