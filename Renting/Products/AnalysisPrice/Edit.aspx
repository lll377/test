<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Products.AnalysisPrice.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-竞品管理-竞品价格分析-租金均价设置</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        .control-label {
            text-align: center;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <table id="TableContainer" border="0" cellspacing="0" cellpadding="0"></table>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitDataGrid();
        });
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    endEditionForItem();//先结束编辑
                    if (editIndexForItem != undefined) {
                        $.messager.alert("温馨提示", '请完成当前编辑!');
                    } else {
                        //添加一行数据
                        $('#TableContainer').datagrid('appendRow', {
                            Sort: '',
                            StartingRentQuote: '',
                            EndRentQuote: ''
                        });
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var SelectRow = $("#TableContainer").datagrid("getSelected");
                    if (SelectRow) {
                        var RowIndex = $("#TableContainer").datagrid("getRowIndex", SelectRow);
                        $("#TableContainer").datagrid("deleteRow", RowIndex);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }, '-',
            {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    Save();
                }
            }, '-',
            {
                iconCls: 'icon-help',
                text: '1、不填写开始租金【(结束租金)以内】2、不填写结束租金【(开始租金)以上】',
                handler: function () {
                }
            }
        ];
        var column = [[
            {
                field: 'Sort', title: '序号', width: 100, align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        max: 10000,
                        required: true
                    }
                }
            },
            {
                field: 'StartingRentQuote', title: '开始租金(元/平米.月)≤[租金均价]', width: 100, align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        max: 10000,
                        precision: 2
                    }
                }
            },
            {
                field: 'EndRentQuote', title: '结束租金(元/平米.月)＞[租金均价]', width: 100, align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        max: 10000,
                        precision: 2
                    }
                }
            }
        ]];
        //加载列表
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                onClickCell: onClickCellForItem,
                onAfterEdit: onAfterEditForItem,
                onBeforeLoad: function (param) {
                    param.SortField = "Sort";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_Products_AnalysisPrice", "GetList", param);
                },
                onLoadSuccess: function (data) {
                }
            });
        }

        //编辑的行号
        var editIndexForItem = undefined;
        //*****编辑
        function endEditionForItem() {
            if (editIndexForItem == undefined) {
                return true
            }
            if ($('#TableContainer').datagrid('validateRow', editIndexForItem)) {
                $('#TableContainer').datagrid('endEdit', editIndexForItem);
                editIndexForItem = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForItem(Rowindex, field, value) {
            $('#TableContainer').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainer').datagrid("getSelected");
            if (endEditionForItem()) {
                $('#TableContainer').datagrid('beginEdit', Rowindex);
                editIndexForItem = Rowindex;
            }
        }
        function onAfterEditForItem(rowIndex, row, changes) {
            var updated = $('#TableContainer').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainer').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForItem != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndexForItem);
                    $('#TableContainer').datagrid('endEdit', editIndexForItem);
                }
            }
        }
        //保存
        function Save() {
            endEditionForItem();
            let Rows = $("#TableContainer").datagrid("getRows");
            if (Rows.length == 0) {
                $.messager.alert('温馨提示', "请录入距离分组设置！");
                return;
            }
            for (var i = 0; i < Rows.length; i++) {
                if (Rows[i]["Sort"] == "") {
                    $.messager.alert('温馨提示', "第【" + (parseInt(i) + 1) + "】行序号不允许为空！");
                    return;
                }
                if (Rows[i]["StartingRentQuote"] == "" && Rows[i]["EndRentQuote"] == "") {
                    $.messager.alert('温馨提示', "第【" + (parseInt(i) + 1) + "】行开始租金、结束租金不允许都为空！");
                    return;
                }
                //验证开始是否大于结束
                if (parseFloat(Rows[i]["StartingRentQuote"]) >= parseFloat(Rows[i]["EndRentQuote"])) {
                    $.messager.alert('温馨提示', "第【" + (parseInt(i) + 1) + "】行开始租金不允许大于等于结束租金！");
                    return;
                }
            }
            var param = $.getParam();
            param.DetailResult = JSON.stringify(Rows);
            $.dataPostJson('Renting_Products_AnalysisPrice', 'Save', param, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        LayerDialog.Close("保存");
                    } else {
                        $.messager.alert('温馨提示', data.msg);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //关闭
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>

