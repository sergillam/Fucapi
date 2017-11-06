CREATE DATABASE IF NOT EXISTS dbProjetoSistema;

USE dbProjetoSistema;

CREATE TABLE IF NOT EXISTS CONTATO(
	idContato INT(10) NOT NULL AUTO_INCREMENT , 
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(45),
    PRIMARY KEY (idContato)
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS ENDERECO(
	idEndereco INT(10) NOT NULL AUTO_INCREMENT , 
    rua VARCHAR(25) NOT NULL,
    numero VARCHAR(10) NOT NULL , 
    bairro VARCHAR (15) NOT NULL,
    cep VARCHAR (15),
    complemento VARCHAR (100),
    PRIMARY KEY (idEndereco)    
) ENGINE = INNODB;


 
CREATE TABLE IF NOT EXISTS HOSPITAL (
	idHospital INT (10) NOT NULL AUTO_INCREMENT , 
    nomeHospital VARCHAR (45) NOT NULL ,
    cnpj VARCHAR (15) NOT NULL ,
    contatoId INT NOT NULL ,
    enderecoId INT NOT NULL ,
    PRIMARY KEY (idHospital) , 
    CONSTRAINT fk_contatoHospital FOREIGN KEY(contatoId) 
	REFERENCES CONTATO(idContato) ,
    CONSTRAINT fk_enderecoHospital FOREIGN KEY(enderecoId) 
	REFERENCES ENDERECO(idEndereco)
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS MEDICO (
	idMedico INT (10) NOT NULL AUTO_INCREMENT UNIQUE, 
    crm VARCHAR (15) NOT NULL ,
    nomeMedico VARCHAR (45) NOT NULL ,
    especialidadeMedica VARCHAR (45) NOT NULL ,
    hospitalId INT NOT NULL ,
    PRIMARY KEY (crm) , 
    CONSTRAINT fk_hospital
	FOREIGN KEY(hospitalId) 
	REFERENCES HOSPITAL(idHospital)
) ENGINE = INNODB;

#CONTATO 
INSERT INTO CONTATO (telefone , email) VALUES ('92 99317-5229' , 'sgm.oliveira96@gmail.com');
INSERT INTO CONTATO (telefone , email) VALUES ('92 99163-6611' , 'marines_oi@hotmail.com');
INSERT INTO CONTATO (telefone , email) VALUES ('92 9209-3822' , 'concy_garcia@gmail.com');
INSERT INTO CONTATO (telefone , email) VALUES ('92 99134-3139' , 'joao.basto@live.com');
INSERT INTO CONTATO (telefone , email) VALUES ('92 3615-9951' , 'hospitaljoaolucio@gmail.com');
INSERT INTO CONTATO (telefone , email) VALUES ('92 3615-9951' , 'hospital28agosto@gmail.com');
#ENDERECO
INSERT INTO ENDERECO (rua , numero , bairro , cep , complemento) VALUES ('uniao' , '4' , 'japiim' ,'69075-222' , Null );
INSERT INTO ENDERECO (rua , numero , bairro , cep , complemento) VALUES ('A' , '2' , 'Dom Pedro 2' , '69075-123' ,  Null);
INSERT INTO ENDERECO (rua , numero , bairro , cep , complemento) VALUES ('C' , '4' , 'japiim 2 ' , '69053-223','próximo a pemaza');
INSERT INTO ENDERECO (rua , numero , bairro , cep , complemento) VALUES ('Alameda Cosme Ferrreira' , 'S/N' , 'Coroado' , '69082-230', Null );
INSERT INTO ENDERECO (rua , numero , bairro , cep , complemento) VALUES ('Av. Mário Ypiranga' , '1581' , 'Adrianópolis' , '69057-000', Null );
#CONTATO 
INSERT INTO HOSPITAL (nomeHospital , cnpj , contatoId , enderecoId) VALUES ('28 de Agosto' , '1234567',6,4);
INSERT INTO HOSPITAL (nomeHospital , cnpj , contatoId , enderecoId) VALUES ('Joao Lucio' , '7654321',5,5);
#medico
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('1-p' , 'Marcio Lopes' , 'Pediatra',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('2-p' , 'Lucas Lincon' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('3-p' , 'Tiago Macedo' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('4-p' , 'Jamilly Lopes' , 'Pediatra',2);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('5-p' , 'Camila Ximenes' , 'Cardiologista',2);
