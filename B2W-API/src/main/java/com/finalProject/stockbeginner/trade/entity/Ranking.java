package com.finalProject.stockbeginner.trade.entity;

import lombok.*;
import javax.persistence.*;

@Getter
@ToString
@EqualsAndHashCode(of = "email")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity

@Table(name = "ranking")
public class Ranking {


    @Column(nullable = false)
    private Long profit;

    @Column(nullable = false)
    private String userNick;

    @Id
    @Column(name = "email", nullable = false)
    private String email;

}
