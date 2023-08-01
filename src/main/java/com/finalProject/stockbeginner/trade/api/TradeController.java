package com.finalProject.stockbeginner.trade.api;

import com.finalProject.stockbeginner.trade.dto.request.TradeRequestDTO;
import com.finalProject.stockbeginner.trade.dto.response.HistoryResponseDTO;
import com.finalProject.stockbeginner.trade.dto.response.RankResponseDTO;
import com.finalProject.stockbeginner.trade.entity.TradeHistory;
import com.finalProject.stockbeginner.trade.service.TradeService;
import com.finalProject.stockbeginner.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/trade")
public class TradeController {

    private final TradeService tradeService;

    //매수 요청
    @PostMapping("/buy")
    public ResponseEntity<?> buying(@RequestBody TradeRequestDTO requestDTO){
        try {
            String result = tradeService.buyStock(requestDTO);
            return ResponseEntity.ok().body(result);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    //매도 요청
    @PostMapping("/sell")
    public ResponseEntity<?> selling(@RequestBody TradeRequestDTO requestDTO){
        try {
            String result = tradeService.sellStock(requestDTO);
            return ResponseEntity.ok().body(result);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    //구매내역 불러오기
    @GetMapping("/history/{email}")
    public ResponseEntity<?> getHistory(@PathVariable String email){
        try {
            List<TradeHistory> histories = tradeService.getTradeHistory(email);
            //histories.sort(Collections.reverseOrder());
            return ResponseEntity.ok().body(histories);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }
    
    //전체 유저 거래내역 조회
    @GetMapping("/historyAll")
    public ResponseEntity<?> getAllHistory(Pageable pageable) {
        try {
            Page<HistoryResponseDTO> historyResponseDTOList = tradeService.getAllHistory(pageable);
            return ResponseEntity.ok().body(historyResponseDTOList);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    //전체 랭킹 조회
    @GetMapping("/rank")
    public ResponseEntity<?> getAllRank(){
        try {
            List<RankResponseDTO> rankResponseDTOList = tradeService.getAllRank();
            return ResponseEntity.ok().body(rankResponseDTOList);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    //내 랭킹 조회
    @GetMapping("/rank/{email}")
    public ResponseEntity<?> getOneRank(@PathVariable String email){
        try {
            List<RankResponseDTO> rankResponseDTOList = tradeService.getAllRank();
            Optional<RankResponseDTO> responseDTO = rankResponseDTOList.stream()
                    .filter(dto -> dto.getEmail().equals(email)).findFirst();
            return ResponseEntity.ok().body(responseDTO);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }

    @PutMapping("/ranking/reset")
    public ResponseEntity<?> resetRank(){
            try {
                tradeService.resetRanking();
                return ResponseEntity.ok().body("랭킹이 초기화 되었습니다.");
            } catch (Exception e) {
                return ResponseEntity.internalServerError().body("요청 실패");
            }
    }
}
