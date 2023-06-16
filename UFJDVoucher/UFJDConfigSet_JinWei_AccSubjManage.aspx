<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSet_JinWei_AccSubjManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSet_JinWei_AccSubjManage" %>

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
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">
           <tr>
                <td class="TdTitle">类别</td>
                <td class="TdContent" colspan="3">
                   <SELECT id="SubjectSetType" name="SubjectSetType" runat="server">
                       <%-- <option value="17">应收账款</option>
                        <option value="18">业务收入</option>--%>
                        <OPTION value="1">收款</OPTION>
                        <OPTION value="14">预收</OPTION>
                        <OPTION value="4">预存费用</OPTION>
                        <option value="5">预交冲抵</option>
                        <option value="3">合同违约金</option>
                        <OPTION value="9">退款</OPTION>
                        <OPTION value="10">预交退款</OPTION>
                        <option value="12">合同违约金退款</option>
					</SELECT>
                </td>
             </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CostName" 
                    searcher="SelCost" type="text"  name="CostName" runat="server" />
                         <input type="hidden" id="hiCostName" name="hiCostName" runat="server" />
                         <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
                         <input type="hidden" id="CostCode"  name="CostCode" runat="server" />
                </td>
             </tr>
              <tr>
                <td class="TdTitle">科目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="AccSubjName" data-options="editable:false" 
                    searcher="SelSubj" type="text"  name="AccSubjName" runat="server" />
                         <input type="hidden" id="hiAccSubjName" name="hiAccSubjName" runat="server" />
                         <input type="hidden" id="AccSubjCode" name="AccSubjCode" runat="server" />
                    <INPUT id="btnClearAccSubj" onclick="javascript:btnClearAccSubj_OnClick();"
						type="button" value="清空" name="btnClearAccSubj" runat="server">
                </td>
            </tr>             
            <tr>
                <td class="TdTitle">税率</td>
                <td class="TdContent" colspan="3"><input id="TaxRate"
                    type="text"  name="TaxRate" runat="server" />                        
                </td>
            </tr>
            <tr>
                <td class="TdTitle">科目(税)</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="TaxAccSubjName" data-options="editable:false" 
                    searcher="SelTaxSubj" type="text"  name="TaxAccSubjName" runat="server" />
                         <input type="hidden" id="hiTaxAccSubjName" name="hiTaxAccSubjName" runat="server" />
                         <input type="hidden" id="TaxAccSubjCode" name="TaxAccSubjCode" runat="server" />
                    <INPUT id="btnClearTaxAccSubj" onclick="javascript:btnClearTaxAccSubj_OnClick();"
						type="button" value="清空" name="btnClearTaxAccSubj" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">现金流量</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CashFlowName" data-options="editable:false" 
                    searcher="SelCashFlow" type="text"  name="CashFlowName" runat="server" />
                         <input type="hidden" id="hiCashFlowName" name="hiCashFlowName" runat="server" />
                         <input type="hidden" id="CashFlowCode" name="CashFlowCode" runat="server" />
                    <INPUT id="btnClearCashFlow" onclick="javascript:btnClearCashFlow_OnClick();"
						type="button" value="清空" name="btnClearCashFlow" runat="server">
                </td>
            </tr>
             <tr>
                <td class="TdTitle">客商</td>
                <td class="TdContent"><input class="easyui-searchbox" id="UFCustName" data-options="editable:false" 
                    searcher="SelUFCust" type="text"  name="UFCustName" runat="server" />
                         <input type="hidden" id="hiUFCustName" name="hiUFCustName" runat="server" />
                         <input type="hidden" id="UFCustCode" name="UFCustCode" runat="server" />
                    <INPUT id="btnClearUFCust" onclick="javascript:btnClearUFCust_OnClick();"
						type="button" value="清空" name="btnClearUFCust" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">往来项目</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CurrentItemName" data-options="editable:false" 
                    searcher="SelCurrentItem" type="text"  name="CurrentItemName" runat="server" />
                         <input type="hidden" id="hiCurrentItemName" name="hiCurrentItemName" runat="server" />
                         <input type="hidden" id="CurrentItemCode" name="CurrentItemCode" runat="server" />
                    <INPUT id="btnClearCurrentItem" onclick="javascript:btnClearCurrentItem_OnClick();"
						type="button" value="清空" name="btnClearCurrentItem" runat="server">
                </td>
            </tr>           
            <tr>
                <td class="TdTitle">款项性质</td>
                <td class="TdContent"><input class="easyui-searchbox" id="FundPropertyName" data-options="editable:false" 
                    searcher="SelFundProperty" type="text"  name="FundPropertyName" runat="server" />
                         <input type="hidden" id="hiFundPropertyName" name="hiFundPropertyName" runat="server" />
                         <input type="hidden" id="FundPropertyCode" name="FundPropertyCode" runat="server" />
                    <INPUT id="btnClearFundProperty" onclick="javascript:btnClearFundProperty_OnClick();"
						type="button" value="清空" name="btnClearFundProperty" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">物业收入</td>
                <td class="TdContent"><input class="easyui-searchbox" id="PropertyIncomeName" data-options="editable:false" 
                    searcher="SelPropertyIncome" type="text"  name="PropertyIncomeName" runat="server" />
                         <input type="hidden" id="hiPropertyIncomeName" name="hiPropertyIncomeName" runat="server" />
                         <input type="hidden" id="PropertyIncomeCode" name="PropertyIncomeCode" runat="server" />
                    <INPUT id="btnClearPropertyIncome" onclick="javascript:btnClearPropertyIncome_OnClick();"
						type="button" value="清空" name="btnClearPropertyIncome" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">资金计划项目</td>
                <td class="TdContent"><input class="easyui-searchbox" id="RollProjetName" data-options="editable:false" 
                    searcher="SelRollProjet" type="text"  name="RollProjetName" runat="server" />
                         <input type="hidden" id="hiRollProjetName" name="hiRollProjetName" runat="server" />
                         <input type="hidden" id="RollProjetCode" name="RollProjetCode" runat="server" />
                    <INPUT id="btnClearRollProjet" onclick="javascript:btnClearRollProjet_OnClick();"
						type="button" value="清空" name="btnClearRollProjet" runat="server">
                </td>
            </tr>
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
           
                $.tool.DataPostChk('frmForm', 'UFJDConfigAccSubj', "add", $('#frmForm').serialize(),
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
                        
            function SelSubj() {
               
                HDialog.Open('800', '600', '../DialogNew/UFJDAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择科目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                                                
                        $('#AccSubjCode').val(Obj.SubjCode);
                        $('#AccSubjName').searchbox("setValue", Obj.SubjName);
                        $('#hiAccSubjName').val(Obj.SubjName);

                        return true;
                    }
                });

                return false;
            }            

            function SelTaxSubj() {
               
                HDialog.Open('800', '600', '../DialogNew/UFJDAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择科目(税)', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                                                
                        $('#TaxAccSubjCode').val(Obj.SubjCode);
                        $('#TaxAccSubjName').searchbox("setValue", Obj.SubjName);
                        $('#hiTaxAccSubjName').val(Obj.SubjName);

                        return true;
                    }
                });

                return false;
            }            

            function SelCashFlow() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCashFlowDlg.aspx' +  '?Ram=' + Math.random(), '选择现金流量', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#CashFlowCode').val(Obj.CashFlowCode);
                        $('#CashFlowName').searchbox("setValue", Obj.CashFlowName);
                        $('#hiCashFlowName').val(Obj.CashFlowName);

                        return true;
                    }
                });

                return false;
            }

            
            function SelUFCust() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCustDlg.aspx' +  '?Ram=' + Math.random(), '选择客商', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#UFCustCode').val(Obj.CustID);//亿利金威用CustID CustCode
                        $('#UFCustName').searchbox("setValue", Obj.CustName);
                        $('#hiUFCustName').val(Obj.CustName);

                        return true;
                    }
                });

                return false;
            }

            function SelCurrentItem() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCurrentItemDlg.aspx' +  '?Ram=' + Math.random(), '选择往来项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#CurrentItemCode').val(Obj.CurrentItemCode);
                        $('#CurrentItemName').searchbox("setValue", Obj.CurrentItemName);
                        $('#hiCurrentItemName').val(Obj.CurrentItemName);

                        return true;
                    }
                });

                return false;
            }


            function SelFundProperty() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDFundPropertyDlg.aspx' +  '?Ram=' + Math.random(), '选择款项性质', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#FundPropertyCode').val(Obj.FundPropertyCode);
                        $('#FundPropertyName').searchbox("setValue", Obj.FundPropertyName);
                        $('#hiFundPropertyName').val(Obj.DFundPropertyName);

                        return true;
                    }
                });

                return false;
            }

            function SelPropertyIncome() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDPropertyIncomeDlg.aspx' +  '?Ram=' + Math.random(), '选择物业收入', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#PropertyIncomeCode').val(Obj.PropertyIncomeCode);
                        $('#PropertyIncomeName').searchbox("setValue", Obj.PropertyIncomeName);
                        $('#hiPropertyIncomeName').val(Obj.PropertyIncomeName);

                        return true;
                    }
                });

                return false;
            }

             function SelRollProjet() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDRollProjetDlg.aspx' +  '?Ram=' + Math.random(), '选择资金计划项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#RollProjetCode').val(Obj.RollProjetCode);
                        $('#RollProjetName').searchbox("setValue", Obj.RollProjetName);
                        $('#hiRollProjetName').val(Obj.RollProjetName);

                        return true;
                    }
                });

                return false;
            }

            function btnClearAccSubj_OnClick()
            {
                $('#AccSubjCode').val("");
                $('#AccSubjName').searchbox("setValue", "");
                $('#hiAccSubjName').val("");
            }

            function btnClearTaxAccSubj_OnClick()
            {
                $('#TaxAccSubjCode').val("");
                $('#TaxAccSubjName').searchbox("setValue", "");
                $('#hiTaxAccSubjName').val("");
            }

            function btnClearCashFlow_OnClick()
            {
                $('#CashFlowCode').val("");
                $('#CashFlowName').searchbox("setValue", "");
                $('#hiCashFlowName').val("");
            }
            
            function btnClearUFCust_OnClick()
            {
                $('#UFCustCode').val("");
                $('#UFCustName').searchbox("setValue", "");
                $('#hiUFCustName').val("");
            }

            function btnClearCurrentItem_OnClick()
            {
                $('#CurrentItemCode').val("");
                $('#CurrentItemName').searchbox("setValue", "");
                $('#hiCurrentItemName').val("");  
            }

            function btnClearFundProperty_OnClick()
            {
                $('#FundPropertyCode').val("");
                $('#FundPropertyName').searchbox("setValue", "");
                $('#hiFundPropertyName').val("");
            }

            function btnClearPropertyIncome_OnClick()
            {
                $('#PropertyIncomeCode').val("");
                $('#PropertyIncomeName').searchbox("setValue", "");
                $('#hiPropertyIncomeName').val("");
            }

            function btnClearRollProjet_OnClick()
            {
                $('#RollProjetCode').val("");
                $('#RollProjetName').searchbox("setValue", "");
                $('#hiRollProjetName').val("");
            }
            
        </script>
    </form>
</body>
</html>
