function mostraTodosHospitais(){
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if ( xmlHttp.readyState == 4 && xmlHttp.status == 200)
			document.getElementById("retorno").innerHTML = xmlHttp.responseText;
	};
	xmlHttp.open("GET","service/listaTodosHospitais.php",true);
	xmlHttp.send();
}

function mostraPorEspecialidadeMedica(){
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if ( xmlHttp.readyState == 4 && xmlHttp.status == 200)
			document.getElementById("retorno").innerHTML = xmlHttp.responseText;
		
	};
	xmlHttp.open("GET","service/listaPorEspecialidadeMedica.php",true);
	xmlHttp.send();
}

function mostraPorHorario(){
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if ( xmlHttp.readyState == 4 && xmlHttp.status == 200)
			document.getElementById("retorno").innerHTML = xmlHttp.responseText;
		
	};
	xmlHttp.open("GET","service/listaPorHorario.php",true);
	xmlHttp.send();
}
