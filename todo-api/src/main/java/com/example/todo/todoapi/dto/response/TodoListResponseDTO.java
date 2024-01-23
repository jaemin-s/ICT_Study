package com.example.todo.todoapi.dto.response;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
@Getter @Setter
public class TodoListResponseDTO {

    private String error;
    private List<TodoDetailResponseDTO> todos;

}
