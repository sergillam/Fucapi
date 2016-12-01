
#include "hash.h"

int noHash::qtdElementos(){
    return (int)elemento.size();
}

void noHash::inserir(aluno aluno1){
    elemento.push_back(aluno1);
}

void noHash::remover(aluno aluno1){
    list<aluno>::iterator it;
		aluno aux;

		   for (it = elemento.begin(); it!=elemento.end(); it++){
        aux = (aluno)*it;
             
        if( (aux.nome == aluno1.nome)  ){
				 elemento.erase(it);	
				 break;
				}
			}
}

void noHash::imprimir(){
	list<aluno>::iterator it;
	aluno aux;
	for (it = elemento.begin(); it!=elemento.end(); it++){
		aux = (aluno)*it;		
		cout << "Nome: " << aux.nome << endl;
		cout << "Idade: " << aux.idade << endl;
		cout << "Matricula: " << aux.matricula << endl;
        cout << "Codigo: " << aux.codigo << endl;
	}
}

bool noHash::pesquisa(aluno aluno1){ 
    aluno aux;
    list<aluno>::iterator it;
    
    for (it = elemento.begin(); it!=elemento.end(); it++){
        aux = (aluno)*it;
             
        if( (aux.nome == aluno1.nome) ) {
                return true;
        }
    }
            return false;
}
  


hash::hash(int tam){
    itens = new noHash[tam];
}
       
int hash::geraIndice(aluno aluno1){
    return (int)aluno1.nome.length()-1;
}
       
void hash::totalElementos(int tam){
  int tot=0;
	
	for (int i = 0 ; i < tam; i++){
			tot+=itens[i].qtdElementos();
	}
	cout << "Total de elementos na tabela: " << tot << endl;
}
     
void hash::inserir(aluno aluno1){
    int id = geraIndice(aluno1);
    cout << "Numero da chave: " << id << endl;
    if (!itens[id].pesquisa(aluno1)){
        cout << "Inserindo elemento" << endl;
        aluno1.codigo = id;
        itens[id].inserir(aluno1); 
    }
    else {
        cout << "Impossivel Inserir , pois o elemento já esta inserido " << endl;
    }
}
    
void hash::remover(aluno aluno1){
 int id = geraIndice(aluno1);

    if (itens[id].pesquisa(aluno1)){
        cout << "Removendo elemento" << endl;
        itens[id].remover(aluno1); 
    }
    else {
        cout << "Impossivel Remover , pois o elemento nao foi encontrado " << endl;
    }
}
    
bool hash::pesquisa (aluno aluno1){
    int id = geraIndice(aluno1);
    
    if (itens[id].pesquisa(aluno1)){
        cout << "elemento encontrado: " << endl;
            return true;
        }
    cout << "NAO EXISTE ESSE ELEMENTO: " << endl;
       return false;
}

void hash::imprimirAll(int tam){
	int i;	
	for (i = 0 ; i < tam; i++){
		itens[i].imprimir();
	}
}

void hash::imprimirCodigo(int codigo){
		itens[codigo].imprimir();
}

aluno leitura(){
    aluno a;
     cout << "Nome: ";
     cin >> a.nome;
     cout << "Idade: ";
     cin >> a.idade;
     cout << "Matricula(numero): ";
     cin >> a.matricula;      
     
     return a;
}

int leituraCodigo(){
  int cod;
  cout << "Codigo: ";
  cin >> cod;
  return cod;   
}

aluno leituraNome(){
     aluno a;
     cout << "Nome: ";
     cin >> a.nome;
     //a.idade=NULL;
    // a.matricula=NULL;
    return a;
}
