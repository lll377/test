﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentPushSetting_Warning.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentPushSetting_Warning" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>
    <style type="text/css">
        .HrefStyle {
            color: darkblue;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="FrmForm" method="post" runat="server">
        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    var editrows = [];
    var editIndex = undefined;
    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }
    InitTableHeight();

    function SelCheckObject(o) {
        var ObjectArray = new Array();
        var checkedValue = $(o).is(':checked');
        var values = $(o).attr('id').replace('Object', '');
        var check = 0;
        if (checkedValue) {
            check = 1;

        } else {
            check = 0;
        }
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_WarningUpdate', 'Type=Object&Id=' + values + '&Status=' + check,
            function Init() {
            },
            function callback(_Data) {

            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    function SelCheckAPP(o) {
        var ObjectArray = new Array();
        var checkedValue = $(o).is(':checked');
        var values = $(o).attr('id').replace('APP', '');
        var check = 0;
        if (checkedValue) {
            check = 1;

        } else {
            check = 0;
        }
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_WarningUpdate', 'Type=APP&Id=' + values + '&Status=' + check,
            function Init() {
            },
            function callback(_Data) {

            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    function SelCheckPhone(o) {
        var ObjectArray = new Array();
        var checkedValue = $(o).is(':checked');
        var values = $(o).attr('id').replace('Phone', '');
        var check = 0;
        if (checkedValue) {
            check = 1;

        } else {
            check = 0;
        }
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_WarningUpdate', 'Type=Phone&Id=' + values + '&Status=' + check,
            function Init() {
            },
            function callback(_Data) {

            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    var column = [
        [
            { field: 'Business', title: '业务场景', width: 110, sortable: true, rowspan: 2, align: 'left' },
            {
                field: 'PushObject', title: '推送对象', width: 200, sortable: true, rowspan: 2, align: 'left', formatter: function (value, row, rowIndex) {
                    var str = '';
                    if (row.CheckPushObject == '0') {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Object' + '\' onclick=\'SelCheckObject(this);\' />' + row.PushObject;
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Object' + '\' checked=\'checked\' onclick=\'SelCheckObject(this);\' />' + row.PushObject;
                    }
                    return str;
                }
            },
            { field: 'PushContent', title: '推送内容（报事编号、房屋编号/公区名称自动附加）', width: 700, sortable: true, editor: { type: 'validatebox' }, rowspan: 2, align: 'left' },
            { title: '推送方式', colspan: 2, align: 'left', width: 220, }
        ], [
            {
                field: 'APP', title: 'APP消息', width: 110, sortable: true, align: 'left', formatter: function (value, row, rowIndex) {
                    var str = '';
                    if (row.App == '0') {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'APP' + '\' onclick=\'SelCheckAPP(this);\' />';
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'APP' + '\' checked=\'checked\' onclick=\'SelCheckAPP(this);\' />';
                    }
                    return str;
                }
            },
            {
                field: 'Phone', title: '手机短信', width: 110, sortable: true, align: 'left', formatter: function (value, row, rowIndex) {
                    var str = '';
                    if (row.Phone == '0') {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Phone' + '\' onclick=\'SelCheckPhone(this);\' />';
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Phone' + '\' checked=\'checked\' onclick=\'SelCheckPhone(this);\' />';
                    }
                    return str;
                }
            }
        ]
    ];

    var toolbar = [
        {
            text: '保存',
            iconCls: 'icon-save',
            handler: function () {

                //if (editIndex != undefined) {
                //    $('#TableContainer').datagrid('endEdit', editIndex);
                //    editIndex = undefined;
                //}
                $('#TableContainer').datagrid('acceptChanges');

                var rows = $('#TableContainer').datagrid('getData').rows;
                $('#AllData').val(JSON.stringify(rows));
                console.log($('#AllData').val());

                $.tool.DataPostChk('FrmForm', 'IncidentPushSetting', 'IncidentPushSetting_WarningUpdateContent', $('#FrmForm').serialize(),
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
        }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            nowrap: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onDblClickRow: function (rowIndex, rowData) {
                if (editIndex != undefined) {
                    $(this).datagrid('endEdit', editIndex);
                }
                $(this).datagrid('beginEdit', rowIndex);
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("IncidentPushSetting", "IncidentPushSetting_Warning", "TableContainer", param);
            },
            onLoadSuccess: function () {
                //var headerTds = $(".datagrid-header-inner table tr:first-child").children();             
                //var bodyTds = $(".datagrid-body table tr:first-child").children();
                //headerTds.each(function (i, obj) {
                //    var headerTd = $(headerTds.get(i));
                //    var bodyTd = $(bodyTds.get(i));
                //    var headerTdWidth = headerTd.width(); //获取第i个头部td的宽度                  
                //    bodyTd.width(headerTdWidth);
                //});
                $.tool.MergeEasyUiGrid("TableContainer", "Business");
                //$("#TableContainer").datagrid("mergeCells", {
                //    index: 0,
                //    field: 'Business', //合并字段
                //    rowspan: 6,
                //    colspan: null
                //});
            }
        });
        $("#SearchDlg").dialog("close");
    }

    LoadList();

</script>
