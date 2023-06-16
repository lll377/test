<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationDelayAudit.aspx.cs" Inherits="M_Main.RenovationNew.RenovationDelayAudit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>装修延期申请列表页面</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 120px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 13%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>

</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CustName" class="easyui-textbox" readonly name="CustName" />
                        <input type="hidden" name="CustID" id="CustID" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoomSign" class="easyui-textbox" readonly name="RoomSign" />
                        <input type="hidden" name="RoomID" id="RoomID" />
                    </td>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContentSearch">
                        <select id="AuditState" name="AuditState" class="easyui-combobox" style="width: 97%;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="审核中" selected>审核中</option>
                            <option value="审核不通过">审核不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">经办人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ChargePerson" class="easyui-textbox" name="ChargePerson" />
                    </td>
                    <td class="TdTitle">经办时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ChargeTimeBegin" name="ChargeTimeBegin" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ChargeTimeEnd" name="ChargeTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            //初始化页面高度
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            var column = [[
                { field: 'CustName', title: '客户名称', width: 120, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: true },
                {
                    field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"Detail('" + row.ID + "','" + row.RID + "','edit')\" href=\"javascript:void(0);\">" + row.RoomName + "</a>";
                        return str;
                    }
                },
                { field: 'DelayDays', title: '延期天数', width: 80, align: 'left', sortable: false },
                { field: 'ChargePerson', title: '经办人', width: 80, align: 'left', sortable: false },
                {
                    field: 'ChargeTime', title: '经办时间', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                        if (row.ChargeTime != "") {
                            var str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                            return str;
                        }
                        return row.ChargeTime;
                    }
                },
                { field: 'AuditState', title: '审核状态', width: 80, align: 'left', sortable: false },
                { field: 'FeesRoleNames', title: '未审岗位', width: 180, align: 'left', sortable: false }
            ]];

            var toolbar =
                [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }, '-', {
                        text: '审核',
                        iconCls: 'icon-add',
                        handler: function () {
                            var rows = $('#TableContainer').datagrid('getSelected');
                            if (rows == null) {
                                //Detail('', '60141300000001', 'insert');
                                HDialog.Info('请选择需要审核的装修延期申请!');
                            }
                            else {
                                Detail(rows.ID, rows.RID, 'edit');
                            }
                        }
                    }
                ];

            function Detail(ID, RID, OpType) {
                HDialog.OpenWin(700, 440, '../RenovationNew/RenovationDelayAuditManage.aspx?ID=' + ID + '&RID=' + RID + '&OpType=' + OpType, "装修延期申请", false, function callback(_Data) {
                    if (_Data != "") {
                        LoadList();
                    }
                });
            }

            //加载数据 加载点位数据
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    remoteSort: false,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    pagination: true,
                    toolbar: toolbar,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Renovation", "GetRenoDelayAuditList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            //页面初始化
            $(function () {
                InitTableHeight();
                LoadList();
                //选择客户名称
                $("#CustName").textbox('textbox').bind("click", function () {
                    $('#RoomSign').textbox("setValue", "");
                    $('#RoomID').val("");
                    HDialog.OpenWin('1000', '400', '../DialogNew/CustDlg.aspx', '客户选择', true, function callback(_Data) {
                        if (_Data != "") {
                            var data = JSON.parse(_Data);
                            $('#CustName').textbox("setValue", data.CustName);
                            $('#CustID').val(data.CustID);
                        }
                    });
                });

                //选择房屋编号
                $("#RoomSign").textbox('textbox').bind("click", function () {
                    HDialog.OpenWin('1000', '400', '../DialogNew/RoomDlg.aspx', '房屋选择', true, function callback(_Data) {
                        if (_Data != "") {
                            var data = JSON.parse(_Data);
                            $('#RoomSign').textbox("setValue", data.RoomSign);
                            $('#RoomID').val(data.RoomID);

                            $('#CustName').textbox("setValue", data.CustName);
                            $('#CustID').val(data.CustID);
                        }
                    });
                });
            });
        </script>
    </form>
</body>
</html>

