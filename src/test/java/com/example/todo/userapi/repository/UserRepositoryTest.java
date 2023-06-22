package com.example.todo.userapi.repository;

import com.example.todo.userapi.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Rollback(false)
class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    @Test
    @DisplayName("회원 가입 테스트")
    void saveTest() {
        //given
        User user = User.builder().email("abc123@abc.com").userName("홍길동").password("1234")
                .build();
        //when
        User saved = userRepository.save(user);
        //then
        assertNotNull(saved);
    }

    @Test
    @DisplayName("이메일로 회원 조회하기")
    void findEmailTest() {
        //given
        String email = "abc123@abc.com";
        //when
        User user = userRepository.findByEmail(email).orElseThrow();
        //then
        System.out.println(user);
        assertEquals("홍길동",user.getUserName());
    }

    @Test
    @DisplayName("이메일 중복체크를 하면 중복값이 false")
    void emailFalse() {
        //given
        String email = "zxc987@abc.com";
        //when
        boolean result = userRepository.existsByEmail(email);
        //then
        assertFalse(result);
    }
}