package com.project.insurance_management_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.insurance_management_system.model.User;
import com.project.insurance_management_system.dao.PolicyRepository;
import com.project.insurance_management_system.dao.SubscriptionRepository;
import com.project.insurance_management_system.dao.ClaimRepository;

@Controller
public class UserController {

    // 🔥 ADD REPOSITORIES
    @Autowired
    private PolicyRepository policyRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    @Autowired
    private ClaimRepository claimRepository;

    // USER DASHBOARD
    @GetMapping("/user/dashboard")
    public String userDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"USER".equals(user.getRole())) {
            return "redirect:/login";
        }

        model.addAttribute("policyCount", policyRepository.count());
        model.addAttribute("myPolicyCount", subscriptionRepository.findByUser(user).size());
        model.addAttribute("claimCount", claimRepository.findByUser(user).size());

        return "userDashboard";
    }

    // USER ACCOUNT
    @GetMapping("/account")
    public String account(HttpSession session) {

        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        return "account";
    }
}