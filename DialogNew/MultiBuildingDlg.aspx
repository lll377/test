<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiBuildingDlg.aspx.cs" Inherits="M_Main.DialogNew.MultiBuildingDlg" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
    <form id="FrmForm" runat="server">
        <input id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
        <input id="CommIDList" size="1" type="hidden" name="CommIDList" runat="server" />
        <input type="hidden" id="pdlist" name="pdlist" value="" />

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 110px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <%--                    <td class="TdTitle">组团区域
                    </td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                        </select>
                    </td>--%>
                    <td class="TdTitle">楼宇名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="BuildName" name="BuildName"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;" id="TableContainer">
        </div>

        <input type="hidden" id="CommID" name="CommID" />

        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();

                document.getElementById("AllCheck").value = "";
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

            var column = [[

                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: true },
                { field: 'RegionName', title: '组团区域', width: 200, align: 'left', sortable: true },
                { field: 'BuildSign', title: '楼宇编号', width: 200, align: 'left', sortable: true },
                { field: 'BuildName', title: '楼宇名称', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var value = $('#AllCheck').val();
                        if (value == "") {
                            HDialog.Info('请选择');
                        }
                        else {
                            if (value.length > 1 && value.substr(0, 1) == "|") {
                                value = value.substr(1);
                            }
                            HDialog.Close(value);
                        }
                    }

                },
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
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Building&Command=search&' + $('#FrmForm').serialize(),
                    //method: "get",
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Building", "search", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    },
                    onCheck: function (rowIndex, rowData) {

                        var dd = $('#AllCheck').val() + "|" + rowData.BuildSNum + "," + rowData.BuildName + "," + rowData.BuildID + "," + rowData.CommName;
                        $('#AllCheck').val(dd);

                    },
                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#AllCheck').val().split('|');
                        for (var i = 0; i < ss.length; i++) {
                            if (ss[i].indexOf(rowData.BuildID) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "|" + ss[i];
                        }
                        $('#AllCheck').val(valu.substr(1, valu.length));

                    },
                    onCheckAll: function (rows) {

                        for (var i = 0; i < rows.length; i++) {
                            var data = rows[i].BuildSNum + "," + rows[i].BuildName + "," + rows[i].BuildID + "," + rows[i].CommName;
                            var ss = $('#AllCheck').val();

                            if (ss.indexOf(data) < 0) {
                                var dd = $('#AllCheck').val() + "|" + data;
                                $('#AllCheck').val(dd);
                            }
                        }

                    },
                    onUncheckAll: function (rows) {
                        var ss = $('#AllCheck').val().split('|');
                        for (var i = 0; i < rows.length; i++) {
                            for (var j = 0; j < ss.length; j++) {
                                if (ss[j].indexOf(rows[i].BuildID) >= 0) {
                                    ss.splice(j, 1);
                                }
                            }
                        }

                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            if (ss[i] != "") {
                                valu += "|" + ss[i];
                            }
                        }
                        $('#AllCheck').val(valu);
                    }

                });
                $("#SearchDlg").dialog("close");
            }

            $(document).ready(function () {
                //var InformCommIDLists = Cache.GetData("InformCommIDLists");
                //if (InformCommIDLists != "" && InformCommIDLists != undefined) {
                //    $('#CommIDList').val(InformCommIDLists);
                //}
                LoadList();
            });



        </script>
    </form>
</body>
</html>
