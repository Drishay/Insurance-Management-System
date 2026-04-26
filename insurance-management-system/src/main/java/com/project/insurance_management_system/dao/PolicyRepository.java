package com.project.insurance_management_system.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.project.insurance_management_system.model.Policy;

public interface PolicyRepository extends JpaRepository<Policy, Integer> {

}