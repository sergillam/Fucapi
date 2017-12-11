<?php
// conexao com o banco de dados usando PDO
header('Access-Control-Allow-Origin: *');
setlocale(LC_ALL,'pt_BR.UTF8');
mb_internal_encoding('UTF8'); 
mb_regex_encoding('UTF8');
try{
	$conexao = new PDO('mysql:host=localhost;dbname=dbprojetosistema','root','');
	$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $erro){
	http_response_code(500);
	echo 'ERROR: '. $erro->getMessage();
}
?>