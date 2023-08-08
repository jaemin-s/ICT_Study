'''
* 리스트의 탐색과 정렬

1. index(): 리스트에서 특정 값이 저장된 인덱스를 반환.
2. count(): 리스트 내부에 저장된 특정 요소의 개수를 반환.
3. sort(): 리스트를 오름차 정렬.
4. reverse(): 리스트 데이터를 역순으로 배치
'''

points = [99,88,77,66,33,55,44,22,88,66,44]

print(points.count(44))

print(points.index(55))

# 내장함수 len(), max(), min()
print(f'max: {max(points)}')
print(f'min: {min(points)}')

# 오름차 정렬 sort()
points.sort(reverse=True)
# points.reverse()
print(points)

# 리스트 내의 요소의 단순 존재 유무를 검사하려면 in 키워드를 사용합니다.
food_menu = ['김밥', '닭강정', '라면', '김말이']
name = input('음식명을 입력하세요:')

if name in food_menu:
    print(f'{name} 음식이 주문되었습니다.')
else:
    print(f'{name}은(는) 없는 음식입니다.')