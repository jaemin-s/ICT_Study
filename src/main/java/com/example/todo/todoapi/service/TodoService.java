package com.example.todo.todoapi.service;

import com.example.todo.todoapi.dto.request.TodoCreateRequestDTO;
import com.example.todo.todoapi.dto.request.TodoModifyRequestDTO;
import com.example.todo.todoapi.dto.response.TodoDetailResponseDTO;
import com.example.todo.todoapi.dto.response.TodoListResponseDTO;
import com.example.todo.todoapi.entity.Todo;
import com.example.todo.todoapi.repository.TodoRepository;
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

    //목록 조회
    public TodoListResponseDTO retrieve() {
        List<Todo> entityList = todoRepository.findAll();
        log.info("findAll result : {}",entityList);
        List<TodoDetailResponseDTO> dtoList = entityList.stream()
                .map(todo -> new TodoDetailResponseDTO(todo)).collect(Collectors.toList());
        log.info("dtoList : {}",dtoList.toString());
        return TodoListResponseDTO.builder().todos(dtoList).build();
    }

    //삭제
    public TodoListResponseDTO delete(final String todoId) {
        try {
            todoRepository.deleteById(todoId);
        } catch (Exception e) {
            log.error("id가 존재하지 않아 삭제에 실패했습니다 - ID : {}, err: {}", todoId, e.getMessage());
            throw new RuntimeException("id가 존재하지 않아 삭제에 실패했습니다");
        }
        return retrieve();
    }

    //생성
    public TodoListResponseDTO insert(TodoCreateRequestDTO todo) {
        todoRepository.save(todo.toEntity());
        return retrieve();
    }

    public TodoListResponseDTO update(TodoModifyRequestDTO dto) {
        Todo todo = todoRepository.findById(dto.getId()).orElseThrow();
        todo.setDone(dto.isDone());
        todoRepository.save(todo);
        return retrieve();
    }
}
