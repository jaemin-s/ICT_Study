package com.example.todo.userapi.service;

import com.example.todo.auth.TokenProvider;
import com.example.todo.exception.DuplicatedEmailException;
import com.example.todo.exception.NoRegisteredArgumentsException;
import com.example.todo.userapi.dto.request.LoginRequestDTO;
import com.example.todo.userapi.dto.request.UserRequestSignUpDTO;
import com.example.todo.userapi.dto.response.LoginResponseDTO;
import com.example.todo.userapi.dto.response.UserSignUpResponseDTO;
import com.example.todo.userapi.entity.User;
import com.example.todo.userapi.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder encoder;
    private final TokenProvider tokenProvider;

    // 회원 가입 처리
    public UserSignUpResponseDTO create(UserRequestSignUpDTO dto) throws RuntimeException{

        if(dto == null || dto.getEmail().equals("")) {
            throw new NoRegisteredArgumentsException("가입 정보가 없습니다.");
        }

        if(isDuplicate(dto.getEmail())) {
            throw new DuplicatedEmailException("중복된 이메일 입니다.");
        }

        //패스워드 인코딩
        dto.setPassword(encoder.encode(dto.getPassword()));

        User user = dto.toEntity();

        User saved = userRepository.save(user);
        log.info("회원 가입 정상 수행됨 - saved user : {}",saved);

        return new UserSignUpResponseDTO(saved);
    }

    public boolean isDuplicate(String email) {
        return userRepository.existsByEmail(email);
    }

    public LoginResponseDTO authenticate(final LoginRequestDTO dto){
        User user = userRepository.findByEmail(dto.getEmail())
                .orElseThrow(() -> new RuntimeException("가입된 회원이 아닙니다."));
        String rawPassword = dto.getPassword();
        String encodedPassword = user.getPassword();
        if(!encoder.matches(rawPassword,encodedPassword)) {
            throw new RuntimeException("비밀번호가 틀렸습니다.");
        }

        log.info("{}님 로그인 성공",user.getUserName());

        String token = tokenProvider.createToken(user);

        return new LoginResponseDTO(user, token);
    }
}
