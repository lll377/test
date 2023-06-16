<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSigning.aspx.cs" Inherits="M_Main.CostManageNew.ContractSigning" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合同签订</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 240px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">所属项目</td>
                    <td class="TdContent">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>
                    <td class="TdTitle">机构部门</td>
                    <td class="TdContent">
                        <input id="DepName" name="DepName" type="text" class="easyui-validatebox" onclick="SelDepSer();" style="width: 98%;" />
                        <input type="hidden" id="DepCode" name="DepCode" value="" />
                    </td>
                    <td class="TdTitle">负责人</td>
                    <td class="TdContent">
                        <input id="PrincipalName" name="PrincipalName" type="text" class="easyui-validatebox" onclick="SelUserSer();" style="width: 98%;" />
                        <input type="hidden" id="Principal" name="Principal" value="" />
                    </td>
                    <td class="TdTitle">合同编号</td>
                    <td class="TdContent">
                        <input id="ContractNo" name="ContractNo" type="text" class="easyui-validatebox" /></td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">合同名称</td>
                    <td class="TdContent">
                        <input id="ContractName" name="ContractName" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">合同类别</td>
                    <td class="TdContent">
                        <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" onclick="SelContractType();" data-options="required:true" />
                        <input type="hidden" name="ContractType" id="ContractType" value="" />
                    </td>
                    <td class="TdTitle">签约类型</td>
                    <td class="TdContent">
                        <select id="SignedType" name="SignedType" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="新签">新签</option>
                            <option value="续签">续签</option>
                        </select>
                    </td>
                    <td class="TdTitle">对方单位</td>
                    <td class="TdContent">
                        <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" onclick="SelSupplier();" />
                        <input type="hidden" id="SupplierId" name="SupplierId" value="" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">合同期限</td>
                    <td class="TdContent">
                        <input id="ContractPeriod" name="ContractPeriod" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContent">
                        <input id="ContractBegin" name="ContractBegin"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">结束时间</td>
                    <td class="TdContent">
                        <input id="ContractEnd" name="ContractEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" /></td>
                    <%--<td class="TdTitle">合同金额</td>
                    <td class="TdContent">
                        <input id="ContractMoney" name="ContractMoney" type="text" class="easyui-numberbox" min="0.01" max="100000000" precision="2" /></td>--%>
                    <td class="TdTitle">发起时间</td>
                    <td class="TdContent">
                        <input id="StartTime" name="StartTime"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                    <%--<td class="TdTitle">已付金额</td>
                    <td class="TdContent">
                        <input id="PayedMoney" name="PayedMoney" type="text" class="easyui-validatebox" /></td>--%>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContent">
                        <select id="Statue" name="Statue" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已驳回">已驳回</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否变更</td>
                    <td class="TdContent">
                        <select id="IsUpdate1" name="IsUpdate1" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否过期</td>
                    <td class="TdContent">
                        <select id="IsPastDue1" name="IsPastDue1" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否终止</td>
                    <td class="TdContent">
                        <select id="IsEnd1" name="IsEnd1" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">是否结算</td>
                    <td class="TdContent">
                        <select id="IsSettleAccounts1" name="IsSettleAccounts1" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否关闭</td>
                    <td class="TdContent">
                        <select id="IsClose1" name="IsClose1" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">预警天数
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-numberbox" id="Num" name="Num" value="30" data-options="min:0" runat="server" />
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="CloseTaskDlg" class="easyui-dialog" title="关闭任务" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 140px; overflow: hidden; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">关闭人</td>
                    <td class="TdContent">
                        <input type="hidden" id="ClosePerson" runat="server" name="ClosePerson" />
                        <input type="text" id="ClosePersonName" name="ClosePersonName" disabled="disabled" runat="server" />
                    </td>
                    <td class="TdTitle">关闭时间</td>
                    <td class="TdContent">
                        <input type="text" id="CloseTime" name="CloseTime" disabled="disabled" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">关闭原因</td>
                    <td class="TdContent">
                        <input id="CloseReason" name="CloseReason" type="text" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr style="height: 8px;">
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="CloseSave();">确定关闭</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
                            onclick="btnCloseTask();">放弃</a>
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc;"
            id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="SearchFlag" value="0" name="SearchFlag" runat="server" />
        <input type="hidden" name="ContractCId" value="" id="ContractCId" runat="server" />
        <input type="hidden" value="" runat="server" id="MtId" name="MtId" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            function GetParam() {

                var str = '';

                var IsUpdateArr = $("input:hidden[name='IsUpdate1']");
                var IsUpdate = '';
                $.each(IsUpdateArr, function (index, item) {
                    IsUpdate += item.value;
                });
                if (IsUpdate.length > 0);
                {
                    str += '&IsUpdate=' + IsUpdate;
                }

                var IsPastDueArr = $("input:hidden[name='IsPastDue1']");
                var IsPastDue = '';
                $.each(IsPastDueArr, function (index, item) {
                    IsPastDue += item.value;
                });
                if (IsPastDue.length > 0);
                {
                    str += '&IsPastDue=' + IsPastDue;
                }

                var IsEndArr = $("input:hidden[name='IsEnd1']");
                var IsEnd = '';
                $.each(IsEndArr, function (index, item) {
                    IsEnd += item.value;
                });
                if (IsEnd.length > 0);
                {
                    str += '&IsEnd=' + IsEnd;
                }

                var IsSettleAccountsArr = $("input:hidden[name='IsSettleAccounts1']");
                var IsSettleAccounts = '';
                $.each(IsSettleAccountsArr, function (index, item) {
                    IsSettleAccounts += item.value;
                });
                if (IsSettleAccounts.length > 0);
                {
                    str += '&IsSettleAccounts=' + IsSettleAccounts;
                }

                var IsCloseArr = $("input:hidden[name='IsClose1']");
                var IsClose = '';
                $.each(IsCloseArr, function (index, item) {
                    IsClose += item.value;
                });
                if (IsClose.length > 0);
                {
                    str += '&IsClose=' + IsClose;
                }
                return encodeURI(str);
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
            //选择机构
            function SelDepSer() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
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
                        //$("#UserCode").val(varObjects.UserCode);
                        //$("#UserName").val(varObjects.UserName);
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }
            //选择合同类别
            function SelContractType() {
                HDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类别', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#ContractType").val(varObjects[0]);
                        $("#TypeName").val(varObjects[1]);
                    }
                });
            }

            //注册事件
            function SelSupplier() {
                HDialog.Open(1000, 500, '../DialogNew/CostSearchSupplier.aspx', '选择供应商', true, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        //选择供应商
                        $("#SupplierId").val(Obj.Id);
                        $("#SupplierName").val(Obj.SupplierName);
                    }
                });
            }

            function btnClear() {
                $("#SupplierId").val("");
                $("#SupplierName").val("");
                $("#ContractType").val("");
                $("#TypeName").val("");
                $("#UserCode").val("");
                $("#UserName").val("");
                $("#DepCode").val("");
                $("#DepName").val("");
                $("#CommId").val("");
                $("#CommName").val("");
                $("#Principal").val("");
                $("#PrincipalName").val("");
                $("#ContractNo").val("");
                $("#ContractName").val("");
                $("#SignedType").val("");
                $("#ContractPeriod").val("");
                $("#ContractBegin").val("");
                $("#ContractEnd").val("");
                $("#StartTime").val("");
            }

            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 160, align: 'left', sortable: true }
            ]];


            var column = [[
                { field: 'DepName', title: '机构部门', width: 130, align: 'left', sortable: true },
                { field: 'PrincipalName', title: '负责人', width: 100, align: 'left', sortable: true },
                { field: 'ContractNo', title: '合同编号', width: 140, align: 'left', sortable: true },
                { field: 'ContractName', title: '合同名称', width: 200, align: 'left', sortable: true },
                { field: 'TypeName', title: '合同类别', width: 60, align: 'left', sortable: true },
                { field: 'SignedType', title: '签约类型', width: 60, align: 'left', sortable: true },
                { field: 'SupplierName', title: '对方单位', width: 240, align: 'left', sortable: true },
                { field: 'ContractPeriod', title: '合同期限', width: 60, align: 'left', sortable: true },
                {
                    field: 'ContractBegin', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, 'yyyy-MM-dd');
                        }
                        return value;
                    }
                },
                {
                    field: 'ContractEnd', title: '结束时间', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, 'yyyy-MM-dd');
                        }
                        return value;
                    }
                },
                { field: 'ContractMoney', title: '合同金额', width: 100, align: 'left', sortable: true },
                { field: 'ContractPayedMoney', title: '已付金额', width: 60, align: 'left', sortable: true },
                {
                    field: 'StartTime', title: '发起时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, 'yyyy-MM-dd');
                        }
                        return value;
                    }
                },
                { field: 'Statue', title: '审核状态', width: 50, align: 'left', sortable: true },
                {
                    field: 'IsUpdate', title: '是否变更', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsUpdate == "0") {
                            str = "是";
                        } if (row.IsUpdate == "1") {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsPastDue', title: '是否过期', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsPastDue == "0") {
                            str = "是";
                        } if (row.IsPastDue == "1") {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsEnd', title: '是否终止', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsEnd == "0") {
                            str = "是";
                        } if (row.IsEnd == "1") {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsSettleAccounts', title: '是否结算', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsSettleAccounts == "0") {
                            str = "是";
                        } if (row.IsSettleAccounts == "1") {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsClose', title: '是否关闭', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsClose == "0") {
                            str = "否";
                        } if (row.IsClose == "1") {
                            str = "是";
                        }
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        window.location.href = '../CostManageNew/FromTabs.aspx?OpType=insert';
                        LoadList();
                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            if (row.Statue == "未审核" || row.State == "已驳回") {
                                DelRecord(row.CId);
                            } else {
                                HDialog.Info("只有“未审核”和“已驳回”数据可以进行删除！");
                            }
                        }
                        else {
                            HDialog.Info("请选择一行数据进行删除！");
                        }
                    }
                }, '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null && row != "" && row != undefined) {
                            window.location.href = '../CostManageNew/FromTabs.aspx?OpType=edit&Id=' + row.CId;
                        } else {
                            HDialog.Info("请选择一行数据");
                        }
                    }
                }, '-', {
                    text: '关闭',
                    iconCls: 'icon-clear',
                    handler: function () {
                        $.tool.DataGet('CsCost', 'getCostPower', 'type=ContractClose',
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "1") {
                                    var row = $("#TableContainer").datagrid("getSelected");
                                    if (row != null && row != "" && row != undefined) {
                                        $('#CloseTaskDlg').parent().appendTo($("form:first"))
                                        $('#CloseTaskDlg').dialog('open');
                                        var nowDate = new Date();
                                        var strDate = nowDate.getFullYear().toString() + "-" + (nowDate.getMonth() + 1) + "-" + (nowDate.getDate()).toString() + " " + nowDate.getHours() + ":" + nowDate.getMinutes() + ":" + nowDate.getSeconds();
                                        $("#CloseTime").val(strDate);

                                        //验证
                                        var rowChecked = $("#TableContainer").datagrid("getChecked");
                                        var ContractCId = "";
                                        if (rowChecked.length > 0) {
                                            var booli = -1;
                                            for (var i = 0; i < rowChecked.length; i++) {
                                                if (rowChecked[i].Statue != "未审核") {
                                                    booli = i;
                                                    break;
                                                }
                                                if (rowChecked[i].IsClose == "是") {
                                                    HDialog.Info("该合同已关闭！");
                                                    break;
                                                }
                                                ContractCId += rowChecked[i].CId + ",";
                                            }
                                            if (booli > -1) {
                                                HDialog.Info("只有合同状态为“未审核”时才允许关闭！");
                                                return false;
                                            }
                                            if (ContractCId != "")
                                                ContractCId = ContractCId.substring(0, ContractCId.length - 1);
                                            else
                                                return false;
                                            $('#ContractCId').val(ContractCId);
                                        }
                                        else {
                                            var rows = $("#TableContainer").datagrid("getSelections");
                                            if (rows[0].Statue != "未审核") {
                                                HDialog.Info("只有合同状态为“未审核”时才允许关闭！");
                                                return false;
                                            }
                                            $('#ContractCId').val(rows[0].CId);
                                        }
                                    } else {
                                        HDialog.Info("请选择需要关闭的合同");
                                    }
                                }
                                else {
                                    HDialog.Info("无关闭权限!");
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }, '-', {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#RunDate").datebox('setValue', null);
                    }
                }, '-', {
                    text: '合同到期预警查询',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchFlag').val("1");
                        LoadList();
                    }
                }, '-', {
                    text: '合同付款预警查询',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchFlag').val("2");
                        LoadList();
                    }
                }];

            var searchtoolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelRecord(CId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsCost', 'DelContract', 'CId=' + CId,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function CloseSave() {
                if ($("#CloseReason").val() == "") {
                    HDialog.Info("关闭原因不能为空！");
                    return false;
                }

                $.tool.DataPostAsync('CsCost', 'CloseContract', 'CId=' + $("#ContractCId").val() + '&ClosePerson=' + $("#ClosePerson").val() +
                    '&CloseTime=' + $("#CloseTime").val() + '&CloseReason=' + $("#CloseReason").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            $("#CloseTaskDlg").dialog("close");
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function btnCloseTask() {
                $("#CloseTaskDlg").dialog("close");
            }
            //确定筛选
            function SearchList() {
                $('#SearchFlag').val("0");
                LoadList();
            }

            function LoadList() {
                if (GetQueryString('Id') > '') {
                    $("#MtId").val(GetQueryString('Id'));
                    toolbar = searchtoolbar;
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractList&' + $('#frmFrom').serialize() + GetParam(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        var date = new Date(row.EndDate);
                        var now = new Date();
                        var num = $("#Num").val();
                        var month = now.getMonth() + 1;
                        if (month < 10) month = "0" + month;
                        var strdate = now.getFullYear() + '-' + month + "-" + now.getDate();

                        var d1 = getNewDay(strdate, num);

                        var now1 = new Date(d1);
                        if (date < now1) {
                            if (now > date) {
                                return '';
                            }
                            return 'background-color:#FFB43F;';
                        }
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function getNewDay(dateTemp, days) {
                var dateTemp = dateTemp.split("-");
                var nDate = new Date(dateTemp[0] + '-' + dateTemp[1] + '-' + dateTemp[2]); //转换为MM-DD-YYYY格式   

                var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
                var rDate = new Date(millSeconds);
                var year = rDate.getFullYear();
                var month = rDate.getMonth() + 1;
                if (month < 10) month = "0" + month;
                var date = rDate.getDate();
                if (date < 10) date = "0" + date;
                return (year + "-" + month + "-" + date);
            }
        </script>
    </form>
</body>
</html>

