def lerArquivo():
    arquivo = open("produto_vendas_visitas.txt","r") ## abre o arquivo em modo de leitura

    linha = arquivo.readline() ##faz a leitura da linha do arquivo txt
   
    if(linha == "" ): ##Caso o arquivo esteja vazio o programa é abortado
        print("Erro ao abrir o arquivo") ## exibe mensagem de erro 
        exit() ## aborta o programa

    dadosProduto = (0,0,0,"0") ## cria uma mascara de tupla (relevancia,quantidade de vendas , quantidade de visitas , id Produto)
    lista = [dadosProduto] ## inseri a mascara da tupla para iniciar a lista
    lista.pop() ## remove a inicialização da lista
    
    while (linha != ""): ## Percorre o arquivo até ele ser vazio
        idProduto , qtdVendas , qtdVisitas =  linha.split(";") ## Separa a leitura por ; e atribiu as variaveis
        relevancia = 2*(int(qtdVendas)) + (int(qtdVisitas)) ## Realiza o Calculo da relevância
        dadosProduto = (relevancia,qtdVendas,qtdVisitas,idProduto) ## inseri os valores na tupla
       
        if(not procuraElementoRepetido(lista,dadosProduto)): ## verifica se o elemento é repetido se for não inseri na lista
            lista.insert(1,dadosProduto) ## inseri na lista a tupla caso ela o parametro de idProduto não exista

        linha = arquivo.readline() ##faz a leitura da linha do arquivo txt

    arquivo.close() ##fecha o arquivo
    lista.sort() ## ordena a lista de maneira crescente , usando a relevancia como parametro.
    lista.reverse() ## inverte a lista para ficar do jeito que eu preciso e facilitar o armazenamento no txt de saida

    return lista ##retorna um list 

def procuraElementoRepetido(myLista,myDadosProduto):
    cont = 0 ## armazena a posicao onde tá o elemento repetido

    for it in myLista:    
        if (myDadosProduto[3] == it[3]): ## se o idProduto for igual atualiza os dados 
            auxQtdVendas = int(myDadosProduto[1]) +  int(it[1])
            auxQtdVisitas = int(myDadosProduto[2]) +  int(it[2])
            auxRelevancia = 2*(int(auxQtdVendas)) + (int(auxQtdVisitas))
            myDadosProduto = (auxRelevancia,auxQtdVendas,auxQtdVisitas,myDadosProduto[3])
            myLista[cont] = myDadosProduto
            return True ##retorna verdadeiro caso tenha elemento repetido
        cont = cont + 1    
    return False ##retorna falso caso tenha percorrido toda a lista e não tenha encontrado o elemento

def criarArquivo():
    arquivo = open ("produtos_ordenados.txt" , "w") ## cria arquivo
    arquivo.close() ##fecha Arquivo

def escreverArquivo(myListaFinal):
    criarArquivo()
    arquivo = open ("produtos_ordenados.txt" , "a") ## Abre para modo de escrita
    for it in myListaFinal: ## Percorre Arquivos e vai salvando no txt
        arquivo.write("ID-" + it[3] + ";" + str(it[0]) + "\n") ##Formatando a Saida do arquivo
    arquivo.close() ##fecha Arquivo

listaFinal = lerArquivo()
escreverArquivo(listaFinal)