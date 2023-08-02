package com.finalProject.stockbeginner.user.dto.response;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CntProfitByAgesResponseDTO {

    private Long count;
    private Long profit;
    private String Ages;

    public CntProfitByAgesResponseDTO(CntProfitByAgesDTO dto){
        this.count = dto.getCount();
        this.profit = dto.getProfit();
        this.Ages = dto.getAges();
    }
}
