package com.spring.jpa.chap05_practice.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.jpa.chap05_practice.entity.HashTag;
import com.spring.jpa.chap05_practice.entity.Post;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Getter @Setter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class PostDetailResponseDTO {

    private String author;
    private String title;
    private String content;
    private List<String> hashTags;
    @JsonFormat(pattern = "yyyy/MM/dd")
    private LocalDateTime regDate;

    public  PostDetailResponseDTO(Post post){
        this.author = post.getWriter();
        this.title = post.getTitle();
        this.content = post.getContent();
        this.regDate = post.getCreateDate();
        this.hashTags = post.getHashTags().stream()
                .map(HashTag::getTagName).collect(Collectors.toList());
    }
}


