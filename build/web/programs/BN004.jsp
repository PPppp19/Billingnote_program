<%-- 
    Document   : BN001
    Created on : Oct 14, 2021, 11:56:55 AM
    Author     : Jilasak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <style>


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

        .jsgrid-filter-row > .jsgrid-cell{
            background-color: #000000 ;
            color:#f0a8be;
            border-color: #f0a8be;


        }

        .btn-search{
            border-radius: 8px;
            background-color: #bbd3f4;
            border:  solid #f7d9df;
            color: #000000;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

        }
        .btn-print{
            border-radius: 8px;
            background-color: #d55d5a;
            border: solid #f7d9df;
            color: #000000;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

        }

        .btn-print:hover {
            background-color:#8e8e93;
        }

        .btn-print:active {
            position:relative;
            top:1px;
        }

        .btn-update{
            border-radius: 8px;
            background-color: peru;
            border-color: #f4b6fd;
            color: #ffffff;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

        }
        .btn-create:hover {
            background-color:#8e8e93;
        }
        .btn-create:active {
            position:relative;
            top:1px;
        }

        .btn-create{
            border-radius: 8px;
            background-color: #bbd3f4;
            border:  solid #f7d9df;
            color: #000000;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

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

        input{


            background-color : #f7d9df;
            border-radius: 10px;
            border: 1px;
            color: #000000;


        }

        
        .jsgrid-grid-header,
        .jsgrid-grid-body{
            overflow: auto;
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
        <title>Billing Note : BN0001</title>
    </head>
    <body>
        <div class="container" style=" border-radius: 20px 20px 50px 50px; box-shadow: 0px 2px 18px 0px rgba(0,0,0,0.3); background-color: #cd8b9a ">
            <div class="col-lg-12 col-md-12 col-sm-12" style=" border-radius: 20px 20px 0 0;" >
                <div class="row">
                    <div class="panel panel-default container"   style="background-color:#cd8b9a;  border: none; border-radius: 20px 20px 25px 25px;  "  >
                        <div class="panel-heading" style=" background-color: #000000;  border-radius: 20px 20px 0 0;   border: none;">
                            <h3 class="panel-title"> <font color="#cd8b9a" style=" font-weight: bold" >Edit Billing Note</font></h3>
                        </div>  
                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                    <form  method="GET"  id="MyForm" action="./Report" >
                                        <label style=" color: #000000;  font-weight: bold; ">Billing Note Number :
                                            <input  style="background-color : #f7d9df; color: #000000;" type="text" class="form-control text-center" value="" id="vBNNO" name="vBNNO">
                                        </label>
                                        <button class="btn btn-danger" id="vComplete" name="vComplete" type="submit" hidden="true">Complete</button>
                                    </form>
                                </div>
                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Customer Code :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control text-center" value="" id="vCustomer" name="vCustomer" onblur="FuncCheck(this.value);" maxlength="10" readonly="true">
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">Customer Name :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control text-center col-lg-3 col-md-3" value="" id="vPAYERNAME" name="vPAYERNAME" readonly="true" >
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Type : 
                                        <select style="background-color : #000000; color: #cd8b9a;" class="form-control form-control-user" name="vType" id="vType" readonly="true" >
                                            <option value="ESPYNO" selected="selected">PAYER</option>
                                            <option value="ESCUNO">CUSTOMER</option>
                                        </select>
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-2">
                                    <label style=" color: #000000;  font-weight: bold; ">Payment Date :
                                        <input  style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control" id="vTRDT" name="vTRDT" readonly="true" >
                                        <!--                                        <select class="form-control" style="  "width: 115% name="vPeriod"  id="vPeriod">-->
                                        <!--<option value="" selected="selected">Select Payment Date</option>-->
                                        <!--</select> &nbsp;&nbsp;-->
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">PO Number :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="vPO" readonly="true" name="VPO" maxlength="45">
                                    </label>
                                </div> 
                                <br> 
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <!--                                    <button class="btn btn-success" id="vCreate" name="vCreate" type="button">Create</button>-->
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <!--                                    <button class="btn btn-warning" id="vUpdate" name="vUpdate" type="button">Update</button>-->
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">

                                    <button class="btn-create" id="vSearch" name="vSearch" type="button">Search</button>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">

                                </div>

                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <button class="btn-print" id="vPrint" name="vPrint" type="button" >Print</button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">Start Date :
                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="dStart" width="100%" name="dStart" maxlength="45" readonly="true">
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label style=" color: #000000;  font-weight: bold; ">To
                                        <input  style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="dStop" width="100%" name="dStop" maxlength="45" readonly="true" >
                                    </label>
                                </div>
                            </div>
                            <br>
                            <div class="row" >
                                <div id="GridARS200"></div>   
                            </div>
                            <br>
                            <div class="row" >
                                <div id="GridBillingNote" style=" border-radius: 0 0 9px 9px;"></div>   
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>

    <script type="text/javascript">

        var PAYMENTDATA = [];



        $('#vPeriod').change(function () {

            console.log(PAYMENTDATA);
            var e = document.getElementById("vPeriod");
            var start = document.getElementById("dStart");
            var stop = document.getElementById("dStop");


            var value = e.value;
            var text = e.options[e.selectedIndex].text;


            console.log(value);
            console.log(text);

            for (var i = 0; i < PAYMENTDATA.length; i++)
            {
                if (PAYMENTDATA[i].DATE === value)
                {
//                    alert(PAYMENTDATA[i].START + " TO: " + PAYMENTDATA[i].END);
                    start.value = PAYMENTDATA[i].START;
                    stop.value = PAYMENTDATA[i].END;

                }
            }


        });

        function GetPaymentDate(CUNO) {
            console.log("Click");

            var cono = "<%out.print(session.getAttribute("cono"));%>";
//            var date = document.getElementById("vPeriod");

            $.ajax({
                url: './Sync',
                type: 'GET',
                dataType: 'json',
                data: {
                    page: "GetPaymentDate2",
                    CONO: cono,
                    CUNO: CUNO,
                    PYDATE: document.getElementById("vBNNO").value 
                    

                },
                async: false
            }).done(function (response) {

                console.log(response);

                var start = document.getElementById("dStart");
                var stop = document.getElementById("dStop");
                PAYMENTDATA = response;
//                $("#vPeriod").empty();
//                var div_data = "<option value='Select_Date'> SELECT DATE</option>";
//                $(div_data).appendTo('#vPeriod');
                $.each(response, function (i, obj) {

                    start.value = obj.START;
                    stop.value = obj.END;




//                    dept = obj.BPH_BPDT;
//                    const myArray = dept.split(':');
//
//                    $.ajax({
//                    url: './Sync',
//                            type: 'GET',
//                            dataType: 'json',
//                            data: {
//                            page: "checkGrid_ARS200",
//                                    CONO: cono,
//                                    END: obj.END
//
//                            },
//                            async: false
//                    }).done(function (response) {
//                        
//                        console.log(response);
//
//                    });

//
//                    var div_data = "<option value='" + obj.DATE + "'> " + obj.DATE + "</option>";
//                    $(div_data).appendTo('#vPeriod');
                });

            });


        }
        ;



        var input = document.getElementById("vCustomer");

        input.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                var value = document.getElementById("vCustomer").value;
                SearchPY(value);



            }
        });

        $(document).ready(function () {
            document.getElementById("vComplete").style.display = "none";
//            document.getElementById("").readonly = true;
//            location.reload(0);
            $("#vCreate").show();
            $("#vUpdate").hide();
            $("#vSearch").show();
            $("#vPrint").hide();

        });

        $('#vCustomer').on('input', function (evt) {
            $(this).val(function (_, val) {
                return val.toUpperCase();
            });
        });

        $("#vSearch").click(function (e) {

            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            var username = "<%out.print(session.getAttribute("username"));%>";




            $.ajax({
                url: './Sync',
                type: 'GET',
                dataType: 'json',
                data: {
                    page: "Search_BillingNote2",
                    CONO: cono,
                    DIVI: divi,
                    BNNO: $("#vBNNO").val(),
                    USER: username

                },
                async: false
            }).done(function (response) {
                $.each(response, function (i, obj) {
                    document.getElementById("vBNNO").value = obj.HB_BNNO;
                    document.getElementById("vCustomer").value = obj.HB_CUNO;
                    document.getElementById("vTRDT").value = obj.HB_TRDT;
                    document.getElementById("vPO").value = obj.HB_PO;

                    GetPaymentDate(obj.HB_CUNO);
                    SearchPY(obj.HB_CUNO);
                    Call_GridARS200();
                    Call_GridBillingNote();
                    $('#vBNNO').prop('readonly', true);
                    $("#vCreate").hide();
                    $("#vUpdate").show();
                    $("#vSearch").show();
                    $("#vPrint").show();
                });
            });
        });

        $("#vCreate").click(function (e) {
            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            var username = "<%out.print(session.getAttribute("username"));%>";
            var e = document.getElementById("vPeriod");
            var text = e.options[e.selectedIndex].text;

            $.ajax({
                url: './Sync',
                type: 'POST',
                dataType: 'json',
                data: {
                    page: "CreateBillingNote",
                    CONO: cono,
                    DIVI: divi,
                    CUNO: $("#vCustomer").val(),
                    TRDT: text,
                    PONO: $("#vPO").val(),
                    USER: username
                },
                async: false
            }).done(function (response) {

                $.each(response, function (i, obj) {
                    document.getElementById("vBNNO").value = obj.BBNO;
                    alert("Create complete");
                    $('#vBNNO').prop('readonly', true);
                    Call_GridARS200();
                    $("#vCreate").hide();
                    $("#vUpdate").show();
                    $("#vSearch").show();
                    $("#vPrint").show();
                });
            });

        });


        $("#vUpdate").click(function (e) {
            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            var username = "<%out.print(session.getAttribute("username"));%>";
            var e = document.getElementById("vPeriod");
            var text = e.options[e.selectedIndex].text;
            $.ajax({
                url: './Sync',
                type: 'POST',
                dataType: 'json',
                data: {
                    page: "UpdateBillingNote",
                    CONO: cono,
                    DIVI: divi,
                    CUNO: $("#vCustomer").val(),
                    TRDT: text,
                    PONO: $("#vPO").val(),
                    BNNO: $("#vBNNO").val(),
                    USER: username
                },
                async: false
            }).done(function (response) {

            });
            alert("Update complete");
            $("#vSearch").click();
        });

        function FuncCheck(code) {
            SearchPY(code);
            GetPaymentDate(code);


        }
        ;


        function SearchPY(code) {
            var cono = <%out.print(session.getAttribute("cono"));%>
            var divi = <%out.print(session.getAttribute("divi"));%>
            $.ajax({
                url: './Sync',
                type: 'GET',
                dataType: 'json',
                data: {
                    page: "SetnamePayer",
                    cono: cono,
                    divi: divi,
                    code: code
                },
                async: false
            }).done(function (response) {
                $.each(response, function (i, obj) {
                    document.getElementById("vPAYERNAME").value = obj.PAYERNAME;
                });
            });



        }



        function  Call_GridARS200() {
            $("#GridARS200").show();
            console.log("xxx");
            $("#GridARS200").jsGrid({
                width: "100%",
                height: "auto",
                filtering: true,
                inserting: false,
                editing: true,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 200,
//                pageButtonCount: 5,
                controller: {
                    loadData: function (filter) {
                        var data = $.Deferred();
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        var enddate = document.getElementById("dStop").value;

                        $.ajax({
                            type: 'GET',
                            url: './Sync',
                            dataType: 'json',
                            data: {
                                page: "Grid_ARS200",
                                cono: cono,
                                divi: divi,
                                payer: "" + $("#vCustomer").val(),
                                type: $("#vType").val(),
                                ENDDATE: enddate
                            },
                            async: false
                        }).done(function (response) {
//                            console.log(response);
                            response = $.grep(response, function (item) {
                                return (!filter.ESCINO || (item.ESCINO.indexOf(filter.ESCINO) > -1))
                                        && (!filter.ESCINO || (item.ESCINO.indexOf(filter.ESCINO) > -1))
                                        && (!filter.ESCUAM || (item.ESCUAM.indexOf(filter.ESCUAM) > -1));
                            });
                            data.resolve(response);
                        });
                        return data.promise();
                    },
                    updateItem: function (item) {
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        item.page = "InsertLine";
                        item.CONO = cono;
                        item.DIVI = divi;
                        item.BBNO = $("#vBNNO").val();

                        item.INVAMT = item.ESCUAM.replace(/,/g, '');


                        $.ajax({
                            type: "POST",
                            url: "./Sync",
                            dataType: 'json',
                            async: false,
                            cache: false,
                            data: item
                        });

                        Call_GridBillingNote();


                        $("#GridARS200").jsGrid("loadData");

                    }
                },
                fields: [
                    {type: "control", css: "blue-cell", width: 30, deleteButton: false},
                    {title: "Invoice No", css: "blue-cell", width: 60, name: "ESCINO", type: "text", align: "center", editing: false},
                    {title: "Invoice Date", css: "blue-cell", name: "ESIVDT", type: "text", align: "center", editing: false, width: 50},
                    {title: "Invoice Amount", css: "blue-cell", name: "ESCUAM", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40}
                    , {title: "WH\TAX", name: "WHTAX", css: "blue-cell", type: "checkbox", align: "center", filtering: false, width: 30}
                ]
            });

        }

        function  Call_GridBillingNote() {
            $("#GridBillingNote").show();

            $("#GridBillingNote").jsGrid({
                width: "100%",
//                height: "100%",
                filtering: true,
                inserting: false,
                editing: true,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 200,
//                pageButtonCount: 5,
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
//                            console.log(response);
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
                    },
                    updateItem: function (item) {
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        item.page = "UpdateLineInvoice";
                        item.CONO = cono;
                        item.DIVI = divi;
//                        item.BBNO = $("#vBNNO").val();
                        item.INVAMT = item.LB_INVAMT.replace(/,/g, '');
                        item.LB_TAXAMT = item.LB_TAXAMT.replace(/,/g, '');

                        $.ajax({
                            type: "POST",
                            url: "./Sync",
                            dataType: 'json',
                            async: false,
                            cache: false,
                            data: item
                        });
                        Call_GridARS200();
                        $("#GridBillingNote").jsGrid("loadData");
                    },
                    deleteItem: function (item) {
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        item.page = "DeleteLineInvoice";
                        item.LB_CONO = cono;
                        item.LB_DIVI = divi;
//                        item.LB_BBNO = $("#vBNNO").val();
                        $.ajax({
                            type: "POST",
                            url: "./Sync",
                            async: false,
                            cache: false,
                            data: item
                        });
                        $("#GridARS200").jsGrid("loadData");
                        $("#GridBillingNote").jsGrid("loadData");

                    }
                },
                fields: [
                    {type: "control", css: "blue-cell", width: 30},
                    {title: "Invoice No", css: "blue-cell", width: 60, name: "LB_INVNO", type: "text", align: "center", editing: false},
                    {title: "Invoice Date", css: "blue-cell", width: 60, name: "INVDATE", type: "text", align: "center", editing: false},
                    {title: "Invoice Amount", css: "blue-cell", name: "LB_INVAMT", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT Amount", name: "LB_TAXAMT", css: "blue-cell", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "Invoice Balance", name: "BL", css: "blue-cell", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT", name: "LB_WHTAX", css: "blue-cell", type: "checkbox", align: "center", filtering: false, width: 30},
                    {title: "Complete", name: "LB_STS", css: "blue-cell", type: "checkbox", align: "center", filtering: false, width: 30}
                ]
            });

        }

        $("#vPrint").click(function (e) {
            $("#vComplete").click();
        });



    </script>
</html>
