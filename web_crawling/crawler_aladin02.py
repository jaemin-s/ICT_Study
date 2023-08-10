import time as t
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
from datetime import datetime
import codecs
d = datetime.today()

file_path = f'c:/Work/알라딘 베스트셀러 1~50위_{d.year}_{d.month}_{d.day}.txt'

'''
- with문을 사용하면 with 블록을 벗어나는 순간
객체가 자동으로 해제됩니다. (자바의 try with resource과 비슷)

- with 작성 시 사용할 객체의 이름을 as 뒤에 작성해 줍니다.
'''

'''
* 표준 모듈 codecs

- 웹이나 다른 프로그램의 텍스트 데이터와
파이썬 내부의 텍스트 데이터의 인코딩 방식이 서로 다를 경우에
내장함수 open()이 제대로 인코딩을 적용할 수 없어서
에러가 발생합니다. (UnicodeEncodeError)

- 파일 입/출력 시 인코딩 코덱을 변경하고 싶다면
codecs 모듈을 사용합니다.
'''

with codecs.open(file_path,mode='w',encoding='utf-8') as f:
    options = webdriver.ChromeOptions()
    options.add_experimental_option('detach',True)

    service = webdriver.ChromeService(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service ,options=options)

    driver.get('https://www.aladin.co.kr/')

    t.sleep(2)
    btn_best_seller = driver.find_element(By.XPATH,'//*[@id="Wa_header1_headerTop"]/div[2]/div[3]/ul[1]/li[3]/a')
    btn_best_seller.click()
    t.sleep(2)

    for index in range(3,10):
        src = driver.page_source
        # print(src)

        # 뷰티풀수프 객체 생성
        # 뷰티풀수프 객체를 생성하면서, 셀레니움이 가지고 온 html 소스코드를
        # 제공하고, 해당 소스코드를 html 문법으로 변환하라는 주문
        soup = BeautifulSoup(src, 'html.parser')

        '''
        - 뷰티풀수프를 사용하여 수집하고 싶은 데이터가 들어있는
        태그를 부분 추출할 수 있습니다.

        - find_all() 메서드는 인수값으로 추출하고자 하는 태그의
        이름을 적으면 해당 태그만 전부 추출하여 리스트에 담아 대입합니다.
        '''

        div_list = soup.find_all('div',class_='ss_book_box')
        for idx,item in enumerate(div_list,1):
            
            book_data = item.find_all('div',class_='ss_book_list')[0].find_all('li')

            # text는 태그를 제외한 사용자가 실제로 브라우저에서 확인 가능한
            # 텍스트만을 추출하여 문자열 형태로 반환합니다.

            if len(book_data) == 5:
                book_title = book_data[1].text
                book_author = book_data[2].text.split('|')
                book_price = book_data[3].text.split(', ')
            else:
                book_title = book_data[0].text
                book_author = book_data[1].text.split('|')
                book_price = book_data[2].text.split(', ')

            min_price = book_price[0]
            f.write(f'# 순위: {idx+(50*(index-3))}위 \n')
            f.write(f'# 제목: {book_title} \n')
            f.write(f'# 저자: {book_author[0]} \n')
            f.write(f'# 출판사: {book_author[1]} \n')
            f.write(f'# 출판일: {book_author[2]} \n')
            f.write('# 가격: ' +  book_price[0] + '\n')
            f.write('-' * 40 + '\n')
        t.sleep(5)
        driver.find_element(By.XPATH,f'//*[@id="newbg_body"]/div[3]/ul/li[{index}]/a').click()

    
