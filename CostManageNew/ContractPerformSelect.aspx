<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractPerformSelect.aspx.cs" Inherits="M_Main.CostManageNew.ContractPerformSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>履约评估查询</title>
     <%--<link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
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
                    <td class="TdTitle">合同类型</td>
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
                        <input id="SupplierIdName" name="SupplierIdName" type="text" class="easyui-validatebox" onclick="SelSupplierSer();" />
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
                            <option value="未审核">未审核</option>
                            <option value="审核中">审核中</option>
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
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            //选择项目
            function SelItem() {
                LayerDialog.Open('370', '360', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
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
                LayerDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }
            //选择责任人
            function SelUserSer() {
                LayerDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        //$("#UserCode").val(varObjects.UserCode);
                        //$("#UserName").val(varObjects.UserName);
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }
            //选择合同类型
            function SelContractType() {
                LayerDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类型', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#ContractType").val(varObjects[0]);
                        $("#TypeName").val(varObjects[1]);
                    }
                });
            }

            function btnClear() {
                $("#CommName ,#CommId , #DepName, #DepCode ,#PrincipalName, #Principal ,#ContractNo,#ContractName, #TypeName, #ContractType, #SupplierIdName, #SupplierId, #ContractPeriod,#ContractBegin, #ContractEnd,#StartTime").val("");
                $("#Statue ,#IsUpdate1 , #IsPastDue1, #IsEnd1 ,#IsSettleAccounts1,#IsClose1 ").val("");
            }

            var frozenColumns = [[
                     { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true }
            ]];

            var column = [[
                     { field: 'CpId', title: 'CpId', width: 25, align: 'left', sortable: true, hidden: true },

                     { field: 'CommId', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },

                     { field: 'DepCode', title: '部门编号', width: 30, align: 'left', hidden: true, sortable: true },
                     { field: 'DepName', title: '机构部门', width: 110, align: 'left', sortable: true },

                     { field: 'Principal', title: '负责人ID', width: 30, align: 'left', hidden: true, sortable: true },
                     { field: 'PrincipalName', title: '负责人', width: 110, align: 'left', sortable: true },

                     { field: 'ContractNo', title: '合同编号', width: 120, align: 'left', sortable: true },
                     { field: 'CId', title: 'CId', width: 25, align: 'left', sortable: true, hidden: true },
                     {
                         field: 'ContractName', title: '合同名称', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "<a style=\"color:blue\" onclick=\"ContractShow('" + row.CId + "')\">" + row.ContractName + "</a>";
                             return str;
                         }
                     },

                     { field: 'ContractType', title: '合同类型ID', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'TypeName', title: '合同类型', width: 80, align: 'left', sortable: true },
                     { field: 'SupplierId', title: '供方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                     { field: 'SupplierName', title: '供方单位', width: 250, align: 'left', sortable: true },
                     { field: 'ContractPeriod', title: '合同期限', width: 80, align: 'left', sortable: true },
                     { field: 'ContractMoney', title: '合同金额', width: 110, align: 'left', sortable: true },
                     { field: 'SynthesisScore', title: '综合得分', width: 110, align: 'left', sortable: true },
                     { field: 'AppraiserName', title: '评价人', width: 110, align: 'left', sortable: true },
                     {
                         field: 'EvaluateDate', title: '评价时间', width: 110, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = $.dateFormat(row.EvaluateDate, 'yyyy-MM-dd');
                             return str;
                         }
                     },
            ]];

            //查看合同详情
            function ContractShow(CId) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                LayerDialog.Open(w, h, '../CostManageNew/FromTabs.aspx?changBS=1&OpType=edit&Id=' + CId, '查看合同信息', true, function callback(_Data) {
                });
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#RunDate").datebox('setValue', null);
                    }
                }, {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        Export();
                    }
                }];


            function DelRecord(CpId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsCost', 'DelContractPerform', 'CpId=' + CpId,
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractPerformList&' + $('#frmFrom').serialize(),
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
            $(function () {
                LoadList();
            });
            function Export() {

                var dataFields = $('#TableContainer').datagrid('getColumnFields');
                var dataColumnFields = [], fields = "", datagridAttribute;

                $.each(dataFields, function (i, item) {
                    fields = item;
                    datagridAttribute = $('#TableContainer').datagrid("getColumnOption", item);
                    if (datagridAttribute.hidden) {
                        return true;
                    }
                    if (item == "Opt") { return true; }
                    dataColumnFields += "," + fields + " '" + datagridAttribute.title.replace("<br/>", "") + "'";
                });
                dataColumnFields = dataColumnFields.slice(1);
                var param = $.getParam();
                param.DataColumnFields = dataColumnFields;
                param.PageSize = 5000;
                param.IsPagination = "否";
                param.IsZip = "否";
                param.TableName = "履约评估";
                param.Class = "CsCost";
                param.Method = "GetContractPerformListWhere";
                console.log($.param(param));
                window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
            }

        </script>
    </form>
</body>
</html>


