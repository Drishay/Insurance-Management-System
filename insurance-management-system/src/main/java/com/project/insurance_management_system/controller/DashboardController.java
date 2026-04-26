package com.project.insurance_management_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {

        if (session.getAttribute("user") == null) {
            return "redirect:/login";  // not logged in
        }

        return "dashboard";
    }
}