 


function configurar(){
    $("#buscar_institucion").keyup(function(){
        var valor = $(this).val();
        buscarInstituciones('i.nombre LIKE',valor);
    });
    
    $("#buscar_personas").keyup(function(){
         var valor = $(this).val();
         buscarPersonas('nombre LIKE',valor);
    });
    
    
    $("#buscar_institucion").change(function(){
        var cod_inst =$("#instituciones").val();
        console.log("buscar_institucion change cod_inst "+cod_inst);
        buscarPersonas('cod_inst = ',cod_inst);
    });
    
    $("#buscar_personas").change(function(){  
        var cod_inst = $("#personas option:selected").attr("data-cod_inst");
        console.log("buscar_personas change cod_inst "+cod_inst);
        buscarInstituciones('cod_inst = ',cod_inst);
    });
}

function buscarInstituciones(criterio,valor){
    if(valor.length > 0){ 
        $.ajax({
            type: "POST",
            url: "call_center/CallCenter.class.php",
            data: {"action": "buscarInstituciones",criterio:criterio,valor:valor},
            async: false,
            dataType: "json",
            beforeSend: function () {
              $("#instituciones").empty();
            },
            success: function (data) {  
                if(data.length > 0){
                    for (var i in data) { 
                        var cod_inst = data[i].cod_inst;
                        var nombre_inst = data[i].nombre;                
                        var distrito = data[i].distrito;
                        var departamento = data[i].departamento;                 
                        $("#instituciones").append('<option value="'+cod_inst+'" data-distrito="'+distrito+'" data-departamento="'+departamento+'" ">'+nombre_inst+' - '+distrito+' - '+departamento+'</option>');
                    }
                    if(criterio != 'cod_inst = '){
                       var cod_inst = $("#instituciones").val();
                       buscarPersonas('cod_inst =',cod_inst);
                    }
                }
            }
        });  
    }
}

function buscarPersonas(criterio,valor){
    if(valor.length > 0){ 
        $.ajax({
            type: "POST",
            url: "call_center/CallCenter.class.php",
            data: {"action": "buscarPersonas",criterio:criterio,valor:valor},
            async: false,
            dataType: "json",
            beforeSend: function () {
              $("#personas").empty();
              $("#lista_personas").empty();
              showLista();
            }, //cod_per,cod_inst,ci_ruc,nombre,tel,ocupacion
            success: function (data) {  
                if(data.length > 0){
                    var ul = "<ul class='ul_personas'></ul>";
                    $("#lista_personas").append(ul);
                    for (var i in data) { 
                        var cod_per = data[i].cod_per;
                        var cod_inst = data[i].cod_inst;
                        var nombre = data[i].nombre;                
                        var ocupacion = data[i].ocupacion;
                        var tel = data[i].tel;
                        $(".ul_personas").append("<li class='lista' data-cod_per='"+cod_per+"' >"+nombre+" - "+ocupacion+"</li>");
                        $("#personas").append('<option value="'+cod_per+'" data-cod_inst="'+cod_inst+'" >'+nombre+' - '+ocupacion+' - Tel-:'+tel+'</option>');                           
                    }
                    $(".lista").click(function(){
                       var cod_per = $(this).attr("data-cod_per"); 
                       $("#personas").val(cod_per);
                       setTimeout("hideLista()",2000);
                    });
                    if(criterio != 'cod_inst = '){
                       var cod_inst = $("#personas option:selected").attr("data-cod_inst");
                       buscarInstituciones('cod_inst = ',cod_inst);
                    }
                }
            }
        });  
    }
}

function hideLista(){
    $("#lista_personas").slideUp("slow");
}
function showLista(){
    $("#lista_personas").slideDown("fast");
}

function registrar(){
    var cod_per = $("#personas").val();
    var obs_per = $("#obs_per").val();
    var obs_user = $("#obs_user").val();
    var nivel = $("#nivel").val();
    var estado = $("#estado").val();
    $.ajax({
        type: "POST",
        url: "call_center/CallCenter.class.php",
        data: {"action": "registrar",cod_per:cod_per,obs_per:obs_per,obs_user:obs_user,nivel:nivel,estado:estado,usuario:getNick()},
        async: false,
        dataType: "json",
        beforeSend: function () { 
           $("#msg").html("<img src='img/loading_fast.gif'>");
        },  
        success: function (data) { 
              if(data.length > 0){
                  
              }
              $("#msg").html("<img src='img/ok.png'>");
        }
    });    
}