<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detailed.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.BlackList.Detailed" %>

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
            <legend class="frame-legend">办理信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">办理类型：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="Type" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">管理单位：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="MerchantsUnit" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">

                <label class="col-sm-1 col-xs-1 control-label">客户名称：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="MerchantsName" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">客商类别：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="MerchantsCategoryName" class="control-content"></label>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">经办人：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="HandleUserName" class="control-content"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">办理时间：</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="HandleTime" class="control-content"></label>
                </div>
            </div>
               <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">办理原因：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Reason" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="Remark" class="control-content"></label>
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
            $.dataPostJson('DivfManage_BlackList', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    data.HandleTime = $.dateFormat(data.HandleTime);
                    $.setParam(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
    </script>
</body>
</html>
