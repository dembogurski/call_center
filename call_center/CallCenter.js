



function configurar(){
    $("#buscar_institucion").keyup(function(){
         buscarInstituciones();
    });
}

function buscarInstituciones(){
    var criterio = $("#buscar_institucion").val();
    $.ajax({
        type: "POST",
        url: "call_center/CallCenter.class.php",
        data: {"action": "buscarInstituciones",criterio:criterio},
        async: false,
        dataType: "json",
        beforeSend: function () {
          $("#instituciones").empty();
        },
        success: function (data) {   
            for (var i in data) { 
                var cod_inst = data[i].cod_inst;
                var nombre_inst = data[i].nombre;                
                var distrito = data[i].distrito;
                var departamento = data[i].departamento;
                 
                $("#instituciones").append('<option value="'+cod_inst+'" data-distrito="'+distrito+'" data-departamento="'+departamento+'" ">'+nombre_inst+' - '+distrito+' - '+departamento+'</option>');
            }
        }
    });    
}