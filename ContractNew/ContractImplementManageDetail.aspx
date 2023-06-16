<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractImplementManageDetail.aspx.cs" Inherits="M_Main.ContractNew.ContractImplementManageDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同执行详细页面</title>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />

    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/GetWorkFlowId.js"></script>
    <style type="text/css">
        #frmForm {
            font-size: 12px;
            font-family: 微软雅黑;
        }

        input, textarea {
            border: 1px solid #cccccc;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .TdTitle {
            width: 15%;
            text-align: center;
        }

        .TdContentSearch {
            width: 30%;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 1px;
            overflow: hidden;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                border-bottom: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }
    </style>
</head>
<body style="overflow: auto">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="ContractType" name="ContractType" runat="server" />
        <input type="hidden" id="ContID" name="ContID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="IID" name="IID" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />

        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <table class="DialogTable" style="width: 100%; padding-top: 5px; line-height: 25px;">
            <tr>
                <td class="TdTitle">项目名称:</td>
                <td class="TdContentSearch">
                    <input type="text" id="CommName" name="CommName" runat="server" disabled="disabled" style="width: 80%; height: 21px" class="easyui-validatebox" />
                </td>
                <td class="TdTitle"><span>合同编号:</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="ContSign" name="ContSign" runat="server" disabled="disabled" style="width: 80%; height: 21px" class="easyui-validatebox" />
                    <%--<a id="personnalShow" style="color: blue; cursor: pointer; width: 50px;" onclick="ViewDetail()">查看详情</a>--%>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">开始日期:</td>
                <td class="TdContentSearch">
                    <input class="Wdate" onkeypress="CheckDate();" runat="server" style="border: 1px solid #cccccc; width: 80%;" id="BeginDate" onclick="WdatePicker()" name="BeginDate" runat="server" />
                </td>
                <td class="TdTitle"><span>结束日期:</span></td>
                <td class="TdContentSearch">
                    <input class="Wdate" onkeypress="CheckDate();" runat="server" style="border: 1px solid #cccccc; width: 80%;" id="EndDate" onclick="WdatePicker()" name="EndDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="color: red;">费用日期:</td>
                <td class="TdContentSearch">
                    <input class="Wdate" onkeypress="CheckDate();" data-options="required:true" style="border: 1px solid #cccccc; width: 80%; height: 21px" id="FeeDate" onclick="WdatePicker()" name="FeeDate" runat="server" />
                </td>
                <td class="TdTitle" style="color: red;">应收日期:</td>
                <td class="TdContentSearch">
                    <input class="Wdate" onkeypress="CheckDate();" data-options="required:true" style="border: 1px solid #cccccc; width: 80%; height: 21px" id="DueDate" onclick="WdatePicker()" name="DueDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同标准:</td>
                <td class="TdContentSearch">
                    <span id="ContSel" style="color: blue; cursor: pointer;" onclick="SelContSetting()">选择标准</span>
                </td>
                <td class="TdTitle"><span>计算方式:</span></td>
                <td class="TdContentSearch">
                    <input type="text" id="CalcTypeName" name="CalcTypeName" runat="server" readonly value="选择标准后自动展示" style="width: 80%; height: 21px; background-color: #E3E3E3;" class="easyui-validatebox" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目:</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" runat="server" id="CostName" readonly size="30" name="CostName" style="border: 1px solid #cccccc; width: 80%; height: 21px; background-color: #E3E3E3;" />
                    <input id="CostID" type="hidden" runat="server" name="CostID" />
                </td>
                <td class="TdTitle">客户名称:</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" runat="server" id="CustName" readonly size="30" name="CustName" style="border: 1px solid #cccccc; width: 80%; height: 21px; background-color: #E3E3E3;" />
                    <input id="CustID" type="hidden" runat="server" name="CustID" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle"><span>单价:</span></td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" id="ContPrice" readonly runat="server" name="ContPrice" style="border: 1px solid #cccccc; width: 80%; height: 21px; background-color: #E3E3E3;" />
                </td>
                <td class="TdTitle">数量:</td>
                <td class="TdContentSearch">
                    <input class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContNumChange,disabled:true" id="ContNum" runat="server" name="ContNum"
                        style="border: 1px solid #cccccc; height: 28px; width: 80%;" />
                    <input type="hidden" id="hidContNum" name="hidContNum" runat="server" />
                </td>

            </tr>
            <tr>
                <td class="TdTitle"><span>金额:</span></td>
                <td class="TdContentSearch">
                    <input class="easyui-numberbox" data-options="min:0,precision:4,disabled:true" id="Amount" runat="server" name="Amount"
                        style="border: 1px solid #cccccc; height: 28px; width: 80%;" />
                    <input type="hidden" id="hidAmount" name="hidAmount" runat="server" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="color:red;">执行说明:</td>
                <td class="TdContentSearch" colspan="3">
                    <textarea style="height: 60px; width: 92%; border: 1px solid #cccccc; resize: none;" runat="server" id="Remark"
                        name="Remark" data-options="required:true"  class="easyui-validatebox"></textarea></td>
            </tr>
        </table>
        <!-- 流程内容 -->
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">


            $(document).ready(function () {
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                    CalcTypeNameChange();
                } else {
                    $("#frmForm input,textarea").attr("disabled", "disabled");
                    $("#frmForm .easyui-numberbox").numberbox({ disabled: true });
                }
            });
            function Close() {
                HDialog.Close();
            }

            //选择标准
            function SelContSetting() {
                if ($("#State").val() != "未启动" && $("#State").val() != "已驳回") {
                    return false;
                }
                HDialog.Open(800, 360, '../ContractNew/SelContSetting.aspx?ContID=' + $("#ContID").val(), "选择合同标准", false, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = JSON.parse(_Data);
                        $("#CalcTypeName").val(arrRet.CalcTypeName);
                        $("#CostID").val(arrRet.CostID);
                        $("#CostName").val(arrRet.CostName);
                        $("#CustID").val(arrRet.CustID);
                        $("#CustName").val(arrRet.CustName);
                        switch ($("#CalcTypeName").val()) {
                            case "按数量单价":
                                $('#Amount').numberbox({ disabled: true });
                                $('#ContNum').numberbox({ disabled: false });
                                $("#ContNum").numberbox("setValue", 0);
                                $("#Amount").numberbox("setValue", 0);
                                $("#ContPrice").val(arrRet.ContPrice);
                                break;
                            case "按实际发生额":
                                $('#Amount').numberbox({ disabled: false });
                                $('#ContNum').numberbox({ disabled: true });
                                $("#Amount").numberbox("setValue", 0);
                                $("#ContNum").numberbox("setValue", 0);
                                $("#ContPrice").val("");
                                $("#Amount").numberbox("setValue", arrRet.ContPrice);
                                break;
                        }
                    }
                });
            }
            function CalcTypeNameChange() {
                switch ($("#CalcTypeName").val()) {
                    case "按数量单价":
                        $('#Amount').numberbox({ disabled: true });
                        $('#ContNum').numberbox({ disabled: false });
                        break;
                    case "按实际发生额":
                        $('#Amount').numberbox({ disabled: false });
                        $('#ContNum').numberbox({ disabled: true });
                        break;
                }
            }

            //数量改变 计算总额
            function ContNumChange(newValue, oldValue) {
                try {
                    var Price = parseFloat($('#ContPrice').val());
                    $("#Amount").numberbox("setValue", Price * newValue);
                } catch (e) {

                }
            }
            function rdoCalcType_OnClick() {
                if (ContractImplementManage.CalcType1.checked) {
                    getObject("labelCalcType").innerHTML = "单价(元/月)";
                    getObject("ContNum").disabled = false;

                    getObject("IncreType2").disabled = false;

                }
                else {
                    if (ContractImplementManage.CalcType2.checked) {
                        getObject("labelCalcType").innerHTML = "总额(元)";
                        getObject("ContNum").text = "";
                        getObject("ContNum").disabled = true;

                        getObject("IncreType1").checked = true;
                        getObject("IncreType2").checked = false;
                        getObject("IncreType2").disabled = true;
                    }
                }
            }
            function ViewDetail() {
                //var conent = '../ContractNew/ContractManage.aspx?OpType=Detail&ContID=' + $("#ContID").val();
                //var w = $(window).width();
                //var h = $(window).height();
                //HDialog.Open(w, h, conent, '合同信息', true, function callback(_Data) {
                //});
            }
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null)
                    return unescape(r[2]);
                return null;
            }

            $("#BtnIsPrint").click(function () {
                //HDialog.Info("暂未开发！");
            });

            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("3秒内不要重复点击");
                    return false;
                }
                if (ClientClick()) {
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 3000);
                    var isValid = $("#frmFrom").form('validate');
                    if (isValid == true) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            return false;
                        }
                        return true;
                    }
                    else {
                        return false;
                    }
                } else {
                    return false;
                }
            });

            function ClientClick() {
                $('#hidAmount').val($('#Amount').numberbox("getValue"));
                $('#hidContNum').val($('#ContNum').numberbox("getValue"));
                return true;
            }

            //单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($('#CalcTypeName').html() == "选择标准后自动展示") {
                    HDialog.Info("请选择费用标准");
                    return;
                }
                if ($('#FeeDate').val() == "") {
                    HDialog.Info("请选择费用日期");
                    return;
                }
                if ($('#DueDate').val() == "") {
                    HDialog.Info("请选择应收日期");
                    return;
                }
                if ($('#Remark').val() == "") {
                    HDialog.Info("请输入执行说明");
                    return;
                }
                
                var FeesAmount = $('#Amount').numberbox("getValue");
                if (parseFloat(FeesAmount) == 0) {
                    HDialog.Info("费用金额为0");
                    return;
                }
                //获取审批流程
                $.tool.DataPostAsync('AuditCorpCostItemContract', 'List', 'AuditType=11&page=1&rows=10000&ContractType=' + $('#ContractType').val(),
                 function Init() {
                 },
                 function callback(_Data) {
                     if (_Data != "") {
                         var Items = eval("(" + _Data + ")");
                         if (Items.rows.length == 0) {
                             HDialog.Info("请设置合同执行流程后再进行操作!");
                             return;
                         }
                         var FlowId = "";
                         for (var i = 0; i < Items.rows.length; i++) {
                             if (FlowId == "") {
                                 FlowId = Items.rows[i].WorkFlowID;
                             } else {
                                 FlowId += "," + Items.rows[i].WorkFlowID;
                             }
                         }
                         if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                             var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=1203&biaoshi=1&FlowId=" + FlowId + "&random=" + Math.random();
                             HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                 if (_Data != '') {
                                     var obj = JSON.parse(_Data);
                                     LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                     document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                     document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                 }
                             });
                         }
                     }
                 },
                 function completeCallback() {
                 },
                 function errorCallback() {
                 });

            }

        </script>
    </form>
</body>
</html>
