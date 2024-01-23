package com.example.todo.userapi.dto.request;

import com.example.todo.userapi.entity.User;
import lombok.*;

import javax.sound.sampled.Mixer;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter @Setter
@Builder
@EqualsAndHashCode(of = "email")
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserRequestSignUpDTO {

    @NotBlank
    @Email
    private String email;

    @NotBlank
    @Size(min = 8, max = 20)
    private String password;

    @NotBlank
    @Size(min = 2, max = 8)
    private String userName;

    public User toEntity() {
        return User.builder().email(this.email).password(this.password).userName(this.userName).build();
    }


}
