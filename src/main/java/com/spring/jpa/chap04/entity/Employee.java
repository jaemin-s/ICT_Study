package com.spring.jpa.chap04.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
// jpa 연관관계 데이터는 tostrting에서 제외
@ToString(exclude = {"department"})
@EqualsAndHashCode(of = "id")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "tbl_emp")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "emp_id")
    private long id;

    @Column(name = "emp_name", nullable = false)
    private String name;

    // EAGER: 항상 무조건 조인을 수행
    // LAZY: 필요한 경우에만 조인을 수행 (실무)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dept_id")
    private Department department;

    public void setDepartment(Department department) {
        this.department = department;
        department.getEmployees().add(this);
    }
}
