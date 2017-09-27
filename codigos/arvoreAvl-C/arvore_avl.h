#ifndef ARVORE_H
#define ARVORE_H

typedef struct no{
    int valor, fb;
    struct no *esq;
    struct no *dir;
}NO;

class arvore_avl
{
    public:
        arvore_avl();
        void insere_no(int n);
        void imprime(void);
		int altura(void);
		NO * busca(int n);
		void remove(int n);

    protected:

    private:
        NO *raiz;
        void insere_no(NO ** pNo, int N);
        void imprime(NO *raiz);
		int maior(int a, int b);
		int altura(NO * n);
		void fator_balanceamento(NO * n);
		NO * rotacao_Direita(NO *n);
		NO * rotacao_Esquerda(NO *n);
		NO * balanceia(NO *n);
		NO * busca(NO * r, int n);
		void remove(NO ** r, int n);
		NO * remove(NO *r);
};

#endif 
