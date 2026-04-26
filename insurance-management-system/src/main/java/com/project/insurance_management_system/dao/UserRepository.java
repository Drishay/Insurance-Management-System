package com.project.insurance_management_system.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.project.insurance_management_system.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);

}