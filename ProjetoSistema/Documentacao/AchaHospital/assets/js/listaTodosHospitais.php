<?php
// conexao com o banco de dados usando PDO
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=utf-8');
try{
	$conexao = new PDO('mysql:host=localhost;dbname=dbprojetosistema','root','');
	$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $erro){
	http_response_code(500);
	echo 'ERROR: '. $erro->getMessage();
}

$sql = "SELECT * FROM hospital";

try{
	$resultado = $conexao->prepare($sql);
	$resultado->execute();
	$row = $resultado->rowCount();

	$metodo = $_SERVER['REQUEST_METHOD'];
	switch($metodo){
		case "GET":
			if($row> 0){
						
				// Criando tabela e cabeçalho de dados !
				echo "<table border=1>";
				echo "<tr>";
				echo "<th>NOME</th>";
				echo "<th>ENDERECO</th>";
				echo "<th>CONTATO</th>";
				echo "</tr>";
				
				while($registro = $resultado->fetch(PDO::FETCH_OBJ)){
					$nome = $registro->nomeHospital;
					$contato = $registro->telefone;
					echo "<tr>";
					echo "<td>".$nome."</td>";
					echo "<td>".$endereco."</td>";
					echo "<td>".$contato."</td>";
					echo "</tr>";
					
					echo json_encode($registro);
				}
				echo "</table>";
				
			}else{
                http_response_code(404);
                echo '{ "mensagem" : "Usuário não encontrado" }';
			}
		break;
}catch(PDOException $erro){
	http_response_code(400);
	echo $erro;
}
?>