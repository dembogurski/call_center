var reporte;

function configurar() {

    $(".rep_button").click(function() {
        var identifier = $(this).val().replace(/\ /g, '_').toLowerCase();  
        if(identifier.substring(0,6) == "cumple"){
            identifier = "cumpleanios";
        } console.log(identifier);
        loadFilters(identifier);
    });

    $("#select_type").change(function() {
        var clase = $(this).val();
        if (clase == "todos") {
            $(".rep_button").fadeIn("fast");
        } else {
            $("." + clase + "").fadeIn("fast");
            $(".rep_button:not('." + clase + "')").fadeOut(800);
        }
    });

    $(".filter").on("keyup change", function() {
        var filter = $(this).val();
        $(".resaltar").removeClass("resaltar");

        if (filter.length > 0) {
            var find = $('.rep_button').filter(function() {
                return $(this).val().toLowerCase().indexOf(filter) > -1;
            });
            find.addClass("resaltar");
        }
    });
     
}
function genericAjax(url,laoder_id,data,callback){       
      $.ajax({
        type: "POST",
        url: url,
        data: data,
        async: true,
        dataType: "json",
        beforeSend: function () {
            $("#"+laoder_id).html("<img src='img/loading_fast.gif' width='16px' height='16px' >"); 
        },
        success: function (data) { 
            $("#"+laoder_id).html(""); 
            callback( data );
        }
    });    
}

function mostrarMenu() {
    $("#filters_area").html("");
    $(".back_arrow").fadeOut();
    $("#rep_container").fadeIn();
}

function loadFilters(identif) {
    $("#rep_container").fadeOut();
    $(".back_arrow").fadeIn();
    $.ajax({
        type: "POST",
        url: "reportes/ReportesUI.class.php",
        data: { "action": identif, "usuario": getNick(), "suc": getSuc() },
        async: true,
        dataType: "html",
        beforeSend: function() {
            $("#filters_area").html("<img src='img/loading_fast.gif' width='16px' height='16px' >");
        },
        complete: function(objeto, exito) {
            if (exito == "success") {
                var result = $.trim(objeto.responseText);
                $("#filters_area").html(result);
                configForm();
            }
        },
        error: function() {
            $("#filters_area").html("Ocurrio un error en la comunicacion con el Servidor...");
        }
    });
}
/* Prepara el Formulario cuando ya esta cargado */
function configForm() {
    $(".fecha").mask("99/99/9999");
    $(".fecha").datepicker({ dateFormat: 'dd/mm/yy' });
    if ($("#desde").length && $("#hasta").length) { $("#desde").change(function() { $("#hasta").val($(this).val()); }); }
}

function sendForm() {
    var emp = $(".emp").text();
    var params = "";
    $('#filter_table *').each(function() {
        var id = $(this).attr("id");
        if (id != undefined) {
            var valor = $(this).val();
            var type =$("#" + id).attr("type");
            if (type == "checkbox" || type == "radio"){
                valor = $(this).is(":checked");              
            }
            params += "" + id + "=" + valor + "&";
        }
    })
    var user = getNick();
    params += "user=" + user+"&emp="+emp;

    var action = $("#filter_form").attr("action");
    reporte = window.open(action + "?" + params, '_blank', 'scrollbars=yes,width=800,height=800');
}

function checkDate(id) {
    var fecha = validDate($("#" + id).val()).fecha;
}
function setCurrentDate(id) {
    var fecha = new Date().toJSON().slice(0,10).split("-");
    var mdy = fecha[2]+"/"+fecha[1]+"/"+fecha[0];    
    $("#" + id).val(mdy);
}
 
 

function desmarcarTodos() {
    var c = confirm("Esta seguro que desea desmarcar todos?");
    if (c) {
        $.post("reportes/ChequesTerceros.class.php", "action=desmarcarTodos", function(data) {
            alert("Ok Todos los cheques han sido desmarcados...");
        });
    }
}
 

function cambiarURL(path){    
    $("#tipo").change(function(){ 
        var t = $(this).val();
        var url = path+"/reportes/"+t;         
        $("#filter_form").attr("action",url);  
    });   
}
 
function initRepCallCenter(){
   $("#select_suc").change(function(){
       var emp = $(this).val();
       buscarEntidades("suc like ",emp);
   }); 
   $("#select_entidad").change(function(){
       var emp = $("#select_suc").val();
       var ent = $(this).val();
       buscarInstituciones(" i.cod_ent =",ent);
   });
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
              $("#select_inst").empty();
            },
            success: function (data) {  
                if(data.length > 0){
                    $("#select_inst").append("<option value='%'>* - Todas</option>");
                    for (var i in data) { 
                        var cod_inst = data[i].cod_inst;
                        var nombre_inst = data[i].nombre;                
                        var distrito = data[i].distrito;
                        var departamento = data[i].departamento;                 
                        $("#select_inst").append('<option value="'+cod_inst+'" data-distrito="'+distrito+'" data-departamento="'+departamento+'" ">'+nombre_inst+' - '+distrito+' - '+departamento+'</option>');
                    } 
                }
            }
        });  
    }
}
function buscarEntidades(criterio,valor){
    if(valor.length > 0){ 
        $.ajax({
            type: "POST",
            url: "call_center/CallCenter.class.php",
            data: {"action": "buscarEntidades",criterio:criterio,valor:valor},
            async: false,
            dataType: "json",
            beforeSend: function () {
              $("#select_entidad").empty();
            },
            success: function (data) {  
                if(data.length > 0){
                    $("#select_entidad").append("<option value='%'>* - Todas</option>");
                    for (var i in data) { 
                        var cod_ent = data[i].cod_ent;
                        var nombre  = data[i].nombre;   
                        $("#select_entidad").append('<option value="'+cod_ent+'"  >'+nombre+'</option>');
                    } 
                }
            }
        });  
    }
}
