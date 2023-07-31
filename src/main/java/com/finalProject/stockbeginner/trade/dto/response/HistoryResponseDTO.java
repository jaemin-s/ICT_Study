package com.finalProject.stockbeginner.trade.dto.response;

import com.finalProject.stockbeginner.trade.entity.TradeHistory;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HistoryResponseDTO {
    private String userName;
    private String email;
    private String stockName;
    private long price;
    private long quantity;
    private String tradeType;
    private LocalDateTime tradeDate;

    public HistoryResponseDTO(TradeHistory tradeHistory) {
        this.userName = tradeHistory.getUser().getName();
        this.email = tradeHistory.getUser().getEmail();
        this.stockName = tradeHistory.getStockName();
        this.price = tradeHistory.getPrice();
        this.quantity = tradeHistory.getQuantity();
        this.tradeType = tradeHistory.getTradeType();
        this.tradeDate = tradeHistory.getTradeDate();

    }
}
