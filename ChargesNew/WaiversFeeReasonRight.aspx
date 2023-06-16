<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeReasonRight.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeReasonRight" %>

<!DOCTYPE html>
<html>
<head>
    <title>减免原因-右</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 150px;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="IsAuditing21" name="IsAuditing21" value="0" runat="server" />
        <input type="hidden" id="WFRCommRows" name="WFRCommRows" runat="server" />
        <input type="hidden" id="WFRIIDRows" name="WFRIIDRows" runat="server" />

        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">减免类别</td>
                    <td class="TdContentSearch">
                        <select id="IsPolicyName" name="IsPolicyName" runat="server">
                            <option value="" selected></option>
                            <option value="1">政策性</option>
                            <option value="0">非政策性</option>
                        </select>
                    </td>
                    <td class="TdTitle">减免原因</td>
                    <td class="TdContent">
                        <input id="WaivReason" type="text" maxlength="50" name="WaivReason"
                            runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">已发小区
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="CommName" name="CommName" class="easyui-searchbox" searcher="SelComm" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();

                $("#TableContainer").css("height", h + "px");
                $("#TableContainer").css("width", "100%");
            }
            InitFunction();

            function SelComm() {

                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    $("#CommName").searchbox("setValue", Obj.name);
                });
            }

            
            var toolbar = [
                {
                    text: '确认发放',
                    iconCls: 'icon-add',
                    handler: function () {

                        $.messager.confirm('确定', '是否确认发放', function (r) {
                            if (r) {
                                //得到项目列表
                                var rowComm = parent.window.frames["WaiversFeeReasonLeft"].window.
                                    $("#TableContainer").datagrid("getSelections");
                                var strWFRCommRows = JSON.stringify(rowComm);
                                $("#WFRCommRows").val(strWFRCommRows);

                                //得到减免原因列表
                                var rowIID = $("#TableContainer").datagrid("getSelections");
                                var strWFRIIDRows = JSON.stringify(rowIID);
                                $("#WFRIIDRows").val(strWFRIIDRows);


                                $.tool.DataPostChk('frmForm', 'WaiversFees', 'SaveWaiversFeeReason', $('#frmForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "false") {
                                            HDialog.Info("减免原因发放失败");
                                        }
                                        else {
                                            $("#WFRCommRows").val("");
                                            $("#WFRIIDRows").val("");
                                            LoadList();
                                            HDialog.Info("减免原因发放成功");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });

                    }
                }, '-',
                {
                    text: '取消发放',
                    iconCls: 'icon-remove',
                    handler: function () {

                        $.messager.confirm('确定', '是否取消发放', function (r) {
                            if (r) {
                                 //得到项目列表
                                var rowComm = parent.window.frames["WaiversFeeReasonLeft"].window.
                                    $("#TableContainer").datagrid("getSelections");
                                var strWFRCommRows = JSON.stringify(rowComm);
                                $("#WFRCommRows").val(strWFRCommRows);

                                //得到减免原因列表
                                var rowIID = $("#TableContainer").datagrid("getSelections");
                                var strWFRIIDRows = JSON.stringify(rowIID);
                                $("#WFRIIDRows").val(strWFRIIDRows);

                                $.tool.DataPostChk('frmForm', 'WaiversFees', 'CancelWaiversFeeReason', $('#frmForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                         if (_Data == "false") {
                                            HDialog.Info("减免原因发放失败");
                                        }
                                        else {
                                            $("#WFRCommRows").val("");
                                            $("#WFRIIDRows").val("");
                                            LoadList();
                                            HDialog.Info("减免原因发放成功");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });

                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            var column;
            column = [[
                { field: 'IID', title: '', align: 'left', checkbox: true, sortable: true, width: 50 },
                { field: 'IsPolicyName', title: '减免类别', align: 'left', sortable: true, width: 100 },
                { field: 'WaivReason', title: '减免原因', align: 'left', sortable: true, width: 120 },
                { field: 'CommNames', title: '发放小区', align: 'left', sortable: true, width: 600 }
            ]];

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    IsCustomHead: false,
                    cascadeCheck: true,
                    toolbar: toolbar,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("WaiversFees", "searchcorpwaiversfeereason", "TableContainer", param);
                    },
                    onSelect: function (rowIndex, rowData) {
                        if ($("#IsAuditing21").val() == "1") {
                            $("#TableContainer").datagrid("unselectRow", rowIndex);
                            $("#TableContainer").datagrid("uncheckRow", RowIndex);
                            $("#TableContainer").datagrid("selectOnCheck", false);
                        }
                    },

                    onCheckAll: function (rows) {
                        for (var i = 0; i < rows.length; i++) {
                            var jsonobj = rows[i];
                            var RowIndex = $("#TableContainer").datagrid("getRowIndex", jsonobj);
                            if ($("#IsAuditing21").val() == "1") {
                                $("#TableContainer").datagrid("uncheckRow", RowIndex);
                            }
                            $(".datagrid-header-check input").prop("checked", true);
                        }
                    }
                });
            }

            LoadList();


        </script>
    </form>
</body>
</html>
