<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AwardInformation.aspx.cs" Inherits="M_Main.InformationManage.AwardInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>信息登记-获奖信息</title>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 880px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">区域名称</td>
                    <td class="TdContent">
                        <input id="RegionName" name="RegionName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">获奖结束开始</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" runat="server" onclick="WdatePicker()" id="AwardDateBegin" name="AwardDateBegin" />
                    </td>
                    <td class="TdTitle">获奖结束时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" runat="server" onclick="WdatePicker()" id="AwardDateEnd" name="AwardDateEnd" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">奖项名称</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="AwardName" name="AwardName" runat="server" /></td>
                    <td class="TdTitle">授予者单位</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="GrantUnit" name="GrantUnit" runat="server" /></td>
                    <td class="TdTitle">获奖级别</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="AwardLevel" name="AwardLevel" runat="server" /></td>
                </tr>
                <tr>
                    <td class="formTable_Footer" align="center" colspan="6">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        //Tb_HSPR_AwardInfo
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h  + "px");
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
                        ViewDetail("新增获奖信息", 'insert', "");
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
                        DeleteHouseHold(row.AwardID);
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = '../InformationManage/AwardInformationToExcel.aspx';
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
                        window.location.href = '../InformationManage/AwardInformationToExcel.aspx';
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
                    Params = "AwardID=" + row.AwardID;
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.RegionName + "</a>";
                    return str;
                }
            },
            { field: 'AreaNumber', title: '物业区域编号', sortable: true },
            //{ field: 'NCSystemNumber', title: 'NC编码', sortable: true },
            { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
            {
                field: 'AwardDate', title: '获奖时间', width: 160, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.AwardDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'AwardName', title: '奖项名称', width: 300, align: 'left', sortable: true
            },
            {
                field: 'GrantUnit', title: '授予者单位', width: 200, align: 'left', sortable: true
            },
            {
                field: 'AwardLevel', title: '获奖级别', width: 200, align: 'left', sortable: true
            }
        ]];

        //清空查询条件
        function CancelParm() {
            $("#RegionName").val("");
            $("#AwardDateBegin").val("");
            $("#AwardDateEnd").val("");
            $("#AwardName").val("");
            $("#GrantUnit").val("");
            $("#AwardLevel").val("");
        }


        //显示详细
        function ViewDetail(title, OpType, Params) {
            HDialog.Open(940, 220, '../InformationManage/AwardInformationManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data != "false" && _Data != "") {
                    LoadList();
                }
            });
        }

        //删除
        function DeleteHouseHold(AwardID) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('AwardInfo', 'deletes', 'AwardID=' + AwardID,
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
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AwardInfo&Command=GetList&' + $("#frmForm").serialize(),
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
