package com.finalProject.stockbeginner.user.dto.response;

import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MbtiUserResponseDTO {

    private long count;
    private String mbti;


}
