package com.example.todo.todoapi.dto.request;

import com.example.todo.todoapi.entity.Todo;
import com.example.todo.userapi.entity.User;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TodoCreateRequestDTO {

    @NotBlank
    @Size(min = 2, max = 20)
    private String title;

    public Todo toEntity(User user) {
        return Todo.builder().title(this.title).user(user).build();
    }

    public Todo toEntity() {
        return Todo.builder().title(this.title).build();
    }

}
