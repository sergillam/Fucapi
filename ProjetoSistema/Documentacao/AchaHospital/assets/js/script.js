function mostraTodosHospitais(){
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if ( xmlHttp.readyState == 4 && xmlHttp.status == 200)
			document.getElementById("retorno").innerHTML = xmlHttp.responseText;
	};
	xmlHttp.open("GET","service/listaTodosHospitais.php",true);
	xmlHttp.send();
}

$('#enviar').click(function(event){
	event.preventDefault();
	$.ajax({
		url: 'service/listaPorEspecialidadeMedica.php',
		type: 'post',
		data:{
			pesquisar: $("#pesquisar").val()
		}
	})

	.done(function(msg){
		$("#retorno").html(msg);
		console.log(msg);
	})
	.fail(function(msg){
		$("#retorno").html(msg);
	});

});

$('#enviarHorario').click(function(event){
	var e = document.getElementById("cmbitens");
	var opRes = e.options[e.selectedIndex].value;
	//alert (opRes);
	$.ajax({
		url: 'service/listaPorHorario.php',
		type: 'post',
		data:{
			pesquisar: $("#cmbitens").val()
		}
	})

	.done(function(msg){
		$("#retornoHorario").html(msg);
		console.log(msg);
	})
	.fail(function(msg){
		$("#retornoHorario").html(msg);
	});

});


				

				