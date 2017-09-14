#include "arvore_avl.h"
#include <iostream>
#include <stdlib.h>

using namespace std;

arvore_avl::arvore_avl()
{
    raiz = 0;
    cout <<endl<< "\n\n\tArvore foi criada!" << endl;

}


void arvore_avl::insere_no(NO **pNO, int N){
    if(*pNO == 0){
        *pNO = (NO*)malloc(sizeof (NO));
        (*pNO)->esq = 0;
        (*pNO)->dir = 0;
        (*pNO)->valor = N;
        cout << N << " inserido!"<< endl;
        
    }else if(N < (*pNO)->valor)
        insere_no(&(*pNO)->esq, N);      
    else 
    	insere_no(&(*pNO)->dir, N);
  	
  	fator_balanceamento(*pNO);
  	*pNO = balanceia(*pNO);	
}


void arvore_avl::insere_no(int N){
    insere_no(&raiz, N);
}


void arvore_avl::imprime(NO * r){
    if(r != NULL){
        imprime(r->esq);
        fator_balanceamento(r);
        cout << r->valor<<" fb= "<< r->fb<< endl;
        imprime(r->dir);
    }
}


void arvore_avl::imprime(void){
    imprime(raiz);
}


int arvore_avl::maior(int a , int b){
	if(a> b) return a;
	else return b;
}


int arvore_avl::altura(NO * n){
	int he = 0, hd = 0;

	if(n == NULL)
		return -1;
	he = altura(n->esq);
	hd = altura(n->dir);
	
	return (1 + maior(he , hd));		
}


int arvore_avl::altura(void){
	return altura(raiz);
}


void arvore_avl::fator_balanceamento(NO * n){
	int he = 0, hd = 0;

	if(n != NULL){
		he = altura(n->esq);
		hd = altura(n->dir);
		n->fb = he - hd;
	}
}


NO * arvore_avl::rotacao_Direita(NO * n){
	NO * aux = n->esq;
    n->esq = aux->dir;
    aux->dir = n;
    return aux;
}


NO * arvore_avl::rotacao_Esquerda(NO * n){
	NO * aux = n->dir;
    n->dir = aux->esq;
    aux->esq = n;
    return aux;
}


NO * arvore_avl::balanceia(NO *n){
 
	if(n->fb == 2){
		if(n->esq->fb == -1)
			n->esq = rotacao_Esquerda(n->esq);
		n = rotacao_Direita(n);
		
	}else 
	if(n->fb == -2){
		if(n->dir->fb == 1)
			n->dir = rotacao_Direita(n->dir);
		n = rotacao_Esquerda(n);
	}
	return n;
}

NO * arvore_avl::busca(NO * r, int n){
	if(r == NULL || r->valor == n)
		return r;
	if(r->valor > n)
		return busca(r->esq, n);
	else return busca(r->dir, n);			
}


NO * arvore_avl::busca(int n){
	return busca(raiz, n);
}


void arvore_avl::remove(NO ** r, int n){
	if(*r != NULL){
		if((*r)->valor == n ){  
	 		cout<< (*r)->valor<< " removido!"<< endl;
		 	*r = remove(*r);
		}else if((*r)->valor > n)
			remove(&(*r)->esq, n);
		else remove(&(*r)->dir, n);
		
		if(*r != NULL){
			fator_balanceamento(*r);
  			*r = balanceia(*r);	
  		}
		
	}else cout<<"Valor nao encotrado!"<<endl;
}


NO * arvore_avl::remove(NO *r){
	NO *p, *q;

    if (r->esq == NULL) {
       q = r->dir;
       free (r);
       return q;
    }

    p = r; q = r->esq;

    while (q->dir != NULL) {
       p = q; 
       q = q->dir;
    }

    if (p != r) {
       p->dir = q->esq;
       q->esq = r->esq;
    }

    q->dir = r->dir;

    free (r);
    return q;	
}


void arvore_avl::remove(int n){
	remove(&raiz, n);
}

