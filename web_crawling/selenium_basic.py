# 셀레늄: 웹 자동화 및 웹의 소스코드를 수집하는 모듈
# cmd -> pip install selenium (셀레늄 라이브러리 다운로드)
# 셀레늄 임포트
import time as t
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
# XPath 등을 통해 요소를 지목하기 위한 클래스
from selenium.webdriver.common.by import By

options = webdriver.ChromeOptions()
options.add_experimental_option('detach',True)

# 이전 버전에서는 크롬 드라이버를 별도로 설치했어야 하지만
# 자동으로 설치해주는 패키지를 이용할 수 있습니다.
service = webdriver.ChromeService(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service ,options=options)

# 물리 드라이버로 사이트 이동 명령
driver.get('https://naver.com/')

t.sleep(1.5)

# 자동으로 버튼이나 링크 클릭 제어하기
# XPath -> XML Path Language
# -> 문서의 특정 요소나 속성에 접근하기 위한 경로를 지정하는 언어.
# -> 요소를 중복없이 정확하게 표현하기 쉬운 언어.

login_btn = driver.find_element(By.XPATH,'//*[@id="account"]/div/a')
login_btn.click()

t.sleep(1)

# 자동으로 텍스트를 입력하기
id_input = driver.find_element(By.XPATH,'//*[@id="id"]')
id_input.send_keys('jaemin4033')
t.sleep(1)
pw_input = driver.find_element(By.XPATH,'//*[@id="pw"]')
pw_input.send_keys('!qqwq3434')
t.sleep(1)
driver.find_element(By.XPATH,'//*[@id="log.login"]').click()