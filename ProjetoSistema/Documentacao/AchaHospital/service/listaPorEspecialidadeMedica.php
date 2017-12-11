<?php
require ("conexao.php");

#$pesquisar = isset($_POST['pesquisar']) ? $_POST['pesquisar'] : 'p';
// if (($_POST['pesquisar']) == NULL ){
// 	echo 'NULO BIBI ';
// 	echo ($_POST['pesquisar']) ;
// 	echo 'fim teste';
// 	$pesquisar = 'c';
// }else {

$pesquisar = ($_POST['pesquisar']);

try{
	$sql =  "SELECT * FROM MEDICO WHERE especialidadeMedica LIKE '%$pesquisar%'";
	$resultado = $conexao->prepare($sql);
	$resultado->execute();
	$row = $resultado->rowCount();

	$metodo = $_SERVER['REQUEST_METHOD'];

	$saida = "Especialidade não encontrada";

	switch($metodo){
		case "POST":
			if($row> 0 && $pesquisar != ""){
						
				// Criando tabela e cabeçalho de dados !
				$saida = 
				"<table border='2'>" .
					"<tr>
						<td>Medico </td>" .
						"<td>Hospital</td>" .
						"<td>Especialidade</td>" .
					"</tr>";
				
				while($registro = $resultado->fetch(PDO::FETCH_OBJ)){
					$nome = $registro->nomeMedico;
					$idHospital = $registro->hospitalId;
					$especialidade = $registro->especialidadeMedica;
					
					$sql2 = "SELECT * FROM HOSPITAL WHERE IDHOSPITAL = ".$idHospital;
									
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
						$saida = $saida .'{ "mensagem" : "Especialidade não encontrada" }';
					}

					$saida = $saida . "<tr>" .

					"<td>".$nome."</td>" .
					"<td>".$nome2."</td>" . 
					"<td>".$especialidade."</td>" . 
					"</tr>";
					
				}
				$saida = $saida . "</table>";
				echo $saida;
				
				
			}
			else{
                $saida =  '{ "mensagem" : "Especialidade não encontrada" }';
                echo $saida;
				http_response_code(404);
			}
			break;
		default:
			http_response_code(200);	
            $saida = '{ "mensagem" : " ERRO " }';
            echo $saida;	
	}
}catch(PDOException $erro){
	http_response_code(400);	
    $saida = '{ "mensagem" : " ERRO " }';
    echo $erro;
}
?>