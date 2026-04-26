package com.project.insurance_management_system.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.project.insurance_management_system.model.Policy;
import com.project.insurance_management_system.model.Subscription;
import com.project.insurance_management_system.model.User;

import java.util.List;

public interface SubscriptionRepository extends JpaRepository<Subscription, Integer> {

    List<Subscription> findByUser(User user);
    Subscription findByUserAndPolicy(User user, Policy policy);
    boolean existsByPolicyId(int policyId);

}