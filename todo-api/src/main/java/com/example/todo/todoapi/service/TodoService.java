package com.example.todo.todoapi.service;

import com.example.todo.todoapi.dto.request.TodoCreateRequestDTO;
import com.example.todo.todoapi.dto.request.TodoModifyRequestDTO;
import com.example.todo.todoapi.dto.response.TodoDetailResponseDTO;
import com.example.todo.todoapi.dto.response.TodoListResponseDTO;
import com.example.todo.todoapi.entity.Todo;
import com.example.todo.todoapi.repository.TodoRepository;
import com.example.todo.userapi.entity.User;
import com.example.todo.userapi.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class TodoService {

    private final TodoRepository todoRepository;

    private final UserRepository userRepository;

    //목록 조회
    public TodoListResponseDTO retrieve(String userId) {

        User user = getUser(userId);

        List<Todo> entityList = todoRepository.findAllByUser(user);

        List<TodoDetailResponseDTO> dtoList = entityList.stream()
//                .map(todo -> new TodoDetailResponseDTO(todo))
                .map(TodoDetailResponseDTO::new)
                .collect(Collectors.toList());

        return TodoListResponseDTO.builder().todos(dtoList).build();
    }

    private User getUser(String userId) {
        User user = userRepository.findById(userId).orElseThrow(
                () -> new RuntimeException("회원 정보가 없습니다.")
        );
        return user;
    }

    //삭제
    public TodoListResponseDTO delete(final String todoId, String userId) {
        try {
            todoRepository.deleteById(todoId);
        } catch (Exception e) {
            log.error("id가 존재하지 않아 삭제에 실패했습니다 - ID : {}, err: {}", todoId, e.getMessage());
            throw new RuntimeException("id가 존재하지 않아 삭제에 실패했습니다");
        }
        return retrieve(userId);
    }

    //생성
    public TodoListResponseDTO insert(final TodoCreateRequestDTO dto, final String userId)
            throws RuntimeException{
        Todo todo = dto.toEntity(getUser(userId));
        todoRepository.save(todo);
        return retrieve(userId);
    }

    public TodoListResponseDTO update(final TodoModifyRequestDTO dto, String userId) {
        Todo todo = todoRepository.findById(dto.getId()).orElseThrow();
        todo.setDone(dto.isDone());
        todoRepository.save(todo);
        return retrieve(userId);
    }
}
