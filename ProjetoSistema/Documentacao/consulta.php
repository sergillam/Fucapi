<?php


// conexao com o banco de dados usando PDO

try{
	$conexao = new PDO('mysql:host=localhost;dbname=dbprojetosistema','root','');
	$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $erro){
	echo 'ERROR: '. $erro->getMessage();
}

$sql = "SELECT * FROM HOSPITAL ORDER BY idHospital DESC";

try{
	$resultado = $conexao->prepare($sql);
	$resultado->execute();
	$row = $resultado->rowCount();
		
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
			$endereco = $registro->enderecoId;
			$contato = $registro->contatoId;
			echo "<tr>";
			echo "<td>".$nome."</td>";
			echo "<td>".$endereco."</td>";
			echo "<td>".$contato."</td>";
			echo "</tr>";
		}
		echo "</table>";
	}else{
		echo 'Não Existe nada cadastrado no Banco';
	}
}catch(PDOException $erro){
	echo $erro;
}

?>