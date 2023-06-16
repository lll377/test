<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetChargeModeManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetChargeModeManage" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="ConfigID" type="hidden" name="ConfigID" runat="server" />
        <input id="ChargeMode" type="hidden" name="ChargeMode" runat="server" />
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">           
            <tr>
                <td class="TdTitle">收费方式</td>
                <td class="TdContent" colspan="3"><SELECT id="SelChargeMode" name="SelChargeMode" runat="server">
													<OPTION selected></OPTION>
												</SELECT>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CostName" data-options="editable:false" 
                    searcher="SelCost" type="text"  name="CostName" runat="server" />
                         <input type="hidden" id="hiCostName" name="hiCostName" runat="server" />
                         <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
                         <input type="hidden" id="CostCode"  name="CostCode" runat="server" />
                </td>
             </tr>
            <tr> 
                <td class="TdTitle">结算方式</td>
                <td class="TdContent"><input class="easyui-searchbox" id="ChargeModeName" data-options="editable:false" 
                    searcher="SelChargeMode" type="text"  name="ChargeModeName" runat="server" />
                    <input type="hidden" id="hiChargeModeName" name="hiChargeModeName" runat="server" />
                    <input type="hidden" id="ChargeModeCode" name="ChargeModeCode" runat="server" />
                    <input type="hidden" id="ChargeModeID" name="ChargeModeID" runat="server" />
                </td>
            </tr>
             <tr>
                 <td class="TdTitle">期间</td>
                 <td class="TdContent" colspan="3"><select name="Period" id="Period" runat="server">
                        <option value=""></option>
                        <option value="本期">本期</option>
                        <option value="上期">上期</option>
                        </select>
                </td>
            </tr>
             <tr>
                <td class="TdTitle">收支项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="BusiClassName" data-options="editable:false" 
                    searcher="SelBusiClass" type="text"  name="BusiClassName" runat="server" />
                         <input type="hidden" id="hiBusiClassName" name="hiBusiClassName" runat="server" />
                         <input type="hidden" id="BusiClassCode" name="BusiClassCode" runat="server" />
                    <input type="hidden" id="BusiClassID" name="BusiClassID" runat="server" />
                </td>
            </tr>  
           <%-- <tr>
                <td class="TdTitle">科目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="AccountSubjectName" data-options="editable:false" 
                    searcher="SelSubj" type="text"  name="AccountSubjectName" runat="server" />
                         <input type="hidden" id="hiAccountSubjectName" name="hiAccountSubjectName" runat="server" />
                         <input type="hidden" id="AccountSubjectCode" name="AccountSubjectCode" runat="server" />
                    <input type="hidden" id="AccountSubjectID" name="AccountSubjectID" runat="server" />
                </td>
            </tr>  --%>
             <tr>
                <td class="TdTitle">手续费</td>
                <td class="TdContent" colspan="3"><input id="TaxRate"
                    type="text"  name="TaxRate" runat="server" />                        
                </td>
            </tr>
            <%-- <tr>
                <td class="TdTitle">科目(手续费)</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="TaxAccountSubjectName" data-options="editable:false" 
                    searcher="SelTaxSubj" type="text"  name="TaxAccountSubjectName" runat="server" />
                         <input type="hidden" id="hiTaxAccountSubjectName" name="hiTaxAccountSubjectName" runat="server" />
                         <input type="hidden" id="TaxAccountSubjectCode" name="TaxAccountSubjectCode" runat="server" />
                    <input type="hidden" id="TaxAccountSubjectID" name="AccountSubjectID" runat="server" />
                </td>
            </tr>--%>
             <tr>
                <td class="TdTitle">银行账户</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="BankAccountName" data-options="editable:false" 
                    searcher="SelBankAccount" type="text"  name="BankAccountName" runat="server" />
                         <input type="hidden" id="hiBankAccountName" name="hiBankAccountName" runat="server" />
                         <input type="hidden" id="BankAccountCode" name="BankAccountCode" runat="server" />
                    <input type="hidden" id="BankAccountID" name="BankAccountID" runat="server" />
                </td>
            </tr> 
             <tr>
                <td class="TdTitle">现金账户</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CashAccountName" data-options="editable:false" 
                    searcher="SelCashAccount" type="text"  name="CashAccountName" runat="server" />
                         <input type="hidden" id="hiCashAccountName" name="hiCashAccountName" runat="server" />
                         <input type="hidden" id="CashAccountCode" name="CashAccountCode" runat="server" />
                    <input type="hidden" id="CashAccountID" name="CashAccountID" runat="server" />
                </td>
            </tr>
            <%-- <tr>
                <td class="TdTitle">科目方向</td>
                <td class="TdContent" colspan="3"><select name="Direction" id="Direction" runat="server">
                        <option value="贷">贷</option>
                        <option value="借">借</option>
                        </select>
                </td>
            </tr>--%>
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 15px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />

                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();

                var strChargeMode = $("#SelChargeMode").find("option:selected").text();

                $("#ChargeMode").val(strChargeMode);

                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigChargeMode', "add", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        HDialog.Close("true");                        
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close('');
            }
            
            function SelChargeMode() {
                
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCChargeModeDlg.aspx' + '?Ram=' + Math.random(), '选择结算方式', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#ChargeModeID').val(Obj.ChargeModeID);
                        $('#ChargeModeCode').val(Obj.ChargeModeCode);
                        $('#ChargeModeName').searchbox("setValue", Obj.ChargeModeName);
                        $('#hiChargeModeName').val(Obj.ChargeModeName);

                        return true;
                    }
                });

                return false;
            }

            
            function SelBusiClass() {
                
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCBusiClassDlg.aspx' +  '?Ram=' + Math.random(), '选择收支项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#BusiClassID').val(Obj.BusiClassID);
                        $('#BusiClassCode').val(Obj.BusiClassCode);
                        $('#BusiClassName').searchbox("setValue", Obj.BusiClassName);
                        $('#hiBusiClassName').val(Obj.BusiClassName);

                        return true;
                    }
                });

                return false;
            }

            //function SelSubj() {
               
            //    HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccountSubjectDlg.aspx' + '?Ram=' + Math.random(), '选择科目(内部)', true, function callback(_Data) {

            //        if (_Data != "") {
            //            var Obj = JSON.parse(_Data);
                        
            //             $('#AccountSubjectID').val(Obj.AccountSubjectID);
            //            $('#AccountSubjectCode').val(Obj.AccountSubjectCode);
            //            $('#AccountSubjectName').searchbox("setValue", Obj.AccountSubjectName);
            //            $('#hiAccountSubjectName').val(Obj.AccountSubjectName);

            //            return true;
            //        }
            //    });

            //    return false;
            //}

            
            //function SelTaxSubj() {
               
            //    HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccountSubjectDlg.aspx' + '?Ram=' + Math.random(), '选择科目(手续费)', true, function callback(_Data) {

            //        if (_Data != "") {
            //            var Obj = JSON.parse(_Data);
                        
            //            $('#TaxAccountSubjectID').val(Obj.AccountSubjectID);
            //            $('#TaxAccountSubjectCode').val(Obj.AccountSubjectCode);
            //            $('#TaxAccountSubjectName').searchbox("setValue", Obj.AccountSubjectName);
            //            $('#hiTaxAccountSubjectName').val(Obj.AccountSubjectName);

            //            return true;
            //        }
            //    });

            //    return false;
            //}

            
            function SelBankAccount() {
                
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCBankAccountDlg.aspx' +  '?Ram=' + Math.random(), '选择银行账户', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#BankAccountID').val(Obj.BankAccountID);
                        $('#BankAccountCode').val(Obj.BankAccountCode);
                        $('#BankAccountName').searchbox("setValue", Obj.BankAccountName);
                        $('#hiBankAccountName').val(Obj.BankAccountName);

                        return true;
                    }
                });

                return false;
            }

            
            function SelCashAccount() {
                
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCCashAccountDlg.aspx' +  '?Ram=' + Math.random(), '选择现金账户', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#CashAccountID').val(Obj.CashAccountID);
                        $('#CashAccountCode').val(Obj.CashAccountCode);
                        $('#CashAccountName').searchbox("setValue", Obj.CashAccountName);
                        $('#hiCashAccountName').val(Obj.CashAccountName);

                        return true;
                    }
                });

                return false;
            }

            function SelCost() {
                HDialog.Open('800', '600', '../DialogNew/CorpCostDlg.aspx', '选择费用项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        $("#CorpCostID").val(Obj.attributes.CorpCostID);
                        $("#CostCode").val(Obj.attributes.CostCode);
                        $("#CostName").searchbox("setValue", Obj.text);
                        $('#hiCostName').val(Obj.text);

                        return true;
                    }
                });

                return false;
            }
        </script>
    </form>
</body>
</html>
