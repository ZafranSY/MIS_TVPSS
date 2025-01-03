package com.tvpss.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "user") // Matches the table name
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserID") // Matches the primary key column name
    private Long userId;

    @Column(name = "Name", nullable = false) // Matches the 'Name' column
    private String name;

    @Column(name = "Email", nullable = false, unique = true) // Matches the 'Email' column
    private String email;

    @Column(name = "Password", nullable = false) // Matches the 'Password' column
    private String password;

    @Column(name = "Role", nullable = false) // Matches the 'Role' column
    private int role;

    @Column(name = "Status", nullable = false) // Matches the 'Status' column
    private String status = "active";

    @Column(name = "CreatedAt", updatable = false) // Matches the 'CreatedAt' column
    private String createdAt;

    @Column(name = "UpdatedAt") // Matches the 'UpdatedAt' column
    private String updatedAt;

    // Constructors, Getters, and Setters
    public User() {}

    public User(String name, String email, String password, int role, String status, String createdAt, String updatedAt) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

	
}
