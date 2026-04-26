package com.project.insurance_management_system.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.project.insurance_management_system.model.Claim;
import com.project.insurance_management_system.model.User;

import java.util.List;

public interface ClaimRepository extends JpaRepository<Claim, Integer> {

    List<Claim> findByUser(User user);

}