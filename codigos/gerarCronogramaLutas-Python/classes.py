class idade:
    
    nome = None
    tempoDeLuta = None
    qtdAtletas = None
    tempoTotal = None 

    def __init__(self,nome,tempoDeLuta,qtdAtletas):
        self.nome = nome
        self.tempoDeLuta = tempoDeLuta
        self.qtdAtletas = qtdAtletas
        if (qtdAtletas > 0):
            self.tempoTotal = (qtdAtletas-1)*tempoDeLuta
        else:
            self.tempoTotal = 0
    
    def imprimiInformacao(self):
        info = self.nome + (str)(self.tempoTotal)
        print(info)


    
