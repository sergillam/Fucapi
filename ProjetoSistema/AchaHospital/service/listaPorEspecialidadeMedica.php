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

#$pesquisar = isset($_POST['pesquisar']) ? $_POST['pesquisar'] : 'p';
if (($_POST['pesquisar']) == NULL ){
	echo 'NULO BIBI ';
	echo ($_POST['pesquisar']) ;
	echo 'fim teste';
	$pesquisar = 'c';
}else {
$pesquisar = ($_POST['pesquisar']);
}
$sql =  "SELECT * FROM MEDICO WHERE especialidadeMedica LIKE '%$pesquisar%'";

try{
	$resultado = $conexao->prepare($sql);
	$resultado->execute();
	$row = $resultado->rowCount();

	$metodo = $_SERVER['REQUEST_METHOD'];
	switch($metodo){
		case "GET":
			if($row> 0){
						
				// Criando tabela e cabeçalho de dados !
				echo "<table border='2'>"; 	
				
				echo "<tr><td>Medico </td>";
				echo "<td>Hospital</td>";
				echo "<td>Especialidade</td>";
				echo "</tr>";
				
				while($registro = $resultado->fetch(PDO::FETCH_OBJ)){
					$nome = $registro->nomeMedico;
					$idHospital = $registro->hospitalId;
					$especialidade = $registro->especialidadeMedica;
					
					$sql2 = "SELECT * FROM hospital WHERE IDHOSPITAL = ".$idHospital;
									
					$resultado2 = $conexao->prepare($sql2);
					$resultado2->execute();
					$row2 = $resultado2->rowCount();
					if($row2> 0){
						while($registro2 = $resultado2->fetch(PDO::FETCH_OBJ)){
							$nome2 = $registro2->nomeHospital;
						} 
					} 
					else{
						http_response_code(404);
						echo '{ "mensagem" : "Usuário não encontrado" }';
					}
					echo "<tr>";
					echo "<td>".$nome."</td>";
					echo "<td>".$nome2."</td>";
					echo "<td>".$especialidade."</td>";
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