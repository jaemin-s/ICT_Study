import time as t
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
from datetime import datetime
import codecs
d = datetime.today()

file_path = f'c:/Work/교보 온라인 베스트셀러 1~50위_{d.year}_{d.month}_{d.day}.html'

with codecs.open(file_path,mode='w',encoding='utf-8') as f:
    options = webdriver.ChromeOptions()
    options.add_experimental_option('detach',True)

    service = webdriver.ChromeService(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service ,options=options)

    driver.get('https://www.kyobobook.co.kr/')

    t.sleep(2)
    btn_best_seller = driver.find_element(By.XPATH,'//*[@id="welcome_header_wrap"]/div[3]/nav/ul[1]/li[3]/a')
    btn_best_seller.click()
    t.sleep(2)
    f.write('<oi>')
    for n in range(2,5):
        src = driver.page_source

        soup = BeautifulSoup(src, 'html.parser')
        div_list = soup.find_all('li',class_='prod_item')
        for item in div_list:
            f.write('<li style="display:flex"}>')
            f.write('<div>')
            f.write(f'{item.find("a",class_="prod_link")}')
            f.write('</div>')
            f.write('<div>')
            f.write(f'<div>순위: {item.find("div",class_="prod_rank").text}위 </div>\n')
            f.write(f'<div>책 제목: {item.find("span",class_="prod_name").text} </div>\n')
            f.write(f'<div>저자: {item.find("span",class_="prod_author").text.split("· ")[0]} </div>\n')
            f.write(f'<div>출판사: {item.find("span",class_="prod_author").text.split("· ")[1]} </div>\n')
            f.write(f'<div>출판일: {item.find("span",class_="prod_author").text.split("· ")[2]} </div>\n')
            f.write(f'<div>가격: {item.find("div",class_="prod_price").text.split("|")[0]} </div>\n')
            f.write('</div>')
            f.write('</li>')
        driver.find_element(By.XPATH,f'//*[@id="tabRoot"]/div[2]/div[1]/div/a[{n}]').click()
        t.sleep(2)
    f.write('</oi>')