package com.finalProject.stockbeginner.user.dto.request;

import com.finalProject.stockbeginner.user.entity.User;
import com.finalProject.stockbeginner.user.entity.UserRole;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@Builder
public class UserDTO {

    private String id;
    private long kakaoId;
    private String email;
    private String password;
    private String name;
    private String nick;
    private Long money;
    private Long gradePoint;
    private LocalDateTime regDate;
    private String phoneNumber;
    private String gender;
    private Integer age;
    private String career;
    private String image;
    private String mbti;
    private UserRole userRole;

    public UserDTO(User user) {
        this.id = user.getId();
        this.kakaoId = user.getKakaoId();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.name = user.getName();
        this.nick = user.getNick();
        this.money = user.getMoney();
        this.gradePoint = user.getGradePoint();
        this.regDate = user.getRegDate();
        this.phoneNumber = user.getPhoneNumber();
        this.gender = user.getGender();
        this.age = user.getAge();
        this.career = user.getCareer();
        this.image = user.getImage();
        this.mbti = user.getMbti();
        this.userRole = user.getUserRole();
    }

    public UserDTO(User user, Long point){
        this.id = user.getId();
        this.kakaoId = user.getKakaoId();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.name = user.getName();
        this.nick = user.getNick();
        this.money = user.getMoney();
        this.gradePoint = point;
        this.regDate = user.getRegDate();
        this.phoneNumber = user.getPhoneNumber();
        this.gender = user.getGender();
        this.age = user.getAge();
        this.career = user.getCareer();
        this.image = user.getImage();
        this.mbti = user.getMbti();
        if(user.getUserRole()==UserRole.BLACK||user.getUserRole()==UserRole.ADMIN){
            System.out.println("블랙이나 어드민");
        }else{
            if(point>=1000){
                this.userRole = UserRole.GOLD;
            }else if(point >= 500){
                this.userRole = UserRole.SILVER;
            }else {
                this.userRole = UserRole.BRONZE;
            }
        }

    }
}
