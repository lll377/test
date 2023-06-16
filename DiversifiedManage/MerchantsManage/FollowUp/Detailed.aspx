<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detailed.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.FollowUp.Detailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>详情</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .col-sm-1, .col-sm-2, .col-sm-3 {
            background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .col-sm-6, .col-xs-6 {
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="mainForm" method="post" class="form-horizontal " role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商跟进信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">序号：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Sort" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="MerchantsName" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">跟进阶段：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="FollowUpStageName" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">跟进时间：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="FollowUpTime" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">客户对接人：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="ConnectPeople" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">对接人职位：</label>
                <div class="col-sm-5 col-xs-5" style="">
                    <label id="ConnectPost" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">对接人电话：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="ConnectPhone" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">跟进内容：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Content" class="control-content" style="min-height:110px"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">后续建议：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Propose" class="control-content" style="min-height:110px"></label>
                </div>
            </div>
        </fieldset>
    </form>
    <input type="hidden" name="ID" id="ID" />
    <script type="text/javascript">

        $(function () {
            InitPage();
        });

        function InitPage() {
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
            InitData();
        }
        function InitData() {
            $.dataPostJson('DivfManage_MerchantsFollowUp', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    data.FollowUpTime = $.dateFormat(data.FollowUpTime);
                    $.setParam(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
    </script>
</body>
</html>
