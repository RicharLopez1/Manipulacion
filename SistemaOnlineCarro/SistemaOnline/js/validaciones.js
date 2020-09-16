function AcceptNum(evt) {
    var nav4 = window.Event ? true : false;
    var key = nav4 ? evt.which : evt.keyCode;
    return (key <= 13 || (key >= 48 && key <= 57) || key == 44);
}


function maskKeyPress2(evt) {
    var iKeyCode;
    iKeyCode = objEvent.keyCode;
    if (iKeyCode == 46 || iKeyCode >= 48 && iKeyCode <= 57) return true;
    return false;
}



function validar(e) { // 1

    tecla = (document.all) ? e.keyCode : e.which; // 2

    if (tecla == 8) return true; // 3

    patron = /[A-Za-áéíóúÉÁÍÓÚzñÑ\s]/; // 4

    te = String.fromCharCode(tecla); // 5

    return patron.test(te); // 6

}
function validarEmail(e) { // 1

    tecla = (document.all) ? e.keyCode : e.which; // 2

    if (tecla == 8) return true; // 3

    patron = "^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"; // 4

    te = String.fromCharCode(tecla); // 5

    return patron.test(te); // 6

}