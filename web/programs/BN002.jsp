<%-- 
    Document   : BN001
    Created on : Oct 14, 2021, 11:56:55 AM
    Author     : Jilasak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>


        .jsgrid-grid-header,
        .jsgrid-grid-body{
            overflow: auto;
            border: none;
        }


        .btn-refresh{
            border-radius: 8px;
            background-color: #000000;
            border-color: #cd8b9a;
            color: #cd8b9a;
            /*            font-weight: bold;*/
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

        }

        .btn-refresh:hover {
            background-color:#8e8e93;
        }

        .btn-refresh:active {
            position:relative;
            top:1px;
        }

        .jsgrid-filter-row > .jsgrid-cell{
            background-color: #000000 ;
            color:#f0a8be;
            border-color: #f0a8be;


        }
        .jsgrid-row>.jsgrid-cell.blue-cell {
            background-color: #F3B9CB ;
            color:#000000;
            border-color: #cd8b9a;
        }

        .jsgrid-alt-row>.jsgrid-cell {
            background-color: #F3B9CB;
            color:#000000;
            border-color: #cd8b9a;
        }

        .jsgrid-selected-row1 > .jsgrid-cell {
            border-color: red !important;
            background-color: red !important;
        }

        .jsgrid-row>.jsgrid-cell.red-cell {
            background-color: red ;
            color:white
        }

        .jsgrid-header-row>.jsgrid-header-cell {
            background-color: #000000;
            color: #cd8b9a;
            border : none;
            /*            background-image: linear-gradient(#6fcaf3, #71f5fc);*/
            /*                       
                        font-family: "Roboto Slab";
                        background-image: linear-gradient(#1c385c, #6b808d);
            
                        font-size: 1.2em;
                        font-weight: normal;
                        align-content: center;
                        text-align: center;
                        align-self: center;*/
        }

        input{


            background-color : #f7d9df;
            border-radius: 10px;
            border: 1px;
            color: #000000;
      
            
        }
        
         .jsgrid-nodata-row .jsgrid-cell {
            padding: .5em 0;
            text-align: center;
            background-color: #cd8b9a;
            color: #000000; 
        }
        

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Billing Note : BN0002</title>
    </head>
    <body >
        <div class="container"   >
            <button class="btn-refresh" onclick="location.reload(0);">Refresh</button>
            <br>
            <br>
         
            <div class="col-lg-12 col-md-12 col-sm-12" style="box-shadow: 0px 2px 18px 0px rgba(0,0,0,0.3);  border-radius: 20px 20px 50px 50px; background-color: #f3b9cb " >
                <div class="row" id="form"  style=" border-radius: 20px 20px 0 0;">
                    <div class="panel panel-default container" style=" border-radius: 20px 20px 0 0; border: none;"  >
                        <div class="panel-heading" style=" border: none;  background-color: #000000; border-radius: 20px 20px 0 0; ">
                            <h3 class="panel-title"> <font color="#f7d9df" style=" font-weight: bold;"  >Billing Note</font></h3>
                        </div>  
                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12 "  style="background-color:#cd8b9a; " >
                            <div class="row" >
                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Customer Code :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control text-center" value="" id="vCustomer" name="vCustomer" onblur="SearchPY(this.value);" maxlength="10" readonly="true" >
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">Customer Name :
                                        <input  style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control text-center col-lg-3 col-md-3" value="" id="vPAYERNAME" name="vPAYERNAME" readonly="true" >
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Billing Note Number :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control text-center" value="" id="vBNNO" name="vBNNO" readonly="true" >
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Transaction Date :
                                        <input  style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control" id="vTRDT" name="vTRDT" readonly="true" >
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">PO Number :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="vPO" name="VPO" maxlength="45" readonly="true" >
                                    </label>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row"  style=" border: none">
                    <div id="GridMonitor" style="  border:none;  border-radius: 20px 20px 25px 25px; "></div>   
                </div>
                <br>
                <div class="row" >
                    <div id="GridBillingNote" style="  border:none;  border-radius: 20px 20px 25px 25px; "></div>   
                </div>
            </div>
        </div>
    </body>

    <script type="text/javascript">


        $(document).ready(function () {
            document.getElementById("form").style.display = "none";
            Call_Monitor();
        });
        function  Call_GridBillingNote() {
            $("#GridBillingNote").show();
            $("#GridBillingNote").jsGrid({
                width: "100%",
                filtering: true,
                inserting: false,
                editing: false,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 200,
                controller: {
                    loadData: function (filter) {
                        var data = $.Deferred();
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        $.ajax({
                            type: 'GET',
                            url: './Sync',
                            dataType: 'json',
                            data: {
                                page: "Grid_BillingNote",
                                CONO: cono,
                                DIVI: divi,
                                BNNO: "" + $("#vBNNO").val()
                            },
                            async: false
                        }).done(function (response) {
                            response = $.grep(response, function (item) {
                                return (!filter.LB_INVNO || (item.LB_INVNO.indexOf(filter.LB_INVNO) > -1))
                                        && (!filter.LB_INVDT || (item.LB_INVDT.indexOf(filter.LB_INVDT) > -1))
                                        && (!filter.LB_INVAMT || (item.LB_INVAMT.indexOf(filter.LB_INVAMT) > -1))
                                        && (!filter.LB_TAXAMT || (item.LB_TAXAMT.indexOf(filter.LB_TAXAMT) > -1))
                                        && (!filter.BL || (item.BL.indexOf(filter.BL) > -1))
                                        && (!filter.LB_INVAMT || (item.LB_INVAMT.indexOf(filter.LB_INVAMT) > -1));
                            });
                            data.resolve(response);
                        });
                        return data.promise();
                    }
                },
                fields: [
                    {title: "Invoice No", css: "blue-cell", width: 60, name: "LB_INVNO", type: "text", align: "center", editing: false},
                    {title: "Invoice Date", css: "blue-cell", width: 60, name: "INVDATE", type: "text", align: "center", editing: false},
                    {title: "Invoice Amount", css: "blue-cell", name: "LB_INVAMT", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT Amount", css: "blue-cell", name: "LB_TAXAMT", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "Invoice Balance", css: "blue-cell", name: "BL", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT", css: "blue-cell", name: "LB_WHTAX", type: "checkbox", align: "center", filtering: false, width: 30},
                    {title: "Complete", css: "blue-cell", name: "LB_STS", type: "checkbox", align: "center", filtering: false, width: 30}
                ]
            });
        }


        function  Call_Monitor() {
            $("#GridMonitor").show();
            $("#GridMonitor").jsGrid({
                width: "100%",
                filtering: true,
                inserting: false,
                editing: true,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 200,
                controller: {
                    loadData: function (filter) {
                        var data = $.Deferred();
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        var username = "<%out.print(session.getAttribute("username"));%>";
                        $.ajax({
                            type: 'GET',
                            url: './Sync',
                            dataType: 'json',
                            data: {
                                page: "Monitoring",
                                CONO: cono,
                                DIVI: divi,
                                USER: username
                            },
                            async: false
                        }).done(function (response) {
                            response = $.grep(response, function (item) {
                                return (!filter.HB_BNNO || (item.HB_BNNO.indexOf(filter.HB_BNNO) > -1))
                                        && (!filter.HB_TRDT || (item.HB_TRDT.indexOf(filter.HB_TRDT) > -1))
                                        && (!filter.HB_CUNO || (item.HB_CUNO.indexOf(filter.HB_CUNO) > -1))
                                        && (!filter.HB_CUNO || (item.HB_CUNO.indexOf(filter.HB_CUNO) > -1))
                                        && (!filter.HB_STS || (item.HB_PO.indexOf(filter.HB_STS) > -1));
                            });
                            data.resolve(response);
                        });
                        return data.promise();
                    }
                },
                fields: [
                    {title: "Biiling No.", css: "blue-cell", width: 40, name: "HB_BNNO", type: "text", align: "center", editing: false},
                    {title: "Date", width: 40, css: "blue-cell", name: "H_DATE", type: "text", align: "center", editing: false},
                    {title: "Code", name: "E_NAME", css: "blue-cell", type: "text", align: "center", filtering: false},
                    {title: "PO", name: "HB_PO", css: "blue-cell", type: "text", align: "center", filtering: false}
                    , {title: "Status", width: 40, name: "HB_STS", css: "blue-cell", type: "text", align: "center", filtering: true}

                ], rowClick: function (args) {
                    showDetailsDialog1("GET", args.item);
                }
            });
        }

        var showDetailsDialog1 = function (dialogType, client) {
            $("#GridMonitor").hide();
            document.getElementById("form").style.display = "";
            document.getElementById("vBNNO").value = client.HB_BNNO;
            document.getElementById("vCustomer").value = client.HB_CUNO;
            document.getElementById("vPAYERNAME").value = client.OKCUNM;
            document.getElementById("vTRDT").value = client.H_DATE;
            document.getElementById("vPO").value = client.HB_PO;
            Call_GridBillingNote();
        };
    </script>
</html>
