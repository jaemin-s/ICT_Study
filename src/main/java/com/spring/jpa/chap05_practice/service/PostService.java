package com.spring.jpa.chap05_practice.service;

import com.spring.jpa.chap05_practice.dto.PageDTO;
import com.spring.jpa.chap05_practice.dto.PageResponseDTO;
import com.spring.jpa.chap05_practice.dto.PostDetailResponseDTO;
import com.spring.jpa.chap05_practice.dto.PostListResponseDTO;
import com.spring.jpa.chap05_practice.entity.Post;
import com.spring.jpa.chap05_practice.repository.HashTagRopository;
import com.spring.jpa.chap05_practice.repository.PostRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class PostService {

    private final PostRepository postRepository;
    private final HashTagRopository hashTagRopository;

    public PostListResponseDTO getPosts(PageDTO dto) {

        Pageable pageable = PageRequest.of(dto.getPage()-1,dto.getSize(),
                Sort.by("createDate").descending());

        Page<Post> posts = postRepository.findAll(pageable);

        // 게시물 정보만 꺼내기
        List<Post> postList = posts.getContent();

        List<PostDetailResponseDTO> detailList
                = postList.stream().map(post -> new PostDetailResponseDTO(post))
                .collect(Collectors.toList());

        PostListResponseDTO responseDTO = PostListResponseDTO.builder()
                .count(detailList.size()).pageInfo(new PageResponseDTO(posts)).posts(detailList).build();

        return responseDTO;
    }
}
