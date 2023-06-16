<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractInformationSelect.aspx.cs" Inherits="M_Main.CostManageNew.ContractInformationSelect" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合同信息查询</title>


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
    <%--<script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
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
                LayerDialog.Open('500', '500', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
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
            //选择合同类别
            function SelContractType() {
                LayerDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类别', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#ContractType").val(varObjects[0]);
                        $("#TypeName").val(varObjects[1]);
                    }
                });
            }

            //注册事件
            function SelSupplier() {
                LayerDialog.Open(1000, 500, '../DialogNew/CostSearchSupplier.aspx', '选择供应商', true, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        //选择供应商
                        $("#SupplierId").val(Obj.Id);
                        $("#SupplierName").val(Obj.SupplierName);
                    }
                });
            }

            function btnClear() {
                //CommName  ,CommId , DepName, DepCode ,PrincipalName, Principal ,ContractNo,  ContractName, TypeName, ContractType, SupplierName, SupplierId, ContractPeriod,ContractBegin, ContractEnd,StartTime 
                //,Statue IsUpdate1 IsPastDue1 IsEnd1 IsSettleAccounts1 IsClose1

                $("#CommName ,#CommId , #DepName, #DepCode ,#PrincipalName, #Principal ,#ContractNo,#ContractName, #TypeName, #ContractType, #SupplierName, #SupplierId, #ContractPeriod,#ContractBegin, #ContractEnd,#StartTime").val("");
                $("#Statue ,#IsUpdate1 , #IsPastDue1, #IsEnd1 ,#IsSettleAccounts1,#IsClose1 ").val("");
            }

            var frozenColumns = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true }
            ]];


            var column = [[
                { field: 'CId', title: 'CId', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'CommId', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },

                { field: 'DepCode', title: '部门编号', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'DepName', title: '机构部门', width: 100, align: 'left', sortable: true },

                { field: 'Principal', title: '负责人ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'PrincipalName', title: '负责人', width: 100, align: 'left', sortable: true },

                { field: 'ContractNo', title: '合同编号', width: 80, align: 'left', sortable: true },
                {
                    field: 'ContractName', title: '合同名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"ContractShow('" + row.CId + "')\">" + row.ContractName + "</a>";
                        return str;
                    }
                },

                { field: 'ContractType', title: '合同类别ID', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'TypeName', title: '合同类别', width: 60, align: 'left', sortable: true },
                { field: 'SignedType', title: '签约类型', width: 60, align: 'left', sortable: true },
                { field: 'SupplierId', title: '对方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'SupplierName', title: '对方单位', width: 240, align: 'left', sortable: true },
                { field: 'ContractPeriod', title: '合同期限', width: 60, align: 'left', sortable: true },
                {
                    field: 'ContractBegin', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = $.dateFormat(row.ContractBegin, 'yyyy-MM-dd');
                        return str;
                    }
                },
                {
                    field: 'ContractEnd', title: '结束时间', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = $.dateFormat(row.ContractEnd, 'yyyy-MM-dd');
                        return str;
                    }
                },
                { field: 'ContractMoney', title: '合同金额', width: 100, align: 'left', sortable: true },
                { field: 'PayedMoney', title: '已付金额', width: 60, align: 'left', sortable: true },
                {
                    field: 'StartTime', title: '发起时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = $.dateFormat(row.StartTime, 'yyyy-MM-dd');
                        return str;
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
                        if (row.IsClose == "0" || row.IsClose == "") {
                            str = "是";
                        } if (row.IsClose == "1") {
                            str = "否";
                        }
                        return str;
                    }
                }
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
            function getQueryStr(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }
            function LoadList() {

                var sy = $.getUrlParam("sy");
                if (sy == '1') {
                    $("#ContractBegin").val(getCurrentMonthFirst());
                    $("#ContractEnd").val(getCurrentMonthLast());
                }

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPost.aspx',
                    method: "post",
                    nowrap: false,
                    fitColumns: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    //fit: true,
                    idField: "CId",
                    frozenColumns: frozenColumns,
                    columns: column,
                    rownumbers: true,
                    checkbox: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "desc",
                    remoteSort: false,
                    rowStyler: function (index, row) {
                        //if (row.IsLock == "是") {
                        //    return 'background-color:#F9F9F9;';
                        //}
                    },
                    onClickRow: function (index, row) {
                    },
                    onDblClickRow: function (index, row) {
                     
                    },
                    onBeforeLoad: function (param) {
                        param.SortField = "AddTime";
                        param.SortOrder = 1;
                        param.IsDelete = 0;
                        param = $.getDataGridParam("CsCost", "GetContractList", param);
                    },
                    onLoadSuccess: function (data) {
                      
                    },
                    onLoadError: function (data) {
                    }
                });

                //$("#TableContainer").datagrid({
                //    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractList&' + $('#frmFrom').serialize() + GetParam(),
                //    method: "get",
                //    loadMsg: '数据加载中,请稍候...',
                //    nowrap: false,
                //    pageSize: top.ListPageSize,
                //    pageList: top.ListPageList,
                //    rownumbers: true,
                //    frozenColumns: frozenColumns,
                //    columns: column,
                //    fitColumns: false,
                //    singleSelect: true,
                //    pagination: true,
                //    width: "100%",
                //    border: false,
                //    toolbar: toolbar,
                //    sortOrder: "asc"
                //});
                $("#SearchDlg").dialog("close");
            }
            function getCurrentMonthFirst() {
                var date = new Date();
                date.setDate(1);
                var month = parseInt(date.getMonth() + 1);
                var day = date.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            function getCurrentMonthLast() {
                var date = new Date();
                var currentMonth = date.getMonth();
                var nextMonth = ++currentMonth;
                var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
                var oneDay = 1000 * 60 * 60 * 24;
                var lastTime = new Date(nextMonthFirstDay - oneDay);
                var month = parseInt(lastTime.getMonth() + 1);
                var day = lastTime.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            $(function () {
                LoadList();
            })

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
                    switch (item) {
                        case "IsUpdate":
                            fields = "IsUpdateName";
                            break;
                        case "IsPastDue":
                            fields = "IsPastDueName";
                            break;
                        case "IsEnd":
                            fields = "IsEndName";
                            break;
                        case "IsSettleAccounts":
                            fields = "IsSettleAccountsName";
                            break;
                        case "IsClose":
                            fields = "IsCloseName";
                            break;
                    }
                    dataColumnFields += "," + fields + " '" + datagridAttribute.title.replace("<br/>", "") + "'";
                });
                dataColumnFields = dataColumnFields.slice(1);
                var param = $.getParam();
                param.DataColumnFields = dataColumnFields;
                param.PageSize = 5000;
                param.IsPagination = "否";
                param.IsZip = "否";
                param.TableName = "合同信息";
                param.Class = "CsCost";
                param.Method = "GetContractWhere";
                console.log($.param(param));
                window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
            }

        </script>
    </form>
</body>
</html>


