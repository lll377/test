<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetAccountItemManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetAccountItemManage" %>

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
                <td class="TdTitle">费用项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CostName" 
                    searcher="SelCost" type="text"  name="CostName" runat="server" />
                         <input type="hidden" id="hiCostName" name="hiCostName" runat="server" />
                         <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
                         <input type="hidden" id="CostCode"  name="CostCode" runat="server" />
                </td>
             </tr>
             <tr>
                <td class="TdTitle">费项科目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CostItemName" data-options="editable:false" 
                    searcher="SelAccSubj" type="text"  name="CostItemName" runat="server" />
                         <input type="hidden" id="hiCostItemName" name="hiCostItemName" runat="server" />
                         <input type="hidden" id="CostItemCode" name="CostItemCode" runat="server" />
                    <INPUT id="btnClearAccSubj" onclick="javascript:btnClearAccSubj_OnClick();"
						type="button" value="清空" name="btnClearAccSubj" runat="server">
                </td>
            </tr>
              <tr>
                <td class="TdTitle">收支项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="AccountItemName" data-options="editable:false" 
                    searcher="SelAccountItem" type="text"  name="AccountItemName" runat="server" />
                         <input type="hidden" id="hiAccountItemName" name="hiAccountItemName" runat="server" />
                         <input type="hidden" id="AccountItemMID" name="AccountItemMID" runat="server" />
                    <INPUT id="btnClearAccountItem" onclick="javascript:btnClearAccountItem_OnClick();"
						type="button" value="清空" name="btnClearAccountItem" runat="server">
                </td>
            </tr>
           
            <%--<tr>
                <td class="TdTitle">实际承担项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="ActuallyProjectName" data-options="editable:false" 
                    searcher="SelActProj" type="text"  name="ActuallyProjectName" runat="server" />
                         <input type="hidden" id="hiActuallyProjectName" name="hiActuallyProjectName" runat="server" />
                         <input type="hidden" id="ActuallyProjectMID" name="ActuallyProjectMID" runat="server" />
                    <INPUT id="btnClearActProj" onclick="javascript:btnClearActProj_OnClick();"
						type="button" value="清空" name="btnClearActProj" runat="server">
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
           
                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigAccountItem', "add", $('#frmForm').serialize(),
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
                        
            function SelAccountItem() {
               
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccountItemDlg.aspx' + '?Ram=' + Math.random(), '选择收支项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                                                
                        $('#AccountItemMID').val(Obj.AccountItemMID);
                        $('#AccountItemName').searchbox("setValue", Obj.AccountItemName);
                        $('#hiAccountItemName').val(Obj.AccountItemName);

                        return true;
                    }
                });

                return false;
            }            

            function btnClearAccountItem_OnClick()
            {
                $('#AccountItemMID').val("");
                $('#AccountItemName').searchbox("setValue", "");
                $('#hiAccountItemName').val("");
            }

            function SelAccSubj() {
               
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择费用项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                                                
                        $('#CostItemCode').val(Obj.SubjCode);
                        $('#CostItemName').searchbox("setValue", Obj.SubjName);
                        $('#hiCostItemName').val(Obj.SubjName);

                        return true;
                    }
                });

                return false;
            }


            function btnClearAccSubj_OnClick()
            {
                $('#CostItemCode').val("");
                $('#CostItemName').searchbox("setValue", "");
                $('#hiCostItemName').val("");
            }

            //function SelActProj() {
               
            //    HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccountBodyDlg.aspx' + '?Ram=' + Math.random(), '选择实际承担项目', true, function callback(_Data) {

            //        if (_Data != "") {
            //            var Obj = JSON.parse(_Data);
                                                
            //            $('#ActuallyProjectMID').val(Obj.AccountBodyMID);
            //            $('#ActuallyProjectName').searchbox("setValue", Obj.AccountBodyName);
            //            $('#hiActuallyProjectName').val(Obj.AccountBodyName);

            //            return true;
            //        }
            //    });

            //    return false;
            //}
            
            function btnClearActProj_OnClick()
            {
                $('#ActuallyProjectMID').val("");
                $('#ActuallyProjectName').searchbox("setValue", "");
                $('#hiActuallyProjectName').val("");
            }

        </script>
    </form>
</body>
</html>
