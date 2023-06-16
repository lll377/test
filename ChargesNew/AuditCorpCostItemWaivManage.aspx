<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditCorpCostItemWaivManage.aspx.cs" Inherits="M_Main.ChargesNew.AuditCorpCostItemWaivManage" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
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
    <style type="text/css">
        .DialogTable td {
            height:30px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">
                    费项名称
                </td>
                <td class="DialogTdContent" colspan="7">
                    <input type="text" class="easyui-searchbox" searcher="SelCost"  style="width:91%;" data-options="required:true" id="CostName" name="CostName" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">
                    通用岗位</td>
                <td class="DialogTdContent" colspan="7">
                    <input type="text" class="easyui-searchbox"  style="width:91%;"   id="RoleName" name="RoleName" searcher="SelRole" runat="server"  />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">
                    审核序号
                </td>
                <td class="DialogTdContent" colspan="7">
                    <input type="text" class="easyui-validatebox"  id="OrderId" name="OrderId" runat="server"  data-options="required:true,validType:'digital'"/>
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
        <input id="OpType"  type="hidden" name="OpType" runat="server" />
        <input id="WaiverCategory"  type="hidden" name="WaiverCategory" runat="server" />
        <input type="hidden" id="AuditID" name="AuditID" runat="server" />
        <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
        <input type="hidden" id="CostCode"  name="CostCode" runat="server" />
        <input type="hidden" id="RoleCode"  name="RoleCode" runat="server" />
        <script type="text/javascript">
       
            function SelCost() {
                HDialog.Open('500', '500', '../DialogNew/CorpCostDlg.aspx', '选择费用项目', true, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    $("#CorpCostID").val(Obj.attributes.CorpCostID);
                    $("#CostCode").val(Obj.attributes.CostCode);
                    $("#CostName").searchbox("setValue", Obj.text);
                });
            }
            function SelRole()
            {
                HDialog.Open('500', '500', '../DialogNew/SelCommRole.aspx', '选择通用岗位', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#RoleCode").val(arrRet[0]);
                    $("#RoleName").searchbox("setValue", arrRet[1]);
                });
            }

            $("#BtnSave").click(function () {
             
                $.tool.DataPostChk('frmForm', 'AuditCorpCostItemWaiv', 'Save', $('#frmForm').serialize(),
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

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>