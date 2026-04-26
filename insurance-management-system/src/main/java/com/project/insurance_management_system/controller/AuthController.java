package com.project.insurance_management_system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.project.insurance_management_system.dao.UserRepository;
import com.project.insurance_management_system.model.User;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    // Show login page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // Show register page
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // Register user
    @PostMapping("/register")
    public String registerUser(@RequestParam String name,
                               @RequestParam String email,
                               @RequestParam String password) {
    	
    	if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            return "register";
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        user.setRole("USER");  // 🔥 default role

        userRepository.save(user);

        return "login";
    }

    // Login user
    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password,
                            javax.servlet.http.HttpSession session) {

        User user = userRepository.findByEmail(email);

        if (user != null && user.getPassword().equals(password)) {

            session.setAttribute("user", user);

            // 🔥 Role-based redirect
            if ("ADMIN".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/user/dashboard";
            }

        } else {
        	return "redirect:/login?error=true";
        }
    }
    
    // Log out
    @GetMapping("/logout")
    public String logout(javax.servlet.http.HttpSession session) {
        session.invalidate();  // destroy session
        return "redirect:/login";
    }
}