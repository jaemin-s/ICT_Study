package com.finalProject.stockbeginner.user.dto.response;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CntByAgesResponseDTO {

    private String ages;
    private Long count;

    public CntByAgesResponseDTO(CntByAgesDTO dto){
        this.ages = dto.getAges();
        this.count = dto.getCount();
    }

}
