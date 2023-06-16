<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelSystem.aspx.cs" Inherits="M_Main.EquipmentNew.SelSystem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择设备系统</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            overflow: hidden;
        }

        select {
        }
    </style>
</head>
<body>
    <form id="SelSystem" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ShowType" runat="server" />
        <input type="hidden" name="SpaceId" id="SpaceId" value="" runat="server" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TableContainer").css("height", (h) + "px");
                $("#TableContainer").css("width", (w - 20) + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'RankId', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 25, align: 'left', sortable: true },
                { field: 'RankName', title: '名称', width: 25, align: 'left', sortable: true },
                { field: 'RankCode', title: '编码', width: 25, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        console.log(row);
                        var str = "", strName = "";
                        if (row.length > 0) {
                            for (var i = 0; i < row.length; i++) {
                                str += row[i].RankId + ",";
                                strName += row[i].RankName + ",";
                            }
                            if (str.length > 0) {
                                str = str.substr(0, str.length - 1);
                                strName = strName.substr(0, strName.length - 1);
                            }
                            HDialog.Close(str + "|" + strName);
                        } else {
                            $.messager.alert("温馨提示", "请选择需要的数据!");
                            return;
                        }

                    }
                }
            ];
            function LoadList() {
                $("#SpaceId").val(GetQueryString('SpaceId'));
                $("#ShowType").val(GetQueryString('type'));
                var single = true;
                if ($("#ShowType").val() == "more") {
                    single = false;
                }
                else {
                    toolbar = [];
                    column = [[
                        { field: 'RankId', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                        { field: 'Sort', title: '序号', width: 25, align: 'left', sortable: true },
                        { field: 'RankName', title: '名称', width: 25, align: 'left', sortable: true },
                        { field: 'RankCode', title: '编码', width: 25, align: 'left', sortable: true }
                    ]];
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetSystem&' + $('#SelSystem').serialize(),
                    method: "get",
                    //title: '点位',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: single,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        if (single) {
                            HDialog.Close(rowData.RankId + "|" + rowData.RankName);
                        }
                    }
                });
            }
            LoadList();


        </script>
    </form>
</body>
</html>
