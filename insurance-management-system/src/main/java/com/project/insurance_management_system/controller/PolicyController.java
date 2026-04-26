package com.project.insurance_management_system.controller;

import javax.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project.insurance_management_system.dao.PolicyRepository;
import com.project.insurance_management_system.dao.SubscriptionRepository;
import com.project.insurance_management_system.model.Policy;
import com.project.insurance_management_system.model.Subscription;
import com.project.insurance_management_system.model.User;

@Controller
public class PolicyController {

    // 🔥 Repositories (keep all together)
    @Autowired
    private PolicyRepository policyRepository;

    @Autowired
    private SubscriptionRepository subscriptionRepository;

    // =========================
    // VIEW ALL POLICIES
    // =========================
    @GetMapping("/policies")
    public String viewPolicies(Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");

        List<Policy> policies = policyRepository.findAll();
        model.addAttribute("policies", policies);

        // send user subscriptions (for "Purchased" logic)
        if (user != null) {
            List<Subscription> subs = subscriptionRepository.findByUser(user);
            model.addAttribute("userSubs", subs);
        }

        return "policyList";
    }

    // =========================
    // ADD POLICY PAGE (ADMIN)
    // =========================
    @GetMapping("/addPolicy")
    public String addPolicyPage(HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/policies";
        }

        return "addPolicy";
    }

    // =========================
    // SAVE POLICY (ADMIN)
    // =========================
    @PostMapping("/addPolicy")
    public String savePolicy(@RequestParam String name,
                             @RequestParam String type,
                             @RequestParam double premium,
                             @RequestParam int duration,
                             @RequestParam String description,
                             HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/policies";
        }

        Policy policy = new Policy();
        policy.setName(name);
        policy.setType(type);
        policy.setPremium(premium);
        policy.setDuration(duration);
        policy.setDescription(description);

        policyRepository.save(policy);

        return "redirect:/policies";
    }

    // =========================
    // BUY POLICY (USER)
    // =========================
    @PostMapping("/buyPolicy")
    public String buyPolicy(@RequestParam int policyId, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        Policy policy = policyRepository.findById(policyId).orElse(null);

        if (policy == null) {
            return "redirect:/policies";
        }

        // 🔥 Prevent duplicate purchase
        Subscription existing = subscriptionRepository.findByUserAndPolicy(user, policy);

        if (existing != null) {
            return "redirect:/myPolicies";
        }

        Subscription sub = new Subscription();
        sub.setUser(user);
        sub.setPolicy(policy);
        sub.setStartDate(java.time.LocalDate.now());
        sub.setStatus("ACTIVE");

        subscriptionRepository.save(sub);

        return "redirect:/myPolicies";
    }

    // =========================
    // VIEW USER POLICIES
    // =========================
    @GetMapping("/myPolicies")
    public String myPolicies(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        List<Subscription> subs = subscriptionRepository.findByUser(user);
        model.addAttribute("subscriptions", subs);

        return "myPolicies";
    }

    // =========================
    // DELETE POLICY (ADMIN)
    // =========================
    @GetMapping("/admin/deletePolicy")
    public String deletePolicy(@RequestParam int id, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/login";
        }

        // 🔥 Prevent deleting used policy
        if (subscriptionRepository.existsByPolicyId(id)) {
            return "redirect:/policies?error=policyInUse";
        }

        policyRepository.deleteById(id);

        return "redirect:/policies";
    }
}