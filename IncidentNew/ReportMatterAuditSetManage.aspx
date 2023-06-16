<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMatterAuditSetManage.aspx.cs" Inherits="M_Main.IncidentNew.ReportMatterAuditSetManage" %>
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

</head>
<body>
    <form id="frmForm" runat="server">
    <table class="DialogTable">
        <tr id="Organ">
            <td class="DialogTdTitle">
                序号
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true,validType:'digital'"
                    id="OrderId" name="OrderId" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                通用岗位
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="RoleName" name="RoleName" runat="server" />
            </td>
        </tr>

        <tr>
            <td class="DialogTdTitle">
                原因大类
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="TypeName" name="TypeName" runat="server" onclick="SelIncidentType();" readonly  />
            </td>
        </tr>
      
        <tr><td colspan="2" style="height:2px;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="BtnSave" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <input type="hidden" id="OpType"  name="OpType" runat="server">
        <input type="hidden" id="AuditID" name="AuditID" runat="server" />
        <input type="hidden" id="AuditType" name="AuditType" runat="server" />
        <input type="hidden" id="RoleCode"  name="RoleCode" runat="server">
        <input type="hidden" id="TypeCode"  name="TypeCode" runat="server">
        <script type="text/javascript">

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            $("#RoleName").click(function () {
                HDialog.Open('500', '500', '../DialogNew/SelCommRole.aspx', '选择通用岗位', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#RoleCode").val(arrRet[0]);
                    $("#RoleName").val(arrRet[1]);
                });
            });

            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'ReportMatterAuditSet', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            });

            function SelIncidentType() {
                HDialog.Open(650, 530, "../IncidentNew/ReportMatterIncidentType.aspx?IsOutSel=1" + "&Ram=" + Math.random(), "请选择原因大类", 'true', function callback(varReturn) {
                    if (varReturn != "") {//**获得返回的参数信息     
                        varReturn = eval("(" + varReturn + ")");
                        varReturn = eval("(" + varReturn + ")");
                        document.all.TypeName.value = varReturn[0].TypeName;
                        document.all.TypeCode.value = varReturn[0].TypeCode;
                        //GetAssignUser();                 
                    }
                });
            }
        </script>
    </form>
</body>
</html>
