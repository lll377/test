<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentPushSetting_Handle.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentPushSetting_Handle" %>

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
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_HandleUpdate', 'Type=Object&Id=' + values + '&Status=' + check,
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
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_HandleUpdate', 'Type=APP&Id=' + values + '&Status=' + check,
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
        $.tool.DataGet('IncidentPushSetting', 'IncidentPushSetting_HandleUpdate', 'Type=Phone&Id=' + values + '&Status=' + check,
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
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Object' + '\' onclick=\'SelCheckObject(this);\' disabled=\'disabled\'/>' + row.PushObject;
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Object' + '\' checked=\'checked\' onclick=\'SelCheckObject(this);\' disabled=\'disabled\'/>' + row.PushObject;
                    }
                    return str;
                }
            },
            { field: 'PushContent', title: '推送内容', width: 700, sortable: true, editor: { type: 'validatebox' }, rowspan: 2, align: 'left' },
            { title: '推送方式', colspan: 2, align: 'left', width: 220, }
        ], [
            {
                field: 'APP', title: 'APP消息', width: 110, sortable: true, align: 'left', formatter: function (value, row, rowIndex) {
                    var str = '';
                    if (row.App == '0') {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'APP' + '\' onclick=\'SelCheckAPP(this);\' disabled=\'disabled\'/>';
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'APP' + '\' checked=\'checked\' onclick=\'SelCheckAPP(this);\' disabled=\'disabled\'/>';
                    }
                    return str;
                }
            },
            {
                field: 'Phone', title: '手机短信', width: 110, sortable: true, align: 'left', formatter: function (value, row, rowIndex) {
                    var str = '';
                    if (row.Phone == '0') {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Phone' + '\' onclick=\'SelCheckPhone(this);\' disabled=\'disabled\'/>';
                    } else {
                        str = '<input type=\'checkbox\' id=\'' + row.IID + 'Phone' + '\' checked=\'checked\' onclick=\'SelCheckPhone(this);\' disabled=\'disabled\'/>';
                    }
                    return str;
                }
            }
        ]
    ];

    var toolbar = [
        {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function () {

                //if (editIndex != undefined) {
                //    $('#TableContainer').datagrid('endEdit', editIndex);
                //    editIndex = undefined;
                //}
                //$('#TableContainer').datagrid('acceptChanges');

                var row = $("#TableContainer").datagrid("getSelected");
                $('#AllData').val(JSON.stringify(row));
                console.log($('#AllData').val());

                //$.tool.DataPostChk('FrmForm', 'IncidentPushSetting', 'IncidentPushSetting_HandleUpdateContent', $('#FrmForm').serialize(),
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        LoadList();
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //    });
                HDialog.Open('650', '280', '../IncidentNewJH/IncidentPushSetting_DetailUpdate.aspx?UpdateTable=Tb_HSPR_IncidentPushSettingHandle&IID=' + row.IID, '报事处理推送设置', true, function callback(_Data) {
                    LoadList();
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
            //onDblClickRow: function (rowIndex, rowData) {
            //    if (editIndex != undefined) {
            //        $(this).datagrid('endEdit', editIndex);
            //    }
            //    $(this).datagrid('beginEdit', rowIndex);
            //},
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("IncidentPushSetting", "IncidentPushSetting_Handle", "TableContainer", param);
            },
            onClickRow: function (rowIndex, rowData) {
                HDialog.Open('650', '280', '../IncidentNewJH/IncidentPushSetting_DetailUpdate.aspx?UpdateTable=Tb_HSPR_IncidentPushSettingHandle&IID=' + rowData.IID, '报事处理推送设置', true, function callback(_Data) {
                    LoadList();
                });
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

    $(document).ready(function () {
        // 任何需要执行的js特效 
        LoadList();
    });

</script>


