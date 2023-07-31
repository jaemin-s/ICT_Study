package com.finalProject.stockbeginner.user.dto.response;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareerAvgResponseDTO {

    private String career;
    private double profit;
}
