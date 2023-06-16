<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialBaseEdit.aspx.cs" Inherits="M_Main.MaterielNew.MaterialBaseEdit" %>

<!DOCTYPE html>

<html xmlns="">
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
    <link href="../css/framesearch.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">字典类别
                </td>
                <td class="TdContent">
                    <select id="DType" name="DType" style="" runat="server">
                        <option value="" style="color: #000000;" selected="selected">--请选择--</option>
                        <option value="颜色" style="color: #000000;">颜色</option>
                        <option value="物资单位" style="color: #000000;">物资单位</option>
                        <option value="供方类别" style="color: #000000;">供方类别</option>
                        <option value="合作级别" style="color: #000000;">合作级别</option>
                        <option value="企业资质" style="color: #000000;">企业资质</option>
                        <option value="出库用途" style="color: #000000;">出库用途</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">字典名称
                </td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Name" name="Name" runat="server" style="width: 80%;" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">字典编码</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Code" name="Code" runat="server" style="width: 80%;" />
                </td>
            </tr>


            <tr id="trJSgs">
                <td class="TdTitle">排序</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Sort" name="Sort" runat="server" style="width: 80%;" />
                </td>
            </tr>


            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="Id" type="hidden" name="Id" runat="server" />


        <script type="text/javascript">

            $("#BtnSave").click(function () {
                if ($("#Name").val() == "") {
                    HDialog.Info('字典名称不能为空');
                    return;
                }
                $.tool.DataPostChk('frmForm', 'MaterialBaseHandle', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('操作成功');
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
