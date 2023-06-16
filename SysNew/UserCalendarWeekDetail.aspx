<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCalendarWeekDetail.aspx.cs" Inherits="M_Main.SysNew.UserCalendarWeekDetail" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

</head>
<body>
    <form id="frmForm" runat="server">
    <input id="UserCalendarCode" type="hidden" name="UserCalendarCode" runat="server" />
    <input id="OPType" type="hidden" name="OPType" runat="server" />
    <div style="height:5px;"></div>
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">
                日程内容
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="Title" name="Title" placeholder="请输入日程内容" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                开始时间
            </td>
            <td class="DialogTdDateContent">
                <input type="text" class="easyui-datetimebox" data-options="required:true"
                    id="StartTime" name="StartTime" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                结束时间
            </td>
            <td class="DialogTdDateContent">
                <input type="text" class="easyui-datetimebox" data-options="required:true"
                    id="EndTime" name="EndTime" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                全天事件</td>
            <td class="DialogTdCommonContent">
                <input type="checkbox" id="IsRemind" name="IsRemind" runat="server" />
            </td>
        </tr>

        <tr><td colspan="2" style="height:2px;border-bottom:1px solid #cccccc;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;padding-top:15px;">
                <input type="button" class="button" value="保存" id="btnSave" onserverclick="btnSave_ServerClick" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="删除" id="btnDel" onserverclick="btnDel_ServerClick" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <script type="text/javascript">
            function RetMsg(_Data) {
                HDialog.ReturnIsJson = true;
                HDialog.Close(_Data);
            }
            $("#BtnSave").click(function () {
                return true;
            });
            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>
