package com.spring.jpa.chap05_practice.dto;

import lombok.*;

import java.util.List;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class PostListResponseDTO {

    private int count;
    private PageResponseDTO pageInfo;
    private List<PostDetailResponseDTO> posts;

}
