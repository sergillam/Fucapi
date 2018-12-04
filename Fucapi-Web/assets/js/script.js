validationName = function () {
    var name = document.getElementById("name");
    if ()
    alert('entrou no js' + name.value);
    return true;
}

validar = function () {
    var formulario = document.getElementById("formulario");
    var cpf = formulario.cpf;
    var email = formulario.email;
    var re_cpf = /^([\d]{3})([\d]{3})([\d]{3})([\d]{2})$/;
    var re_email = /^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/;   

    if(re_cpf.test(cpf.value)){
        alert("CPF válido");}
        else{
            alert("CPF inválido");
    }

    if(re_email.test(email.value)) alert('E-mail válido');
    else alert('E-mail inválido');
}