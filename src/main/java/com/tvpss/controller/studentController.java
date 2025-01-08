package com.tvpss.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Servlet implementation class studentController
 */
@Controller
public class studentController
{
 @GetMapping("/student/dashboard")
 public String showDashboard()
 {
	 return "student/dashboard";
 }
 
 @GetMapping("/student/crewTask")
}
