'''
* 리스트 내부 요소 삭제

1. remove(): 삭제할 값을 직접 지정하여 삭제
2. 내장함수 del(): 삭제할 요소의 인덱스를 통해 삭제합니다.
3. clear(): 리스트 내부 요소 전체 삭제
'''

points = [55,66,77,88,99]

points.remove(66)
print(points)

del(points[3])
print(points)

points.clear()
print(points)