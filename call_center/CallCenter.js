var mode = "Registrar";
var limite = 50;
var editing_comunication_id = 0;

function configurar(){
    $("#buscar_institucion").keyup(function(){
        var valor = $(this).val();
        buscarInstituciones('i.nombre LIKE',valor);
    });
    
    $("#buscar_personas").keyup(function(){
         var valor = $(this).val();
         buscarPersonas('nombre LIKE',valor);
    });
    
    
    $("#instituciones").change(function(){ 
        var cod_inst =$(this).val(); 
        buscarPersonas("cod_inst =",cod_inst);
    });
    
    $("#personas").change(function(){  
        var cod_inst = $("#personas option:selected").attr("data-cod_inst"); 
        buscarInstituciones("cod_inst =",cod_inst);
    });
    $("#limite").change(function(){
        limite = $(this).val();
    });
    $("#limite").val(50);
    $("#aceptar").click(function(){
        if($(".selected").text() == "Registrar"){
           registrar();
        }else{
           modificar();
        }
    });
   
    filtrarComunicaciones();
}

function buscarInstituciones(criterio,valor){
    if(valor.length > 0 && valor != "%"){ 
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
                    if(criterio !== "cod_inst ="){
                       var cod_inst = $("#instituciones").val();
                       buscarPersonas("cod_inst =",cod_inst);
                    }
                }
            }
        });  
    }
}

function buscarPersonas(criterio,valor){  
    if(valor.length > 0 && valor != undefined){ 
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
                    if($(".selected").text() == "Editar"){
                        $("#personas").append('<option value="%" class="todos" data-cod_inst="%" >Todos</option>');                           
                    }
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
                    
                    if(criterio !== "cod_inst ="){ console.log("Buscando instituciones");
                       var cod_inst = $("#personas option:selected").attr("data-cod_inst");
                       buscarInstituciones("cod_inst =",cod_inst);
                    }
                }
            }
        });  
    }
}
function cambiarModo(obj){
    $(".selected").removeClass("selected");
    $(obj).addClass("selected");
    var id = $(obj).attr("id");
    $(".todos").remove();  
    if(id == "editar"){
        $("#nivel").prepend("<option class='todos' value='%'>Todos</option>").val("%");
        $("#estado").prepend("<option class='todos' value='%'>Todos</option>").val("%");
        $("#instituciones").prepend("<option class='todos' value='%'>Todos</option>").val("%");
        $("#personas").prepend("<option class='todos' value='%'>Todos</option>").val("%");
        $(".buscar").addClass("search");
        $("#aceptar").val("Modificar");
        $(".edit_img").fadeIn();
        mode = "Editar"
    }else{ 
       $(".search").removeClass("search");
       $("#aceptar").val("Registrar");
       $(".edit_img").fadeOut();
       mode = "Registrar"
       limpiar();
    }
}
function hideLista(){
    $("#lista_personas").slideUp("slow");
}
function showLista(){
    $("#lista_personas").slideDown("fast");
}
function limpiar(){
    $(".call_input").val("");
    editing_comunication_id = 0;
}
function addComunicationRowEvent(){
    $(".edit_img").click(function(){
        var $row = $(this).parent().parent(); 
        editing_comunication_id = $row.attr("data-id_com"); 
        var cod_per = $row.attr("data-cod_per"); 
        var obs_user = $row.attr("data-obs_user"); 
        var obs_per = $row.find('.obs_per').text();
        var nivel = $row.find('.nivel').text();
        var estado = $row.find('.estado').text(); 
        //console.log(editing_comunication_id+"  "+cod_per +" "+ obs_user +" "+  obs_per  +" "+  nivel +" "+  estado);
        $("#obs_per").val(obs_per);
        $("#obs_user").val(obs_user);
        $("#nivel").val(nivel);
        $("#estado").val(estado);
        buscarPersonas('cod_per =',cod_per);
        setTimeout(function(){
            $("#personas").val(cod_per)
        },3000);
    });
}

function registrar(){
    if($(".selected").text() == "Registrar"){
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
                  for (var i in data) { 
                     var id_com = data[i].id_com; 
                     var cod_per = data[i].cod_per;
                     var cod_inst = data[i].cod_inst;
                     var usuario_reg = data[i].usuario;                      
                     var fecha = data[i].fecha;    
                     var persona = data[i].persona;  
                     var institucion = data[i].institucion;
                     var entidad = data[i].entidad;  
                     var obs_per = data[i].obs_per; 
                     var obs_usuario= data[i].obs_usuario;  
                     var nivel = data[i].nivel;  
                     var estado = data[i].estado;  
                     $("#calls").append("<tr class='com_row tr_'"+id_com+"'' data-id_com='"+id_com+"' data-cod_per='"+cod_per+"' data-obs_user='"+obs_usuario+"'><td  class='itemc'>"+usuario_reg+"</td><td class='itemc'>"+fecha+"</td><td class='item'>"+persona+"</td><td class='item'>"+institucion+"</td>\n\
                     <td class='item'>"+entidad+"</td><td class='item obs_per'>"+obs_per+"</td><td class='itemc nivel "+nivel+"'>"+nivel+"</td><td class='itemc estado'>"+estado+"</td><td class='itemc'><img src='img/edit.png' width='18px' class='edit_img'   ></td></tr>");
                  } 
              }
              addComunicationRowEvent();
              $("#msg").html("<img src='img/ok.png'>");
              limpiar();
            }
        }); 
    }
}

