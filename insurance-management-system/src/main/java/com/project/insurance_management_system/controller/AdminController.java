package com.project.insurance_management_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.insurance_management_system.model.User;

@Controller
public class AdminController {

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        return "adminDashboard";
    }
    @GetMapping("/admin/account")
    public String adminAccount(javax.servlet.http.HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        return "adminAccount";
    }
}