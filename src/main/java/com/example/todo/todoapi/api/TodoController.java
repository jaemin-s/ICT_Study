package com.example.todo.todoapi.api;

import com.example.todo.todoapi.dto.request.TodoCreateRequestDTO;
import com.example.todo.todoapi.dto.request.TodoModifyRequestDTO;
import com.example.todo.todoapi.entity.Todo;
import com.example.todo.todoapi.service.TodoService;
import com.example.todo.todoapi.dto.response.TodoListResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/todos")
@CrossOrigin(origins = "http://localhost:3000")
public class TodoController {

    private final TodoService todoService;

    //할 일 등록 요청
    @PostMapping
    public ResponseEntity<?> createTodo(@Validated @RequestBody TodoCreateRequestDTO dto, BindingResult result) {

        if(result.hasErrors()) {
            log.info("DTO 검증 에러 발생: {}", result.getFieldError());
            return ResponseEntity.badRequest().body(result.getFieldError());
        }

        try {
            TodoListResponseDTO responseDTO = todoService.insert(dto);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            log.error(e.getMessage());
            return ResponseEntity.internalServerError().body(TodoListResponseDTO.builder().error(e.getMessage()));
        }

    }

    //할 일 삭제 요청
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTodo(@PathVariable("id") String todoId) {
        log.info("/api/todos/{} DELETE request",todoId);

        if(todoId == null || todoId.trim().equals("")){
            return ResponseEntity.badRequest().body(TodoListResponseDTO.builder().error("ID를 전달해 주세요"));
        }

        try {
            TodoListResponseDTO responseDTO = todoService.delete(todoId);
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body(TodoListResponseDTO.builder().error(e.getMessage()));
        }
    }
    //할 일 목록 요청
    @GetMapping
    public ResponseEntity<?> retrieveTodoList() {
        return ResponseEntity.ok().body(todoService.retrieve());
    }

    //할 일 수정 요청
    @PatchMapping
    public ResponseEntity<?> updateTodo(@RequestBody TodoModifyRequestDTO dto) {
        try {
            return ResponseEntity.ok().body(todoService.update(dto));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(TodoListResponseDTO.builder().error(e.getMessage()));
        }
    }

}
