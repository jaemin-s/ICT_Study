package com.finalProject.stockbeginner.user.dto.response;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MbtiAvgResponseDTO {

    private String mbti;
    private double profit;
}
