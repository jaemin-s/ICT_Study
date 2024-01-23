package com.finalProject.stockbeginner.user.repository;

import com.finalProject.stockbeginner.user.dto.request.UserDTO;
import com.finalProject.stockbeginner.user.dto.response.*;
import com.finalProject.stockbeginner.user.entity.User;
import com.finalProject.stockbeginner.user.entity.UserRole;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@Rollback(false)
class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    @Test
    @DisplayName("회원가입 테스트")
    void saveTest() {
        User user = User.builder()
                .email("abc123@naver.com")
                .password("!1234qwer")
                .name("홍길동")
                .nick("홍천재")
                .build();

        User saved = userRepository.save(user);

        System.out.println(saved);
        assertNotNull(saved);
    }

    @Test
    @DisplayName("rank")
    void getRank() {
        //given

        //when
        List<User> result = userRepository.findAllByOrderByMoneyDesc();
        //then
        System.out.println("result = " + result);
    }

    @Test
    @DisplayName("강등")
    void forceGradeDown() {
        //given
         Optional<User> admin = userRepository.findByEmail("m1@naver.com");
         User blacker = admin.get();
         if(blacker.getUserRole() == UserRole.ADMIN);

        //when
        Optional<User> black = userRepository.findByEmail("n6@naver.com");
        //then
        if (black.isPresent()) {
            User user = black.get();
            user.setUserRole(UserRole.BLACK);
            userRepository.save(user);
            System.out.println("user = " + user);

        }

    }

    @Test
    @DisplayName("mbti 유저 수 테스트")
    void mbtiTest() {
        //given
        List<MbtiUserResponseDTO> mbtiUser = userRepository.getMbtiUser();
        //when
        System.out.println("mbtiUser = " + mbtiUser);;
        //then
    }
    
    @Test
    @DisplayName("native test")
    void ntest() {
        //given
        List<CntByAgesDTO> dtos = userRepository.getCntByAges();
        System.out.println("dtos.stream().map(CntByAgesResponseDTO::new).collect(Collectors.toList()) = "
                + dtos.stream().map(CntByAgesResponseDTO::new).collect(Collectors.toList()));
        //when
        
        //then
    }

    @Test
    @DisplayName("profit join")
    void profittest() {
        //given
        List<CntProfitByAgesDTO> dtos = userRepository.getCntProfitByAges();
        System.out.println("dtos = " + dtos.stream().map(CntProfitByAgesResponseDTO::new).collect(Collectors.toList()));
        //when

        //then
    }


    


//    @Test
//    @DisplayName("age 유저 수 테스트")
//    void ageTest() {
//        List<AgeUserResponseDTO> ageUser = userRepository.getAgeUser();
//        System.out.println("ageUser = " + ageUser);
//
//    }

    @Test
    @DisplayName("경력 유저 수 테스트")
    void careerTest() {
        //given
        List<CareerUserResponseDTO> list = userRepository.getCareerUser();
        //when
        System.out.println("list = " + list);
        //then
    }

    @Test
    @DisplayName("mbti 평균 수익")
    void mbtiAvgTest() {
        //given
        List<MbtiAvgResponseDTO> mbtiAvg = userRepository.getMbtiProfit();
        //when
        System.out.println("mbtiAvg = " + mbtiAvg);
        //then
    }

    @Test
    @DisplayName("career 평균 수익")
    void careerAvgTest() {
        //given
        List<CareerAvgResponseDTO> careerAvg = userRepository.getCareerProfit();
        //when
        System.out.println("careerAvg = " + careerAvg);
        //then
    }

    @Test
    @DisplayName("포인트 부여")
    void updatePoint() {
        //given
        String email = "jaemin@naver.com";
        Long point = 1500L;
        //when
        User user = userRepository.findByEmail(email).orElseThrow();
        System.out.println("user = " + user);
        UserDTO userDTO = new UserDTO(user, point);
        System.out.println("userDTO = " + userDTO);
        User updateUser = new User(userDTO);
        System.out.println("updateUser = " + updateUser);
        User saved = userRepository.save(updateUser);

        //then
    }

}
