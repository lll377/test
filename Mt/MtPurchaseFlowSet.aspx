<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtPurchaseFlowSet.aspx.cs" Inherits="M_Main.Mt.MtPurchaseFlowSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
   
    <link href="../css/button.css" type="text/css" rel="stylesheet" /><link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>


    <style>
        .Td {
    height: 16px;
    width: 20%;
    text-align:right;
}
        .TContent {
    height: 16px;
    width: 25%;
    margin-left:15px;
    padding-left:15px;
    text-align:left;
    /*border: none;border-bottom: 1px solid #cccccc;*/
}
        .validatebox-invalid {
    border-color: #ffa8a8;
    background-color: #fff3f3;
    color: #000;
}
         
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
          <input type="hidden" id="TypeCode" name="TypeCode" runat="server" />
         <div  style="width: 99%; margin: 0px auto; text-align: center;">
              <table class="DialogTable"  style="width:100%;">
                   <tr>
                        <td colspan="4" style="height: 8px">
                           
                        </td>
                    </tr>
             <%--       <tr>
                        <td class="Td">采购类型</td>
                        <td class="TContent">
                             <select name="TypeCode" id="TypeCode">
	                                      <option value="计划采购">计划采购</option>
	                                      <option value="零星采购">零星采购</option>
	                                      <option value="紧急采购">紧急采购</option>
	                                      <option value="专项采购">专项采购</option>
                              </select>
                        </td>
                        <td class="Td"></td>
                        <td class="TContent">
                       
                        </td>
                    </tr>
                       <tr>
                        <td colspan="4" style="height: 8px"></td>
                    </tr>--%>
                      <tr>
                        <td class="Td"><span id="spanMoneyS"></span>金额(起)</td>
                        <td class="TContent">
                            <input id="StartMoney" name="StartMoney" class="easyui-numberbox" min="0.0001" precision="4" data-options="required:true" />
                        </td>
                        <td class="Td"><span id="spanMoneyE"></span>金额(止)</td>
                        <td class="TContent">
                            <input id="EndMoney" name="EndMoney" class="easyui-numberbox" min="0.0001" precision="4" data-options="required:true" />
                        </td>
                    </tr>
                       <tr>
                        <td colspan="4" style="height: 8px"></td>
                    </tr>
                     <tr>
                        <td class="Td">流程名称</td>
                        <td class="TContent">
                            <input type="hidden" id="WorkFlowId" name="WorkFlowId" />
                            <input id="WorkFlowIdName" name="WorkFlowIdName"   class="easyui-validatebox" onclick="WorkFlowChoise();" data-options="required:true" />
                        </td>
                        <td class="Td"></td>
                        <td class="TContent">
                       
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                </table>
          </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onclick="Save();" />
            <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
        </div>
        
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script type="text/javascript">
            function WorkFlowChoise()
            {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=" + $("#TypeCode").val() + "&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        document.getElementById("WorkFlowId").value = obj[0].toString();
                        document.getElementById("WorkFlowIdName").value = obj[1].toString();
                    }
                });
            }
            function Load() {
                var TypeCode = $("#TypeCode").val();
                switch (TypeCode)
                {
                    case "02":
                        $("#spanMoneyS").text("计划");
                        $("#spanMoneyE").text("计划");
                        break;
                    case "03":
                        $("#spanMoneyS").text("入库");
                        $("#spanMoneyE").text("入库");
                        break;
                    case "04":
                        $("#spanMoneyS").text("出库");
                        $("#spanMoneyE").text("出库");
                        break;
                    case "06":
                        $("#spanMoneyS").text("调拨");
                        $("#spanMoneyE").text("调拨");
                        break;
                    default:
                        $("#spanMoneyS").text("采购");
                        $("#spanMoneyE").text("采购");
                        break;
                }
               
                if ($("#OpType").val() == 'Edit') {
                    $.tool.DataGet('MaterialBaseHandle', 'GetMtPurchaseFlowById', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) { 
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象 
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            $("#frmForm").form('validate');
                            $("#StartMoney").numberbox('setValue', varObjects[0].StartMoney);
                            $("#EndMoney").numberbox('setValue', varObjects[0].EndMoney);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                }
            }
            function Close()
            {
                HDialog.Close();
            }
            function Save()
            {
                if (parseFloat($("#StartMoney").numberbox('getValue')) > parseFloat($("#EndMoney").numberbox('getValue')))
                {
                    HDialog.Info("采购金额(起)不能大于采购金额(止)！");
                }
                else
                $.tool.DataPostChk('frmForm', 'MaterialBaseHandle', 'SaveMtPurchaseFlow', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data)
                        {
                            if (_Data == "true")
                            {
                                HDialog.Info("操作成功!");
                                HDialog.Close("true");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                            HDialog.Info("保存错误!");
                        });
            }
            $(document).ready(function () { Load(); });
        </script>
    </form>
</body>
</html>
