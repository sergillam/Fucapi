#include <iostream>
#include <stdlib.h>
#include "arvore_avl.cpp"

using namespace std;
void menu(void);

int main()
{
	system("cls");
    arvore_avl doida;
    int OP, conteudo;
	NO *resultado_busca;
	
    menu();
    cout <<endl<<"Escolha um numero: ";
    cin >> OP;
    while(OP != 0){
        switch(OP){
        case 1:
			system("cls");
            cout<< "Inserir" <<endl;
            cin >> conteudo;
            system("cls");
            doida.insere_no(conteudo);
            break;

        case 4:
			system("cls");
			cout<< "Imprimi em ordem" <<endl;
            doida.imprime();
            break;
				
		case 5:
			system("cls");
			cout<< "Altura da arvore eh "<< doida.altura() <<endl;
        	break;
        
        case 3:
        	system("cls");
        	cout<< "Buscar NO da arvore"<< endl;
        	cin>> conteudo;
        	resultado_busca = doida.busca(conteudo);
        	
        	system("cls");
        	if(resultado_busca != NULL)
        		cout<< "NO encontrado: valor= "<<resultado_busca->valor<< " fb = "<< resultado_busca->fb << endl;
        	else cout<< "Valor nao encontrado!"<< endl;
			break;
			
		case 2:
			system("cls");
			cout<< "Remove NO da arvore"<< endl;
			cin>> conteudo;
			doida.remove(conteudo);
			break;	
			
		default:
			system("cls");
			cout<< "Escolha Invalida!"<< endl;
            
		}
		menu();
		cout <<"?";
		cin >> OP;
	}
	system("cls");
	return 0;
}

void menu(void){
  
   cout  <<endl<<"[1}==> Inserir na Arvore,"<< endl
    	 <<"[2]==> Remover No"<<	endl
		 <<"[3]==> Buscar No"<<	endl
		 <<"[4]==> Imprimir em Ordem"<< endl
		 <<"[5]==> Altura da Arvore"<<	endl
         <<"[0]==> Sair." << endl;
}

