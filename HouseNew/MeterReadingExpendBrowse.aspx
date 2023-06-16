<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterReadingExpendBrowse.aspx.cs" Inherits="M_Main.HouseNew.MeterReadingExpendBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>抄表支出</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 550px; height: 180px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">年度</td>
                    <td class="TdContentSearch">
                        <input name="Year" type="text" id="Year" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy', autoPickDate: true })" runat="server" />
                    </td>
                    <td class="TdTitle">月份</td>
                    <td class="TdContentSearch">
                        <select id="Month" runat="server" name="Month">
                            <option value="">全部</option>
                            <option value="1">1月</option>
                            <option value="2">2月</option>
                            <option value="3">3月</option>
                            <option value="4">4月</option>
                            <option value="5">5月</option>
                            <option value="6">6月</option>
                            <option value="7">7月</option>
                            <option value="8">8月</option>
                            <option value="9">9月</option>
                            <option value="10">10月</option>
                            <option value="11">11月</option>
                            <option value="12">12月</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">表计类型</td>
                    <td class="TdContentSearch">
                        <select id="MeterType" runat="server" name="MeterType"></select>
                    </td>
                    <td class="TdTitle">表计区域</td>
                    <td class="TdContentSearch">
                        <select id="MeterArea" runat="server" name="MeterArea">
                            <option value="" selected="selected">全部</option>
                            <option value="房间表">房间表</option>
                            <option value="公区表">公区表</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnSearch" type="button" value="查询" name="btnSave" runat="server" onclick="LoadList()" />
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();

            var column = [[
                { field: 'ck', checkbox: true },
                {
                    field: 'Year', title: '年度', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (row.Year != '') {
                            str = row.Year + '年';
                        }
                        return str;
                    }
                },
                {
                    field: 'Month', title: '月份', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (row.Month != '') {
                            str = row.Month + '月';
                        }
                        return str;
                    }
                },
                {
                    field: 'MeterType', title: '表计类型', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        switch (row.MeterType) {
                            case 1:
                                str = '水';
                                break;
                            case 2:
                                str = '电';
                                break;
                            case 3:
                                str = '气';
                                break;
                            case 4:
                                str = '其他';
                                break;
                        }
                        return str;
                    }
                },
                { field: 'MeterArea', title: '表计区域', width: 100, align: 'center', sortable: true },
                {
                    field: 'ExpendAmount', title: '支出金额(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(row.ExpendAmount);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                { field: 'LastModifier', title: '操作人', width: 100, align: 'center', sortable: true },
                { field: 'LastModifyDate', title: '操作时间', width: 120, align: 'center', sortable: true },
                { field: 'Remarks', title: '备注', width: 150, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail('新增公区表计', "Insert", 0);
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelections');
                        if (rows == null || rows.length == 0) {
                            HDialog.Info('请选择需要修改的数据行!');
                            return;
                        }
                        if (rows.length > 1) {
                            HDialog.Info('仅支持修改单条数据!');
                            return;
                        }
                        ViewDetail('修改抄表支出', "Edit", rows[0].Id);
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var ids = []
                        var rows = $('#TableContainer').datagrid('getSelections');
                        for (var i = 0; i < rows.length; i++) {
                            ids.push(rows[i].Id);
                        }
                        if (ids.length == 0) {
                            HDialog.Info('请选择需要删除的数据行!');
                            return;
                        }
                        DelRecord(ids.join(","));
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("MeterReadingExpend", "List", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function ViewDetail(title, opType, id) {
                var w = 720;
                var h = 360;
                HDialog.Open(w, h, '../HouseNew/MeterReadingExpendManage.aspx?OpType=' + opType + '&Id=' + id, title, false, function callback(_Data) {
                    LoadList();
                });
            }

            //删除数据行，支持批量删除
            function DelRecord(ids) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataPost('MeterReadingExpend', 'Delete', 'Ids=' + ids,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Info('删除成功!');
                                    LoadList();
                                } else {
                                    HDialog.Info('删除失败!');
                                }
                            },
                            function completeCallback() { },
                            function errorCallback() { }
                        );
                    }
                });
            }
        </script>
    </form>
</body>
</html>
