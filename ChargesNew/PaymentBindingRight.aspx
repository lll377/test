<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentBindingRight.aspx.cs" Inherits="M_Main.ChargesNew.PaymentBindingRight" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <form id="frmForm" runat="server">
        <input type="hidden" id="CostID" name="CostID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="CostCode" name="CostCode" runat="server" />
        <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CommName" name="CommName" class="easyui-searchbox" searcher="SelCommInfo" />
                    </td>
                    <td class="TdTitle">费用名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CostName" name="CostName" class="easyui-searchbox" searcher="SelCostName" />
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
            }
            InitFunction();

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CommID").val() == null || $("#CommID").val() == "") {
                            HDialog.Info("请选择项目");
                            return false;
                        } else {
                            ViewDetail("新增", 'add', 0, $("#CommID").val());
                        }
                    }

                }, '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择需要修改的数据");
                            return false;
                        } else {
                            ViewDetail("修改", 'Edit', row.IID, row.CommID);
                        }
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");

                        if (row == null) {
                            HDialog.Info("请选择需要删除的费用类型");
                            return;
                        }
                        $.messager.confirm('确定', '是否删除该项', function (r) {
                            if (r) {
                                if (row != undefined && row != null) {

                                    //alert(row.CommID)
                                    ////DelRecord(row.IID);
                                    $.tool.DataPostChk('frmForm', 'PaymentSubject', 'PaymentBindDel', $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            LoadList();
                                            HDialog.Close('1');
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }
                        })
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '<font color=red>&nbsp;&nbsp*&nbsp费项绑定设置用于设置每个物业项目哪些费用项目在业主通过APP/微信/小程序缴费时必须一起缴纳。</font>'
                }
            ];

            var column;
            column = [[
                { field: 'IID', title: '', align: 'left', checkbox: true, sortable: true, width: 50 },
                { field: 'OrganName', title: '区域名称', align: 'left', sortable: true, width: 100 },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
                { field: 'CostNames', title: '费用名称', align: 'left', sortable: true, width: 200 },
                {
                    field: 'IsPrec', title: '是否预存', align: 'left', sortable: true, width: 120
                },
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
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("PaymentSubject", "PaymentBindGetList", "TableContainer", param);
                    }
                });
            }

            LoadList();


            function ViewDetail(title, OpType, ID, CommID) {
                HDialog.Open('800', '300', '../ChargesNew/PaymentBindingBrowse.aspx?IID=' + ID + '&OpType=' + OpType + '&CommID=' + CommID, title, true, function callback(_Data) {
                    LoadList();
                });
            }

            function SelCommInfo() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelComm.aspx', '管理项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CommID").val(Obj.attributes.InPopedom);
                        $("#CommName").searchbox("setValue", Obj.text);
                    }
                });
            }

            function SelCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CostName").searchbox("setValue", Obj.text);
                        $("#CommID").val(Obj.attributes.InPopedom);
                    }
                });
            }

            function DelRecord(IID) {
                $.tool.DataPostChk('frmForm', 'PaymentSubject', 'Del', IID,
                    function Init() {
                    },
                    function callback(_Data) {

                        HDialog.Close('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        </script>
    </form>
</body>
</html>
