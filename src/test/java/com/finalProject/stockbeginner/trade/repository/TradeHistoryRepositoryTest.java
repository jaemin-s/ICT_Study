package com.finalProject.stockbeginner.trade.repository;

import com.finalProject.stockbeginner.trade.entity.TradeHistory;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
@Rollback(false)
class TradeHistoryRepositoryTest {
    @Autowired
    TradeHistoryRepository tradeHistoryRepository;

    @Test
    @DisplayName("dkdk")
    void tradeHistory() {
        //given

        //when
        List<TradeHistory> result = tradeHistoryRepository.findAll();
        //then
        System.out.println("result = " + result);
    }

    @Test
    @DisplayName("delete")
    void delete() {
        //given
        tradeHistoryRepository.deleteAll();
        //when

        //then
    }

}