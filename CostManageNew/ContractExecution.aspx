<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractExecution.aspx.cs" Inherits="M_Main.CostManageNew.ContractExecution" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合同执行信息</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
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
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 190px; padding: 10px;">
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
                    <td class="TdTitle">合同类型</td>
                    <td class="TdContent">
                        <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" onclick="SelContractType();" data-options="required:true" />
                        <input type="hidden" name="ContractType" id="ContractType" value="" />
                    </td>
                    <td class="TdTitle">对方单位</td>
                    <td class="TdContent">
                        <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" onclick="SelSupplier();" />
                        <input type="hidden" id="SupplierId" name="SupplierId" value="" /></td>
                    <td class="TdTitle">执行时间从</td>
                    <td class="TdContent">
                        <input id="ExecuteDateBegin" name="ExecuteDateBegin"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="ExecuteDateEnd" name="ExecuteDateEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" /></td>
                    <%--<td class="TdTitle">发起时间</td>
                    <td class="TdContent">
                        <input id="StartTime" name="StartTime"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>--%>
                    <td class="TdTitle">是否按进度完成</td>
                    <td class="TdContent">
                        <select id="IsSchedule" name="IsSchedule" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否处罚</td>
                    <td class="TdContent">
                        <select id="IsDeduct" name="IsDeduct" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>


        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

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
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }
            //选择合同类型
            function SelContractType() {
                HDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类型', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#ContractType").val(varObjects[0]);
                        $("#TypeName").val(varObjects[1]);
                    }
                });
            }

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

                //CommName CommId DepName DepCode PrincipalName Principal ContractNo ContractName TypeName ContractType SupplierName SupplierId ExecuteDateBegin

                $("#CommName").val(''); $("#CommId").val(''); $("#DepName").val(''); $("#DepCode").val(''); $("#PrincipalName").val(''); $("#Principal").val(''); $("#ContractNo").val(''); $("#ContractName").val('');
                $("#TypeName").val(''); $("#ContractType").val(''); $("#SupplierName").val(''); $("#SupplierId").val(''); $("#ExecuteDateBegin").val('');
            }

            var frozenColumns = [[
                     { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true }
            ]];

            var column = [[
                     { field: 'CeId', title: 'CeId', width: 25, align: 'left', sortable: true, hidden: true },
                     { field: 'CId', title: 'CId', width: 25, align: 'left', sortable: true, hidden: true },
                     { field: 'CommId', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },

                     { field: 'DepCode', title: '部门编号', width: 30, align: 'left', hidden: true, sortable: true },
                     { field: 'DepName', title: '机构部门', width: 100, align: 'left', sortable: true },

                     { field: 'Principal', title: '负责人ID', width: 30, align: 'left', hidden: true, sortable: true },
                     { field: 'PrincipalName', title: '负责人', width: 100, align: 'left', sortable: true },

                     { field: 'ContractNo', title: '合同编号', width: 110, align: 'left', sortable: true },
                     { field: 'ContractName', title: '合同名称', width: 250, align: 'left', sortable: true },
                     { field: 'ContractType', title: '合同类型ID', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'TypeName', title: '合同类型', width: 60, align: 'left', sortable: true },
                     { field: 'SupplierId', title: '供方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'SupplierName', title: '供方单位', width: 250, align: 'left', sortable: true },
                     { field: 'ContractMoney', title: '合同金额', width: 100, align: 'left', sortable: true },
                     {
                         field: 'ExecuteDateBegin', title: '执行时间从', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = formatDate(row.ExecuteDateBegin, 'yyyy-MM-dd');
                             return str;
                         }
                     },
                     {
                         field: 'ExecuteDateEnd', title: '到', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = formatDate(row.ExecuteDateEnd, 'yyyy-MM-dd');
                             return str;
                         }
                     },
                     {
                         field: 'IsSchedule', title: '是否按进度完成', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                             var str = "";
                             if (row.IsSchedule == "0") {
                                 str = "是";
                             } if (row.IsSchedule == "1") {
                                 str = "否";
                             }
                             return str;
                         }
                     },
                     {
                         field: 'IsDeduct', title: '是否扣罚', width: 60, align: 'center', sortable: true, formatter: function (value, row, index) {
                             var str = "";
                             if (row.IsDeduct == "0") {
                                 str = "是";
                             } if (row.IsDeduct == "1") {
                                 str = "否";
                             }
                             return str;
                         }
                     },
                     { field: 'DeductMoney', title: '扣罚金额', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    $.tool.DataGet('CsCost', 'getCostPower', 'type=ContractExecution',
                         function Init() {
                         },
                         function callback(_Data) {
                             if (_Data == "1") {
                                 HDialog.Open(700, 620, '../CostManageNew/ContractExecution_xx.aspx?OpType=insert', '新增合同执行信息', true, function callback(_Data) {
                                     LoadList();
                                 });
                             }
                             else {
                                 HDialog.Info("无新增权限!");
                             }
                         },
                         function completeCallback() {
                         },
                         function errorCallback() {
                         });
                }
            }, '-', {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    $.tool.DataGet('CsCost', 'getCostPower', 'type=ContractExecution',
                         function Init() {
                         },
                         function callback(_Data) {
                             if (_Data == "1") {
                                 var row = $("#TableContainer").datagrid("getSelected");
                                 if (row != null) {
                                     DelRecord(row.CeId);
                                 }
                                 else {
                                     HDialog.Info("请选择一行数据进行删除！");
                                 }
                             }
                             else {
                                 HDialog.Info("无新增权限!");
                             }
                         },
                         function completeCallback() {
                         },
                         function errorCallback() {
                         });
                }
            }, '-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    $.tool.DataGet('CsCost', 'getCostPower', 'type=ContractExecution',
                         function Init() {
                         },
                         function callback(_Data) {
                             if (_Data == "1") {
                                 var row = $("#TableContainer").datagrid("getSelected");
                                 if (row != null && row != "" && row != undefined) {
                                     HDialog.Open(700, 620, '../CostManageNew/ContractExecution_xx.aspx?OpType=edit&CeId=' + row.CeId, '修改合同执行信息', true, function callback(_Data) {
                                         LoadList();
                                     });
                                 } else {
                                     HDialog.Info("请选择一行数据");
                                 }
                             }
                             else {
                                 HDialog.Info("无新增权限!");
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
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                    $("#StartTime").datebox('setValue', null);
                }
            }];

            function DelRecord(CeId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsCost', 'DelContractExecution', 'CeId=' + CeId,
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

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractExecutionList&' + $('#frmFrom').serialize(),
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
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>



