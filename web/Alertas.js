/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function alertaCambio(){
    alert("Al modificar tu información deberás volver a iniciar sesión");
}
function aceptarCambio(){
    var mensaje = confirm("Al modificar tu información deberás volver a iniciar sesión, ¿Quiéres continuar?");
    if(mensaje === true){
        return true;
    }
    else{
        return false;
    }
}
function aceptarEliminacion(){
    var mensaje = confirm("Al confirmar tu usuario se borrará de los registros, ¿Quiéres continuar?");
    if(mensaje === true){
        return true;
    }
    else{
        return false;
    }
}


