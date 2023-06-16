<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtSupplierCooperationPeriodEdit.aspx.cs" Inherits="M_Main.Mt.MtSupplierCooperationPeriodEdit" %>

<!DOCTYPE html>

<html>
<head runat="server">
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr style="line-height: 30px;">
                <td class="TdTitle">供应商名称:</td>
                <td class="TdContent" colspan="3">

                    <label id="labSupplierName" runat="server"></label>
                </td>
            </tr>
            <tr style="line-height: 30px;">
                <td class="TdTitle">开始时间:</td>
                <td class="TdContent">
                    <input type="text" class="Wdate" style="height: 22px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" runat="server" id="StartDate" value="" name="StartDate" />
                </td>

                <td class="TdTitle">结束时间:</td>
                <td class="TdContent">
                    <input type="text" class="Wdate" style="height: 22px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" data-options="required:true" runat="server" id="EndDate" value="" name="EndDate" />
                </td>
            </tr>
             <tr style="line-height: 30px;">
                <td class="TdTitle">评价信息:</td>
                <td class="TdContent" colspan="3">
                    <textarea class="easyui-validatebox" style="height: 52px; width: 98%" runat="server" id="EvaluateMessage" name="EvaluateMessage"></textarea>
                </td>
            </tr>

            <tr style="line-height: 30px;">
                <td class="TdTitle">备注:</td>
                <td class="TdContent" colspan="3">
                    <textarea class="easyui-validatebox" style="height: 52px; width: 98%" runat="server" id="Memo" name="Memo"></textarea>
                </td>
            </tr>
           <%-- <tr>
                <td colspan="4">&nbsp;</td>
            </tr>--%>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <input type="button" class="button" value="保    存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关   闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input id="HidOpType" type="hidden" name="HidOpType" runat="server" value="" />
        <input type="hidden" id="Id" name="Id" runat="server" value="" />
        <input type="hidden" id="SupplierId" name="SupplierId" runat="server" value="" />
        <input type="hidden" id="IsDelete" name="IsDelete" runat="server" value="0" />
        <script type="text/javascript">

            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'MaterialSupplierInfo', 'AddSupplierCooperationPeriod', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            //HDialog.Info('操作成功');
                            HDialog.Close('1');
                        } else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

        </script>

    </form>
</body>
</html>
