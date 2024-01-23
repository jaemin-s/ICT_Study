package com.example.todo.userapi.dto.request;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Builder
@EqualsAndHashCode(of = "email")
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LoginRequestDTO {

    @NotBlank
    @Email
    private String email;

    @NotBlank
    private String password;
}
