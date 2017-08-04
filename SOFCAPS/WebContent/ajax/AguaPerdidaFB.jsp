<%@page language="java"%>
<%@page contentType="text/html"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
 <%@page pageEncoding="UTF-8" import="Datos.DTConsumo,Entidades.Usuario, Entidades.Rol, Datos.DT_Vw_rol_opciones,java.sql.ResultSet ;"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
%>
<%
	String nombre_usuario = "";
	nombre_usuario = (String) session.getAttribute("nombre_usuario");
	nombre_usuario = nombre_usuario==null?"":nombre_usuario;
	

	
	String url="";	
	ResultSet rs;
	

%>

<!--///////////////////////div donde se muestra un Dialogo /////////////////////////////// -->
<div id="dialogCat" class= "col-xm-offset-1 col-xm-10">
	<div class="contenido" style="margin-left: 20px;"></div>
</div>  
<!--///////////////////////Directorios donde estan los jsp /////////////////////////////// -->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<!--<li><a href="index.html">Home</a></li>-->
			<li><a href="index.jsp">Inicio</a></li>
			<li><a href="#">Reporte Consumos CAPS</a></li>
		</ol>
	</div>
</div>
<!--///////////////////////Final de los directorios/////////////////////////////// -->

<!--///////////////////////MODAL PARA MOSTRAR FORMULARIOS /////////////////////////////// -->
<div id="modalbox">
	<div class="devoops-modal">
		<div class="devoops-modal-header">
			<div class="modal-header-name">
				<span>Basic table</span>
			</div>
			<div class="box-icons">
				<a class="close-link"> <i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="devoops-modal-inner"></div>
		<div class="devoops-modal-bottom"></div>
	</div>
</div>
<!--Start Dashboard 1-->
<div id="dashboard-header" class="row">
	<div class="col-sm-12 col-md-12 text-center">
		<h3>Opciones para generar reporte consumo clientes</h3>
	</div>
</div>
<!--End Dashboard 1-->
<!--Start Dashboard 2-->
<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right">
		<ul class="nav nav-pills nav-stacked"
		style="background: #4C9480 url(./img/devoops_pattern_b10.png) 0 0 repeat;">
			<li class="active"><a href="#" class="tab-link" id="IMC">Imprimir por fechas</a></li>
			
		</ul>
	</div>
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
	
		<!--Start Dashboard Tab 1-->
		<div id="dashboard-IMC" class="row"
		style="visibility: visible; position: relative;">
			<div class="col-xs-12" style="margin-top: 20px;">
				<h4 class="page-header">Informe período de fechas</h4>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12  col-md-offset-1 col-md-10">
					<div class="box" style="top: 0px; left: 0px; opacity: 1;">
						<div class="box-header">
							<div class="box-name">
								<i class="fa fa-plus-square-o"></i> <span>Generar consumo meses</span>
							</div>
							<div class="box-icons">
								<a id="colapsar_desplegar1" class="collapse-link"> 
									<i class="fa fa-chevron-up"></i></a> 
								<a id="expandir1" class="expand-link"> 
									<i class="fa fa-expand"></i></a>
								<a class="cerrar" title="Inhabilitado"> 
									<i class="fa fa-times"></i></a>
							</div>
							<div class="no-move"></div>
						</div>
						<div class="box-content">
								<div class="form-group">
								
									<label class="col-sm-2 control-label">Periodo de fechas</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="FECHITAM"
										placeholder="fecha de inicio">
									</div>
									
									<div class="col-sm-4">
										<input type="text" class="form-control" id="FECHITAMM"
										placeholder="fecha de fin">
									</div>
									
								</div>
									<div class="clearfix"></div>
									<input type="hidden" id="userC" name="userC" value="<%=nombre_usuario %>">
								
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-3">
										<button type='button' class='imprimir btn btn-basic' data-toggle='tooltip' 
											data-placement='top' title='Imprimir' onclick="imprimir();" >
											<i class='fa fa-print'></i> Imprimir
										</button>
									</div>
								</div>
								
									<div class= "clearfix"></div>
									<div class= "clearfix"></div>
									<div class= "clearfix"></div>
									<div class="clearfix"></div>
									<div class="clearfix"></div>
					
							</div>
						</div>
					</div>
				</div>
			</div>
			
		
		<!--End Dashboard Tab 1-->
		
	
		<!--End Dashboard Tab 2-->
		
	</div>
	<div class="clearfix"></div>
</div>

<!--End Dashboard 2 -->

<div style="height: 40px;"></div>

<script type="text/javascript">


function imprimir()

{	
	
	var valor = "";
	var v = "";
	userC = $('#userC').val();
	
	
	cat = $('#FECHITAM').val();
	valor = $('#FECHITAMM').val();
		
	window.open("SL_AguaPerdidaFB?FECHITAM="+cat+"&FECHITAMM="+valor+"&userC="+userC, '_blank');
	console.log("El paramtero del jsp otro FECHITAM"+" "+valor);
	console.log("El paramtero del jspFECHITA MM "+" "+cat);
	

}



function DemoSelect2() {
	
	$('#sec').select2();
	
}
///////////////////////////////////FUNSIÓN PRINCIPAL////////////////////////////////////////////////////////
$(document).ready(function() {
	LoadTimePickerScript(AllTimePickers);
	// Make all JS-activity for dashboard
	DashboardTabChecker();
	LoadBootstrapValidatorScript(DemoFormValidator);//validaciones
	LoadSelect2Script(DemoSelect2);
	 $('[data-toggle="tooltip"]').tooltip();
	// Create UI spinner
	$("#ui-spinner").spinner();

	// Create Wysiwig editor for textare
	TinyMCEStart('#wysiwig_simple', null);
	TinyMCEStart('#wysiwig_full', 'extreme');
	// Add slider for change test input length
	FormLayoutExampleInputLength($(".slider-style"));
	// Initialize datepicker
	$('#FECHITAM').datepicker({
		setDate : new Date(),
		dateFormat: 'dd/mm/yy',
		changeMonth: true,
  		changeYear: true,
		onSelect: function(dateText, inst) {
			$("#insert").val(dateText);
	}
	});
	
	$('#FECHITAMM').datepicker({
		setDate : new Date(),
		dateFormat: 'dd/mm/yy',
		changeMonth: true,
  		changeYear: true,
		onSelect: function(dateText, inst) {
			$("#insert").val(dateText);
	}
	});
	
	$('#FECHITA').datepicker({
		setDate : new Date(),
		dateFormat: 'dd/mm/yy',
		changeMonth: true,
  		changeYear: true,
		onSelect: function(dateText, inst) {
			$("#insert").val(dateText);
	}
	});
	
	$('#FECHITAA').datepicker({
		setDate : new Date(),
		dateFormat: 'dd/mm/yy',
		changeMonth: true,
  		changeYear: true,
		onSelect: function(dateText, inst) {
			$("#insert").val(dateText);
	}
	});
	// Load Timepicker plugin
	
	// Add tooltip to form-controls
	$('.form-control').tooltip();
	LoadSelect2Script(DemoSelect2);
	// Load example of form validation
	LoadBootstrapValidatorScript(DemoFormValidator);
		
			
});


</script>