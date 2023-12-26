<%-- 
    Document   : BN001
    Created on : Oct 14, 2021, 11:56:55 AM
    Author     : Jilasak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    

   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Billing Note : BN0001</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="row">
                    <div class="panel panel-default container"  >
                        <div class="panel-heading" style="background-color: #999999">
                            <h3 class="panel-title"> <font color="#FFFFFF" >Billing Note</font></h3>
                        </div>  
                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                            <div class="row">
                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">
                                    <label >Customer Code :
                                        <input type="text" class="form-control text-center" value="" id="vCustomer" name="vCustomer" onblur="FuncCheck(this.value);" maxlength="10">
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label>Customer Name :
                                        <input type="text" class="form-control text-center col-lg-3 col-md-3" value="" id="vPAYERNAME" name="vPAYERNAME" readonly="true" >
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                    <form  method="GET"  id="MyForm" action="./Report" >
                                        <label>Billing Note Number :
                                            <input type="text" class="form-control text-center" value="" id="vBNNO" name="vBNNO">
                                        </label>
                                        <button class="btn btn-danger" id="vComplete" name="vComplete" type="submit" hidden="true">Complete</button>
                                    </form>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                    <label>Type : 
                                        <select class="form-control form-control-user" name="vType" id="vType">
                                            <option value="ESPYNO" selected="selected">PAYER</option>
                                            <option value="ESCUNO">CUSTOMER</option>
                                        </select>
                                    </label>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <br>
                                    <button class="btn btn-primary" id="vSearch" name="vSearch" type="button">Search</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-2">
                                    <label>Payment Date :
                                        <!--                                        <input type="date" class="form-control" id="vTRDT" name="vTRDT">-->
                                        <select class="form-control" style="  "width: 115% name="vPeriod"  id="vPeriod">
                                            <option value="" selected="selected">Select Payment Date</option>
                                        </select> &nbsp;&nbsp;
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label>PO Number :
                                        <input type="text" class="form-control col-lg-3 col-md-3" id="vPO" name="VPO" maxlength="45">
                                    </label>
                                </div> 
                                <br> 
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <button class="btn btn-success" id="vCreate" name="vCreate" type="button">Create</button>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <button class="btn btn-warning" id="vUpdate" name="vUpdate" type="button">Update</button>
                                </div>

                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                    <button class="btn btn-danger" id="vPrint" name="vPrint" type="button" >Print</button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label>Start Date :
                                        <input type="text" class="form-control col-lg-3 col-md-3" id="dStart" width="100%" name="dStart" maxlength="45">
                                    </label>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <label>To
                                        <input type="text" class="form-control col-lg-3 col-md-3" id="dStop" width="100%" name="dStop" maxlength="45">
                                    </label>
                                </div>
                            </div>
                            <br>
                            <div class="row" >
                                <div id="GridARS200"></div>   
                            </div>
                            <br>
                            <div class="row" >
                                <div id="GridBillingNote"></div>   
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
                    page: "GetPaymentDate",
                    CONO: cono,
                    CUNO: CUNO

                },
                async: false
            }).done(function (response) {

                console.log(response);
                PAYMENTDATA = response;
                $("#vPeriod").empty();
                var div_data = "<option value='Select_Date'> SELECT DATE</option>";
                $(div_data).appendTo('#vPeriod');
                $.each(response, function (i, obj) {
                    dept = obj.BPH_BPDT;
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


                    var div_data = "<option value='" + obj.DATE + "'> " + obj.DATE + "</option>";
                    $(div_data).appendTo('#vPeriod');
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
                    page: "Search_BillingNote",
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
                    //document.getElementById("vTRDT").value = obj.HB_TRDT;
                    document.getElementById("vPO").value = obj.HB_PO;

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
                    {type: "control", width: 30, deleteButton: false},
                    {title: "Invoice No", width: 60, name: "ESCINO", type: "text", align: "center", editing: false},
                    {title: "Invoice Date", name: "ESIVDT", type: "text", align: "center", editing: false, width: 50},
                    {title: "Invoice Amount", name: "ESCUAM", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40}
                    , {title: "WH\TAX", name: "WHTAX", type: "checkbox", align: "center", filtering: false, width: 30}
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
                    {type: "control", width: 30},
                    {title: "Invoice No", width: 60, name: "LB_INVNO", type: "text", align: "center", editing: false},
                    {title: "Invoice Date", width: 60, name: "INVDATE", type: "text", align: "center", editing: false},
                    {title: "Invoice Amount", name: "LB_INVAMT", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT Amount", name: "LB_TAXAMT", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "Invoice Balance", name: "BL", type: "text", align: "right", editing: false,
                        itemTemplate: function (value) {
                            return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                        }, width: 40},
                    {title: "WHT", name: "LB_WHTAX", type: "checkbox", align: "center", filtering: false, width: 30},
                    {title: "Complete", name: "LB_STS", type: "checkbox", align: "center", filtering: false, width: 30}
                ]
            });

        }

        $("#vPrint").click(function (e) {
            $("#vComplete").click();
        });



    </script>
</html>
