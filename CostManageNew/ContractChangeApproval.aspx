<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChangeApproval.aspx.cs" Inherits="M_Main.CostManageNew.ContractChangeApproval" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>合同变更审核</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/GetWorkFlowId.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
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
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <%--盘点IDeas--%>
        <input type="hidden" id="Id" name="Id" runat="server" value="" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <%--合同ID--%>
        <input type="hidden" id="CId" name="CId" runat="server" value="" />
        <input type="hidden" id="SubjectName" name="SubjectName" runat="server" value="" />
        <input type="hidden" id="CsId" name="CsId" runat="server" value="" />
        <input type="hidden" id="Rate" name="Rate" runat="server" value="" />

        <%--成本单位--%>
        <input type="hidden" name="CastName" id="CastName" value="" />
        <input type="hidden" name="CostId" id="CostId" value="" />

        <input type="hidden" name="inserted" id="inserted" value="" runat="server" />
        <input type="hidden" name="updated" id="updated" value="" runat="server" />
        <input type="hidden" name="deleted" id="deleted" value="" runat="server" />

        <input type="hidden" name="selected" id="selected" value="" runat="server" />

        <input type="hidden" name="HdText" value="" id="HdText" runat="server" />
        <input type="hidden" name="HdChangeName" value="" id="HdChangeName" runat="server" />



        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="Originator" name="Originator" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />


        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>

        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">项目名称：
                </td>
                <td class="DialogTdContent">
                    <input id="CommName" name="CommName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" onclick="SelItem();" />
                    <input type="hidden" id="CommId" name="CommId" runat="server" />
                </td>
                <td class="DialogTdTitle">机构部门：
                </td>
                <td class="DialogTdContent">
                    <input id="DepName" name="DepName" class="easyui-validatebox" runat="server" data-options="required:true" readonly="readonly" type="text" onclick="SelDepSer();" />
                    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                </td>
                <td class="DialogTdTitle">负责人：
                </td>
                <td class="DialogTdContent">
                    <input id="PrincipalName" name="PrincipalName" class="easyui-validatebox" runat="server" data-options="required:true" readonly="readonly" type="text" onclick="SelUserSer();" />
                    <input type="hidden" id="Principal" name="Principal" runat="server" />
                </td>
                <td class="DialogTdTitle">合同编号：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractNo" name="ContractNo" style="width: 68%;" class="easyui-validatebox" readonly="readonly" data-options="required:true" runat="server" type="text" onclick="SelContractInformation();" />
                    <a id="personnalShow" style="color: blue; cursor: pointer; width: 50px;" onclick="ContractShow()">查看</a>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同名称：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractName" data-options="required:true" name="ContractName" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">合同类型：
                </td>
                <td class="DialogTdContent">
                    <input id="TypeName" name="TypeName" data-options="required:true" type="text" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <input type="hidden" name="ContractType" id="ContractType" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">供方单位：
                </td>
                <td class="DialogTdContent">
                    <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" data-options="required:true" readonly="readonly" runat="server" />
                    <input type="hidden" name="SupplierId" id="SupplierId" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">变更类型：
                </td>
                <td class="DialogTdContent">
                    <select id="ContractSource" name="ContractSource" data-options="required:true" onchange="ContractSourceChange(this.options[this.options.selectedIndex].value)"
                        style="border: 1px solid #cccccc; height: 20px; line-height: 20px; width: 75%;" runat="server">
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更说明：</td>
                <td class="DialogTdContent" colspan="7">
                    <input id="ChangeRemark" name="ChangeRemark" style="width: 95.5%; height: 22px;" type="text" class="easyui-validatebox" runat="server" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更前期限：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractPeriod" name="BeforeContractPeriod" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后期限：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractPeriod" name="AfterContractPeriod" class="easyui-validatebox" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更前开始时间：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractBegin" name="BeforeContractBegin" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后开始时间：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractBegin" name="AfterContractBegin"
                        onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更前结束时间：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractEnd" name="BeforeContractEnd" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后结束时间：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractEnd" name="AfterContractEnd"
                        onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">变更前金额（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractMoney" name="BeforeContractMoney" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后金额（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractMoney" name="AfterContractMoney" class="easyui-validatebox" data-options="required:true" runat="server" type="text" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更前质保金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeMargin" name="BeforeMargin" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后质保金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterMargin" name="AfterMargin" class="easyui-validatebox" runat="server" onblur="validateNumber(this)" type="text" />
                </td>
                <td class="DialogTdTitle">变更前违约金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforePenalty" name="BeforePenalty" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后违约金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterPenalty" name="AfterPenalty" class="easyui-validatebox" runat="server" onblur="validateNumber(this)" type="text" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更前付款方式：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforePayType" name="BeforePayType" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">变更后付款方式：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterPayType" name="AfterPayType" class="easyui-validatebox" runat="server" type="text" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdContent" colspan="7">
                    <textarea id="Remark" name="Remark" style="width: 95.5%; height: 22px;" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">附&nbsp;&nbsp;件：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input id="btnFile" style="width: 260px; height: 25px;" tabindex="1" type="file" size="1"
                        name="btnFile" runat="server" />
                    <input type="button" name="fileList" style="width: 50px; height: 25px;" value="上传" id="fileList" runat="server" />
                    <input type="button" name="fileList1" style="width: 70px; height: 25px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" />
                    <input type="button" name="fileList1" style="width: 70px; height: 25px;" value="查看备注" id="Button1" runat="server" onclick="OnRemark();" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls1:'icon-search',closed: true,modal:true" style="width: 800px; height: 250px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td style="color: red;">应付金额管控方式：</td>
                </tr>
                <tr>
                    <td>1、当期控制：
                    </td>
                </tr>
                <tr>
                    <td>可输入金额≤本期预算总额（按科目管控层级提取）-本期合同类应付金额（含审批中合同）-本期无合同类的资金计划金额（含审批中计划）-本期无合同无计划类的报账付款金额（含审批中付款）
                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>2、累计控制：
                    </td>
                </tr>
                <tr>
                    <td>可输入金额≤1月至本月的预算总额（按科目管控层级提取）-1月至本月合同类应付金额（含审批中合同）-1月至上月无合同类的报账付款金额（含审批中付款）
                        -本月无合同类的资金计划金额（含审批中计划）-本月无合同无计划类的报账付款金额（含审批中付款）

                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>3、总量控制：
                    </td>
                </tr>
                <tr>
                    <td>可输入金额≤本年预算总额（按科目管控层级提取）-本年合同类的合同应付金额（含审批中合同）-1月至上月无合同类的报账付款金额（含审批中付款）
                        -本月无合同类的资金计划金额（含审批中计划）-本月无合同无计划类的报账付款金额（含审批中付款）
                    </td>
                </tr>

            </table>
        </div>

        <script type="text/javascript">
            //计算小数位数
            var decimalPos = 2;
            //编辑的行号
            var editIndex = undefined;

            var IsSubmitFlag = true;

            $("input[type='submit']").click(function (e) {

                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }


                var myselect = document.getElementById("ContractSource");
                var index = myselect.selectedIndex;
                if (index != "-1") {
                    $("#HdText").val(myselect.options[index].value);
                }

                //if ($("#ContractSource").is(":selected") == false) {
                //    HDialog.Info("请选择变更类型");
                //    return false;
                //}

                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                var isValid = $("#frmForm").form('validate');

                //加载数据
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }
                    var trlength = $("#WorkFlowNodeList tr").length;
                    if (trlength < 2) {
                        HDialog.Info("请给该流程设置处理人");
                        return false;
                    }
                    //初始化加载数据
                    var DataRows = $('#TableContainer').datagrid("getRows");
                    $("#SearchResult").val(JSON.stringify(DataRows));

                }
                else {
                    return false;
                }
            });

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            //查看上传附件
            function OnFileList() {
                HDialog.Open(600, 450, '../DialogNew/ContractTenderFiles.aspx?CtId=' + $("#Id").val(), '查看合同变更附件', true, function callback(_Data) {
                });
            }

            //查看备注
            function OnRemark() {
                $('#DlgMemo').parent().appendTo($("form:first"))
                $('#DlgMemo').dialog('open');
            }

            function ContractSourceChange(s) {
                $("#HdText").val(s);
                //选择后,让第一项被选中,这样,就有Change啦.
                document.all.sel.options[0].selected = true;
            }

            //选择项目
            function SelItem() {
                //HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split(',');
                //        $("#CommId").val(varObjects[2]);
                //        $("#CommName").val(varObjects[1]);
                //    }
                //});
                HDialog.Open('370', '360', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        //$("#CommId").val(varObjects.attributes.InPopedom);
                        //$("#CommName").val(varObjects.text);
                        var arrRet = JSON.parse(_Data);
                        $("#CommId").val(arrRet.id);
                        $("#CommName").val(arrRet.name);
                    }
                });
            }

            //选择部门
            function SelDepSer() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle_Cost.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }

            //选择责任人
            function SelUserSer() {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }
            //选择合同
            function SelContractInformation() {
                HDialog.Open('800', '500', '../DialogNew/SelContractInformation.aspx?IsApproval=1&IsEnd=0&IsClose=0', '选择合同', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        //判断该合同是否发生终止
                        if (varObjects.CId != "" && varObjects != null && varObjects != undefined) {
                            $.tool.DataGet('CsCost', 'GetContractModel', 'CId=' + varObjects.CId,
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "null") {
                                        HDialog.Info("该合同已终止无法进行操作！");
                                    } else {
                                        $.tool.DataGet('CsCost', 'GetContractChangeModel', 'CId=' + varObjects.CId,
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                if (_Data == "null") {
                                                    HDialog.Info("该合同有审核中的变更信息，不能二次变更");
                                                } else {
                                                    $("#CommId").val(varObjects.CommId);
                                                    $("#CommName").val(varObjects.CommName);
                                                    $("#DepCode").val(varObjects.DepCode);
                                                    $("#DepName").val(varObjects.DepName);
                                                    $("#Principal").val(varObjects.Principal);
                                                    $("#PrincipalName").val(varObjects.PrincipalName);
                                                    $("#CId").val(varObjects.CId);
                                                    $("#ContractNo").val(varObjects.ContractNo);
                                                    $("#ContractName").val(varObjects.ContractName);
                                                    $("#SupplierId").val(varObjects.SupplierId);
                                                    $("#SupplierName").val(varObjects.SupplierName);
                                                    $("#ContractType").val(varObjects.ContractType);
                                                    $("#TypeName").val(varObjects.TypeName);
                                                    $("#BeforeContractPeriod").val(varObjects.ContractPeriod);
                                                    $("#AfterContractPeriod").val(varObjects.ContractPeriod);
                                                    $("#BeforeContractBegin").val(varObjects.ContractBegin);
                                                    $("#AfterContractBegin").val(varObjects.ContractBegin);
                                                    $("#BeforeContractEnd").val(varObjects.ContractEnd);
                                                    $("#AfterContractEnd").val(varObjects.ContractEnd);
                                                    $("#BeforeContractMoney").val(varObjects.ContractMoney);
                                                    $("#AfterContractMoney").val(varObjects.ContractMoney);
                                                    $("#BeforeMargin").val(varObjects.MarginMoney);
                                                    $("#AfterMargin").val(varObjects.MarginMoney);
                                                    $("#BeforePenalty").val(varObjects.PenaltyMoneh);
                                                    $("#AfterPenalty").val(varObjects.PenaltyMoneh);
                                                    $("#BeforePayType").val(varObjects.PayType);
                                                    $("#AfterPayType").val(varObjects.PayType);
                                                    //加载数据
                                                    LoadList(varObjects.CId);
                                                }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    }
                });
            }

            //查看合同详情
            function ContractShow() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                if ($("#CId").val() == null || $("#CId").val() == "" || $("#CId").val() == undefined) {
                    HDialog.Info("请选择查看合同");
                    return;
                }
                HDialog.Open(w, h, '../CostManageNew/FromTabs.aspx?changBS=1&OpType=edit&Id=' + $("#CId").val(), '查看合同信息', true, function callback(_Data) {
                });
            }

            var column = [[
                { field: 'ChId', title: 'ChId', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CId', title: 'CId', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CostId', title: '成本单位ID', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CsId', title: '成本科目ID', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CastName', title: '成本单位', width: 100, align: 'center', sortable: true },
                { field: 'SubjectName', title: '成本科目', align: 'center', width: 100, sortable: true },
                { field: 'Rate', title: '税率（%）', align: 'center', width: 100, sortable: true },
                { field: 'PayMonth', title: '应付年月', width: 80, align: 'left', sortable: true },
                { field: 'PayMoney', title: '应付金额（元）', width: 60, align: 'center', sortable: true },
                { field: 'PayedMoney', title: '已付金额（元）', width: 60, align: 'center', sortable: true },
                { field: 'Remark', title: '备注', width: 100, align: 'center', sortable: true },
                //{ field: 'BudgetPayMoney', title: '预算剩余金额（元）', width: 50, align: 'left', sortable: true }
            ]];
            var toolbar;
            var toolbar_Start = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        MaterialChiose();
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }

                        HDialog.Prompt("是否删除该项", function () {
                            $.tool.DataGet('MtInventory', 'DelDetail', 'Id=' + row["Id"],
                                function Init() {
                                },
                                function callback(_Data) {
                                    var index = $("#TableContainer").datagrid("getRowIndex", row);
                                    $('#TableContainer').datagrid('deleteRow', index);
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        });

                    }
                }
                , '-',
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        //结束编辑
                        EndEdit();
                        ClientClick();
                        CheckMoneyAll();
                    }
                }
            ];
            if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                toolbar = toolbar_Start;
            }
            else {
                if ($("#State").val() == "审核中") {
                    toolbar = "";
                }
                if ($("#State").val() == "已审核") {
                    toolbar = "";
                }
            }

            //验证是否为数字
            function validateNumber(obj) {
                var a = /^[0-9]*(\.[0-9]{1,2})?$/;
                if (!a.test(obj.value.trim())) {
                    HDialog.Info("输入金额格式不正确");
                }
            }

            //选择项目
            function SelItem() {
                HDialog.Open('370', '360', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        //$("#CommId").val(varObjects.attributes.InPopedom);
                        //$("#CommName").val(varObjects.text);
                        var arrRet = JSON.parse(_Data);
                        $("#CommId").val(arrRet.id);
                        $("#CommName").val(arrRet.name);
                    }
                });
            }

            //选择部门
            function SelDep() {
                //HDialog.Open('370', '360', '../dialog/DepartmentDlg_hr.aspx', '选择部门', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split('\t');
                //        $("#DepCode").val(varObjects[0]);
                //        $("#DepName").val(varObjects[1]);
                //    }
                //});
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }

            function MaterialChiose() {
                if ($("#CommId").val() == "") {
                    HDialog.Info("请选择所属项目");
                    return;
                }
                if ($("#DepCode").val() == "") {
                    HDialog.Info("请选择所属部门");
                    return;
                }
                if ($("#Principal").val() == "") {
                    HDialog.Info("请选择负责人");
                    return;
                }
                if ($("#ContractNo").val() == "") {
                    HDialog.Info("请选择合同");
                    return;
                }
                AddRows();
            }

            //选择费用后增加行
            function AddRows() {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        ChId: guid(),
                        CId: $("#CId").val(),
                        CostId: "",
                        CsId: "",
                        PayMonth: "",
                        PayMoney: "0",
                        PayedMoney: "0",
                        Remark: "",
                        IsDelete: "",
                        Sort: "",
                        PayDepCode: "",
                        Rate: "",
                        CastName: "",
                        SubjectName: "",
                        ContractName: "",
                        ContractPayedMoney: "",
                        ContractNo: "",
                        ContractMoney: "",
                        CommId: "",
                        DepCode: "",
                        PayType: "",
                        SupplierId: "",
                        SupplierName: "",
                        ContractType: "",
                        PayDepName: "",
                        WorkPlanId: "",
                        WorkPlanName: "",
                        IsClose: "",
                        RN: "",
                        BudgetPayMoney: ""
                    }
                });
            }


            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });



            function LoadList(CId) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractChargeList&CId=' + CId,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 60, 70],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    toolbar: toolbar,
                    remoteSort: false,
                    onLoadSuccess: function () {
                        if ($("#State").val() == "未启动") {//只有未提交审核时才能操作 
                            $('#TableContainer input:checkbox').each(function (index, el) {
                                el.disabled = false;
                            });
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#State").val() == "已审核") return;

                        //发起时/驳回 允许编辑,审核中不允许编辑
                        if ($("#State").val() == "未启动" || $("#State").val()=="已驳回") {
                            //$("#TableContainer").datagrid('acceptChanges', editIndex);
                            //更改当前行号
                            editIndex = rowIndex;
                            //去除编辑器                    
                            $("#TableContainer").datagrid('removeEditor', 'CastName');
                            $("#TableContainer").datagrid('removeEditor', 'SubjectName');
                            $("#TableContainer").datagrid('removeEditor', 'Rate');
                            $("#TableContainer").datagrid('removeEditor', 'PayMonth');
                            $("#TableContainer").datagrid('removeEditor', 'PayMoney');
                            $("#TableContainer").datagrid('removeEditor', 'Remark');

                            //实际数量可以编辑
                            $("#TableContainer").datagrid('addEditor', [
                                {
                                    field: 'CastName', editor: { type: 'text' }
                                }, {
                                    field: 'SubjectName', editor: { type: 'text' }
                                }, {
                                    field: 'Rate', editor: {
                                        type: 'numberbox',
                                        options: {
                                            min: 0,
                                            max: 100,
                                            precision: 2
                                        }, formatter: function (value, row, index) {
                                            return formatNumber(value, 2);
                                        }
                                    }, formatter: function (value, row, index) {
                                        if (value == undefined || value == null || value == "") {
                                            return '0.00';
                                        }
                                        return ToDecimal(value, decimalPos);
                                    }
                                }, {
                                    field: 'PayMonth', editor: { type: 'text' }
                                }, {
                                    field: 'PayMoney', editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 2
                                        }, formatter: function (value, row, index) {
                                            return formatNumber(value, 2);
                                        }
                                    }, formatter: function (value, row, index) {
                                        if (value == undefined || value == null || value == "") {
                                            return '0.00';
                                        }
                                        return ToDecimal(value, decimalPos);
                                    }
                                }, {
                                    field: 'Remark', editor: { type: 'text' }
                                }]);

                            //开始编辑
                            $("#TableContainer").datagrid('beginEdit', rowIndex);

                            //格式化时间
                            //var eddate = $('#TableContainer').datagrid('getSelected');
                            //alert(formatDate(eddate.PayMonth, 'yyyy-MM'));
                            // alert(formatDate(rowData.PayMonth, 'yyyy-MM'));
                            //rowData.PayMonth = formatDate(rowData.PayMonth, 'yyyy-MM');
                            //$('#TableContainer').datagrid('acceptChanges');

                            //绑定JS事件
                            var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                            //var selectRow = $('#TableContainer').datagrid('getChanges', 'updated');
                            //var selectRow = $('#TableContainer').datagrid('getSelected');

                            //$("#CostId").val(selectRow["CostId"]);
                            //$("#CsId").val(selectRow["CsId"]);
                            //$("#PayMonth").val(selectRow["PayMonth"]);
                            for (var i = 0; i < ed.length; i++) {
                                var e = ed[i];

                                if (e.field == "PayMoney") {

                                    $(e.target).bind("click", function () {

                                    }).bind("change", function () {
                                        //文本变化事件
                                        var val = this.value;
                                        var sl = rowData.PayMoney;
                                        var s2 = rowData.PayedMoney;
                                        //if (parseFloat(val) == NaN) {
                                        //    HDialog.Info("请输入正确数字！");
                                        //    this.value = sl;
                                        //    return;
                                        //}
                                        if (s2 > val) {
                                            HDialog.Info("应付金额不得大于已付金额！");
                                            this.value = sl;
                                            return;
                                        }

                                        //验证该成本科目下的应付金额不能大于预算金额
                                        //var rowDataAll = $('#TableContainer').datagrid('getSelected');
                                        //CheckMoneyAll(rowData.CostId, rowData.CsId, rowData.PayMonth);
                                    });
                                }
                                //选择成本科目
                                if (e.field == "SubjectName") {
                                    $(e.target).bind("click", function () {
                                        SelCostSubject(rowIndex);
                                    });
                                }
                                //选择成本单位
                                if (e.field == "CastName") {
                                    $(e.target).bind("click", function () {
                                        SelCast(rowIndex);
                                    });
                                }
                                //选择成本年月
                                if (e.field == "PayMonth") {
                                    $(e.target).bind("click", function () {
                                        var dateObj = WdatePicker({ dateFmt: 'yyyy-MM', skin: 'default' });
                                        $('#TableContainer').datagrid('updateRow',
                                            {
                                                index: rowIndex,
                                                row: {
                                                    PayMonth: date
                                                }
                                            });
                                    })
                                }
                            }
                        }
                    }
                });
                $("#frmForm").form('validate');
            }

            /** 
        * 格式化数字，小数点后是0不表示 
        * @param value 
        * @param fixed 小数位数 
        */
            function formatNumber(value, fixed) {
                var number = Number(value);
                if (isNaN(number)) {
                    return '';
                } else {
                    if (fixed == 2) {
                        return number.toFixed(2) * 100 / 100;
                    } else if (fixed == 6) {
                        return number.toFixed(6) * 1000000 / 1000000;
                    }
                }
            }


            function guid() {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            }

            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            }

            //验证该成本科目下的应付金额不能大于预算金额
            function CheckMoneyAll() {
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows.length > 0) {
                    var rowDataAll = JSON.stringify(rows);
                    var SelectedData = rowDataAll.replaceAll("SubjectName", "CsName");
                    $("#selected").val(SelectedData);
                    //取出预算科目的总金额(返回值_Data,A:预算金额已使用完，B:未设置预算，C:查询到多条预算（预算设置有误），D:未获取到前台传入参数，程序异常,等于空验证通过，E:输入金额超出预算金额)
                    $.tool.DataPostInfoAsync('CsCost', 'CheckBudgetSubjectMoney', 'selected=' + $("#selected").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "D") {
                                HDialog.Info("未获取到前台传入参数，程序异常");
                                $("#BudgetPayMoney").numberbox("setValue", "0");
                                return;
                            }
                            else if (_Data == "C") {
                                HDialog.Info("查询到多条预算，预算设置有误");
                                $("#BudgetPayMoney").numberbox("setValue", "0");
                                return;
                            }
                            else {
                                var obj = _Data.split('|');//obj[0]标识判断，obj[1]成本科目，obj[2]可用预算)
                                if (obj[0] == "B") {
                                    HDialog.Info("“" + obj[1] + "”" + "科目未设置预算金额");
                                }
                                else if (obj[0] == "A") {
                                    HDialog.Info("“" + obj[1] + "”" + "科目预算金额已使用完");
                                }
                                else if (obj[0] == "E") {
                                    //当前录入应付金额不得大于预算剩余金额-支付审批报账审核通过的金额）预算剩余可显示负数
                                    HDialog.Info("“" + obj[1] + "”" + "科目应付金额已超出预算剩余金额");
                                } else {
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, '正在计算,请稍侯', false);
                }
            }


            if ($("#CId").val() != "" && $("#CId").val() != null && $("#CId").val() != undefined) {
                LoadList($("#CId").val());
            }

            function ChangeNameFZ() {
                var val = document.getElementById("HdChangeName").value;
                var sel = document.getElementById('ContractSource');
                for (var i = 0; i < sel.options.length; i++) {
                    if (sel.options[i].text == val) {
                        sel.options[i].selected = true;
                        break;
                    }
                }
            }
            ChangeNameFZ();

            //$.fn.datebox.defaults.formatter = function (date) {
            //    var y = date.getFullYear();
            //    var m = date.getMonth() + 1;
            //    var d = date.getDate();
            //    return y + "-" + m;
            //}

            function EndEdit() {
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    $('#TableContainer').datagrid('endEdit', i);
                }
                var rowsValidation = rows;
                for (var i = 0; i < rows.length; i++) {
                    for (var j = 0; j < rowsValidation.length; j++) {
                        if ((rows[i].CostId == rowsValidation[j].CostId && rows[i].CsId == rowsValidation[j].CsId && rows[i].PayMonth == rowsValidation[j].PayMonth
                        ) && rows[i].ChId != rowsValidation[j].ChId) {
                            HDialog.Info("数据重复，[单元:" + rows[i].CastName + ",科目:" + rows[i].SubjectName + ",年月:" + rows[i].PayMonth + "]!");
                            return;
                        }
                    }
                }

                var money = parseFloat('0');
                for (var i = 0; i < rows.length; i++) {
                    money += parseFloat(rows[i].PayMoney);
                }
                //$('#AfterContractMoney').val(money);
                if (parseFloat($('#AfterContractMoney').val()) < money) {
                    HDialog.Info("合同费用明细之和，不得大于“变更后合同金额”");
                }
            }

            //选择成本科目
            function SelCostSubject(rowIndex) {
                HDialog.Open('400', '350', '../DialogNew/SelCostSubject.aspx?IsCM=1&OnlyChildren=true', '选择成本科目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CsId").val(varObjects[0]);
                        $("#SubjectName").val(varObjects[1]);
                        $("#Rate").val(varObjects[2]);
                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: rowIndex,
                                row: {
                                    SubjectName: $("#SubjectName").val(),
                                    CsId: $("#CsId").val(),
                                    Rate: $("#Rate").val()
                                }
                            });
                        EndEdit();
                        $("#TableContainer").datagrid('beginEdit', rowIndex);//绑定JS事件
                        var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                        for (var i = 0; i < ed.length; i++) {
                            var e = ed[i];
                            if (e.field == "PayMoney") {
                                $(e.target).bind("click", function () {
                                }).bind("change", function () {
                                    //文本变化事件
                                    var val = this.value;
                                    var sl = rowData.PayMoney;
                                    var s2 = rowData.PayedMoney;
                                    if (s2 > val) {
                                        HDialog.Info("应付金额不得大于已付金额！");
                                        this.value = sl;
                                        return;
                                    }
                                });
                            }
                            //选择成本科目
                            if (e.field == "SubjectName") {
                                $(e.target).bind("click", function () {
                                    SelCostSubject(rowIndex);
                                });
                            }
                            //选择成本单位
                            if (e.field == "CastName") {
                                $(e.target).bind("click", function () {
                                    SelCast(rowIndex);
                                });
                            }
                            //选择成本年月
                            if (e.field == "PayMonth") {
                                $(e.target).bind("click", function () {
                                    var dateObj = WdatePicker({ dateFmt: 'yyyy-MM', skin: 'default' });
                                    $('#TableContainer').datagrid('updateRow',
                                        {
                                            index: rowIndex,
                                            row: {
                                                PayMonth: date
                                            }
                                        });
                                })
                            }
                        }
                    }
                });
            }
            //选择成本单位
            function SelCast(rowIndex) {
                HDialog.Open('400', '350', '../DialogNew/SelCostCompany.aspx', '选择成本单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: rowIndex,
                                row: {
                                    CastName: varObjects[1],
                                    CostId: varObjects[0]
                                }
                            });
                        EndEdit();
                        $("#TableContainer").datagrid('beginEdit', rowIndex);//绑定JS事件
                        var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                        for (var i = 0; i < ed.length; i++) {
                            var e = ed[i];
                            if (e.field == "PayMoney") {
                                $(e.target).bind("click", function () {
                                }).bind("change", function () {
                                    //文本变化事件
                                    var val = this.value;
                                    var sl = rowData.PayMoney;
                                    var s2 = rowData.PayedMoney;
                                    if (s2 > val) {
                                        HDialog.Info("应付金额不得大于已付金额！");
                                        this.value = sl;
                                        return;
                                    }
                                });
                            }
                            //选择成本科目
                            if (e.field == "SubjectName") {
                                $(e.target).bind("click", function () {
                                    SelCostSubject(rowIndex);
                                });
                            }
                            //选择成本单位
                            if (e.field == "CastName") {
                                $(e.target).bind("click", function () {
                                    SelCast(rowIndex);
                                });
                            }
                            //选择成本年月
                            if (e.field == "PayMonth") {
                                $(e.target).bind("click", function () {
                                    var dateObj = WdatePicker({ dateFmt: 'yyyy-MM', skin: 'default' });
                                    $('#TableContainer').datagrid('updateRow',
                                        {
                                            index: rowIndex,
                                            row: {
                                                PayMonth: date
                                            }
                                        });
                                })
                            }
                        }
                    }
                });
            }


            function ClientClick() {
                if ($('#TableContainer').datagrid('getChanges').length > 0) {
                    var inserted = $("#TableContainer").datagrid('getChanges', "inserted");
                    var updated = $("#TableContainer").datagrid('getChanges', "updated");
                    var deleted = $("#TableContainer").datagrid('getChanges', "deleted");

                    if (inserted.length > 0) {
                        $("#inserted").val(JSON.stringify(inserted));
                    }
                    if (deleted.length > 0) {
                        $("#deleted").val(JSON.stringify(deleted));
                    }
                    if (updated.length > 0) {
                        $("#updated").val(JSON.stringify(updated));
                    }
                }
            }

            //初始化加载数据
            //var Rows = JSON.parse($("#SearchResult").val());
            ////加载数据
            //$('#TableContainer').datagrid('loadData', Rows);


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });

            $(document).ready(function () { $("#frmForm").form('validate'); });

            //如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($("#ContractNo").val() == "") {
                    HDialog.Info("请选择合同");
                    return;
                }
                var rows = $('#TableContainer').datagrid('getRows');
                var money = parseFloat('0');
                EndEdit();
                for (var i = 0; i < rows.length; i++) {
                    money += parseFloat(rows[i].PayMoney);
                }
                if (parseFloat($('#AfterContractMoney').val()) < money) {
                    HDialog.Info("合同费用明细之和，不得大于“变更后合同金额”");
                } else if ($("#State").val() == "未启动") {
                    var FlowId = GetWorkFlow.CostWorkFlowId('0702', $("#ContractSource").val(), $("#AfterContractMoney").val());
                    if (FlowId == undefined || FlowId == "undefined") {
                        FlowId = "";
                    }
                    if (FlowId == "") {
                        HDialog.Info("请设置审核流程!");
                        return;
                    }

                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0702&biaoshi=1&FlowId=" + FlowId + "&InfoId=" + FlowId + "&random=" + Math.random();
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
        </script>
    </form>
</body>
</html>
