'''
* 사전 (Dictionary)

- 사전은 키(key)와 값(value)의 쌍을 저장하는 대용량의 자료구조.
- 사전은 타 언어에서는 Map이라고도 부르며 연관배열이라고도 부릅니다.
- 사전을 정의하는 기호는 {}이고, 괄호 안에 데이터를 
key : value 형태로 나열하여 저장합니다.
'''

students = {'멍멍이':'김철수','야옹이':'박영희','짹짹이':'이홍기'}
print(type(students))
print(len(students))

'''
- 사전에 사용되는 key값은 중복값을 가질 수 없고, 변경도 안됩니다.
- 반면에 value값은 중복을 허용하고, 데이터를 자유롭게 편집할 수도
있습니다.
- 사전 내부에 저장된 데이터를 검색할 때는 인덱스 대신
key를 사용합니다. (시퀀스 자료형이 아닙니다.)
'''

print(students['멍멍이'])
# in 키워드를 사용하여 key의 존재 유무를 파악할 수 있다
print('메뚜기' in students)

'''
* 사전 내부 데이터 관리

- 사전은 변경 가능한 자료형이어서 실행 중에 데이터의
추가, 삭제, 수정 등의 편집을 자유롭게 진행할 수 있습니다.
'''

# 데이터 추가하기 (append처럼 동작)
# 사전 내부에 존재하지 않는 키(key)를 사용하여 데이터를 대입하면
# 데이터가 key:value 쌍으로 사전에 저장됩니다.
eng_kor = {'students':'학생','apple':'사과'}
eng_kor['banana'] = '바나나' # 없는 키를 이용한 대입
print(eng_kor)

'''
* 사전에 데이터를 수정하기
- 사전 내부에 이미 존재하는 key를 사용하여 새로운 데이터를
대입하면 해당 key값에 매핑 되어있는 value가 수정됩니다.
'''

eng_kor['apple'] = '애플'
print(eng_kor)

'''
- 사전의 key 목록과 value 목록을 따로따로 추출하고 싶다면
 사전의 메서드 keys(), values()를 사용합니다.
'''

print(eng_kor.keys())
print(eng_kor.values())

# 사전의 반복분 처리
# for ~ in 뒤에 사전 데이터를 적으면 key만 반복 순회합니다.
for k in eng_kor:
    print(f'{k}:{eng_kor[k]}')

    '''
* 사전의 데이터 삭제 (내장함수 del을 사용)
del(사전이름[key])
key를 전달하면 같이 맵핑된 value도 함께 삭제됩니다.
'''

del(eng_kor['students'])
print(eng_kor)

# 빈 사전 만들기
d = {}
d2 = dict()