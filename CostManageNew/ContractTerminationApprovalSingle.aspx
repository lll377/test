<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractTerminationApprovalSingle.aspx.cs" Inherits="M_Main.CostManageNew.ContractTerminationApprovalSingle" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>合同终止审核</title>
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

        <%--成本单位--%>
        <input type="hidden" name="CastName" id="CastName" value="" />
        <input type="hidden" name="CostId" id="CostId" value="" />

        <input type="hidden" name="inserted" id="inserted" value="" runat="server" />
        <input type="hidden" name="updated" id="updated" value="" runat="server" />
        <input type="hidden" name="deleted" id="deleted" value="" runat="server" />
        <input type="hidden" name="selected" id="selected" value="" runat="server" />
        <%--<input type="hidden" name="HdText" value="" id="HdText" runat="server" />--%>



        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="Originator" name="Originator" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />
        <%--盘点单号--%>
        <input type="hidden" value="" runat="server" id="InventoryNum" name="InventoryNum" />


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
                    <input id="DepName" name="DepName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" onclick="SelDepSer();" />
                    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                </td>
                <td class="DialogTdTitle">负责人：
                </td>
                <td class="DialogTdContent">
                    <input id="PrincipalName" name="PrincipalName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" onclick="SelUserSer();" />
                    <input type="hidden" id="Principal" name="Principal" runat="server" />
                </td>
                <td class="DialogTdTitle">合同编号：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractNo" name="ContractNo" style="width: 68%;" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                    <a id="personnalShow" style="color: blue; cursor: pointer; width: 50px;" onclick="ContractShow()">查看详情</a>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同名称：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractName" name="ContractName" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">合同类型：
                </td>
                <td class="DialogTdContent">
                    <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <input type="hidden" name="ContractType" id="ContractType" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">供方单位：
                </td>
                <td class="DialogTdContent">
                    <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <input type="hidden" name="SupplierId" id="SupplierId" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">终止说明</td>
                <td class="DialogTdContent" colspan="7">
                    <input id="StopRemark" name="StopRemark" style="width: 95.5%; height: 22px;" type="text" class="easyui-validatebox" runat="server" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">终止前结束时间：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractEnd" name="BeforeContractEnd" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">终止后结束时间：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractEnd" name="AfterContractEnd"
                        onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">终止前合同金额（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeContractMoney" name="BeforeContractMoney" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">终止后合同金额（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterContractMoney" name="AfterContractMoney" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">终止前合同质保金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforeMargin" name="BeforeMargin" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">终止后合同质保金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterMargin" name="AfterMargin" class="easyui-validatebox" runat="server" onblur="validateNumber(this)" data-options="required:true" type="text" />
                </td>
                <td class="DialogTdTitle">终止前合同违约金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforePenalty" name="BeforePenalty" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">终止后合同违约金（元）：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterPenalty" name="AfterPenalty" class="easyui-validatebox" runat="server" onblur="validateNumber(this)" data-options="required:true" type="text" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">终止前付款方式：
                </td>
                <td class="DialogTdContent">
                    <input id="BeforePayType" name="BeforePayType" class="easyui-validatebox" readonly="readonly" runat="server" type="text" />
                </td>
                <td class="DialogTdTitle">终止后付款方式：
                </td>
                <td class="DialogTdContent">
                    <input id="AfterPayType" name="AfterPayType" class="easyui-validatebox" runat="server" data-options="required:true" type="text" />
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

        <script type="text/javascript">
            //计算小数位数
            var decimalPos = 2;
            //编辑的行号
            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            //查看上传附件
            function OnFileList() {
                HDialog.Open(600, 450, '../DialogNew/ContractTenderFiles.aspx?CtId=' + $("#Id").val(), '查看合同终止附件', true, function callback(_Data) {
                });
            }

            //选择项目
            function SelItem() {
                HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CommId").val(varObjects[2]);
                        $("#CommName").val(varObjects[1]);
                    }
                });
            }
            //选择机构
            function SelDepSer() {
                HDialog.Open('370', '360', '../dialog/DepartmentDlg_hr.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('\t');
                        $("#DepCode").val(varObjects[0]);
                        $("#DepName").val(varObjects[1]);
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
            SelContractInformation();
            function SelContractInformation() {
                $.tool.DataGet('CsCost', 'SelContractInformation', 'Id=' + $("#CId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $("#CId").val(varObjects[0].CId);
                            $("#ContractNo").val(varObjects[0].ContractNo);
                            $("#ContractName").val(varObjects[0].ContractName);
                            $("#SupplierId").val(varObjects[0].SupplierId);
                            $("#SupplierName").val(varObjects[0].SupplierName);
                            $("#ContractType").val(varObjects[0].ContractType);
                            $("#TypeName").val(varObjects[0].TypeName);
                            $("#BeforeContractEnd").val(varObjects[0].ContractEnd);
                            $("#AfterContractEnd").val(varObjects[0].ContractEnd);
                            $("#BeforeContractMoney").val(varObjects[0].ContractMoney);
                            //$("#AfterContractMoney").val(varObjects.ContractMoney);
                            $("#BeforeMargin").val(varObjects[0].MarginMoney);
                            $("#AfterMargin").val(varObjects[0].MarginMoney);
                            $("#BeforePenalty").val(varObjects[0].PenaltyMoneh);
                            $("#AfterPenalty").val(varObjects[0].PenaltyMoneh);
                            $("#BeforePayType").val(varObjects[0].PayType);
                            $("#AfterPayType").val(varObjects[0].PayType);

                            $("#PrincipalName").val(varObjects[0].PrincipalName);
                            $("#Principal").val(varObjects[0].Principal);
                            $("#CommId").val(varObjects[0].CommId);
                            $("#CommName").val(varObjects[0].CommName);
                            $("#DepName").val(varObjects[0].DepName);
                            $("#DepCode").val(varObjects[0].DepCode);
                            //加载数据
                            LoadList(varObjects[0].CId);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
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

            column = [[
                    { field: 'ChId', title: 'ChId', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'CId', title: 'CId', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'CostId', title: '成本单位ID', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'CsId', title: '成本科目ID', width: 50, align: 'center', sortable: true, hidden: true },

                    { field: 'CastName', title: '成本单位', width: 100, align: 'center', sortable: true },
                    { field: 'SubjectName', title: '成本科目', align: 'center', width: 100, sortable: true },
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
                     text: '提交',
                     iconCls: 'icon-save',
                     handler: function () {
                         //结束编辑
                         endEdit();
                         ClientClick();
                         var rowDataAll = $('#TableContainer').datagrid('getRows');
                         CheckMoney(rowDataAll);
                     }
                 }
            ];
            if ($("#State").val() == "未启动") {
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
                HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CommId").val(varObjects[2]);
                        $("#CommName").val(varObjects[1]);
                    }
                });
            }

            //选择部门
            function SelDep() {
                HDialog.Open('370', '360', '../dialog/DepartmentDlg_hr.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('\t');
                        $("#DepCode").val(varObjects[0]);
                        $("#DepName").val(varObjects[1]);
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
                        ChId: "",
                        CId: $("#CId").val(),
                        CostId: "",
                        CsId: "",
                        CastName: "",
                        SubjectName: "",
                        PayMonth: "",
                        PayMoney: "0",
                        PayedMoney: "0",
                        Remark: ""
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

                        //发起时允许编辑,审核中不允许编辑
                        if ($("#State").val() == "未启动") {
                            // $("#TableContainer").datagrid('acceptChanges', editIndex);
                            //更改当前行号
                            editIndex = rowIndex;
                            //去除编辑器                    
                            $("#TableContainer").datagrid('removeEditor', 'CastName');
                            $("#TableContainer").datagrid('removeEditor', 'SubjectName');
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
                                 field: 'PayMonth', editor: { type: 'text' }
                             }, {
                                 field: 'PayMoney', editor: { type: 'text' }
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
                            for (var i = 0; i < ed.length; i++) {
                                var e = ed[i];

                                if (e.field == "PayMoney") {

                                    $(e.target).bind("click", function () {

                                    }).bind("change", function () {
                                        //文本变化事件
                                        var val = this.value;
                                        var sl = rowData.PayMoney;
                                        var s2 = rowData.PayedMoney;

                                        if (parseFloat(val) == "NaN") {
                                            HDialog.Info("请输入正确数字！");
                                            this.value = sl;
                                            return;
                                        }
                                        if (s2 > val) {
                                            HDialog.Info("应付金额不得大于已付金额！");
                                            this.value = sl;
                                            return;
                                        }
                                        //验证该成本科目下的应付金额不能大于预算金额
                                        var rowDataAll = $('#TableContainer').datagrid('getSelected');
                                        CheckMoney(rowDataAll);
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
                                                PayMonth: date,
                                            }
                                        });
                                    });
                                }
                            }
                        }
                    }
                });
            }

            LoadList("随意传值");

            function endEdit() {
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    $('#TableContainer').datagrid('endEdit', i);
                }
            }


            //选择成本科目
            function SelCostSubject(rowIndex) {
                HDialog.Open('400', '350', '../DialogNew/SelCostSubject.aspx?OnlyChildren=true', '选择成本科目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CsId").val(varObjects[0]);
                        $("#SubjectName").val(varObjects[1]);
                        $('#TableContainer').datagrid('updateRow',
                           {
                               index: rowIndex,
                               row: {
                                   SubjectName: $("#SubjectName").val(),
                                   CsId: $("#CsId").val()
                               }
                           });
                        endEdit();
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
                        endEdit();
                    }
                });
            }

            //验证该成本科目下的应付金额不能大于预算金额
            function CheckMoney(rowDataAll) {
                if (rowDataAll.length > 0) {
                    $("#selected").val(JSON.stringify(rowDataAll));
                }
                //取出预算科目的总金额
                $.ajax({
                    url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CsCost&Command=CheckBudgetSubjectMoneyBatch&biaoshi=0',
                    type: 'POST',
                    dataType: 'text',
                    data: {"selected": $("#selected").val()},
                    cache: false,
                    async: false,
                    success: function (_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info("数据读取错误");
                    }
                });
            }


            function ClientClick() {
                var val = $("#ContractSource").find("option:selected").val();
                //$('#TableContainer').datagrid('acceptChanges');
                if ($('#TableContainer').datagrid('getChanges').length > 0) {
                    var inserted = $("#TableContainer").datagrid('getChanges', "inserted");
                    var updated = $("#TableContainer").datagrid('getChanges', "updated");
                    var deleted = $("#TableContainer").datagrid('getChanges', "deleted");


                    if (inserted.length > 0) {
                        alert(JSON.stringify(inserted));
                        $("#inserted").val(JSON.stringify(inserted));
                    }
                    if (deleted.length > 0) {
                        $("#deleted").val(JSON.stringify(deleted));
                    }
                    if (updated.length > 0) {
                        $("#updated").val(JSON.stringify(updated));
                        alert($("#updated").val());
                    }
                }
            }

            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());
            //加载数据
            $('#TableContainer').datagrid('loadData', Rows);


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                var isValid = $("#frmForm").form('validate');
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
                    return true;
                }
                else {
                    return false;
                }
            });


            //如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {

                if ($("#ContractNo").val() == "") {
                    HDialog.Info("请选择合同");
                    return;
                }
                if ($("#State").val() == "未启动") {

                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0703&biaoshi=1&random=" + Math.random();
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

