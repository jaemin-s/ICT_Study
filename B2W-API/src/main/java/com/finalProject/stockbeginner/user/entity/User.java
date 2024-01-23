package com.finalProject.stockbeginner.user.entity;

import com.finalProject.stockbeginner.user.dto.request.KakaoRegisterRequestDTO;
import com.finalProject.stockbeginner.user.dto.request.UserDTO;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.UniqueElements;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.HashMap;

@Getter
@Setter
@ToString @EqualsAndHashCode(of = "id")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "stock_user")
public class User  {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(name = "kakao_id")
    private long kakaoId;

    @Column(name = "user_email", unique = true, nullable = false)
    private String email;


    @Column(name = "user_pw", nullable = false)
    private String password;

    @Column(name = "user_name", nullable = false)
    private String name;

    @Column(nullable = false)
    private String nick;

    @Builder.Default
    private Long money = 5000000L;

    @Builder.Default
    private Long gradePoint = 0L;

    @CreationTimestamp
    private LocalDateTime regDate;


    private String phoneNumber;

    private String gender;

    private Integer age;


    private String career;

    private String image;

    private String mbti;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    private UserRole userRole = UserRole.BRONZE;

    public User(UserDTO dto){
        this.id = dto.getId();
        this.kakaoId = dto.getKakaoId();
        this.email = dto.getEmail();
        this.password = dto.getPassword();
        this.name = dto.getName();
        this.nick = dto.getNick();
        this.money = dto.getMoney();
        this.gradePoint = dto.getGradePoint();
        this.regDate = dto.getRegDate();
        this.phoneNumber = dto.getPhoneNumber();
        this.gender = dto.getGender();
        this.age = dto.getAge();
        this.career = dto.getCareer();
        this.image = dto.getImage();
        this.mbti = dto.getMbti();
        this.userRole = dto.getUserRole();
    }

}
