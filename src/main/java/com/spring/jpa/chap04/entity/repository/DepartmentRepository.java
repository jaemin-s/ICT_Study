package com.spring.jpa.chap04.entity.repository;

import com.spring.jpa.chap04.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
}
