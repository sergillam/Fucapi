
#include "hash.h"
#include "hash.cpp"

int main(){
    int tam;
    //cout << "Qual o Tamanho da tabela? ";
    //cin >> tam;
    tam = 150;
    
    hash h(tam);
    int op=-1;
    
   do{
      switch (op){
         case 1:
            h.inserir(leitura());
            break;
         case 2: 
            h.pesquisa(leituraNome());
            break;
         case 3:
            h.remover(leituraNome());  
            break;
         case 4:
            h.imprimirAll(tam);            
            break;
         case 5:
            h.imprimirCodigo( leituraCodigo() );            
            break;
         case 6:
            h.totalElementos(tam);
            break;
      }
      
      std::cout << "0-sair\n" << "1-Inserir\n" << "2-Pesquisar\n" << "3-Remover\n" << "4-Imprimir todos os elementos\n" 
           << "5-Imprimir os elementos com o codigo informado\n" << "6-Total de elementos na tabela\n";
      std::cin >> op; 
        
   }while(op!=0);
    
    
    return 0;
}