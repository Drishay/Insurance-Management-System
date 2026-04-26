package com.project.insurance_management_system.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project.insurance_management_system.dao.ClaimRepository;
import com.project.insurance_management_system.dao.PolicyRepository;
import com.project.insurance_management_system.dao.SubscriptionRepository;
import com.project.insurance_management_system.model.*;

@Controller
public class ClaimController {

    @Autowired
    private ClaimRepository claimRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    @Autowired
    private PolicyRepository policyRepository;

    // Show claim form
    @GetMapping("/claim")
    public String claimPage(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<Subscription> subs = subscriptionRepository.findByUser(user);
        model.addAttribute("subs", subs);

        return "claimForm";
    }

    // Submit claim
    @PostMapping("/claim")
    public String submitClaim(@RequestParam int policyId,
                              @RequestParam double amount,
                              @RequestParam String reason,
                              HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        Policy policy = policyRepository.findById(policyId).orElse(null);

        Claim claim = new Claim();
        claim.setUser(user);
        claim.setPolicy(policy);
        claim.setAmount(amount);
        claim.setReason(reason);
        claim.setStatus("PENDING");
        claim.setDate(LocalDate.now());

        claimRepository.save(claim);

        return "redirect:/myClaims";
    }

    // View user's claims
    @GetMapping("/myClaims")
    public String myClaims(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<Claim> claims = claimRepository.findByUser(user);
        model.addAttribute("claims", claims);

        return "myClaims";
    }
    
    @GetMapping("/admin/claims")
    public String viewAllClaims(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        List<Claim> claims = claimRepository.findAll();
        model.addAttribute("claims", claims);

        return "adminClaims";
    }
    
    @GetMapping("/admin/approveClaim")
    public String approveClaim(@RequestParam int id, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        Claim claim = claimRepository.findById(id).orElse(null);
        if (claim != null) {
            claim.setStatus("APPROVED");
            claimRepository.save(claim);
        }

        return "redirect:/admin/claims";
    }
    
    @GetMapping("/admin/rejectClaim")
    public String rejectClaim(@RequestParam int id, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        Claim claim = claimRepository.findById(id).orElse(null);
        if (claim != null) {
            claim.setStatus("REJECTED");
            claimRepository.save(claim);
        }

        return "redirect:/admin/claims";
    }
}