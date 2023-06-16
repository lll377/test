<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewExcelMeterManage.aspx.cs" Inherits="M_Main.HouseNew.NewExcelMeterManage" %>
<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE html>

<html>
<head>
    <title>ExcelMeterManage</title>
    

  <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

    <script type="text/javascript">
		<!--
    function DownData() {
        window.location.href = "NewExcelMeterManage.aspx";
        return true;

    }
    //-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>

    <form id="ExcelMeterManage" method="post" runat="server">
        <table class="DialogTable" id="Table1">
            <tr>
                <td class="TdTitle">组团区域</td>
                <td class="TdContent">
                    <select id="RegionSNum" name="RegionSNum" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">楼宇</td>
                <td class="TdContent">
                    <asp:DropDownList ID="BuildSNum" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">收费类型</td>
                <td class="TdContent">
                    <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">表计类型</td>
                <td class="TdContent">
                    <select id="MeterType" name="MeterType" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">抄表日期</td>
                <td class="TdContent">
                    <input class="Control_ItemInput" id="ListDate" name="ListDate" runat="server" onclick="WdatePicker();"></td>
            </tr>
         <%--   <tr>
                <td class="TdTitle">是否有上次起止数和用量</td>
                <td class="TdContent">
                    <asp:CheckBox ID="IsExpand" runat="server" Text="是" Checked="True"></asp:CheckBox></td>
            </tr>--%>
            <tr>
                <td align="center" colspan="2">
                    <input class="button" id="btnCreExcel" type="button" value="生成格式文件"
                        name="btnCreExcel" runat="server" onclick="javascript: if (DownData() == false) return false;">&nbsp;&nbsp;&nbsp;<input class="button" id="btnReturn" type="button" value="关闭"
                            name="btnReturn" runat="server"></td>
            </tr>
        </table>
        <script type="text/javascript">
            $('#btnReturn').click(function () {
                HDialog.Close();
            });
        </script>
    </form>
</body>
</html>

