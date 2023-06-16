<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageBrowse.aspx.cs" Inherits="M_Main.SysNew.MessageBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style>
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 620px; height: 190px; padding: 10px">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;padding:10px" >
                <tr>
                    <td>状态：</td>
                    <td >
                        <select id="MsgState" name="MsgState" runat="server" class="easyui-combobox" style="width:124px">
                            <option selected></option>
                            <option value ="1">未读</option>
                            <option value ="2">已读</option>
                        </select>
                    </td>
                    <td>消息内容：</td>
                    <td>
                        <input id="MsgTitle"  size="5" name="MsgTitle" runat="server" class="easyui-validatebox">                
                    </td>
                    
                </tr>
                <tr>
                    <td>发送人</td>
                    <td><input id="SendManName"  name="SendManName" runat="server" class="easyui-validatebox">          
                    </td>
                    <td>接收人</td>
                    <td><input id="UserName"  name="UserName" runat="server" class="easyui-validatebox">          
                    </td>
                </tr>
                <tr>
                    <td>开始时间</td>
                    <td><input id="StartSendTime"  name="StartSendTime" runat="server" class="easyui-datebox">          
                    </td>
                    <td>结束时间</td>
                    <td><input id="EndSendTime"  name="EndSendTime" runat="server" class="easyui-datebox">          
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align:center">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();" >确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            var column = [[
                    { field: 'MessageCode', title: 'MessageCode', width: 50, align: 'left', sortable: true, checkbox: true, },
                    {
                        field: 'MsgTitle', title: '消息标题', width: 400, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.MessageCode + "','edit');\">" + row.MsgTitle + "</a>";
                            return str;
                        }
                    },
                    {
                        field: 'SendManName', title: '发送人', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "";
                            if (row.SendManName == "") {
                                str = "系统消息";
                            } else {
                                str = row.SendManName;
                            }
                            return str;
                        }
                    },
                    { field: 'UserName', title: '接收人', width: 100, align: 'left', sortable: true },
                    { field: 'SendTime', title: '发送时间', width: 150, align: 'left', sortable: true },
                    {
                        field: 'MsgStateName', title: '状态', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "";
                            if (row.MsgState == "1") {
                                str = "<font color='red'>未读</font>";
                            } else {
                                str = "<font color='red'>已读</font>";
                            }
                        return str;
                    }
                    },
            ]];


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var toolbar = [
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            $.messager.confirm('确定', '是否删除该项', function (r) {
                                if (r) {
                                    var row = $("#TableContainer").datagrid("getChecked");
                                    for (var i = 0; i < row.length; i++) {
                                        DelRecord(row[i]);
                                    }
                                }
                            });

                        }
                    }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-filter',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }
            ];

            function DelRecord(row) {
                    $.tool.DataGet('OnLineMessage', 'delete', 'MessageCode=' + row.MessageCode,
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=OnLineMessage&Command=search&' + $("#frmForm").serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "desc",
                    remoteSort: false,
                    onLoadSuccess: function (data) {
                    },
                    onLoadError: function (data)
                    {

                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function Detail(MsgCode, OpType) {
                HDialog.Open('800', '600', '../SysNew/MessageRead.aspx?MsgCode=' + MsgCode + '&OpType=' + OpType, '在线短信', true, function callback(_Data) {
                });
            }

            LoadList();

        </script>
    </form>
</body>
</html>

