import time as t
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup

options = webdriver.ChromeOptions()
options.add_experimental_option('detach',True)

service = webdriver.ChromeService(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service ,options=options)

driver.get('https://www.aladin.co.kr/')

t.sleep(2)
btn_best_seller = driver.find_element(By.XPATH,'//*[@id="Wa_header1_headerTop"]/div[2]/div[3]/ul[1]/li[3]/a')
btn_best_seller.click()
t.sleep(2)

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

first_list = soup.find_all('div',class_='ss_book_box')[0]
first_book = first_list.find_all('li')

# text는 태그를 제외한 사용자가 실제로 브라우저에서 확인 가능한
# 텍스트만을 추출하여 문자열 형태로 반환합니다.

book_title = first_book[1].text
book_author = first_book[2].text.split('| ')
book_price = first_book[3].text.split(',')

print('제목:',book_title)
print('저자:',book_author[0])
print('출판사:',book_author[1])
print('출판일:',book_author[2])
print('가격:',book_price[0])
