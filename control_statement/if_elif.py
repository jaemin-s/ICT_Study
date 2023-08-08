age = int(input('나이: '))

if age >= 20:
    print('성인입니다.')
elif age >= 17:
    print('고등학생입니다.')
elif age >= 14:
    print('중학생입니다.')
elif age >= 8:
    print('초등학생입니다.')
else:
    print('미취학 아동입니다.')

'''
* 중첩 if문
중첩 if문은 if블록 내부에 새로운 if문이
있는 형태입니다.
첫 번째 조건식의 결과가 True일 경우 한번 더 조건을 설정할 때
사용합니다.
'''
height = float(input('키를 입력하세요: '))

if height >= 140:
    age = int(input('나이를 입력하세요: '))
    if age >= 8:
        print('놀이기구 탑승이 가능합니다.')
    else:
        print('나이가 8세 미만입니다.')
        print('놀이기구 탑승이 불가합니다.')
else:
    print('키가 140 미만입니다.')
    print('놀이기구 탑승이 불가합니다.')