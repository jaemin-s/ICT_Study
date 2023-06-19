package com.spring.jpa.chap05_practice.service;

import com.spring.jpa.chap05_practice.repository.HashTagRopository;
import com.spring.jpa.chap05_practice.repository.PostRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class PostService {

    private final PostRepository postRepository;
    private final HashTagRopository hashTagRopository;
}
