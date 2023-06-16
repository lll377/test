<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustCanBrowse_WeChat.aspx.cs" Inherits="M_Main.SMSNew.CustCanBrowse_WeChat" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
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
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="Type" name="Type" runat="server" />
        <input type="hidden" id="IsSelCommID" name="IsSelCommID" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="DialogTdTitle">管理项目</td>
                    <td class="DialogTdContentSearch">
                        <input class="easyui-searchbox" id="CommNames" style="width: 87.5%;" data-options="editable:false" searcher="SelCommInfo" name="CommNames" runat="server">
                        <input class="Control_ItemInput" id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server">
                        <input class="Control_ItemInput" id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server"></td>
                    <td class="DialogTdTitle">客户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" name="CustName" class="easyui-validatebox" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td class="DialogTdContent">
                        <input class="easyui-validatebox" id="RoomSign" name="RoomSign" runat="server"></td>
                    <td class="DialogTdTitle">手机号码</td>
                    <td class="DialogTdContent">
                        <input class="easyui-validatebox" id="Telephone" name="Telephone" runat="server"></td>
                </tr>
                <%--                <tr>
                    <td class="DialogTdTitle">生日</td>
                    <td class="DialogTdContent">
                        <select id="nMonth" name="nMonth" runat="server">
                            <option selected></option>
                        </select>月
                        <select id="nDay" name="nDay" runat="server">
                            <option selected></option>
                        </select>日
                    </td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <select id="endnMonth" name="endnMonth" runat="server">
                            <option selected></option>
                        </select>月
                        <select id="endnDay" name="endnDay" runat="server">
                            <option selected></option>
                        </select>日
                    </td>
                </tr>--%>
                <tr>
                    <td align="center" colspan="6">
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
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    location.href = "../SMSNew/CustCanBrowse_WeChat_Excel.aspx?showCode=微信可发用户";
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
            {
                field: 'LiveTypeName', title: '业主/租户', width: 100, align: 'left', sortable: true
            },
            {
                field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true
            },
            { field: 'Sex', title: '性别', width: 200, align: 'left', sortable: true },
            { field: 'Birthday', title: '生日', width: 200, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
            { field: 'MobilePhone', title: '手机号码', width: 200, align: 'left', sortable: true }
            //,{
            //    field: '操作', title: '操作', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
            //        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.OpenId + "');\">" + '查看' + "</a>";
            //        return str;
            //    }
            //}
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=SMS&Command=CustCanSearch_WeChat&' + $("#frmForm").serialize(),
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
