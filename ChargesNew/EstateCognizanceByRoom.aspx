<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EstateCognizanceByRoom.aspx.cs" Inherits="M_Main.ChargesNew.EstateCognizanceByRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>不动产认定设置-房屋设置</title>
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
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <input type="hidden" id="Flag" value="0" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 880px; height: 240px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="DialogTdTitle">管理项目</td>
                    <td colspan="5" class="DialogTdContent">
                        <input id="CommName" style="width: 93%" disabled name="CommName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">组团区域</td>
                    <td class="DialogTdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server" style="width: 160px;">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td class="DialogTdContent">
                        <input id="RoomSign" typ="text" name="RoomSign" runat="server" style="width: 160px;" /></td>
                    <td class="DialogTdTitle">交房状态</td>
                    <td class="DialogTdContent">
                        <select id="RoomState" runat="server" name="RoomState" style="width: 160px;"></select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">是否备案</td>
                    <td class="DialogTdContent">
                        <select id="Cognizance" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="formTable_Footer" align="center" colspan="6">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
            $("#Cognizance ").get(0).selectedIndex = 2;
            $("#Cognizance option[text='否']").attr("selected", true);
        }
        InitTableHeight();


        //工具栏
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
                text: '批量设置',
                iconCls: 'icon-add',
                handler: function () {
                    ViewDetail("批量设置", '0');

                }
            }, '-',
            {
                text: '批量修改',
                iconCls: 'icon-edit',
                handler: function () {


                    $.messager.confirm('确定', '确定修改列表中所有数据的备案设置？', function (r) {
                        if (r == true) {
                            ViewDetail("批量修改", '1');
                        }
                    })

                }
            }, '-',
            {
                text: '批量删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    DeleteDetail('2');
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var rowData = $('#TableContainer').datagrid('getData');
                    if (rowData.total == 0) {
                        HDialog.Info('没有可导出的数据');
                    }
                    else {
                        location.href = '../ChargesNew/EstateCognizanceByRoomExcel.aspx';
                        //Export('备案设置Excel', $('#TableContainer'));
                    }
                }
            }
        ];

        function Export(strXlsName, exportGrid) {
            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);
        }


        var Headcolumn = [[
            { field: 'RoomSign', title: '房屋编号', width: 120, align: 'center', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 120, align: 'center', sortable: true },
            { field: 'CognizanceDate', title: '备案时间', width: 120, align: 'center', sortable: true },
            { field: 'RecordState', title: '备案状态', width: 120, align: 'center', sortable: true },
            { field: 'OperationUser', title: '操作人', width: 100, align: 'center', sortable: true },
            { field: 'OperationTime', title: '操作时间', width: 120, align: 'center', sortable: true }
        ]];
        var ExcelCol = [
            { field: 'RoomSign', title: '房屋编号', width: 120, align: 'center', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 120, align: 'center', sortable: true },
            { field: 'CognizanceDate', title: '备案时间', width: 120, align: 'center', sortable: true },
            { field: 'RecordState', title: '备案状态', width: 120, align: 'center', sortable: true },
            { field: 'OperationUser', title: '操作人', width: 100, align: 'center', sortable: true },
            { field: 'OperationTime', title: '操作时间', width: 120, align: 'center', sortable: true }
        ];


        //列表列
        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomSign', title: '房屋编号', width: 120, align: 'center', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 120, align: 'center', sortable: true },
            {
                field: 'CognizanceDate', title: '备案时间', width: 120, align: 'center', sortable: true,
                formatter: function (value, row, index) {
                    var str = "";
                    if (row.CognizanceDate != "") {
                        str = formatDate(row.CognizanceDate, "yyyy-MM-dd");
                    }
                    return str;
                }
            },
            { field: 'RecordState', title: '备案状态', width: 120, align: 'center', sortable: true },
            { field: 'OperationUser', title: '操作人', width: 100, align: 'center', sortable: true },
            { field: 'OperationTime', title: '操作时间', width: 120, align: 'center', sortable: true }
        ]];

        //清空查询条件
        function CancelParm() {
            //$("#RegionName").val("");
            //$("#AwardDateBegin").val("");
            //$("#AwardDateEnd").val("");
            //$("#AwardName").val("");
            //$("#GrantUnit").val("");
            //$("#AwardLevel").val("");
        }


        //显示详细
        function ViewDetail(title, OpType) {
            //获取勾选的数据
            var CheckedRow = $('#TableContainer').datagrid("getChecked");
            var GridData = $('#TableContainer').datagrid("getRows");
            if (CheckedRow.length == 0) {
                HDialog.Info('请选择需要设置备案的房号');
                return;
            }
            var CognizanceDate = ""; // 不动产认定时间
            //两个相等意思就是勾选了最上面的勾，需要根据条件去设置所有数据
            if (CheckedRow.length == GridData.length) {
                $.messager.confirm('确定', '确定对列表中所有数据设置备案？', function (r) {
                    if (r) {
                        HDialog.Open(600, 320, '../ChargesNew/EstateCognizanceManage.aspx', title, true, function callback(_Data) {
                            if (_Data != "false" && _Data != "") {
                                SaveData(OpType, _Data, "");
                            }
                        });
                    } else {
                        return;
                    }
                });
            } else {
                HDialog.Open(600, 320, '../ChargesNew/EstateCognizanceManage.aspx', title, true, function callback(_Data) {
                    if (_Data != "false" && _Data != "") {
                        var IdList = "";
                        for (var i = 0; i < CheckedRow.length; i++) {
                            IdList += CheckedRow[i].RoomID + ",";
                        }
                        if (IdList.length > 0) {
                            IdList = IdList.substring(0, IdList.length - 1);
                        }
                        SaveData(OpType, _Data, IdList);
                    }
                });
            }

        }

        //***批量删除
        function DeleteDetail(OpType) {
            //获取勾选的数据
            var CheckedRow = $('#TableContainer').datagrid("getChecked");
            var GridData = $('#TableContainer').datagrid("getRows");
            if (CheckedRow.length == 0) {
                HDialog.Info('请选择需要删除备案的房号');
                return;
            }
            var CognizanceDate = ""; // 不动产认定时间
            //两个相等意思就是勾选了最上面的勾，需要根据条件去设置所有数据
            if (CheckedRow.length == GridData.length) {
                $.messager.confirm('确定', '确定删除列表中所有数据的备案设置？', function (r) {
                    if (r) {
                        SaveData(OpType, "", "");
                    } else {
                        return
                    }
                });
            } else {
                $.messager.confirm('确定', '确定删除选中的备案设置？', function (r) {
                    if (r) {
                        var IdList = "";
                        for (var i = 0; i < CheckedRow.length; i++) {
                            IdList += CheckedRow[i].RoomID + ",";
                        }
                        if (IdList.length > 0) {
                            IdList = IdList.substring(0, IdList.length - 1);
                        }
                        SaveData(OpType, "", IdList);
                    } else {
                        return;
                    }
                });
            }

        }
        //保存不动产认定时间
        function SaveData(OpType, ReturnData, IdList) {
            var CognizanceDate = "";
            var RecordState = "";
            if (ReturnData != "") {
                var Arrlist = ReturnData.split('|');
                if (Arrlist.length > 1) {
                    CognizanceDate = Arrlist[0];
                    RecordState = Arrlist[1];
                }
            }
            $.tool.DataPostAsync('EstateCognizance', 'SaveAll', "OpType=" + OpType + "&IdList=" + IdList + "&CognizanceDate=" + CognizanceDate + "&RecordState=" + RecordState + "&" + $("#frmForm").serialize(),
                function Init() {
                },
                function callback(_Data) {

                    LoadList();
                });
        }

        //加载数据列表
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
                singleSelect: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("EstateCognizance", "getRoomList", "TableContainer", param);
                }
            });



            $("#SearchDlg").dialog("close");
        }
        LoadList();
    </script>
</body>
</html>
