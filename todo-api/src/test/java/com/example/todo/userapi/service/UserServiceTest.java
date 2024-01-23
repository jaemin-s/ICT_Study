package com.example.todo.userapi.service;

import com.example.todo.userapi.dto.request.UserRequestSignUpDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertThrows;

@SpringBootTest
@Rollback(false)
@Transactional
class UserServiceTest {

    @Autowired
    UserService userService;

    @Test
    @DisplayName("중복된 이메일로 회원가입을 시도하면 RuntimeException 발생")
    void validateEmailTest() {
        //given
        String email = "abc123@abc.com";
        //when
        UserRequestSignUpDTO dto = UserRequestSignUpDTO.builder()
                .email(email).userName("name").password("password").build();
        //then
        assertThrows(RuntimeException.class, ()->{
            userService.create(dto);
        });
    }

}