function modificar(){
        //var cod_per = $("#personas").val();
        if(editing_comunication_id > 0){
        var obs_per = $("#obs_per").val();
        var obs_user = $("#obs_user").val();
        var nivel = $("#nivel").val();
        var estado = $("#estado").val();
        $.ajax({
            type: "POST",
            url: "call_center/CallCenter.class.php",
            data: {"action": "modificar",editing_comunication_id:editing_comunication_id,obs_per:obs_per,obs_user:obs_user,nivel:nivel,estado:estado,usuario:getNick()},
            async: false,
            dataType: "json",
            beforeSend: function () { 
               $("#msg").html("<img src='img/loading_fast.gif'>");
               $("#tr_"+editing_comunication_id).remove();
            },  
            success: function (data) { 

                if(data.length > 0){
               
                  for (var i in data) { 
                     var id_com = data[i].id_com; 
                     var cod_per = data[i].cod_per;
                     var cod_inst = data[i].cod_inst;
                     var usuario_reg = data[i].usuario;                      
                     var fecha = data[i].fecha;    
                     var persona = data[i].persona;  
                     var institucion = data[i].institucion;
                     var entidad = data[i].entidad;   
                     var obs_per = data[i].obs_per; 
                     var obs_usuario= data[i].obs_usuario;  
                     var nivel = data[i].nivel;  
                     var estado = data[i].estado; 
                     
                     $("#calls").append("<tr class='com_row tr_'"+id_com+"'' data-id_com='"+id_com+"' data-cod_per='"+cod_per+"' data-obs_user='"+obs_usuario+"'><td  class='itemc'>"+usuario_reg+"</td><td class='itemc'>"+fecha+"</td><td class='item'>"+persona+"</td><td class='item'>"+institucion+"</td>\n\
                     <td class='item'>"+entidad+"</td><td class='item obs_per'>"+obs_per+"</td><td class='itemc nivel "+nivel+"'>"+nivel+"</td><td class='itemc estado'>"+estado+"</td><td class='itemc'><img src='img/edit.png' width='18px' class='edit_img'   ></td></tr>");
                  } 
              }
              addComunicationRowEvent();
              $("#msg").html("<img src='img/ok.png'>");
              limpiar();
            }
        }); 
    }else{
        alert("Debe modificar algun campo antes de presionar este boton.");
    }
}

function filtrarComunicaciones(){
    var desde = $("#desde").val();
    var hasta = $("#hasta").val();
    var cod_inst = $("#instituciones").val();
    var cod_per = $("#personas").val();
    var nivel = $("#nivel").val();
    var estado = $("#estado").val();
    var obs_per = $("#obs_per").val();
    
    if(cod_inst == ""){
        cod_inst = "%";
    }
    if(cod_per == ""){
        cod_per = "%";
    }
    if(obs_per == ""){
        obs_per = "%";
    }
    
    $.ajax({
        type: "POST",
        url: "call_center/CallCenter.class.php",
        data: {"action": "filtrarComunicaciones",desde:desde,hasta:hasta,cod_per:cod_per,cod_inst:cod_inst,obs_per:obs_per,nivel:nivel,estado:estado,limite:limite},
        async: false,
        dataType: "json",
        beforeSend: function () { 
           $("#msg").html("<img src='img/loading_fast.gif'>");
           $(".com_row").remove();
        },  
        success: function (data) { 
              if(data.length > 0){
                  for (var i in data) { 
                     var id_com = data[i].id_com; 
                     var cod_per = data[i].cod_per;
                     var cod_inst = data[i].cod_inst;
                     var usuario_reg = data[i].usuario;                      
                     var fecha = data[i].fecha;    
                     var persona = data[i].persona;  
                     var institucion = data[i].institucion;
                     var entidad = data[i].entidad;  
                     var obs_per = data[i].obs_per;  
                     var obs_usuario= data[i].obs_usuario;  
                     var nivel = data[i].nivel;  
                     var estado = data[i].estado;  
                     $("#calls").append("<tr class='com_row tr_'"+id_com+"' data-id_com='"+id_com+"' data-cod_per='"+cod_per+"' data-obs_user='"+obs_usuario+"'><td  class='itemc'>"+usuario_reg+"</td><td class='itemc'>"+fecha+"</td><td class='item'>"+persona+"</td><td class='item'>"+institucion+"</td>\n\
                     <td class='item'>"+entidad+"</td><td class='item obs_per'>"+obs_per+"</td><td class='itemc nivel "+nivel+"'>"+nivel+"</td><td class='itemc estado'>"+estado+"</td><td class='itemc'><img src='img/edit.png' width='18px' class='edit_img' ></td></tr>");
                  }
              }
              addComunicationRowEvent();
              if(mode == "Editar"){
                  $(".edit_img").fadeIn();
              }
              $("#msg").html("<img src='img/ok.png'>");
        }
    });   
}