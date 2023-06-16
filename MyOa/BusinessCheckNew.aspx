<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessCheckNew.aspx.cs" Inherits="M_Main.MyOa.BusinessCheckNew" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>待办工作</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link rel="stylesheet" href="../Jscript-Ui/hplus/css/plugins/datapicker/datepicker3.css">

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body class="gray-bg">
    <form id="frmForm" runat="server">
        <input id="EditBeginDate" name="EditBeginDate" value="1" type="hidden" runat="server" />
        <input id="EditEndDate" name="EditEndDate" value="1" type="hidden" runat="server" />
        <input id="rows" name="rows" value="50" type="hidden" />
        <input id="page" name="page" value="1" type="hidden" />
        <input id="CommId" name="CommId" runat="server" type="hidden" />
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <button class="btn btn-white" type="button" onclick="window.location.href='../frame/NewDesktop/NewDeskIndex.aspx';"><i class="fa fa-chevron-left"></i></button>
                            &nbsp;&nbsp;
                                 <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">待办流程列表</span>
                        </div>

                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                <div class="col-md-1">
                                    <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" id="Refresh" onclick="Refresh();"><i class="fa fa-refresh"></i>刷新</button>
                                </div>
                                <div class="col-md-1">
                                    <select id="OAType" name="OAType" style="height: 28px;">
                                        <option value="">所有流程</option>
                                        <option value="0001">房屋状态审核</option>
                                        <option value="0002">应收入账审核</option>
                                        <option value="0003">应收导入审核</option>
                                        <option value="0004">预交导入审核</option>
                                        <option value="0005">预交冲抵审核</option>
                                        <option value="0006">费用减免审核</option>
                                        <option value="0007">取消减免审核</option>
                                        <option value="0008">票据撤销审核</option>
                                        <option value="0009">费用退款审核</option>
                                        <option value="0010">收款票据红冲</option>
                                        <option value="0011">预交冲抵红冲</option>
                                        <option value="0012">减免冲销红冲</option>
                                        <option value="0013">银行托收审核</option>
                                        <option value="0014">客户发函审核</option>
                                        <option value="0016">报事延期审核</option>
                                        <option value="0017">报事协助审核</option>
                                        <option value="0018">报事关闭审核</option>
                                        <option value="0019">装修申请审核</option>
                                        <option value="0020">装修变更审核</option>
                                        <option value="0021">装修停工审核</option>
                                        <option value="0022">装修延期审核</option>
                                    </select>
                                </div>
                                <div class="col-md-10">
                                    <div class="input-group" style="margin-bottom: 2px;">

                                        <div class="form-group" id="data_5">
                                            <div class="input-daterange input-group" id="datepicker">
                                                <input type="text" class="input-sm form-control" id="StartDate" name="StartDate">
                                                <span class="input-group-addon">到</span>
                                                <input type="text" class="input-sm form-control" id="EndDate" name="EndDate">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="input-group">
                                        <input type="text" placeholder="请输入待办工作名称、发起人" class="input-sm form-control" id="Key" name="Key" runat="server">
                                        <span class="input-group-btn">
                                            <input type="button" class="btn btn-sm btn-primary" id="Search" value="搜索" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="project-list">
                                <div class="sk-spinner sk-spinner-circle" id="Loading">
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
                                <table class="table table-hover" id="List">
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="CorpID" name="CorpID" runat="server" />
        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
        <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $('#StartDate').datepicker({
            });

            $('#EndDate').datepicker({
            });

            $(document).ready(function () {
                $("#loading-example-btn").click(function () {
                    btn = $(this); simpleLoad(btn, true); simpleLoad(btn, false)
                })

            });

            function simpleLoad(btn, state) {
                if (state) {
                    btn.children().addClass("fa-spin"); btn.contents().last().replaceWith(" Loading")
                }
                else {
                    setTimeout(function () { btn.children().removeClass("fa-spin"); btn.contents().last().replaceWith(" Refresh") }, 2000)
                }
            };


            function Refresh() {
                window.location.href = "WaitWork.aspx";
            }


            $("#Search").click(function (e) {
                $("#Loading").css("display", "");
                $("#List").html("");

                if ($("#OAType").val() == "") {
                    LoadData();
                }
                else {
                    LoadWaitWork($("#OAType").val());
                }
            });

            function LoadWaitWork(strType) {

                $.tool.DataPost('OASearch', 'WaitWork', 'Type=' + strType + '&' + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#Loading").css("display", "none");
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            var obj = JSON.parse(_Data);
                            for (var i = 0; i < obj.length; i++) {
                                $("#List").append("<tr><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\">" + obj[i].UrlTitle + "<br/></td><td class=\"project-actions\">" + formatDate(obj[i].SubDate, 'yyyy-MM-dd') + "</td></tr>");
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


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
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=HousingStatusAuditList&IsOption=0";
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

                            $("#List").append("<tr class='0001'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','房屋状态审核')\">【"
                                + _Data.rows[i].CommName + "】房屋状态审核:" + _Data.rows[i].CustName + '，' + _Data.rows[i].RoomSign + '</a>(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].ChangeDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init2() {
                //获取应收入账列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingFeeList&IsAuditing=0";
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
                            var ahref = '../ChargesNew/NewAuditingBCreDetailBrowse.aspx?FromIndex=' + _Data.rows[i].CommID+'&AuditID=' + _Data.rows[i].AuditID + '&StartBCreDate' + _Data.rows[i].StartBCreDate + '&EndBCreDate=' + _Data.rows[i].EndBCreDate;

                            $("#List").append("<tr class='0002'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','应收入账审核')\">【"
                                + _Data.rows[i].CommName + "】应收入账审核:" + _Data.rows[i].AuditTypeName + '</a>(' + _Data.rows[i].BCreUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].BCreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init3() {
                //获取应收导入列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingInputFeesList&IsAuditing=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/AuditingInputFeesDetailBrowse.aspx?FromIndex=' + _Data.rows[i].CommID +'&AuditID=' + _Data.rows[i].AuditID + "&StartBCreDate="
                                + _Data.rows[i].StartBCreDate + "&EndBCreDate=" + _Data.rows[i].EndBCreDate + "&FeesRoleCodes=" + _Data.rows[i].FeesRoleCodes;

                            $("#List").append("<tr class='0003'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','应收导入审核')\">【"
                                + _Data.rows[i].CommName + "】应收导入审核:" + _Data.rows[i].CostName + '</a>(' + _Data.rows[i].BCreUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].BCreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init4() {
                //获取预交导入列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingInputPreCostsList&IsAuditing=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/AuditingInputPreCostsDetailBrowse.aspx?FromIndex=' + _Data.rows[i].CommID +'&AuditID=' + _Data.rows[i].AuditID + "&StartBCreDate="
                                + _Data.rows[i].StartBCreDate + "&EndBCreDate=" + _Data.rows[i].EndBCreDate;

                            $("#List").append("<tr class='0004'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','预交导入审核')\">【"
                                + _Data.rows[i].CommName + "】预交导入审核:" + _Data.rows[i].CostName + '</a>(' + _Data.rows[i].BCreUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].BCreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init5() {
                //获取预交冲抵列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=AuditingPreList&IsAuditing=0";
                $.ajax({
                    url: "/HM/M_Main/HC/DataPostControl.aspx",
                    type: 'POST',
                    data: postStr,
                    dataType: 'json',
                    cache: false,
                    async: true,
                    success: function (_Data) {

                        for (var i = 0; i < _Data.rows.length; i++) {
                            var ahref = '../ChargesNew/NewAuditingPreDetailBrowse.aspx?FromIndex=' + _Data.rows[i].CommID +'&FeesRoleCodes=' + _Data.rows[i].FeesRoleCodes + '&AuditID=' + _Data.rows[i].AuditID
                                + '&IsAuditing=' + _Data.rows[i].IsAuditing + '&StartPreDate=' + _Data.rows[i].StartPreDate + '&EndPreDate=' + _Data.rows[i].EndPreDate;

                            $("#List").append("<tr class='0005'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','预交冲抵审核')\">【"
                                + _Data.rows[i].CommName + "】预交冲抵审核:" + _Data.rows[i].CostName + '</a>(' + _Data.rows[i].PreUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].PreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init6() {
                //获取费用减免审核列表

                var postStr = $('#frmForm').serialize().replace('+00%3A00%3A00', '').replace('+23%3A59%3A59', '') + "&Method=DataPost&Class=AuditManageIndex&Command=WaiversFeeAuditList&IsAudit=0&SelAudit=0";
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

                            $("#List").append("<tr class='0006'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','费用减免审核')\">【"
                                + _Data.rows[i].CommName + "】费用减免审核:"
                                + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WaivCreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init7() {
                //获取取消减免列表

                var postStr = $('#frmForm').serialize().replace('+00%3A00%3A00', '').replace('+23%3A59%3A59', '') + "&Method=DataPost&Class=AuditManageIndex&Command=WaiversFeeList&IsAudit=";
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
                            var ahref = '../ChargesNew/NewWaiversFeeModifyAuditBrowse.aspx?FromIndex=' + _Data.rows[i].CommID;

                            $("#List").append("<tr class='0007'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','取消减免审核')\">【"
                                + _Data.rows[i].CommName + "】取消减免审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WaivCreDate, 'yyyy-MM-dd') + "</td></tr>");

                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init8() {
                //获取 票据撤销 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=RepealReceiptsList&IsAudit=&DrReceive=0&SelIsAudit=0";
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
                            var ahref = '../ChargesNew/NewRepealReceiveFeesBrowse.aspx?FromIndex=' + _Data.rows[i].CommID;

                            $("#List").append("<tr class='0008'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','票据撤销审核')\">【"
                                + _Data.rows[i].CommName + "】票据撤销审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].ReferDate, 'yyyy-MM-dd') + "</td></tr>");
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


                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=AuditManageIndex&Command=RefundMultiAuditList&IsAudit=0&BusinessType=0";
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
                            var ahref = '../ChargesNew/NewRefundFeesSecAuditing.aspx?FromIndex=' + _Data.rows[i].CommID;

                            $("#List").append("<tr class='0009'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','费用退款审核')\">【"
                                + _Data.rows[i].CommName + "】费用退款审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubDatatime, 'yyyy-MM-dd') + "</td></tr>");
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

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffFeesReceiptsAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
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

                            $("#List").append("<tr class='0010'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','收款票据红冲审核')\">【"
                                + _Data.rows[i].CommName + "】收款票据红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init11() {
                //获取 预交冲抵冲销 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffPreCostsOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
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

                            $("#List").append("<tr class='0011'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','预交冲抵红冲审核')\">【"
                                + _Data.rows[i].CommName + "】预交冲抵红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init12() {
                //获取 减免冲抵冲销 列表 
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=WriteOffAuditingIndex&Command=GetList&IsAudit=0&ListType=WriteoffWaiversFeeOffsetAudit&AuditUser=&AuditBeginDate=&AuditEndDate=";
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

                            $("#List").append("<tr class='0012'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','减免冲抵红冲审核')\">【"
                                + _Data.rows[i].CommName + "】减免冲抵红冲审核:" + _Data.rows[i].CustName + _Data.rows[i].RoomSign + '(' + _Data.rows[i].SubmitterUserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].SubmitterDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }

            function Init13() {
                //获取 银行托收审核 列表 
                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=BankSurrTLAuditIndex&Command=search&IsAudit=0";
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

                            $("#List").append("<tr class='0013'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','银行托收审核')\">【"
                                + _Data.rows[i].CommName + "】银行托收审核:" + _Data.rows[i].BankName + '(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].ChargeDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

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

                                $("#List").append("<tr><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + url + "','装修" + item.TypeName + "审核')\">【"
                                    + item.CommName + "】装修" + item.TypeName + '审核: ' + item.CustName + ',' + item.RoomSign + '(' + item.UserName + ')'
                                    + "<br/></td><td class=\"project-actions\">" + formatDate(item.AddTime, 'yyyy-MM-dd') + "</td></tr>");

                            });

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

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentUnnormalCloseList&IsAudit=0&AuditState=审核中";
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
                            var ahref = '../Incident/NewspaperReportClose.html?ID=' + _Data.rows[i].IID;

                            $("#List").append("<tr class='0018'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事关闭审核')\">【"
                                + _Data.rows[i].CommName + "】报事关闭审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            function Init16() {
                //获取 报事延期审核 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentDelayList&IsAudit=0&AuditState=审核中";
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
                            var ahref = '../Incident/Incident_Delay.aspx?DelayApplyIID=' + _Data.rows[i].IID;

                            $("#List").append("<tr class='0016'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事延期审核')\">【"
                                + _Data.rows[i].CommName + "】报事延期审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            function Init17() {
                //获取 报事协助审核 列表

                var postStr = $('#frmForm').serialize() + "&Method=DataPost&Class=IncidentProcessingNew&Command=GetIncidentAssistList&IsAudit=0&AuditState=审核中";
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
                            var ahref = '../Incident/Incident_Assist.aspx?AssistIID=' + _Data.rows[i].IID;

                            $("#List").append("<tr class='0017'><td class=\"project-status\"><span class=\"label label-primary\">办理中</td><td class=\"project-title\"><a onclick=\"Detail('" + ahref + "','报事协助审核')\">【"
                                + _Data.rows[i].CommName + "】报事协助审核:" + _Data.rows[i].IncidentNum + '(' + _Data.rows[i].UserName + ')'
                                + "<br/></td><td class=\"project-actions\">" + formatDate(_Data.rows[i].WorkStartDate, 'yyyy-MM-dd') + "</td></tr>");
                        }

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
                Init1();
                Init2();
                Init3();
                Init4();
                Init5();
                Init6();
                Init7();
                Init8();
                Init9();
                Init10();
                Init11();
                Init12();
                Init13();
                Init14();
                Init15();
                Init16();
                Init17();
                Init18();

                $("#Loading").css("display", "none");
            }

            $(function () {
                LoadData();
            });


        </script>
    </form>
</body>
</html>
