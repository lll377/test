<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelCheckStandard.aspx.cs" Inherits="M_Main.Supervision.SelCheckStandard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查标准引用</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 185px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">所属单位:</td>
                    <td class="text">
                        <input id="OrganCode" name="OrganCode" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            width:'400px',
                            tipPosition: 'bottom',
                            required: false,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelOrgan(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input type="text" id="TypeName" name="TypeName" class="easyui-textbox" data-options="width:'400px',required:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            //选择所属单位
            function SelOrgan() {
                HDialog.Open('400', '350', '../Supervision/SelOrgan.aspx?IsCheck=1', "选择所属单位", false, function callback(_Data) {
                    if (_Data > '') {
                        var varObjects = _Data.split('◆');
                        $("#OrganCode").textbox('setValue', varObjects[0]);
                        $("#OrganCode").textbox('setText', varObjects[1]);
                    }
                });
            }

            function InitTableHeight() {
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'OrganName', title: '所属单位', width: 20, align: 'left', sortable: true },
                { field: 'TypeName', title: '检查类型', width: 50, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '引用',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择引用数据");
                            return;
                        }
                        QuoteCheckStandard(row.Id);
                    }
                }
                ,'-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function QuoteCheckStandard(Id) {
                HDialog.Prompt('是否引用选中的数据，将全部覆盖所有标准设置!', function () {
                    $.tool.DataGet('CSSupervision', 'QuoteCheckStandard', 'QuoteCheckTypeId=' + Id + '&CheckTypeId=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Info("引用成功");
                            HDialog.Close();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=SelCheckStandard&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    rownumbers: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                $("#Id").val(GetQueryString('Id'));
                InitTableHeight();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
