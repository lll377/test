<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessCheck.aspx.cs" Inherits="M_Main.MyOa.BusinessCheck" %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>桌面统计</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
    <style type="text/css">
        .WaitWork {
            width: 100%;
        }

            .WaitWork td {
                text-align: center;
                padding-bottom: 10px;
                cursor: pointer;
            }

        .NewsList {
            width: 100%;
        }

            .NewsList td {
                text-align: center;
                padding-bottom: 5px;
                cursor: pointer;
            }

        .ibox-content {
            height: 220px;
            overflow-y: scroll;
        }
    </style>
</head>

<body class="gray-bg">
    <form id="frmForm" name="frmForm">
        <input id="EditBeginDate" name="EditBeginDate" value="1" type="hidden" runat="server" />
        <input id="EditEndDate" name="EditEndDate" value="1" type="hidden" runat="server" />
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="ibox">
                <div class="ibox-title">
                    <button class="btn btn-white" type="button" onclick="window.location.href='../frame/NewDesktop/NewDeskIndex.aspx';"><i class="fa fa-chevron-left"></i></button>
                    &nbsp;&nbsp;
                        <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">业务审核工作台</span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="Init1()" style="cursor: pointer;">刷新</span>
                            <h5>房屋状态</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_1" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_1" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(4)" style="cursor: pointer;">刷新</span>
                            <h5>应收入账</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_2" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_2" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(7)" style="cursor: pointer;">刷新</span>
                            <h5>预交冲抵审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_5" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_5" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(10)" style="cursor: pointer;">刷新</span>
                            <h5>费用减免审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_6" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_6" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(2)" style="cursor: pointer;">刷新</span>
                            <h5>票据撤销审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_8" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_8" style="display: none;">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(5)" style="cursor: pointer;">刷新</span>
                            <h5>费用退款审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_9" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_9" style="display: none;">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(8)" style="cursor: pointer;">刷新</span>
                            <h5>实收票据红冲审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_10" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_10" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(3)" style="cursor: pointer;">刷新</span>
                            <h5>预交冲抵冲销审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_11" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_11" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(6)" style="cursor: pointer;">刷新</span>
                            <h5>减免冲抵冲销审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_12" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_12" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(6)" style="cursor: pointer;">刷新</span>
                            <h5>银行托收审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_13" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_13" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(3)" style="cursor: pointer;">刷新</span>
                            <h5>装修审核审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_14" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_14" style="display: none;">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">

                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(6)" style="cursor: pointer;">刷新</span>
                            <h5>报事关闭审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_15" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_15" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(6)" style="cursor: pointer;">刷新</span>
                            <h5>报事延期审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_16" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_16" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox">
                        <div class="ibox-title">
                            <span class="label label-primary pull-right" onclick="LoadWaitWork(3)" style="cursor: pointer;">刷新</span>
                            <h5>报事协助审核</h5>
                        </div>
                        <div class="ibox-content">
                            <table id="List_17" class="NewsList"></table>
                            <div class="sk-spinner sk-spinner-circle" id="Loading_17" style="">
                                <div class="sk-circle1 sk-circle"></div>
                                <div class="sk-circle2 sk-circle"></div>
                                <div class="sk-circle3 sk-circle"></div>
                                <div class="sk-circle4 sk-circle"></div>
                                <div class="sk-circle5 sk-circle"></div>
                                <div class="sk-circle6 sk-circle"></div>
                                <div class="sk-circle7 sk-circle"></div>
                                <div class="sk-circle8 sk-circle"></div>
                                <div class="sk-circle9 sk-circle"></div>
                                <div class="sk-circle10 sk-circle"></div>
                                <div class="sk-circle11 sk-circle"></div>
                                <div class="sk-circle12 sk-circle"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <input type="hidden" id="page" name="page" value="1" />
        <input type="hidden" id="rows" name="rows" value="100" />

        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
        <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/format.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Refresh() {
                window.location.href = "WaitWork.aspx";
            }

            function Detail(Flag, OrganCode, CommID) {
                if (Flag == 1) {
                    if ($("#IsCan_" + Flag).val() == "0") {
                        HDialog.Info("没有权限");
                        return;
                    }
                }
                var Url;
                if (Flag == 1) Url = '../ChargesNew/NewAuditingBCreBrowse.aspx';
                if (Flag == 2) Url = '../ChargesNew/NewAuditingBCreBrowse.aspx';
                if (Flag == 3) Url = '../ChargesNew/NewAuditingPreBrowse.aspx';
                if (Flag == 4) Url = '../ChargesNew/NewWaiversFeeAuditBrowse.aspx';
                if (Flag == 5) Url = '../ChargesNew/NewRepealReceiveFeesBrowse.aspx';
                if (Flag == 6) Url = '../ChargesNew/NewRefundFeesSecAuditing.aspx';
                if (Flag == 7) Url = '../ChargesNew/NewRefundFeesSecAuditing.aspx';
                if (Flag == 8) Url = '../ChargesNew/LeaseRoomThdContractAuditBrowse.aspx';
                if (Flag == 9) Url = '../ChargesNew/NewAuditingContFeesBrowse.aspx';
                if (Flag == 10) Url = '../HouseNew/NewHousingStatusAudit.aspx';

                top.window.location.href = "../frame/loginswitch.aspx?OrganCode=" + OrganCode + "&CommID=" + CommID + "&GoToPage=" + Url;
            }

            function LoadWaitWork(strType) {
                $("#List_" + strType).html("");
                $.tool.DataPost('StatDesktop', 'LoadBusinessCheck', 'Flag=' + strType,
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#Loading_" + strType).css("display", "none");
                        var varObjects = JSON.parse(_Data);
                        if (varObjects.length == 0) {
                            $("#List_" + strType).append("<tr><td  style='text-align:left;color:#3988D7;'>暂无审核信息</td></tr>");
                        }
                        for (var i = 0; i < varObjects.length; i++) {
                            $("#List_" + strType).append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail(" + strType + ",'" + varObjects[i].OrganCode + "','" + varObjects[i].CommID + "');\"><i class='fa fa-file-excel-o'></i> " + getString(varObjects[i].CommName, 13) + "</td><td style='text-align:right;'>" + varObjects[i].Counts + "</td></tr>");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //function LoadData() {
            //    LoadWaitWork(1);
            //    LoadWaitWork(2);
            //    LoadWaitWork(3);
            //    LoadWaitWork(4);
            //    LoadWaitWork(5);
            //    LoadWaitWork(6);
            //    LoadWaitWork(7);
            //    LoadWaitWork(8);
            //    LoadWaitWork(9);
            //    LoadWaitWork(10);
            //}

           // LoadData();

        </script>


        <script type="text/javascript"> 
            function Detail(Url, title) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, Url, title, true, function callback(_Data) {
                    if (_Data != '') {
                        LoadData();
                    }
                });
            }

            function Init1() {
                //获取房屋状态列表 
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndexComm&Command=HousingStatusAuditList&IsOption=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../HouseNew/NewHousingStatusAudit.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0001'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','房屋状态审核')\">【"
                            //    + _Data.rows[i].CommName + "】房屋状态审核:" + _Data.rows[i].CustName + '，' + _Data.rows[i].RoomSign + '</a>(' + _Data.rows[i].UserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].ChangeDate, 'yyyy-MM-dd') + "</td></tr>");
                            //if (varObjects.length == 0) {
                            //    $("#List_" + strType).append("<tr><td  style='text-align:left;color:#3988D7;'>暂无审核信息</td></tr>");
                            //}

                            $("#List_1").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','房屋状态审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");


                        }
                        $("#Loading_1").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init2() {
                //获取应收入账列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndexComm&Command=AuditingFeeList&IsAuditing=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/NewAuditingBCreBrowse.aspx?FromIndex=' + _Data.rows[i].CommID +"&StartBCreDate=1900-01-01&EndBCreDate=2099-12-31";

                            //$("#List").append("<tr class='0002'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','应收入账审核')\">【"
                            //    + _Data.rows[i].CommName + "】应收入账审核:" + _Data.rows[i].AuditTypeName + '</a>(' + _Data.rows[i].BCreUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].BCreDate, 'yyyy-MM-dd') + "</td></tr>");

                            $("#List_2").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','应收入账审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_2").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }


            function Init5() {
                //获取预交冲抵列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndexComm&Command=AuditingPreList&IsAuditing=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/NewAuditingPreBrowse.aspx?FromIndex=' + _Data.rows[i].CommID + '&FeesRoleCodes=' + _Data.rows[i].FeesRoleCodes + '&AuditID=' + _Data.rows[i].AuditID
                                + '&IsAuditing=' + _Data.rows[i].IsAuditing + '&StartPreDate=' + _Data.rows[i].StartPreDate + '&EndPreDate=' + _Data.rows[i].EndPreDate;

                            //$("#List").append("<tr class='0005'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','预交冲抵审核')\">【"
                            //    + _Data.rows[i].CommName + "】预交冲抵审核:" + _Data.rows[i].CostName + '</a>(' + _Data.rows[i].PreUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].PreDate, 'yyyy-MM-dd') + "</td></tr>");


                            $("#List_5").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','预交冲抵审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_5").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init6() {
                //获取费用减免审核列表

                var postStr = $('#frmForm').serialize().replace('+00%3A00%3A00', '').replace('+23%3A59%3A59', '') + "&Method=DataPost&Class=AuditManageIndexComm&Command=WaiversFeeAuditList&IsAudit=0&SelAudit=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/NewWaiversFeeAuditBrowse.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0006'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','费用减免审核')\">【"
                            //    + _Data.rows[i].CommName + "】费用减免审核:"
                            //    + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WaivCreDate, 'yyyy-MM-dd') + "</td></tr>");


                            $("#List_6").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','费用减免审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_6").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }


            function Init8() {
                //获取 票据撤销 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndexComm&Command=RepealReceiptsList&IsAudit=&DrReceive=0&SelIsAudit=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        console.log(_Data)
                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/NewRepealReceiveFeesBrowse.aspx?FromIndex=' + _Data.rows[i].CommID;

                            $("#List_8").append("<tr class='0008'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','票据撤销审核')\">【"
                                + _Data.rows[i].CommName + "】票据撤销审核 " + "<br/></td><td class=\"project-actions\">" +  _Data.rows[i].Counts  + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init9() {
                //获取 费用退款 列表


                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndexComm&Command=RefundMultiAuditList&IsAudit=0&BusinessType=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        console.log(_Data);

                        var html = '';
                        for (var i = 0; i < _Data.length; i++) {
                            var ahref = '../ChargesNew/NewRefundFeesSecAuditing.aspx?FromIndex=' + _Data[i].CommID;

                            //$("#List_9").append("<tr class='0009'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','费用退款审核')\">【"
                            //    + _Data.rows[i].CommName + "】费用退款审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubDatatime, 'yyyy-MM-dd') + "</td></tr>");

                            $("#List_9").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','费用退款审核');\"><i class='fa fa-file-excel-o'></i> " + _Data[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data[i].Counts + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init10() {
                //获取 实收票据红冲 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetListGroupComm&IsAudit=0&ListType=WriteoffFeesReceiptsAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../WriteOffManage/WriteoffFeesReceiptsAudit.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0010'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','收款票据红冲审核')\">【"
                            //    + _Data.rows[i].CommName + "】收款票据红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");

                            $("#List_10").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','实收票据红冲审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_10").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init11() {
                //获取 预交冲抵冲销 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetListGroupComm&IsAudit=0&ListType=WriteoffPreCostsOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../WriteOffManage/WriteoffPreCostsOffsetAudit.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0011'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','预交冲抵红冲审核')\">【"
                            //    + _Data.rows[i].CommName + "】预交冲抵红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");
                            $("#List_11").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','预交冲抵冲销审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_11").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init12() {
                //获取 减免冲抵冲销 列表 
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetListGroupComm&IsAudit=0&ListType=WriteoffWaiversFeeOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../WriteOffManage/WriteoffWaiversFeeOffsetAudit.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0012'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','减免冲抵红冲审核')\">【"
                            //    + _Data.rows[i].CommName + "】减免冲抵红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");
                            $("#List_12").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','减免冲抵冲销审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_12").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init13() {
                //获取 银行托收审核 列表 
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=BankSurrTLAudit&Command=searchGroupComm&IsAudit=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/BankSurrTLAudit.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0013'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','银行托收审核')\">【"
                            //    + _Data.rows[i].CommName + "】银行托收审核:" + _Data.rows[i].BankName + '(' + _Data.rows[i].UserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].ChargeDate, 'yyyy-MM-dd') + "</td></tr>");

                            $("#List_13").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','银行托收审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_13").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init14() {
                //获取装修审核数据

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=Renovation&Command=GetListRenoAuditAllHTML5";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (result) {
                        if (result.result) {
                            var data = $.parseJSON(result.data);
                            var html = "", url = "", param = "";
                            var pageName = "";
                            $.each(data, function (i, item) {
                                switch (item.TypeName) {
                                    case "申请":
                                        var opType = "Detailed";
                                        if (item.AuditState == '已审核' || item.AuditState == '审核不通过') {
                                            opType = "Detailed";
                                        } else {
                                            opType = "ViewDetail";
                                        }
                                        param = $.param({ "OpType": opType, "ID": item.ID, "AuditState": item.AuditState });
                                        pageName = "RenovationMainTab.aspx";
                                        break;
                                    case "变更":
                                        param = $.param({ "OpType": "edit", "ID": item.ID, "RID": item.RID });
                                        pageName = "RenovationChangeAuditManage.aspx";
                                        break;
                                    case "停工":
                                        param = $.param({ "OpType": "edit", "ID": item.ID, "RID": item.RID });
                                        pageName = "RenovationStoppageAuditManage.aspx";
                                        break;
                                    case "延期":
                                        param = $.param({ "OpType": "edit", "ID": item.ID, "RID": item.RID });
                                        pageName = "RenovationDelayAuditManage.aspx";
                                        break;
                                    default:
                                        break;
                                }
                                url = '../RenovationNew/' + pageName + '?' + param;

                                $("#List_14").append("<tr><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + url + "','装修" + item.TypeName + "审核')\">【"
                                    + item.CommName + "】装修" + item.TypeName + '审核: ' + item.CustName + ',' + item.RoomSign + '(' + item.UserName + ')'
                                    + "<br/></td><td class=\"project-actions\">" + formatDate(item.AddTime, 'yyyy-MM-dd') + "</td></tr>");

                                $("#List_14").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + url
                                    + "','装修审核审核');\"><i class='fa fa-file-excel-o'></i> " + "【" + item.CommName + "】装修" + item.TypeName + "审核: "+ item.CustName + "," + item.RoomSign + "(" + item.UserName + ")"
                                    + "</td><td style='text-align:right;'>" + "" + "</td></tr>");


                            });

                            $("#Loading_14").css("display", "none");
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init15() {
                //获取 报事关闭审核 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentUnnormalCloseListGroupComm&IsAudit=0&AuditState=审核中";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../IncidentNewJH/IncidentCloseManage.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0018'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事关闭审核')\">【"
                            //    + _Data.rows[i].CommName + "】报事关闭审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                            $("#List_15").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','报事关闭审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_15").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            function Init16() {
                //获取 报事延期审核 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentDelayListGroupComm&IsAudit=0&AuditState=审核中";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../IncidentNewJH/IncidentDelayApplyManage.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0016'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事延期审核')\">【"
                            //    + _Data.rows[i].CommName + "】报事延期审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                            $("#List_16").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','报事延期审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_16").css("display", "none");

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            function Init17() {
                //获取 报事协助审核 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentAssistListGroupComm&IsAudit=0&AuditState=审核中";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        var html = '';
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../IncidentNewJH/IncidentAssistManage.aspx?FromIndex=' + _Data.rows[i].CommID;

                            //$("#List").append("<tr class='0017'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事协助审核')\">【"
                            //    + _Data.rows[i].CommName + "】报事协助审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                            //    + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                            $("#List_17").append("<tr><td style='text-align:left;color:#3988D7;' onclick=\"Detail('" + ahref
                                + "','报事协助审核');\"><i class='fa fa-file-excel-o'></i> " + _Data.rows[i].CommName
                                + "</td><td style='text-align:right;'>" + _Data.rows[i].Counts + "</td></tr>");
                        }
                        $("#Loading_17").css("display", "none");
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }

            function Init18() {
                //获取 客户发函 列表 
                var date = new Date();
                var nYear1 = date.getFullYear(),
                    nMonth1 = date.getMonth(),
                    nYear2 = date.getFullYear(),
                    nMonth2 = date.getMonth();


                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=SendLetter&Command=SendLetterBrowse&IsAudit=0&AuditState=审核中&nYear1=" + nYear1 + "&nMonth1=" + nMonth1 + "&nYear2=" + nYear2 + "&nMonth2=" + nMonth2;
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {
                        var html = '';
                        debugger;
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../UrgeFees/SendLetterDetailFrame.aspx?OPType=Auditing&SendLetterID=' + _Data.rows[i].SendLetterID;

                            $("#List").append("<tr class='0017'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','客户发函审核')\">【"
                                + _Data.rows[i].CommName + "】客户发函审核:" + _Data.rows[i].SubDebtsAmountCount + '户(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].CreDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            function LoadData() {
                    Init1();// 房屋状态
                    Init2();// 应收入账
                    Init5();// 预交冲抵
                    Init6();// 费用减免审核
                    Init8(); // 票据撤销
                    Init9();// 费用退款审核列表
                    Init10();//票据红冲
                    Init11();// 预交冲抵
                    Init12();// 减免冲抵冲销
                    Init13();// 银行托收

                    Init14();// 装修审核
                    Init15();
                    Init16();// 报事延期审核
                    Init17();// 报事协助审核

                //$("#Loading").css("display", "none");
            }

            $(function () {
                LoadData();
            });


        </script>
    </form>
</body>
</html>
