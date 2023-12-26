<%-- 
    Document   : index
    Created on : Jun 14, 2019, 9:32:52 AM
    Author     : Wattana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/jQuery-3.3.1/jquery-ui.min.css">
        <link rel="stylesheet" type="text/css" href="assets/Bootstrap-3.3.7/css/bootstrap.min.css"/>
        <script type="text/javascript" src="assets/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/jQuery-3.3.1/jquery-ui.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

        <link rel="stylesheet" type="text/css" href="assets/jsgrid-1.5.3/dist/jsgrid.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/jsgrid-1.5.3/dist/jsgrid-theme.min.css">
        <script type="text/javascript" src="assets/jsgrid-1.5.3/dist/jsgrid.min.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.core.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.validation.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.load-indicator.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.load-strategies.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.sort-strategies.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.field.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.text.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.number.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.select.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.checkbox.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.control.js"></script>
        <link rel="icon" type="image/icon" href="images/image.jpg" />

    </head>
    <body style=" background: linear-gradient(#cd8b9a 50% ,#000000  );  background-repeat: no-repeat;   background-attachment: fixed;">
        <div>
            <nav class="navbar navbar-default navigation-clean" style=" background-color: #333333; border-color: #000000; border-radius: 0 0 0 0; "  >
                <div class="container" >
                    <div class="navbar-header">
                        <a class="navbar-brand" href="./" style=" color:#000000; background-color: #ee9eb3;  margin-right:     25px;  border-color: #000000; font-weight:1000;"></a>
                        <a class="navbar-brand" href="./" style=" color:#000000; background-color: #ee9eb3;  margin-right:     25px;  border-color: #000000; font-weight:1000;"></a>
                        <a class="navbar-brand" href="./" style=" color:#000000; background-color: #ee9eb3;  margin-right:     25px;  border-color: #000000; font-weight:1000;"></a>
                        <a class="navbar-brand" href="./" style="color:#000000; background-color: #ee9eb3;  margin-right:     25px;  border-color: #000000; font-weight:1000;"></a>
                        
                        <a class="navbar-brand" href="./" style="color:#000000; background-color: #ee9eb3;   border-color: #000000; font-weight: 1000;">BR GROUP</a>
                        <a class="navbar-brand" href="./" style=" margin-left:  0px;color:#ee9eb3; background-color: #000000;   border-color: #ee9eb3; font-weight: 1000;">Billing Note</a>
                        
                        <a class="navbar-brand" href="./" style=" color:#ee9eb3; background-color: #000000;  margin-left:    10px;  border-color: #ee9eb3; font-weight: 1000;"></a>
                        <a class="navbar-brand" href="./" style="  color:#ee9eb3; background-color: #000000;  margin-left:    10px;  border-color: #ee9eb3; font-weight: 1000;"></a>
                        <a class="navbar-brand" href="./" style="  color:#ee9eb3; background-color: #000000;  margin-left:    10px;  border-color: #ee9eb3; font-weight: 1000;"></a>
                        <a class="navbar-brand" href="./" style="  color:#ee9eb3; background-color: #000000;  margin-left:    10px;  border-color: #ee9eb3; font-weight: 1000;"></a>


                        <button data-toggle="collapse" class="navbar-toggle collapsed" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
                            <span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav navbar-right">

                            <li role="presentation"></li>
                            <!--                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="./"style="color: black">Programs&nbsp;<span class="caret"></span></a>
                                                            <ul class="dropdown-menu" role="menu">
                                                                <li role="presentation"><a class='dropdown-item'  href="?page=BN000">BN000 : Billing Board</a></li>
                                                                                                    <li role="presentation"><a class='dropdown-item'  href="?page=BN001">BN001 : Billing Note</a></li>
                                                                <li role="presentation"><a class='dropdown-item'  href="?page=BN002">BN002 : Monitoring</a></li>
                                                                <li role="presentation"><a class='dropdown-item'  href="?page=BN003">BN003 : Search Invoice</a></li>
                                                                <li role="presentation"><a class='dropdown-item'  href="?page=BN004">BN004 : Edit Billing Note</a></li>
                            
                                                            </ul>
                                                        </li>-->
                            <li role="presentation"><a class='dropdown-item' style="font-weight: bold;color: #ffffff;font-size: 16px" href="?page=BN000">Billing Note</a></li>
                            <li role="presentation"><a class='dropdown-item' style="font-weight: bold;color: #ffffff;font-size: 16px" href="?page=BN004">Edit Billing</a></li>
                            <li role="presentation"><a class='dropdown-item' style="font-weight: bold;color: #ffffff;font-size: 16px" href="?page=BN002">Monitoring</a></li>
                            <li role="presentation"><a class='dropdown-item' style="font-weight: bold;color: #ffffff;font-size: 16px" href="?page=BN003">Search Invoice</a></li>

                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <form action="Logout" method="POSTs">
                                        <input style="color: #ffffff; background-color: #000000; border-color: #f0a8be;"  type="submit" value="Sign Out">

                                    </form>
                                </a>
                            </li>
                        </ul>

                    </div>
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
                </div>
            </nav>
        </div>
        <section id="programs">
            <div class='centerDiv' id="vSection"></div>
        </section>
    </body>
</html>

<script type="text/javascript">

    <% if (request.getParameter("page") != null) {%>
    $("#vSection").load("./programs/<%=request.getParameter("page").toString()%>.jsp");
    <%  } else {  %>
//    $("#vSection").load("./programs/Main.jsp");
//    $("#vSection").load("./programs/BN001.jsp");
    $("#vSection").load("./programs/BN000.jsp");
    <% }%>


    $('.dropdown-item').on('click', function () {
        console.log(this.name);
        $("#vSection").load("./programs/" + this.name + ".jsp");
    });

</script>