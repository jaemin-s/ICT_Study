package com.example.todo.auth;

import com.example.todo.userapi.entity.Role;
import com.example.todo.userapi.entity.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class TokenProvider{

    @Value("${jwt.secret}")
    private String SECRET_KEY;
    
    /**
    *  JSON Web Token을 생성하는 메서드
    *  @param userEntity - 토큰의 내용(클레임)에 포함될 유저 정보
    *  @return
    * */
    public String createToken(User userEntity) {
        /*
            {
                "iss": "서비스이름",
                "exp": "2023-07-23",
                "iat": "2023-06-23",
                "email": "로그인한 사람 이메일",
                "role": "Premium"
            }
        */
        Map<String, Object> claims = new HashMap<>();
        claims.put("email", userEntity.getEmail());
        claims.put("role", userEntity.getRole().toString());
        
        
        Date expiry = Date.from(Instant.now().plus(1, ChronoUnit.DAYS));
        return Jwts.builder().signWith(
                Keys.hmacShaKeyFor(SECRET_KEY.getBytes()),
                SignatureAlgorithm.HS512
        ).setClaims(claims)
        .setIssuer("딸기겅듀")
        .setIssuedAt(new Date())
        .setExpiration(expiry)
        .setSubject(userEntity.getId())
        .compact();
    }

    /**
     *
     * @param token
     * @return
     */
    public TokenUserInfo validateAndGetTokenUserInfo(String token){
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(Keys.hmacShaKeyFor(SECRET_KEY.getBytes()))
                .build() // 서명 위조 검사, 위조 되지 않은 경우 페이로드를 리턴
                .parseClaimsJws(token)
                .getBody();

        log.info("claims : {}",claims);
        return TokenUserInfo.builder()
                .userId(claims.getSubject())
                .email(claims.get("email",String.class))
                .role(Role.valueOf(claims.get("role",String.class)))
                .build();
    }
}
