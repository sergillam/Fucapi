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
				echo "<table border='1'>"; 
				echo "<tr><td>\n\n\nNome </td>";
				echo "<td>Endereço</td>";
				echo "<td>Contato</td>";
				echo "</tr>";
				echo "<tr><td>Nome </td>";
				echo "<td>Endereço</td>";
				echo "<td>Contato</td>";
				echo "</tr>";
				
				while($registro = $resultado->fetch(PDO::FETCH_OBJ)){
					$nome = $registro->nomeHospital;
					$rua = $registro->rua;
					$numero = $registro->numero;
					$bairro = $registro->bairro;
					$endereco = $rua.' '.$numero.' '.$bairro;
					$contato = $registro->telefone;
					echo "<tr>";
					echo "<td>".$nome."</td>";
					echo "<td>".$endereco."</td>";
					echo "<td>".$contato."</td>";
					echo "</tr>";
					
				}
				echo "</table>";
				
			}else{
                http_response_code(404);
                echo '{ "mensagem" : "Usuário não encontrado" }';
			}
		break;
	}
}catch(PDOException $erro){
	http_response_code(400);
	echo $erro;
}
?>