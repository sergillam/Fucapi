# -*- coding: utf-8 -*-
import random
import math

class RSA:
    '''
        Construtor da classe delimita o intervalo possivél das geração das chaves públicas e prívadas
    '''
    def __init__(self):
        self.limInferior = 2
        self.limSuperior = 8192
    '''
        Realiza o sorteo de um número natural dentro do intervalo definido
    '''
    def gerarPrimo(self , limInf , limSup):
        primo = random.randint(limInf , limSup)
        while not self.verificaPrimo(primo):
            primo = random.randint(limInf, limSup)
        return primo
    '''
        Percorre de 2 até a raiz quadrada do número sorteado verificando se ele é divisivel por algum número dentro 
        desse intervalo caso o numero seja divivel retorna falso dizendo que o número não é primo se nenhum dos número
        dentro do intervalo dividir o número ele é considerado número primo .
    '''
    def verificaPrimo(self,primo):
        primoRaiz = int(math.sqrt(primo))
        for i in range(2,primoRaiz):
            if primo%i == 0:
                return False
        return True
    '''
       Realiza o Sorteio de um numero de 1 até 'phi -1' e 
       Verifica se os números não possuem dividor em comum exceto( '1' )
    '''
    def primoRelativo(self,phi):
        x = 0
        mdc = 0
        while mdc != 1:
            x = random.randint(1, phi - 1)
            #x = self.gerarPrimo(1, phi - 1)
            mdc = self.euclides(x, phi)
        return x
    '''
        Algoritmo de Euclides encontra de maneira simples e eficiente o MDC entre 2 número inteiros diferentes de 0
    '''
    def euclides(self,a, b):
        while b != 0:
            a, b = b, a % b
        return a
    '''
       É uma extensão do algoritmo de Euclides , além de calcular o MDC entre 2 numero inteiros fornece coeficientes. 
    '''
    def extendidoEuclides(self,a, b):
        if b == 0:
            return (a, 1, 0)
        d1, x1, y1 = self.extendidoEuclides(b, a % b)
        d, x, y = d1, y1, x1 - (a // b) * y1
        return d, x, y
    '''
        Troca o caracter pelo seu valor inteiro (relativo a tabela ASC)
        Retornando a frase dividida por caracteres salvando seu valor correspondente da tabela ASC
    '''
    def inteiro(self,msg):
        saida = []
        for i in range(len(msg)):
            saida.append(ord(msg[i]))
        return (saida)
    '''
        Transformar o valor do caracter(relativo a tabela ASC)
        Utilizando o processo matemático de potenciação modular
        Retorna o vetor com os valores criptografados
    '''

    def criptografar(self,msg, chavePublica, n):
        msgCrip = []
        for i in msg:
            msgCrip.append(pow(i, chavePublica, n))
        return msgCrip

    '''
        Com base nos valores da tabela ASC transforma o valor correspondente na tabela pelo caracter 
        Forma a mensagem e retorna a mesma
    '''
    def string(self , msg):
        saida = ""
        for i in msg:
            saida += (chr(i))
        return saida

    '''
        Pega o Vetor de inteiro criptografado , realiza o processo de descriptografia dos valores  e chama a função 
        string para que seja realizado a montagem da mensagem.
    '''
    def descriptografar(self,msg, chavePrivada, n):
        msgDes = []

        for i in range(len(msg)):
            msgDes.append(pow(msg[i], chavePrivada, n))
        return self.string(msgDes)
    '''
        Realiza o processo do algoritmo do RSA.
        
    '''
    def rsa(self):
        p, q = self.gerarPrimo(self.limInferior , self.limSuperior), self.gerarPrimo(self.limInferior , self.limSuperior)
        n = p * q
        phi = (p - 1) * (q - 1) #Função Totiente
        e = self.primoRelativo(phi)
        x, d, y = self.extendidoEuclides(e, phi)
        while d < 0:
            x, d, y = self.extendidoEuclides(e, phi)
            if (d < 0):
                p, q = self.gerarPrimo(self.limInferior , self.limSuperior), self.gerarPrimo(self.limInferior , self.limSuperior)
                n = p * q
                phi = (p - 1) * (q - 1)
                e = self.primoRelativo(phi)
        chavePublica = e
        chavePrivada = d

        return chavePublica, chavePrivada, n  # publicas , secretas
    '''
        Inicializa  o processo do algoritmo
    '''
    def main(self):
        text = input("Informe a mensagem: ")
        msg = self.inteiro(text)

        chavePublica, chavePrivada, n = self.rsa()
        print("Chave public: ", chavePublica, "Chave private: ", chavePrivada, "N:", n)

        msgCriptografada = self.criptografar(msg, chavePublica, n)
        #print("Mensagem Cripografada  ",msgCriptografada)

        msgDescriptografada = self.descriptografar(msgCriptografada, chavePrivada, n)
        print("saida: ", msgDescriptografada)

r = RSA()

r.main()




