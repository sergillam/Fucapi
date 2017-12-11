CREATE DATABASE IF NOT EXISTS dbProjetoSistema;

USE dbProjetoSistema;
 
CREATE TABLE IF NOT EXISTS HOSPITAL (
	idHospital INT (10) NOT NULL AUTO_INCREMENT , 
    nomeHospital VARCHAR (45) NOT NULL ,
    cnpj VARCHAR (15) NOT NULL ,
    
    rua VARCHAR(25) NOT NULL,
    numero VARCHAR(10) NOT NULL , 
    bairro VARCHAR (15) NOT NULL,
    cep VARCHAR (15) NOT NULL,
    complemento VARCHAR (100),
    
	telefone VARCHAR(15) NOT NULL,
    email VARCHAR(45),
    
    PRIMARY KEY (idHospital)  
    
    
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

INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email ) 
	VALUES ('28 de Agosto' , '1234567' , 'Alameda Cosme Ferrreira' , 'S/N' , 'Coroado' , '69082-230', Null ,
			'92 3615-9951' , 'hospital28agosto@gmail.com' );
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email ) 
	VALUES('Joao Lucio' , '7654321','Av. Mário Ypiranga' , '1581' , 'Adrianópolis' , '69057-000', Null,
			'92 3615-9951' , 'hospitaljoaolucio@gmail.com' );
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email ) 
	VALUES('Hospital Universitário Francisca Mendes' , '7654321','Av. Camapuã' , '108' , 'Cidade Nova' , '69097-720', Null,
			'(92) 3649-2750' , 'hospitalfranciscaMendes@gmail.com' );
#medico
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('1-p' , 'Marcio Lopes' , 'Pediatra',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('2-p' , 'Lucas Lincon' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('3-p' , 'Tiago Macedo' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('4-p' , 'Jamilly Lopes' , 'Pediatra',2);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('5-p' , 'Camila Ximenes' , 'Cardiologista',2);
