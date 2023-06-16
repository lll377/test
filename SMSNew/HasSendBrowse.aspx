<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HasSendBrowse.aspx.cs" Inherits="M_Main.SMSNew.HasSendBrowse" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
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
    <link href="../css/framedialog_eightcol.css" type="text/css" rel="stylesheet" />


</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="Type" name="Type" runat="server" />
        <input type="hidden" id="IsSelCommID" name="IsSelCommID" runat="server" />
        <div id="toolbar" style="display: none;">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <a href="#" id="btnSearch" class="easyui-linkbutton" data-options="text: '筛选',plain:true, iconCls: 'icon-search'" />
                    </td>
                    <td>
                        <span class="datagrid-btn-separator"></span>
                    </td>
                    <td>
                        <a href="#" id="btnResend" class="easyui-linkbutton" data-options="text:'转入待发送',plain:true,iconCls: 'icon-edit',disabled: true, onClick:Resend" />
                    </td>
                    <td>
                        <span class="datagrid-btn-separator"></span>
                    </td>
                    <td>
                        <a href="#" id="btnExcel" class="easyui-linkbutton" data-options="text:'Excel输出',plain:true,iconCls: 'icon-page_white_excel',disabled: true, onClick:Export" />
                    </td>
                    <td>
                        <span class="datagrid-btn-separator"></span>
                    </td>
                    <td><a href="#" id="btnInfo" class="easyui-linkbutton" data-options="text: '',plain:true, iconCls: 'icon-man'" /></td>
                </tr>
            </table>
        </div>
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CommName" data-options="editable:false" searcher="SelCommInfo" name="CommName" runat="server">
                        <input class="Control_ItemInput" id="hiCommName" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommName" runat="server">
                        <input class="Control_ItemInput" id="CommID" style="width: 8px; height: 22px" type="hidden" size="1" name="CommID" runat="server">
                    </td>
                    <td class="TdTitle">转发时间从</td>
                    <td class="TdDateContent">
                        <input class="easyui-datebox" id="StartDate" name="StartDate" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdDateContent">
                        <input class="easyui-datebox" id="EndDate" name="EndDate" data-options="editable:false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">手机号码</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Mobile" name="Mobile" runat="server" />
                    </td>
                    <td class="TdTitle">信息内容</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Message" name="Message" runat="server" />
                    </td>
                    <td class="TdTitle">发送人</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="UserName" name="UserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">转发报告</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="ErrMsg" name="ErrMsg" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="CustName" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="RoomSigns" name="RoomSigns" runat="server" />
                    </td>
                </tr>
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
                $("#CommName").searchbox('disable');
            }
            
        })

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        function SelCommInfo() {
            HDialog.Open(400, 500, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                $("#CommID").val(Obj.attributes.InPopedom);
                $("#CommName").searchbox("setValue", Obj.text);
            });
        }

        $("#btnSearch").click(function () {
            $('#SearchDlg').parent().appendTo($('form:first'))
            $('#SearchDlg').dialog('open');
        })

        function Resend() {
            var param = "CommID=" + $("#CommID").val() + "&StartDate=" + $("#StartDate").datebox('getValue') + "&EndDate="
            + $("#EndDate").datebox('getValue') + "&Mobile=" + $("#Mobile").val() + "&Message=" + $("#Message").val() 
            + $("#UserName").val() + "&ErrMsg=" + $("#ErrMsg").val() + "&CustName=" + $("#CustName").val() + "&RoomSigns="
            + $("#RoomSigns").val();

            $.tool.DataPost('SMS', "ReSend", param,
                    function Init() {
                    },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info('转入待发送成功');
                    }
                    else {
                        HDialog.Info('转入待发送失败');
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
            
        }

        function Export() {
            window.location.href = '../SMSNew/HasSendBrowseCre.aspx'
        }

        var column = [[
            { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
            { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left', sortable: true },
            { field: 'Mobile', title: '手机号码', width: 100, align: 'left', sortable: true },
            { field: 'Message', title: '信息内容', width: 500, align: 'left', sortable: true },
            { field: 'MsgLen', title: '信息条数', width: 70, align: 'left', sortable: true },
            { field: 'SendDate', title: '发送时间', width: 140, align: 'left', sortable: true },
            { field: 'UserName', title: '发送人', width: 80, align: 'left', sortable: true },
            { field: 'ErrMsg', title: '转发报告', width: 80, align: 'left', sortable: true },
            { field: 'SmsStatus', title: '状态报告', width: 80, align: 'left', sortable: true }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
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
                toolbar: '#toolbar',
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("SMS", "HasSendSearch", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    if (data.rows.length > 0) {
                        $("#btnResend").linkbutton('enable');
                        $("#btnExcel").linkbutton('enable');
                    }
                    else {
                        $("#btnResend").linkbutton('disable');
                        $("#btnExcel").linkbutton('disable');
                    }
                    $("#SearchDlg").dialog("close");
                }
               
            });

            $.tool.DataPost('SMS', "HasSendCount", $('#frmForm').serialize(),
                    function Init() {
                    },
                function callback(_Data) {
                    var data = eval(_Data)[0];
                    var successCount = '0';
                    var failCount = '0';
                    if (data.SuccCounts != undefined && data.SuccCounts != 'null'
                        && data.SuccCounts != null && data.SuccCounts != 0 && data.SuccCounts != '0') {
                        successCount = data.SuccCounts;
                    }

                    if (data.SuccCounts != undefined && data.SuccCounts != 'null'
                        && data.FailCounts != null && data.FailCounts != 0 && data.FailCounts != '0') {
                        failCount = data.FailCounts;
                    }

                    var msg = "发送成功：" + successCount + "条 发送失败：" + failCount + "条";
                    $("#btnInfo").linkbutton({ text: msg });
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
           
        }
        $.parser.parse('#SearchDlg');
        LoadList();
    </script>
</body>
</html>
