<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendInformation.aspx.cs" Inherits="M_Main.InformationManage.AttendInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>信息登记-参加协会信息</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent">
                        <input id="RegionName" name="RegionName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">协会名称</td>
                    <td class="TdContent">
                        <input id="AssociationName" name="AssociationName" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">协会级别</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="AssociationLevel" name="AssociationLevel" runat="server"></td>
                    <td class="TdTitle">任职情况</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="JobStatus" name="JobStatus" runat="server"></td>
                </tr>
                <tr>
                    <td class="formTable_Footer" align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        //[Tb_HSPR_AttendInfo]

        function InitTableHeight() {
            var h = $(window).height();
            $("#CommIds").val($("#CommIds").val().replace('?v=4.0', ''));
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        //工具栏
        var toolbar = "";
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        var types = getUrlParam("types");
        if (types == "1") {
            toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增参加协会信息", 'insert', "");
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        DeleteHouseHold(row.AttendID);
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = '../InformationManage/AttendInformationToExcel.aspx';
                    }
                }];
        } else {
            toolbar = [
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
                        window.location.href = '../InformationManage/AttendInformationToExcel.aspx';
                    }
                }];
        }

        //列表列
        var column = [[
            {
                field: 'OrganName', title: '项目所属大区', width: 120, align: 'left', sortable: true
            },
            {
                field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true
            },
            { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
            {
                field: 'RegionName', title: '区域名称', width: 200, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var Params = "";
                    var str = row.RegionName;
                    Params = "AttendID=" + row.AttendID;
                    if (types == "1") {
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.RegionName + "</a>";
                    }
                    return str;
                }
            },
            { field: 'AreaNumber', title: '物业区域编号', sortable: true },
            //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
            { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
            {
                field: 'AssociationName', title: '协会名称', width: 160, align: 'left', sortable: true
            },
            {
                field: 'JoinDate', title: '加入协会时间', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.JoinDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'AssociationLevel', title: '协会级别', width: 160, align: 'left', sortable: true
            },
            {
                field: 'JobStatus', title: '任职情况', width: 200, align: 'left', sortable: true
            },
            {
                field: 'MembershipFee', title: '会费标准', width: 200, align: 'left', sortable: true
            }
        ]];

        //清空查询条件
        function CancelParm() {
            $("#RegionName").val("");
            $("#AssociationName").val("");
            $("#AssociationLevel").val("");
            $("#JobStatus").val("");
        }


        //显示详细
        function ViewDetail(title, OpType, Params) {
            HDialog.Open(940, 220, '../InformationManage/AttendInformationManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data != "false" && _Data != "") {
                    LoadList();
                }
            });
        }

        //删除
        function DeleteHouseHold(AttendID) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('AttendInfo', 'deletes', 'AttendID=' + AttendID,
                        function Init() {
                        },
                        function callback(_Data) {

                            if (_Data == "true") {
                                HDialog.Info('删除成功');
                            }
                            else { HDialog.Info('删除失败'); }
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });
        }

        //加载数据列表
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AttendInfo&Command=GetList&' + $("#frmForm").serialize(),
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
    </script>
</body>
</html>
