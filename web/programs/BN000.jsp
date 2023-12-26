<%-- 
    Document   : BN000
    Created on : Mar 30, 2023, 1:16:50 PM
    Author     : Phongsathon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>


        .jsgrid-nodata-row .jsgrid-cell {
            padding: .5em 0;
            text-align: center;
            background-color: #cd8b9a;
            color: #000000;
        }

        .jsgrid-grid-header,
        .jsgrid-grid-body{
            overflow: auto;
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

        .jsgrid-filter-row > .jsgrid-cell{
            background-color: #000000 ;
            color:#f0a8be;
            border-color: #f0a8be;


        }


        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
            background-color: red;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #aacfb0;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }


        .close2 {
            position: absolute;
            right: 20px;
            top: 10px;
            width: 32px;
            height: 32px;
            opacity: 0.5;
        }
        .close2:hover {
            opacity: 1;
        }
        .close2:before, .close2:after {
            position: absolute;
            left: 15px;
            content: ' ';
            height: 33px;
            width: 2px;
            background-color: #f3d7f3;
        }
        .close2:before {
            transform: rotate(45deg);
        }
        .close2:after {
            transform: rotate(-45deg);
        }

        .close1 {
            position: absolute;
            right: 20px;
            top: 10px;
            width: 32px;
            height: 32px;
            opacity: 0.5;
        }
        .close1:hover {
            opacity: 1;
        }
        .close1:before, .close1:after {
            position: absolute;
            left: 15px;
            content: ' ';
            height: 33px;
            width: 2px;
            background-color: #f3d7f3;
        }
        .close1:before {
            transform: rotate(45deg);
        }
        .close1:after {
            transform: rotate(-45deg);
        }
        .btn-create{
            border-radius: 8px;
            background-color: #000000;
            border-color: #f4b6fd;
            color: #cd8b9a;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

        }

        .btn-update{
            border-radius: 8px;
            background-color: #cd7f4b;
            border: solid #f7d9df;
            color: #000000;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: thin;

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

        .btn-update:hover {
            background-color:#8e8e93;
        }

        .btn-update:active {
            position:relative;
            top:1px;
        }

        .btn-print:hover {
            background-color:#8e8e93;
        }

        .btn-print:active {
            position:relative;
            top:1px;
        }

        .btn-search:hover {
            background-color:#8e8e93;
        }

        .btn-search:active {
            position:relative;
            top:1px;
        }


        .btn-create:hover {
            background-color:#8e8e93;
        }
        .btn-create:active {
            position:relative;
            top:1px;
        }

        input {

            background-color : #F7D9DF;
            border-radius: 10px;
            border: 1px;
            color: #3f0c54



        }

        .btn-export {
            box-shadow:inset 0px 1px 3px 0px #91b8b3;
            background-color:#2c2c2e;
            border-radius:5px;
            border:1px solid #1c1c1e;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:13px;
            font-weight:bold;
            padding:11px 23px;
            text-decoration:none;
            text-shadow:0px -1px 0px #2b665e;
            position:absolute;
            align-content: center;
            text-align: right;
            /*            margin: 10px;*/
            /*width: 100%*/


        }
        .btn-export:hover {
            background-color:#8e8e93;
        }
        .btn-export:active {
            position:relative;
            top:1px;
        }


        .btn-create{
            border-radius: 8px;
            background-color: #000000;
            border: 20px solid #f7d9df;
            color: #cd8b9a;
            height: 40px;
            width: 150px;
            border-style: solid;
            border-width: medium;


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

        .bg-red td {
            background-color: red ;
            color:white
        }

        .bg-green td {
            background-color: white ;
            color:#000000
        }

        /* The container */
        .container1 {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Hide the browser's default checkbox */
        .container1 input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
            height: 0;
            width: 0;
        }

        /* Create a custom checkbox */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 25px;
            width: 25px;
            background-color: #ffe2ff;
        }

        /* On mouse-over, add a grey background color */
        .container1:hover input ~ .checkmark {
            background-color: #ccc;
        }

        /* When the checkbox is checked, add a blue background */
        .container1 input:checked ~ .checkmark {
            background-color: #aacfb0;
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the checkmark when checked */
        .container1 input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the checkmark/indicator */
        .container1 .checkmark:after {
            left: 9px;
            top: 5px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 3px 3px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
        }


    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    </head>
    <body >
        <div class="row">
            <div  id="GridBP" ></div>   
        </div>

        <div id="frm_create" class="modal" style="position: fixed;
             left: 0;
             top: 0;
             width: 100%;
             height: 100%;
             overflow: auto;
             border: none;
             background-color: #cd8b9a;
             background-color: rgba(0,0,0,0.4);  "  >
            <div class="modal-content"  style="background-color: #cd8b9a; border: none;">
                <div class="panel panel-default"  >
                    <div class="panel-heading" style="background-color: #000000; border: none; border-radius: 2.5px;margin-left: -15px;">
                        <span class="close1"   style=" color: #f3d7f3; border: none;" ></span>
                        <!--                          &nbsp;&nbsp;&nbsp;<input type="checkbox" id="isactive" name="isactive" value="isactive" style="display: inline-block; size: 15px;">               -->
                        <label class="panel-title" style="margin-left: 10px; font-size: 22px" > <font id="tabletitle" color="#cd8b9a">BILLING NOTE</font></label>

                    </div>

                    <div class=" panel-body "  style="background-color: #cd8b9a; border: none;" >
                        <div class="container" style="border: none;">
                            <div class="col-lg-12 col-md-12 col-sm-12"  style="border: none;  box-shadow: 0px 2px 18px 0px rgba(0,0,0,0.3); border-radius: 20px 20px 25px 25px">
                                <div class="row">
                                    <div class="panel panel-default container"  style="border: none; border-radius: 20px 20px 0 0" >
                                        <div class="panel-heading" style="background-color: #000000; border: none; border-radius: 20px 20px 0 0 ">
                                            <h3 class="panel-title"> <font style=" color: #cd8b9a;  font-weight: bold; " >Billing Note</font></h3>
                                        </div>  
                                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color:#cd8b9a">
                                            <div class="row">
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">
                                                    <label style=" color: #000000;  font-weight: bold; ">Customer Code :
                                                        <input type="text" class="form-control text-center" value="" id="vCreCustomer" name="vCreCustomer" onblur="FuncCheck(this.value);" maxlength="10" style="background-color : #f7d9df; color: #000000; ">
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label style=" color: #000000;  font-weight: bold; " >Customer Name :
                                                        <input type="text" class="form-control text-center col-lg-3 col-md-3" value="" id="vCrePAYERNAME" name="vCrePAYERNAME" readonly="true" style="background-color : #000000; color: #cd8b9a;">
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                                    <form  method="GET"  id="MyForm" action="./Report" >
                                                        <label style=" color: #000000;  font-weight: bold; ">Billing Note Number :
                                                            <input type="text" class="form-control text-center" value="" id="vCreBNNO" name="vCreBNNO" readonly="true" style="background-color : #f7d9df; color: #000000;">
                                                        </label>
                                                    </form>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                                    <label style=" color: #000000;  font-weight: bold; ">Type : 
                                                        <select class="form-control form-control-user" name="vCreType" id="vCreType" style="background-color : #f7d9df; color: #000000; font-weight: bold;  ">
                                                            <option value="ESPYNO" selected="selected">PAYER</option>
                                                            <option value="ESCUNO">CUSTOMER</option>
                                                        </select>
                                                    </label>
                                                </div>
                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                    <br>
                                                    <button class="btn-search" id="vSearch" name="vSearch" type="button">Search</button>
                                                </div>


                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                    <br>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-2">
                                                    <label style=" color: #000000;  font-weight: bold; ">Billing  :
                                                        <!--                                        <input type="date" class="form-control" id="vTRDT" name="vTRDT">-->
                                                        <select class="form-control" width: 115% name="vCrePeriod1"  id="vCrePeriod1" style="background-color : #f7d9df; color: #000000;">
                                                            <option value="" selected="selected">Select Billing </option>
                                                        </select> &nbsp;&nbsp;

                                                        <input type="DATE" class="form-control col-lg-3 col-md-3" id="vPeriodD2" name="vPeriodD2" maxlength="45" style=" display: none;">

                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label style=" color: #000000;  font-weight: bold; ">PO Number :
                                                        <input type="text" class="form-control col-lg-3 col-md-3" id="vCrePO" name="VCrePO" maxlength="45" style="background-color : #f7d9df; color: #000000;">
                                                    </label>
                                                </div> 
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label style=" color: #000000; visibility: hidden; font-weight: bold; ">PO Number :
                                                    </label>
                                                    <br>
                                                    <input type="checkbox" id="myCheck1" class="container" onclick="myFunction1()">
                                                </div> 



                                                <br>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label style=" color: #000000;  font-weight: bold; ">Start Date :
                                                        <input type="text" class="form-control col-lg-3 col-md-3" id="dCreStart" width="100%" name="dCreStart" maxlength="45" style="background-color : #000000; color: #cd8b9a;">
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label style=" color: #000000;  font-weight: bold; ">To
                                                        <input   type="text" class="form-control col-lg-3 col-md-3" id="dCreStop" width="100%" name="dCreStop" maxlength="45" style="background-color : #000000; color: #cd8b9a;">
                                                    </label>
                                                </div>


                                                <br>

                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"> </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"> </div>
                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">

                                                    <!--                                                    <button class="btn-create" id="vCreate1" name="vCreate" type="button">Create</button>-->
                                                </div>
                                            </div>
                                            <br>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div id="frm_sublot" class="modal" style="position: fixed;

             left: 0;
             top: 0;
             width: 100%;
             height: 100%;
             overflow: auto;

             " >

            <div class="modal-content" style="background-color: #cd8b9a; border-radius: 0 0 25px 25px" >
                <div class="panel panel-default " style="background-color: red; border: none"  >
                    <div class="panel-heading" style="background-color: black; border-color: #000000; border-radius: 2.5px;margin-left: -15px;">
                        <span class="close2" style="  color: #f3d7f3"></span>
                        <!--                          &nbsp;&nbsp;&nbsp;<input type="checkbox" id="isactive" name="isactive" value="isactive" style="display: inline-block; size: 15px;">               -->
                        <label class="panel-title" style="margin-left: 10px; font-size: 22px; color: #cd8b9a; "> <font id="tabletitle1" >BILLING NOTE</font></label>

                    </div>

                    <div class=" panel-body " style="background-color:#cd8b9a;" >
                        <div class="container" >
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="row">
                                    <div class="panel panel-default container"  >
                                        <div class="panel-heading" id="bgcolor" >
                                            <h3 class="panel-title" > <font color="#000000" >Billing Note</font></h3>
                                        </div>  
                                        <div class="container panel-body col-xs-12 col-sm-12 col-md-12 col-lg-12 " style=" background-color: #cd8b9a">
                                            <div class="row">
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2">
                                                    <label  style=" color: #000000;  font-weight: bold; " >Customer Code :
                                                        <input type="text" style="background-color : #ffe2ff; color: #000000;" class="form-control text-center" value="" id="vCustomer" name="vCustomer" onblur="FuncCheck(this.value);" maxlength="10">
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label  style=" color: #000000;  font-weight: bold; " >Customer Name :
                                                        <input type="text" style="background-color : #000000; color: #cd8b9a;" class="form-control text-center col-lg-3 col-md-3" value="" id="vPAYERNAME" name="vPAYERNAME" readonly="true" >
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                                    <form  method="GET"  id="MyForm" action="./Report"  >
                                                        <label  style=" color: #000000;  font-weight: bold; " >Billing Note Number :
                                                            <input type="text" style="background-color : #ffe2ff; color: #000000;" class="form-control text-center" value="" id="vBNNO" name="vBNNO"  >
                                                        </label>

                                                        <!--<label  style=" color: #000000;  font-weight: bold; ">Transaction Date :-->
                                                        <!--                                                        <input  style="background-color : #ffe2ff; width: 100%; color: #000000;" type="date" class="form-control col-lg-3 col-md-3" id="vTrdt" name="vTrdt"  maxlength="45">-->
                                                        <!--</label>-->

                                                        <button class="btn btn-danger" id="vComplete" name="vComplete" type="submit" formtarget="_blank" hidden="true">Complete</button>


                                                    </form>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                                                    <label  style=" color: #000000;  font-weight: bold; " >Type : 
                                                        <select class="form-control form-control-user" name="vType" id="vType" style="background-color : #ffe2ff; color: #000000;">
                                                            <option value="ESPYNO" selected="selected">PAYER</option>
                                                            <option value="ESCUNO">CUSTOMER</option>
                                                        </select>
                                                    </label>
                                                </div>


                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                    <br>
                                                    <!--                                                    <button class="btn-search" id="vSearch" name="vSearch" type="button">Search</button>-->
                                                    <button class="btn-create" id="vCreate1" name="vCreate" type="button">Create</button>

                                                </div>


                                            </div>
                                            <div class="row">
                                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-2">
                                                    <label  style=" color: #000000;  font-weight: bold; " >Transaction Date :
                                                        <!--                                                                                                <input type="date" class="form-control" id="vTRDT" name="vTRDT">-->
                                                        <select  id="vCrePeriod" name="vCrePeriod" style="background-color : #ffe2ff; color: #000000;" class="form-control" style="  "width: 115% namvcreate >
                                                            <option value="" selected="selected">Select Billing</option>
                                                        </select> &nbsp;&nbsp;


                                                        <input type="DATE" class="form-control col-lg-3 col-md-3" id="vPeriodD" name="vPeriodD"  style=" color: #000000; background-color: #ffe2ff; display: none;" maxlength="45">

                                                    </label>
                                                </div>

                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label  style=" color: #000000;  font-weight: bold; ">PO Number :
                                                        <input  style="background-color : #ffe2ff; color: #000000;" type="text" class="form-control col-lg-3 col-md-3" id="vPO" name="VPO" maxlength="45">
                                                    </label>
                                                </div> 



                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">

                                                    <br>


                                                    <label class="container1">
                                                        <input type="checkbox" id="myCheck"  onclick="myFunction1()">
                                                        <span class="checkmark"></span>
                                                    </label>

                                                </div>


                                                <br>




                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                    <button class="btn-update" id="vUpdate" name="vUpdate" type="button">Update</button>
                                                </div>
                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">

                                                </div>

                                                <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                    <button class="btn btn-print" id="vPrint" name="vPrint" type="button" >Print</button>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label  style=" color: #000000;  font-weight: bold; ">Start Date :
                                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="dStart" width="100%" name="dStart" maxlength="45">
                                                    </label>
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label  style=" color: #000000;  font-weight: bold; ">To
                                                        <input style="background-color : #000000; color: #cd8b9a;" type="text" class="form-control col-lg-3 col-md-3" id="dStop" width="100%" name="dStop" maxlength="45">
                                                    </label>
                                                    <!--                                                                                                    </div>
                                                                                                                                                               <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1">
                                                                                                        </div>-->
                                                </div>
                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                                    <label  style=" color: #000000;  font-weight: bold; ">Completed
                                                    </label>
                                                    <br>
                                                    <label class="switch">
                                                        <input type="checkbox" id="switchchk"   onclick="myFunction()">
                                                        <span class="slider"></span>
                                                    </label>

                                                </div>
                                                <br>
                                                <div>
                                                    <div id="GridARS200"></div>   
                                                </div>
                                                <br>
                                                <div>
                                                    <div id="GridBillingNote"></div>   
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<script>


    function myFunction() {

        var switchchk = document.getElementById("switchchk");
        var bgcolor = document.getElementById("bgcolor");
        var searchbtn = document.getElementById("vSearch");
        var printbtn = document.getElementById("vPrint");
        var updatebtn = document.getElementById("vUpdate");

        //id="bgcolor" style="background-color: red"


        if (switchchk.checked === true)
        {
            bgcolor.style.backgroundColor = '#aacfb0';
            searchbtn.style.backgroundColor = '#808080';
            printbtn.style.backgroundColor = '#808080';
            updatebtn.style.backgroundColor = '#808080';

            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            var username = "<%out.print(session.getAttribute("username"));%>";
            var BNNO = document.getElementById("vBNNO").value;

            $.ajax({
                url: './Sync',
                type: 'GET',
                data: {
                    page: "UpdateStatus",
                    CONO: cono,
                    DIVI: divi,
                    BNNO: BNNO,
                    USER: username,
                    STS: "20"

                },
                async: false
            });

        } else
        {
            bgcolor.style.backgroundColor = '#c0837c';
            searchbtn.style.backgroundColor = '#bbd3f4';
            printbtn.style.backgroundColor = '#d55d5a';
            updatebtn.style.backgroundColor = '#cd7f4b';

            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            var username = "<%out.print(session.getAttribute("username"));%>";
            var BNNO = document.getElementById("vBNNO").value;

            $.ajax({
                url: './Sync',
                type: 'GET',
                data: {
                    page: "UpdateStatus",
                    CONO: cono,
                    DIVI: divi,
                    BNNO: BNNO,
                    USER: username,
                    STS: "10"

                },
                async: false
            });

        }
    }

    $("#GridBP").jsGrid({
        width: "100%",
        height: "auto",
        filtering: true,
        inserting: false,
        noDataContent: "All Billing Completed.",

//            editing: true,
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
                var username = "<%out.print(session.getAttribute("username"));%>";
                $.ajax({
                    type: 'GET',
                    url: './Sync',
                    dataType: 'json',
                    data: {
                        page: "GridBP",
                        user: username
                    },
                    async: false
                }).done(function (response) {
                    response = $.grep(response, function (item) {
                        return ((!filter.HB_BNNO || (item.HB_BNNO.indexOf(filter.HB_BNNO) > -1))
                                && (!filter.HB_TRDT || (item.HB_TRDT.indexOf(filter.HB_TRDT) > -1))
                                && (!filter.STATUS || (item.STATUS.indexOf(filter.STATUS) > -1))
                                && (!filter.HB_CUNO || (item.HB_CUNO.indexOf(filter.HB_CUNO) > -1))
                                && (!filter.BPM_RINV || (item.BPM_RINV.indexOf(filter.BPM_RINV) > -1))

                                );
                    });
                    data.resolve(response);
                });
                return data.promise();
            }
        },
        rowClick: function (args) {


            $("#vCreate").hide();
            $("#vUpdate").show();
            $("#vPrint").show();
            var tabletitle = document.getElementById("tabletitle1");
            tabletitle.innerHTML = "BILLING NOTE :" + " รอบ " + args.item.BPM_RINV + " วัน : " + args.item.HB_BNNO;
            var start = document.getElementById("dStart");
            var stop = document.getElementById("dStop");
            var modal = document.getElementById("frm_sublot");
            modal.style.display = "block";
            var BNNO = document.getElementById("vBNNO");
            var switchchk = document.getElementById("switchchk");

            var switchchk = document.getElementById("switchchk");
            var bgcolor = document.getElementById("bgcolor");
            var searchbtn = document.getElementById("vSearch");
            var printbtn = document.getElementById("vPrint");
            var updatebtn = document.getElementById("vUpdate");
            var checkBox = document.getElementById("myCheck");
            var text2 = document.getElementById("vPeriodD");
            var crepre = document.getElementById("vCrePeriod");
            crepre.style.backgroundColor = "#000000";
            crepre.style.color = "#cd8b9a";
            $("#vPeriodD").show();

            checkBox.checked = true;


            if (args.item.HB_STS === '20')
            {

                switchchk.checked = true;
            } else {
                switchchk.checked = false;
                bgcolor.style.backgroundColor = '#c0837c';
                searchbtn.style.backgroundColor = '#bbd3f4';
                printbtn.style.backgroundColor = '#d55d5a';
                updatebtn.style.backgroundColor = '#cd7f4b';
            }
            BNNO.value = args.item.HB_BNNO;
            GetPaymentDate(args.item.HB_CUNO);
            var date = document.getElementById("vPeriodD");

            text2.value = GetDate(args.item.HB_TRDT);


            SearchPY1(args.item.HB_CUNO);
//            var e = document.getElementById("vPeriod");
//            e.value = args.item.HB_TRDT;
            var eCus = document.getElementById("vCustomer");
            eCus.value = args.item.HB_CUNO;
            var ePo = document.getElementById("vPO");
            ePo.value = args.item.HB_PO;
            for (var i = 0; i < PAYMENTDATA.length; i++)
            {
                console.log(PAYMENTDATA[i].DATE);
                if ((PAYMENTDATA[i].DATE) === args.item.HB_TRDT)
                {
//                    alert(PAYMENTDATA[i].START + " TO: " + PAYMENTDATA[i].END);
                    start.value = PAYMENTDATA[i].START;
                    stop.value = PAYMENTDATA[i].END;
                }
            }

        },
        fields: [

            {

                headerTemplate: function () {




                }, width: 10, css: "blue-cell"
            },
            {title: "Billing Note NO.", width: 60, name: "HB_BNNO", type: "text", align: "center", editing: false, css: "blue-cell"},
//            {title: "LB_BNNO", name: "LB_BNNO", type: "text", align: "center", editing: false, width: 50},
            {title: "รหัสลูกค้า", name: "HB_CUNO", type: "text", align: "center", editing: false, width: 50, css: "blue-cell"},
            {title: "Transection Date", name: "HB_TRDT", type: "text", align: "center", editing: false, width: 50, css: "blue-cell"},
            {title: "STATUS", name: "STATUS", type: "text", align: "center", editing: false, width: 50, css: "blue-cell"

            }
//            , {type: "control", width: 30, deleteButton: false},
            ,
            {title: "รอบวัน", name: "BPM_RINV", type: "text", align: "center", width: 50, css: "blue-cell"}
            , {type: "control", width: 50, clearFilterButton: false, editButton: true, deleteButton: false, css: "blue-cell",
                headerTemplate: function () {
                    return getCustomInsertHeader("GridBP");
                },
                insertTemplate: function () {
                    return getCustomInsertControls("GridBP");
                }
            }
        ]
    });
    function getCustomInsertHeader(gridId) {
        return $("<button>").attr("type", "button").text("Create Billing No.").addClass("btn-create")
                .on("click", function () {
//                $("#" + gridId).jsGrid({ inserting: true });
//                alert("Added");
                    var modal = document.getElementById("frm_sublot");
                    var crecuscode = document.getElementById("vCustomer");
                    var crecusname = document.getElementById("vPAYERNAME");
                    var bnno = document.getElementById("vBNNO");
                    var start = document.getElementById("dStart");
                    var stop = document.getElementById("dStop");
                    var date = document.getElementById("vCrePeriod");
                    var checkBox = document.getElementById("myCheck");

                    checkBox.checked = false;
                    $("#vPeriodD").hide();


                    modal.style.display = "block";
                    crecuscode.value = "";
                    crecusname.value = "";
                    stop.value = "";
                    start.value = "";
                    bnno.value = "";
                    date.options.length = 0;
                      var crepre = document.getElementById("vCrePeriod");
            crepre.style.backgroundColor = "#ffe2ff";
            crepre.style.color = "#000000";



                });
    }

    function getCustomInsertControls(gridId) {
        var grid = $("#" + gridId).data("JSGrid");
        return $("<input>").addClass("jsgrid-button")
                .addClass("jsgrid-update-button")
                .attr({
                    type: "button"
                })
                .on("click", function () {
                    grid.insertItem().done(function () {
                        grid.option("inserting", false);
                    });
                })
                .add($("<input>")
                        .addClass("jsgrid-button")
                        .addClass("jsgrid-cancel-edit-button")
                        .attr({
                            type: "button"
                        })
                        .on("click", function () {
                            grid.option("inserting", false);
                        }));
    }

    var modal = document.getElementById("frm_sublot");
    var span_1 = document.getElementsByClassName("close2")[0];
    span_1.onclick = function () {
        modal.style.display = "none";
        $("#GridBP").jsGrid("loadData");
        $("#GridBillingNote").hide();
        $("#GridARS200").hide();
    };
    var modal1 = document.getElementById("frm_create");
    var span_2 = document.getElementsByClassName("close1")[0];
    span_2.onclick = function () {
        modal1.style.display = "none";
        $("#GridBP").jsGrid("loadData");


    };
    var PAYMENTDATA = [];
    $('#vPeriod').change(function () {

        var e = document.getElementById("vPeriod");
        var start = document.getElementById("dStart");
        var stop = document.getElementById("dStop");
        var value = e.value;
        var text = e.options[e.selectedIndex].text;

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
    $('#vCrePeriod').change(function () {

        var e = document.getElementById("vCrePeriod");
        var start = document.getElementById("dStart");
        var stop = document.getElementById("dStop");
        var value = e.value;
        var text = e.options[e.selectedIndex].text;

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

    function GetDate(date) {

        let text = date;
        let year = text.substring(0, 4);
        let month = text.substring(4, 6);
        let day = text.substring(6, 8);

        return year + "-" + month + "-" + day;

    }


    function GetdeDate(date) {
        var datef = date.value.split("-");

        return datef[0] + datef[1] + datef[2];

    }



    function GetPaymentDate(CUNO) {
        var cono = "<%out.print(session.getAttribute("cono"));%>";
//            var date = document.getElementById("vPeriodD");

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
    function GetPaymentDate1(CUNO) {

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

            PAYMENTDATA = response;
            $("#vCrePeriod").empty();
            var div_data = "<option value='Select_Date'> SELECT DATE</option>";
            $(div_data).appendTo('#vCrePeriod');
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
                $(div_data).appendTo('#vCrePeriod');
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
                document.getElementById("vPeriodD").value = GetDate(obj.HB_TRDT);
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
    $("#vCreate1").click(function (e) {


        var cono = "<%out.print(session.getAttribute("cono"));%>";
        var divi = "<%out.print(session.getAttribute("divi"));%>";
        var username = "<%out.print(session.getAttribute("username"));%>";
        var e = document.getElementById("vCrePeriod");
        var text = e.options[e.selectedIndex].text;
        var checkBox = document.getElementById("myCheck");
        var dated = "";
        var text2 = document.getElementById("vPeriodD");

        if (checkBox.checked === true) {
            dated = GetdeDate(text2);
        } else {
            dated = text;
        }
        $.ajax({
            url: './Sync',
            type: 'POST',
            dataType: 'json',
            data: {
                page: "CreateBillingNote",
                CONO: cono,
                DIVI: divi,
                CUNO: $("#vCustomer").val(),
                TRDT: dated,
                PONO: $("#vPO").val(),
                USER: username
            },
            async: false
        }).done(function (response) {

            $.each(response, function (i, obj) {
                document.getElementById("vBNNO").value = obj.BBNO;
                alert("Create complete");
                $('#vCreBNNO').prop('readonly', true);
                Call_GridARS200();
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
        var checkBox = document.getElementById("myCheck");
        var dated = "";
//        alert(GetdeDate(text2.value));

        var text2 = document.getElementById("vPeriodD2");

        if (checkBox.checked === true) {
            dated = GetdeDate(text2.value);
        } else {
            dated = text;
        }



        $.ajax({
            url: './Sync',
            type: 'POST',
            dataType: 'json',
            data: {
                page: "CreateBillingNote",
                CONO: cono,
                DIVI: divi,
                CUNO: $("#vCustomer").val(),
                TRDT: dated,
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
        var e = document.getElementById("vCrePeriod");

        var checkBox = document.getElementById("myCheck");
        var dated = "";

        var text2 = document.getElementById("vPeriodD");

//            alert(text2.value);

        if (checkBox.checked === true) {

            dated = GetdeDate(text2);
            
        } else {
        var text = e.options[e.selectedIndex].text;
            dated = text;
        }

//        alert(text);
        //xxxxxxxxxxxxxxxx
        $.ajax({
            url: './Sync',
            type: 'POST',
            dataType: 'json',
            data: {
                page: "UpdateBillingNote",
                CONO: cono,
                DIVI: divi,
                CUNO: $("#vCustomer").val(),
                TRDT: dated,
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

        var user = code;
        if (user !== "" && (user.indexOf("TH") !== 0 && user.indexOf("th") !== 0 && user.indexOf("Th") !== 0 && user.indexOf("tH") !== 0)) {

            user = "TH" + user;
        }
        SearchPY(user);
        GetPaymentDate1(user);
    }
    ;
    function FuncCheck1(code) {
        SearchPY1(code);
        GetPaymentDate1(code);
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


    function SearchPY1(code) {
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

        console.log("OPen");



        $("#GridARS200").show();
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
                {type: "control", width: 30, deleteButton: false, css: "blue-cell"},
                {title: "Invoice No", css: "blue-cell", width: 60, name: "ESCINO", type: "text", align: "center", editing: false},
                {title: "Invoice Date", css: "blue-cell", name: "ESIVDT", type: "text", align: "center", editing: false, width: 50},
                {title: "Invoice Amount", css: "blue-cell", name: "ESCUAM", type: "text", align: "right", editing: false,
                    itemTemplate: function (value) {
                        return  value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                    }, width: 40}
                , {title: "WH\TAX", css: "blue-cell", name: "WHTAX", type: "checkbox", align: "center", filtering: false, width: 30
//                    , filterTemplate: function () {
//                        return SelectallHeader("GridARS200");
//                    },
                    , filterTemplate: function () {
                        return SelectallControls("GridARS200");
                    }
                }


            ]
        });
        var cono = <%out.print(session.getAttribute("cono"));%>
        var divi = <%out.print(session.getAttribute("divi"));%>
        var enddate = document.getElementById("dStop").value;
        console.log(cono);
        console.log(divi);
        console.log("" + $("#vCustomer").val());
        console.log(enddate);

    }

    function SelectallHeader(gridId) {
        return $("<button>").attr("type", "button").text("SelectALL").addClass("your css classes here")
                .on("click", function () {
                    $("#" + gridId).jsGrid({inserting: true});
                });
    }

    function SelectallControls(gridId) {
        var grid = $("#" + gridId).data("JSGrid");
        return $("<input>").addClass("jsgrid-button")
                .addClass("jsgrid-update-button")
                .attr({
                    type: "button"
                })
                .on("click", function () {
                    if (confirm("Are you sure to SelectAll? ") === true) {

                        var items = $("#GridARS200").jsGrid("option", "data");
                        // var items = $("#jsGrid").jsGrid("option", "data");
//                        alert(JSON.stringify(items));
                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>


                        $.ajax({
                            type: "POST",
                            url: "./Sync",
                            dataType: 'json',
                            async: false,
                            cache: false,
                            data: {
                                page: "InsertLineJSON",
                                CONO: cono,
                                DIVI: divi,
                                BNNO: "" + $("#vBNNO").val(),
                                JSONARRAY: JSON.stringify(items)
                            }
                        });


                        Call_GridBillingNote();
                        $("#GridARS200").jsGrid("loadData");
                    }

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
                {type: "control", width: 30, css: "blue-cell"},
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
                {title: "WHT", name: "LB_WHTAX", css: "blue-cell", type: "checkbox", align: "center", filtering: false, width: 30},
                {title: "Complete", name: "LB_STS", css: "blue-cell", type: "checkbox", align: "center", filtering: false, width: 30
//                    , filterTemplate: function () {
//                        return CompleteSelectallHeader("GridBillingNote");
//                    },
                    , filterTemplate: function () {
                        return CompleteSelectallControls("GridBillingNote");
                    }
                }
            ]
        });
    }

    $("#vPrint").click(function (e) {
        $("#vComplete").click();
    });


    function CompleteSelectallHeader(gridId) {
        return $("<button>").attr("type", "button").text("CompleteSelectALL").addClass("your css classes here")
                .on("click", function () {
                    $("#" + gridId).jsGrid({inserting: true});
                });

    }

    function CompleteSelectallControls(gridId) {
        var grid = $("#" + gridId).data("JSGrid");
        return $("<input>").addClass("jsgrid-button")
                .addClass("jsgrid-cancel-edit-button")
                .attr({
                    type: "button"
                })
                .on("click", function () {
                    if (confirm("Are you sure to DeleteAll? ") === true) {

                        var cono = <%out.print(session.getAttribute("cono"));%>
                        var divi = <%out.print(session.getAttribute("divi"));%>
                        var items = $("#GridBillingNote").jsGrid("option", "data");



                        $.ajax({
                            type: "POST",
                            url: "./Sync",
                            dataType: 'json',
                            async: false,
                            cache: false,
                            data: {
                                page: "DeleteLineInvoiceJSON",
                                CONO: cono,
                                DIVI: divi,
                                BNNO: "" + $("#vBNNO").val(),
                                JSONARRAY: JSON.stringify(items)
                            }
                        });

                        Call_GridARS200();
                        $("#GridBillingNote").jsGrid("loadData");
                    }

                });
    }


//    function paint(ev) {
////  $("#GridBP").each((i,tr)=>{
////    $(tr).children().css("background-color",tr.children[4].textContent = "INVOICE"?"red":"");
////  })
//        console.log("REFRESH");
//        $("#GridBP tbody tr").each((i, tr) => {
//
//            console.log(tr.children[4]);
//
//
////            $(tr).children().css("background-color", +tr.children[4].textContent < 20 ? "red" : "");
//
//        });
//    }

    function myFunction1() {
        // Get the checkbox

        var crepre = document.getElementById("vCrePeriod");

        var checkBox = document.getElementById("myCheck");
        // Get the output text
        var text = document.getElementById("vPeriodD");

        // If the checkbox is checked, display the output text
        if (checkBox.checked === true) {
            text.style.display = "block";
            crepre.style.backgroundColor = "#000000";
            crepre.style.color = "#cd8b9a";
        } else {
            text.style.display = "none";
            crepre.style.backgroundColor = "#ffe2ff";
            crepre.style.color = "#000000";
        }
    }

</script>
