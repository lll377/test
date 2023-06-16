<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelBuildingList.aspx.cs" Inherits="M_Main.HouseInspect.SelBuildingList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>楼宇名称
                          <input type="text" class="easyui-validatebox" id="BuildName" name="BuildName"
                            runat="server" />      

                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                    <td><a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="Save(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">确定</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%;" id="TableContainer">
        </div>
        <input id="HiCommID" type="hidden" name="HiCommID" runat="server" />
        <input id="Id" type="hidden" name="Id" runat="server" />
        <input id="name" type="hidden" name="name" runat="server" />

    </form>

    <script>

        function Load() {
            $("#HiCommID").val(GetQueryString('CommID'));
        }
        Load();
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h);
        }
        InitTableHeight();

        function Save() {
            if ($("#Id").val() == "") {
                HDialog.Info("请选择楼宇!");
                return
            }
            var result = new Object();
            result["Id"] = $("#Id").val();
            result["name"] = $("#name").val();

            HDialog.ReturnIsJson = true;
            HDialog.Close(result);
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'BuildID', title: 'BuildID', align: 'left', sortable: true, hidden: true },
            { field: 'BuildName', title: '楼宇名称', width: 200, align: 'left', sortable: true },
            { field: 'BuildSign', title: '楼宇编号', width: 200, align: 'left', sortable: true }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
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
                rownumbers: true,
                sortOrder: "asc",
                border: false,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CsHouseInspect", "GetBuildingList", "TableContainer", param);
                },
                onCheck: function (rowIndex, rowData) {
                    var Id = $("#Id").val();
                    Id += rowData.BuildID + ",";
                    $("#Id").val(Id);

                    var name = $("#name").val();
                    name += rowData.BuildName + ",";
                    $("#name").val(name);
                },
                onUncheck: function (rowIndex, rowData) {
                    var kk = $("#Id").val();
                    var ff = "";
                    var jj = new Array();
                    jj = kk.split(',');
                    if (jj.length > 1) {
                        for (var i = 0; i < jj.length - 1; i++) {
                            if (jj[i] != rowData.BuildID) {
                                ff += jj[i] + ",";
                            }
                        }
                    } else {
                        ff = "";
                    }

                    var name = $("#name").val();
                    var temp = "";
                    var list = new Array();
                    list = name.split(',');
                    if (list.length > 1) {
                        for (var i = 0; i < list.length - 1; i++) {
                            if (list[i] != rowData.BuildName) {
                                temp += list[i] + ",";
                            }
                        }
                    } else {
                        temp = "";
                    }

                    $("#Id").val(ff);
                    $("#name").val(temp);
                },
                onCheckAll: function (rows) {
                    var Id = "";
                    var name = "";
                    for (var i = 0; i < rows.length; i++) {
                        Id += rows[i].BuildID + ",";
                        name += rows[i].BuildName + ",";
                    }
                    $("#Id").val(Id);
                    $("#PublicAreaName").val(name);
                },
                onUncheckAll: function (rows) {
                    $("#Id").val("");
                    $("#PublicAreaName").val("");
                }
            });
        }
        LoadList();

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

    </script>
</body>
</html>
