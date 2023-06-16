<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChangeSelect.aspx.cs" Inherits="M_Main.CostManageNew.ContractChangeSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合同变更查询</title>

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
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 180px; padding: 10px;">
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
                    <td class="TdTitle">供方单位</td>
                    <td class="TdContent">
                        <input id="SupplierIdName" name="SupplierIdName" type="text" class="easyui-validatebox" onclick="SelSupplierSer();" />
                        <input type="hidden" id="SupplierId" name="SupplierId" value="" /></td>
                    <td class="TdTitle">变更类型</td>
                    <td class="TdContent">
                        <select id="ContractSource" isdctype="true" dctype="合同变更类型" clientidmode="Static" name="ContractSource" style="border: 1px solid #cccccc; height: 21px; line-height: 16px; width: 100%;">
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContent">
                        <input id="StartPersonName" name="StartPersonName" type="text" class="easyui-validatebox" onclick="SelStartPerson();" style="width: 98%;" />
                        <input type="hidden" id="StartPerson" name="StartPerson" value="" />
                    </td>
                    <td class="TdTitle">发起时间</td>
                    <td class="TdContent">
                        <input id="StartTime" name="StartTime"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
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
        <input type="hidden" name="ContractCId" value="" id="ContractCId" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

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

            //选择发起人
            function SelStartPerson() {
                LayerDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#StartPerson").val(varObjects.UserCode);
                        $("#StartPersonName").val(varObjects.UserName);
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
                { field: 'ChangeId', title: 'ChangeId', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'CommId', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },

                { field: 'DepCode', title: '部门编号', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'DepName', title: '机构部门', width: 100, align: 'left', sortable: true },

                { field: 'Principal', title: '负责人ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'PrincipalName', title: '负责人', width: 100, align: 'left', sortable: true },

                { field: 'ContractNo', title: '合同编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'ContractName', title: '合同名称', width: 230, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"ContractShow('" + row.CId + "')\">" + row.ContractName + "</a>";
                        return str;
                    }
                },

                { field: 'ContractType', title: '合同类型ID', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'TypeName', title: '合同类型', width: 100, align: 'left', sortable: true },
                { field: 'SupplierId', title: '对方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'SupplierName', title: '对方单位', width: 250, align: 'left', sortable: true },
                { field: 'ChangeName', title: '变更类型', width: 100, align: 'left', sortable: true },

                { field: 'BeforeContractMoney', title: '变更前合同金额', width: 100, align: 'left', sortable: true },
                { field: 'AfterContractMoney', title: ' 变更后合同金额', width: 100, align: 'left', sortable: true },

                { field: 'StartPerson', title: '发起人ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'StartPersonName', title: '发起人', width: 100, align: 'left', sortable: true },
                {
                    field: 'StartTime', title: '发起时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = $.dateFormat(row.StartTime, 'yyyy-MM-dd');
                        return str;
                    }
                },
                { field: 'Statue', title: '审核状态', width: 60, align: 'left', sortable: true }
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


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPost.aspx',
                    method: "post",
                    nowrap: false,
                    fitColumns: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    //fit: true,
                    idField: "ChangeId",
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
                        param = $.getDataGridParam("CsCost", "GetContractChangeList", param);
                    },
                    onLoadSuccess: function (data) {

                    },
                    onLoadError: function (data) {
                    }
                });


                //$("#TableContainer").datagrid({
                //    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractChangeList&' + $('#frmFrom').serialize(),
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
                param.TableName = "合同变更";
                param.Class = "CsCost";
                param.Method = "GetContractChangeListWhere";
                console.log($.param(param));
                window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
            }
        </script>
    </form>
</body>
</html>


