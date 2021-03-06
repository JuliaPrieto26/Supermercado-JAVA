<%@page import="java.util.LinkedList"%>
<%@page import="entidades.*"%>
<%@page import="logic.*"%>
<%@ page language="java" contentType="text/html; charset= ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	 <!-- Boostrap para searchbar -->
  <link href="style/search-bar/search-bar.css" rel="stylesheet">
  <link href="style/mainpage/bootstrap.min.css" rel="stylesheet">
  <link href="style/mainpage/modern-business.css" rel="stylesheet">
  <link href="style/clientes-admin/listado-clientes.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="style/clientes-admin/confirmacion.css" rel="stylesheet">  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<title>Clientes</title>

<% LinkedList<Persona> lc = (LinkedList<Persona>)request.getAttribute("listado");
   String descrip= (String)request.getAttribute("descrip");
 %>

</head>
<body>

    <div class="container">
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
   		<a class="navbar-brand" href="mainpage-admin.jsp">Supermercado</a>
   		  
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">

          <li class="nav-item">
            <a class="nav-link" href="ListCategorias">Categorķas</a>
          </li>
          <li class="nav-item">
           <a class="nav-link" href="ListDescuentos">Descuentos</a>
          </li>
          <li class="nav-item active">
	            <a class="nav-link" href="ListClientes">Clientes</a>
	             <span class="sr-only">(current)</span>
          </li>
          <li class="nav-item ">
	            <a class="nav-link" href="ListEmpleados">Empleados</a>
	             
          </li>
          <li class="nav-item">
              <a class="nav-link" href="ListProductos">Productos</a>
          </li>
          <li class="nav-item">
             <a class="nav-link" href="ListPedidos">Pedidos</a>
          </li>
           <li class="nav-item ">
            <a class="nav-link" href="ListProveedores">Proveedores</a>
          </li>
          <li class="nav-item">
              	<a class="nav-link" href="CerrarSesion">Cerrar Sesión</a>
          </li>
        </ul>
      </div>
   </div>
  </nav>
</div>
 
 <hr> 
 <div class="container bootstrap snippets bootdey">
    <div class="row">
    <form class="example" action="ListClientesNombre" style="margin:10px;max-width:300px">
	 <%if (descrip==null){ %>
	  <input type="text" placeholder="Nombre..." name="search2" autocomplete="off">
	  <%}else{ %>
	  <input type="text" placeholder="Nombre..." name="search2" value=<%=descrip%>>
	  <%} %>
	  <button type="submit"><i class="fa fa-search"></i></button>
	</form>
	<%if(lc.size() == 0){ %>  
    <br>         
    <div class="alert alert-warning"> ”Lo sentimos! No hay clientes con ese nombre.</div>                               	
	<%} %>
 
	<br>
	<br>
	<br>
	
 </div>  
 
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                <th align="center"><span>ID</span></th>
                                <th align="center"><span>Nombre</span></th>
                                <th align="center"><span>Apellido</span></th>
                                <th align="center"><span>Tipo Doc</span></th>
                                <th align="center"><span>Nśmero Doc</span></th>
                                <th align="center"><span>Telefono</span></th>
                                <th align="center"><span>Dirección</span></th>
                                <th align="center"><span>Email</span></th>
                               
                                <th align="center"><span>Registro</span></th>
                               
                                <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
	                           <% for (Persona per : lc) { %>
	                    			<tr>
	                    			<td><%=per.getIdPersona() %></td>
                                    <td><%=per.getNombre()%></td>
                                    <td><%=per.getApellido() %></td>
                                    <td><%=per.getTipoDoc()%> </td>
                                    <td><%=per.getNroDoc()%> </td>
                                    <td><%=per.getTelefono() %> </td>
                                    <td><%=per.getDireccion()%> </td>
                                    <td><%=per.getEmail()%> </td>
                             
                                    <td><%=per.getFechaRegistro()%></td>
                                     <td style="width: 10%;">
                                        
                                        <a href="BuscarCliente?id=<%=per.getIdPersona()%>" class="table-link text-info">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                        <a  href="DeleteClientes?id=<%=per.getIdPersona()%>" class="table-link danger" onclick="return confirm('Are you sure you want to delete this item?');" >
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                            </span>
                                            
                                        </a>
                                    
                                    </td>
                                   
    
	                    		</tr>
	                    		   
	                    		
	                    		<% } %>
	                    		
                    		</tbody>	
                        </table>
                    </div>
                </div>
            </div>
           <!--  <span style="text-align: right; vertical-align: bottom;">
            <form action="" method=post">
					<div class="w3-container">	 
						<button class="w3-button w3-xlarge w3-circle w3-teal" type="submit" >+</button>
						<a href=""> Agregar cliente</a>
					</div>
			</form>
			</span>
			-->
        </div>
    </div>
</div>



</body>
</html>