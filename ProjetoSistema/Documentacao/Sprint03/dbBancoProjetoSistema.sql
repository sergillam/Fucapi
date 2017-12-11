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
    
    horaFuncionamento VARCHAR(15) NOT NULL,
    PRIMARY KEY (idHospital)  
    
    
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS MEDICO (
	idMedico INT (10) NOT NULL AUTO_INCREMENT , 
    crm VARCHAR (15) NOT NULL ,
    nomeMedico VARCHAR (45) NOT NULL ,
    especialidadeMedica VARCHAR (45) NOT NULL ,
    hospitalId INT NOT NULL ,
    PRIMARY KEY (idMedico) , 
    CONSTRAINT fk_hospital
	FOREIGN KEY(hospitalId) 
	REFERENCES HOSPITAL(idHospital)
) ENGINE = INNODB;

INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email , horaFuncionamento) 
	VALUES ('28 de Agosto' , '1234567' , 'Alameda Cosme Ferrreira' , 'S/N' , 'Coroado' , '69082-230', Null ,
			'92 3615-9951' , 'hospital28agosto@gmail.com' , '24h');
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email , horaFuncionamento) 
	VALUES('Joao Lucio' , '7654321','Av. Mário Ypiranga' , '1581' , 'Adrianópolis' , '69057-000', Null,
			'92 3615-9951' , 'hospitaljoaolucio@gmail.com' , '24h');
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email , horaFuncionamento) 
	VALUES('Hospital Universitário Francisca Mendes' , '7654321','Av. Camapuã' , '108' , 'Cidade Nova' , '69097-720', Null,
			'(92) 3649-2750' , 'hospitalfranciscaMendes@gmail.com','24h');
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email , horaFuncionamento) 
	VALUES('UBS NOVA CIDADE' , '711','Rua Nova ' , '151' , 'Nova Cidade' , '69213-010', Null,
			'92 3125-4154' , 'ubsNovaCidade@gmail.com' , 'Normal');
INSERT INTO HOSPITAL (nomeHospital , cnpj , rua , numero, bairro , cep , complemento , telefone , email , horaFuncionamento) 
	VALUES('UBS Jappim' , '071-2','Rua 13 ' , '1-1' , 'Jappim' , '69313-310', Null,
			'92 3345-4121' , 'ubsJappim@gmail.com' , 'Normal');
#medico
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('1-p' , 'Marcio Lopes' , 'Pediatra',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('2-p' , 'Lucas Lincon' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('3-p' , 'Tiago Macedo' , 'Clinico Geral',1);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('4-p' , 'Jamilly Lopes' , 'Pediatra',2);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('5-p' , 'Camila Ximenes' , 'Cardiologista',2);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('6-p' , 'Yago Lopes' , 'Pediatra',3);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('7-p' , 'Joao Ximenes' , 'Cardiologista',3);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('8-p' , 'Marcos Luiz' , 'Clinico Geral',4);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('9-p' , 'Jerry Costa' , 'Clinico Geral',5);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('10-p' , 'Max Luiz' , 'Pediatra',4);
INSERT INTO MEDICO (crm , nomeMedico , especialidadeMedica , hospitalId ) VALUES ('11-p' , 'Jr Costa' , 'Pediatra',5);


