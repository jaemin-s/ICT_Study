package com.example.todo.exception;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class NoRegisteredArgumentsException extends RuntimeException{

    public NoRegisteredArgumentsException(String message) {
        super(message);
    }
}
