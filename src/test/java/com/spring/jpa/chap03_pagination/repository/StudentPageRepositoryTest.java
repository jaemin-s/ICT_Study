package com.spring.jpa.chap03_pagination.repository;

import com.spring.jpa.chap02_querymethod.entity.Student;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.annotation.Rollback;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootTest
@Transactional
@Rollback(false)
class StudentPageRepositoryTest {

    @Autowired
    StudentPageRepository studentPageRepository;

    @BeforeEach
    void bulkInsert(){
        for (int i = 1; i < 147; i++) {
            Student student = Student.builder().name("김테스트" + i).city("도시시" + i).major("전공공" + i).build();
            studentPageRepository.save(student);
        }
    }
    @Test
    @DisplayName("기본 페이징 테스트")
    void testBasicPagination() {
        //given
        int pageNum = 1;
        int amount = 10;
        
        //페이지 정보 생성
        Pageable pageInfo = PageRequest.of(pageNum-1, amount
//                , Sort.by("name").ascending()
                , Sort.by(Sort.Order.desc("name"),Sort.Order.asc("city"))
        );

        //when
        Page<Student> students = studentPageRepository.findAll(pageInfo);

        List<Student> studentList = students.getContent();
        int totalPages = students.getTotalPages();
        System.out.println("totalPages = " + totalPages);
        long totalElements = students.getTotalElements();
        System.out.println("totalElements = " + totalElements);
        boolean next = students.hasNext();
        System.out.println("next = " + next);
        boolean previous = students.hasPrevious();
        System.out.println("previous = " + previous);

        //then
        studentList.forEach(System.out::println);
    }

    @Test
    @DisplayName("이름검색 + 페이징")
    void testSearchAndPagination() {
        //given
        int pageNo = 1;
        int size = 10;
        Pageable pageInfo = PageRequest.of(pageNo - 1, size);
        //when
        Page<Student> students =
                studentPageRepository.findByNameContaining("3", pageInfo);
        //then
        students.getContent().forEach(System.out::println);
    }
}