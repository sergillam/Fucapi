#ifndef HASH_H
#define HASH_H

#include<bits/stdc++.h>

using namespace std;

class aluno{
    public:
        int idade;
        int matricula;
        string nome;
        int codigo;
};

class noHash{
    private:
        list<aluno> elemento;
    
    public:  
       
       int qtdElementos(); 
        
       void inserir(aluno aluno1);
       void remover(aluno aluno1);
       void imprimir();
       
       bool pesquisa(aluno aluno1);
               
       friend class hash;
};

class hash {
    private:
        noHash *itens;
    public:
       hash(int tam);
       
       void inserir(aluno aluno1);
       void remover(aluno aluno1);
       void imprimirAll(int tam);  
       void imprimirCodigo(int codigo);
            
       void totalElementos(int tam);
       
       int geraIndice(aluno aluno1); 
       
       bool pesquisa (aluno aluno1);    
};

// Funções auxiliares
aluno leitura();
int leituraCodigo();
aluno leituraNome();

#endif