<%-- 
    Document   : BN001
    Created on : Oct 14, 2021, 11:56:55 AM
    Author     : Jilasak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <style>

        .btn-create{
            border-radius: 8px;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;
/*            font-weight: bold;*/

            /*            background-color: #3e1e55;
                        border-color: #f4b6fd;
                        color: #e79cf3;*/


            background-color: #000000;
            border-color: #f0a8be;
            color: #f0a8be;
        }


        .btn-create:hover {
            background-color:#8e8e93;
        }
        .btn-create:active {
            position:relative;
            top:1px;
        }

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Billing Note : BN0002</title>
        <style>


            .jsgrid-header-row>.jsgrid-header-cell {
                
                /*                background-color: #55bdca;
                                color: #a341ce;
                                background-image: linear-gradient(#6fcaf3, #71f5fc);*/

                background-color: #000000;
                color: #ff76d8;
/*                background-image: linear-gradient(#6fcaf3, #71f5fc);*/

            }

            .jsgrid-filter-row > .jsgrid-cell{
                background-color: #440f58 ;
                color:#e79cf3;
                border-color: black;


            }
            .jsgrid-row>.jsgrid-cell.blue-cell {
                background-color: #271756 ;
                color:#e79cf3;
                border-color: black;
            }

            .jsgrid-alt-row>.jsgrid-cell {
                background-color: #440f58;
                color:#e79cf3;
                border-color: black;
            }

            .jsgrid-selected-row1 > .jsgrid-cell {
                border-color: red !important;
                background-color: red !important;
            }

            .jsgrid-row>.jsgrid-cell.red-cell {
                background-color: red ;
                color:white
            }



            .ui-widget *, .ui-widget input, .ui-widget select, .ui-widget button {
                font-family: 'Helvetica Neue Light', 'Open Sans', Helvetica;
                font-size: 14px;
                font-weight: 300 !important;
            }
            .center {


                text-align: center;
            }
            input{


                background-color : #f7d9df;
                color: #000000;
                border-radius: 10px;
                border: 1px;
                border-color:  #f0a8be;
            }

            .btn-search:hover {
                background-color:#8e8e93;
            }

            .btn-search:active {
                position:relative;
                top:1px;
            }

            .btn-search{
                border-radius: 8px;
                background-color: #6fcaf3;
                border-color: #f4b6fd;
                color: #ffffff;
                height: 40px;
                width: 150px;
                border-style: solid;
                border-width: thin;

            }
            
             .jsgrid-nodata-row .jsgrid-cell {
            padding: .5em 0;
            text-align: center;
            background-color: #cd8b9a;
            color: #000000; 
        }
        
        </style>
    </head>
    <body>
        <div class="container">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel panel-default container" style="  box-shadow: 0px 2px 18px 0px rgba(0,0,0,0.3); background-color:#000000; border-width: thin; border-color: #cd8b9a; border-radius: 20px 20px 50px 50px"  >
                        <div class="panel-heading" style="background-color:  #f0a8be;border:none;  font-weight: bold;  border-radius: 20px 20px 0px 0px">
                            <h3 class="panel-title"> <font color="#000000" style=" font-weight: bold"  >Check Invoice Number</font></h3>
                        </div>
                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                            <form  method="POST" enctype="multipart/form-data" acceptcharset="UTF-8" id="MyForm" >
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="center">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <label style="color: #f0a8be; font-weight: bold">Invoice Number : </label>
                                                <input type="text" name="vInv" id="vInv"  style="width: 15%;text-align: center" value="" > 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">

                                </div>                                
                                <br>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="center">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <button class="btn-create"  style="width: 25%" id="vSearch" font-family="" name="vSearch" type="button">Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div> 
        </div>
    </body>

    <script type="text/javascript">

        $("#vSearch").click(function (e) {

            var msg, count;
            var CONO = <%out.print(session.getAttribute("cono"));%>
            var DIVI = <%out.print(session.getAttribute("divi"));%>
            $.ajax({
                type: 'GET',
                url: './Sync',
                dataType: 'json',
                data: {
                    page: "CheckInvoice",
                    CONO: CONO,
                    DIVI: DIVI,
                    Invoice: "" + $("#vInv").val()
                },
                async: false
            }).done(function (response) {
                $.each(response, function (i, obj) {
                    msg = obj.BBNO;
                    count = obj.Count;

                });
            });

            if (count > 0) {
                alert(msg);
            } else {
                alert("Not found!");
            }

        });




    </script>
</html>
