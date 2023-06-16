<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendReadBrowse_WeChat.aspx.cs" Inherits="M_Main.SMSNew.SendReadBrowse_WeChat" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="Type" name="Type" runat="server" />
        <input type="hidden" id="IsSelCommID" name="IsSelCommID" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CommNames" data-options="editable:false" searcher="SelCommInfo" name="CommNames" runat="server">
                        <input class="Control_ItemInput" id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server">
                        <input class="Control_ItemInput" id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server"></td>
                    <td class="TdTitle">手机号码</td>
                    <td class="TdContent">
                        <input id="Mobile" name="Mobile" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">姓名</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="Name" name="Name" runat="server"></td>
                    <td class="TdTitle">发送人</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="UserName" name="UserName" runat="server"></td>
                </tr>
                <tr>
                    <td class="formTable_Footer" align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            if ($("#Type").val() == "1" && $("#IsSelCommID").val() != "0") {
                $("#CommNames").searchbox('disable');
            }
        })

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function SelCommInfo() {
            HDialog.Open(400, 500, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                $("#CommIDs").val(Obj.attributes.InPopedom);
                $("#CommNames").searchbox("setValue", Obj.text);
            });
        }

        var column = [[
            { field: 'CommName', title: '管理项目', width: 200, align: 'left', sortable: true },
            { field: 'Mobile', title: '手机号码', width: 100, align: 'left', sortable: true },
            { field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true },
            { field: 'SendTime', title: '定时发送时间', width: 160, align: 'left', sortable: true },
            { field: 'UserName', title: '发送人', width: 200, align: 'left', sortable: true },
            {
                field: '操作', title: '操作', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.OpenId + "');\">" + '查看' + "</a>";
                    return str;
                }
            }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=SMS&Command=SendReadSearch_WeChat&' + $("#frmForm").serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });
        }

        LoadList();

        function Detail(OpenID) {
            HDialog.Open('420', '300', '../SMSNew/SendReadBrowse_WeChatCustDetail.aspx?OpenID=' + OpenID, '用户详情', false, function callback(_Data) {
                //LoadList();
            });
        }
    </script>
</body>
</html>
