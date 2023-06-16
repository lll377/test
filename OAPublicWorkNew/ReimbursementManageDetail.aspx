<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReimbursementManageDetail.aspx.cs" Inherits="M_Main.OAPublicWorkNew.ReimbursementManageDetail" %>
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
    <input id="DetailTableInfo" type="hidden" name="DetailTableInfo" runat="server" />
    <input id="TxtAllMoney" type="hidden"  name="DetailTableInfo" runat="server" />
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">
                费用类别
            </td>
            <td class="DialogTdContent">
                <select id="ReimbursementType" runat="server">
							<option selected></option>
						</select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                费用名称
            </td>
            <td class="DialogTdContent">
                <input  id="SubjectName" name="SubjectName" class="easyui-validatebox" data-options="required:true" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                摘要名称</td>
            <td class="DialogTdContent">
                <input  id="SummaryName" name="SummaryName" class="easyui-validatebox" data-options="required:true"  runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                金额</td>
            <td class="DialogTdContent">
                <input  id="ReimbursementMoney" class="easyui-validatebox" data-options="required:true,validType:'decimal'"  name="ReimbursementMoney" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                收款单位/收款人</td>
            <td class="DialogTdContent">

                <input  id="CustName" name="CustName" runat="server" />
            </td>
        </tr>
         <tr>
            <td class="DialogTdTitle">
                开户行</td>
            <td class="DialogTdContent">

                <input  id="BankName" name="BankName" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                账号</td>
            <td class="DialogTdContent">

                <input  id="BankAccount" name="BankAccount" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td class="DialogTdTitle">
                付款方式</td>
            <td class="DialogTdSearchContent">
                <select id="PayMethod" name="PayMethod" runat="server"><option value="现金">现金</option><option value="支票">支票</option><option value="其它">其它</option><option value="转账">转账</option></select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                是否已付款</td>
            <td class="DialogTdContent">
                <select id="IsPay" name="IsPay" runat="server"><option value="否">否</option><option value="是">是</option></select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                附件张数</td>
            <td class="DialogTdContent">
               <input  id="FileCount" name="FileCount" runat="server" />
            </td>
        </tr>
       <tr>
            <td class="DialogTdTitle">
                部门</td>
            <td class="DialogTdContent">
               <input  id="DepName" name="DepName" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                备注</td>
            <td class="DialogTdContent">
               <input  id="Memo" name="Memo" runat="server" />
            </td>
        </tr>
        <tr><td colspan="2" style="height:2px;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="btnSave" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="删除" id="btnDel" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <script type="text/javascript">
            function RetMsg() {
                var Obj = new Array();
                Obj[0] = document.all.DetailTableInfo.value;
                Obj[1] = document.all.TxtAllMoney.value;

                HDialog.ReturnIsJson = true;
                HDialog.Close(Obj);
            }
            $("#BtnSave").click(function () {
                if (document.all.Num.value == "") {
                    window.alert("编号不能为空");
                    document.all.Num.focus();
                    return false;
                }
                if (isDigit(document.all.Num.value) == false) {
                    window.alert("编号只能为数字");
                    document.all.Num.focus();
                    return false;
                }
                if (document.all.SubjectName.value == "") {
                    window.alert("名称不能为空");
                    document.all.SubjectName.focus();
                    return false;
                }
                if (document.all.SubjectType.value == "") {
                    window.alert("规格型号不能为空");
                    document.all.SubjectType.focus();
                    return false;
                }
                if (document.all.BuyPlanMoney.value == "") {
                    window.alert("预计单价不能为空");
                    document.all.BuyPlanMoney.focus();
                    return false;
                }
                if (CheckMoneyValue(document.all.BuyPlanMoney.value) == false) {
                    window.alert("预计单价金额格式错误");
                    document.all.BuyPlanMoney.focus();
                    return false;
                }
                if (document.all.BuyPlanMoney.value > 100000000) {
                    window.alert("金额过大");
                    document.all.BuyPlanMoney.focus();
                    return false;
                }
                if (document.all.HowMany.value == "") {
                    window.alert("数量不能为空");
                    document.all.HowMany.focus();
                    return false;
                }

                if (document.all.NeedDate.value == "") {
                    window.alert("需求时间不能为空");
                    document.all.NeedDate.focus();
                    return false;
                }
                if (checkIsValidDate(document.all.NeedDate.value) == false) {
                    window.alert("需求日期格式不正确");

                    return false;
                }
                if (document.all.HowUse.value == "") {
                    window.alert("用途不能为空");
                    document.all.HowUse.focus();
                    return false;
                }
                return true;
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>