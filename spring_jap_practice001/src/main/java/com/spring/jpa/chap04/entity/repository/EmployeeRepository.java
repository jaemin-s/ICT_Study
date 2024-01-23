package com.spring.jpa.chap04.entity.repository;

import com.spring.jpa.chap04.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
