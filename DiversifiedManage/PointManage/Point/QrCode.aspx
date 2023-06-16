<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCode.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.QrCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/QRCode.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/excanvas.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <style type="text/css">
        .col-sm-3 {
            font-weight: bold;
            /*background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;*/
        }

        .form-horizontal .form-group .color-black {
            color: #555555;
        }
    </style>
</head>
<body>
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <div class="form-group">
            <div class="col-sm-12 col-xs-12" style="padding: 0; margin: 0; text-align: center">
                <div id="QrCode"></div>
            </div>
        </div>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">点位信息</legend>
            <div class="form-group">
                <div class="col-sm-3 col-xs-3 control-label color-black">点位编号</div>
                <div class="col-sm-9 col-xs-9" style="padding-right: 0">
                    <label id="Number" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3 col-xs-3 control-label color-black">点位名称</div>
                <div class="col-sm-9 col-xs-9" style="padding-right: 0">
                    <label id="Name" class="control-content"></label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3 col-xs-3 control-label color-black">点位位置</div>
                <div class="col-sm-9 col-xs-9" style="padding-right: 0">
                    <label id="Position" class="control-content"></label>
                </div>
            </div>
        </fieldset>
    </form>
    <script type="text/javascript">
        $(function () {
            var param = $.getUrlParam();
            $.setParam(param);
            $('#QrCode').qrcode({
                render: 'canvas',
                text: param.ID,
                height: 200,
                width: 200,
                typeNumber: -1,			//计算模式
                correctLevel: QRErrorCorrectLevel.M,//纠错等级
                background: "#ffffff",	//背景颜色
                foreground: "#000000",	//前景颜色
                //logo图片地址
                //src: "../images/logo.jpg",
            });
        });
    </script>
</body>
</html>
