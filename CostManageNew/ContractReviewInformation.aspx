<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractReviewInformation.aspx.cs" Inherits="M_Main.CostManageNew.ContractReviewInformation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>合同评审信息</title>
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
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" name="CId" id="CId" runat="server" />
        <input type="hidden" name="changBS" id="changBS" value="" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'CId', title: 'CId', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'CommId', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'DepCode', title: '部门编号', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'DepName', title: '机构部门', width: 100, align: 'left', sortable: true },

                { field: 'Principal', title: '负责人ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'PrincipalName', title: '负责人', width: 100, align: 'left', sortable: true },

                { field: 'ContractNo', title: '合同编号', width: 80, align: 'left', sortable: true },
                { field: 'ContractName', title: '合同名称', width: 200, align: 'left', sortable: true },

                { field: 'ContractType', title: '合同类型ID', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'TypeName', title: '合同类型', width: 60, align: 'left', sortable: true },
                { field: 'SupplierId', title: '供方单位Id', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'SupplierName', title: '供方单位', width: 240, align: 'left', sortable: true },
                { field: 'ContractMoney', title: '合同金额', width: 100, align: 'left', sortable: true },
                { field: 'StartPerson', title: '发起人ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'StartPersonName', title: '发起人', width: 100, align: 'left', sortable: true },
                {
                    field: 'StartTime', title: '发起时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, 'yyyy-MM-dd');
                        }
                        return value;
                    }
                },
                { field: 'Statue', title: '审核状态', width: 60, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getRows");
                        if (row.length > 0) {
                            if (row.Statue != "null") {
                                HDialog.Info("合同评审只能新增一条");
                                return;
                            }
                        }
                        var w = top.$(window).width();
                        var h = parent.$(window).height();
                        HDialog.Open(w, 600, '../CostManageNew/ContractReviewProcess.aspx?OpType=insert&CId=' + $("#CId").val(), '新增合同评审信息', true, function callback(_Data) {
                            LoadList();
                            //判断如果该条信息已经评审，则限制合同信息操作
                            //var row = $("#TableContainer").datagrid("getRows");
                            //if (row.length > 0) {
                            //    alert(row[0].Statue);
                            //    if (row[0].Statue == "审核中" || row[0].Statue == "已审核"){
                            //        window.location.href = '../CostManageNew/FromTabs.aspx?OpType=edit&Id=' + $("#CId").val();
                            //    }
                            //}
                        });
                    }
                }
                //, '-', {
                //    text: '删除',
                //    iconCls: 'icon-cancel',
                //    handler: function () {
                //        var row = $("#TableContainer").datagrid("getSelected");
                //        if (row != null) {
                //            DelRecord(row.CId);
                //        }
                //        else {
                //            HDialog.Info("请选择一行数据进行删除！");
                //        }
                //    }
                //}

                , '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null && row != "" && row != undefined) {
                            var w = top.$(window).width();
                            var h = parent.$(window).height();
                            HDialog.Open(w, 600, '../CostManageNew/ContractReviewProcess.aspx?OpType=edit&CId=' + $("#CId").val(), '修改合同评审信息', true, function callback(_Data) {
                                LoadList();
                                //判断如果该条信息已经评审，则限制合同信息操作
                                //var row = $("#TableContainer").datagrid("getSelected");
                                //if (row.length > 0) {
                                //    if (row[0].Statue == "审核中" || row[0].Statue == "已审核") {
                                //        window.location.href = '../CostManageNew/FromTabs.aspx?OpType=edit&Id=' + $("#CId").val();
                                //    }
                                //}
                            });
                        } else {
                            HDialog.Info("请选择一行数据");
                        }
                    }
                }];

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

            function LoadList() {
                if ($("#changBS").val() == 1) {
                    toolbar = null;
                } if ($("#CId").val() != "" && $("#CId").val() != null && $("#CId").val() != undefined && $("#CId").val() != "null") {
                    $("#TableContainer").datagrid({
                        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=SelContractInformation1&' + $('#frmFrom').serialize(),
                        method: "get",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        rownumbers: true,
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
                } else {
                    $("#TableContainer").datagrid({
                        url: null,
                        method: "get",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        rownumbers: true,
                        columns: column,
                        fitColumns: true,
                        singleSelect: true,
                        pagination: true,
                        width: "100%",
                        border: false,
                        toolbar: null,
                        sortOrder: "asc"
                    });
                    $("#SearchDlg").dialog("close");
                }
            }
            LoadList();

        </script>
    </form>
</body>
</html>

