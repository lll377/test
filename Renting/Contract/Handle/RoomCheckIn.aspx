<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomCheckIn.aspx.cs" Inherits="M_Main.Renting.Contract.Handle.RoomCheckIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房屋入住</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">入住确认信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">入住时间</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="CheckInTime" name="CheckInTime" class="easyui-datebox" runat="server" data-options="editable:false,required:true,panelHeight:'220'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">入住办理人</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="CheckInUserName" name="CheckInUserName" class="easyui-textbox" runat="server" data-options="tipPosition:'bottom',width:'100%',disabled:true" />
                    <input type="hidden" id="CheckInUserCode" name="CheckInUserCode" runat="server" />
                    <input type="hidden" id="ContractRoomIDs" name="ContractRoomIDs" runat="server" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson("Renting_ContractHandle", 'ContractRoomCheckIn', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>

