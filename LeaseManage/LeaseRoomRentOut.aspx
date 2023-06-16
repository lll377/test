<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomRentOut.aspx.cs" Inherits="M_Main.LeaseManage.LeaseRoomRentOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>租赁房屋退租确认</title>
<link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 10%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmFrom" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">退租时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RentOutTime" name="RentOutTime" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">退租办理人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RentOutUserName" name="RentOutUserName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        <input type="hidden" id="RentOutUserCode" name="RentOutUserCode" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle">退租原因:</td>
                    <td class="TdContentSearch">
                        <textarea id="RentOutReason" name="RentOutReason" maxlength="1500" runat="server" class="easyui-validatebox" data-options="required:true" ></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="LeaseRoomIDList" name="LeaseRoomIDList" runat="server" />
    </form>
    <div style="text-align: center; width: 100%; padding: 5px 0;">
        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
        <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
    </div>
    <script language="javascript" type="text/javascript">
        //关闭页面
        function btnClose() {
            HDialog.Close("");
        }
        //保存
        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('LeaseManage', 'LeaseRoomRentOut', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Info("办理退租成功");
                            HDialog.Close("1");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }
    </script>

</body>
</html>
