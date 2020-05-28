import requests
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

tentativas = 0
maxTentativas = 15
tempoEspera = 3

while(tentativas < maxTentativas):
    tentativas+=1
    try:
        with requests.Session() as c:
            print("post" , tentativas)
            c.post('http://192.168.0.131:3008/')
            print("get")
            r = c.get('http://192.168.0.131:3008/')
            print(r.status_code)
    except:
        print("Exception ... ")
        print("Problema de Conexão")
        time.sleep(tempoEspera)
    else:
        if(r.status_code == 200):
            print("Conexão Tomcat")
            break
if(tentativas < maxTentativas):
    navegador = False
    try:
        print("Abrindo Chrome ! ")
        browser = webdriver.Chrome()
        navegador = True
    except:
        try:
            print("Abrindo FireFox ! ")
            browser = webdriver.Firefox()
            navegador = True
        except:
            try:
                print("Abrindo Safari ! ")
                browser = webdriver.Safari()
                navegador = True
            except:
                try:
                    print("Abrindo o Edge")
                    browser = webdriver.Edge()
                    navegador = True
                except:
                    try:
                        print("Abrindo o IE")
                        browser = webdriver.Ie()
                        navegador = True
                    except:
                        print("Nenhum Navegador Serviu")
                        navegador = False

    while navegador == True:
        try:
            print("Solicitando SCADABR")
            browser.get("http://192.168.0.131:3008/ScadaBR/login.htm")
            time.sleep(5)
            username = browser.find_element_by_id("username")
            password = browser.find_element_by_id("password")
            username.send_keys("admin")
            password.send_keys("admin")
            login_attempt = browser.find_element_by_xpath("//*[@type='submit']")
            login_attempt.submit()
            break
        except:
            print("Erro ao fazer login no SCADA")
            time.sleep(tempoEspera)
else:
    print(tentativas , 'Chegou na quantidade de tentativas maximas')
