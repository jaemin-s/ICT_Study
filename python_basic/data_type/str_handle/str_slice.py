'''
* 문자열 슬라이싱

- 문자열 인덱싱이 단일 문자를 취할 때 사용했다면
슬라이싱은 문자열 내부의 데이터를 범위를 지정해서
부분 추출할 때 사용하는 방법입니다.

ex) 문자열데이터[begin:end:step]

- range함수처럼 시작 인덱스는 포함이지만,
끝 인덱스는 포함하지 않습니다. (미만)
'''


s = 'python'
print(s[2:5:1])
print(s[1:4]) # step 생략 시 1로 처리
print(s[3:]) # end 생략시 begin부터 끝까지
print(s[:4]) # begin 생략시 처음부터 end 미만까지

week = '월화수목금토일'
print(week[::2])
print(week[1:6:2])