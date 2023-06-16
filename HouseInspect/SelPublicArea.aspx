<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelPublicArea.aspx.cs" Inherits="M_Main.HouseInspect.SelPublicArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择公区</title>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
     <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style=" height: 100%;">
            <div class="datagrid-toolbar" id="divtt">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>公区类型
                                <select id="PublicAreaType" name="PublicAreaType" data-options="required:true" isdctype='true' dctype="公区类型" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 204px">
                                </select>
                        </td>
                        <td>公区名称
                                <input id="PublicAreaName" name="PublicAreaName" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;" data-options="required:true" />
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
            <div style="width: 100%; background-color: #cccccc;height:420px" id="TableContainerPoint">
            </div>
        </div>
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="Id" type="hidden" name="Id" runat="server" />
        <input id="name" type="hidden" name="name" runat="server" />
    </form>
    <script>
        function Load() {
            $("#CommId").val(GetQueryString('CommID'));
        }
        Load();
        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'Id', title: 'Id', align: 'left', sortable: true, hidden: true },
            { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
            { field: 'PublicAreaCode', title: '公区编号', width: 10, align: 'left', sortable: true, hidden: true },
            {
                field: 'PublicAreaName', title: '公区名称', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.PublicAreaName + "</a>";
                    return str;
                }
            },
            { field: 'PublicAreaTypeName', title: '公区类型', width: 40, align: 'left', sortable: true },
            { field: 'Remark', title: '备注', width: 50, align: 'left', sortable: true }
        ]];


        function Save() {
            //if ($("#Id").val() == "") {
            //    HDialog.Info("请选择公区!");
            //    return
            //}
            //var result = new Object();
            //result["Id"] = $("#Id").val();
            //result["name"] = $("#name").val();

            //HDialog.ReturnIsJson = true;
            //HDialog.Close(result);

            var rows = $('#TableContainerPoint').datagrid("getChecked");
            if (rows.length == 0) {
                HDialog.Info('请选择公区');
                return false;
            }
            HDialog.Close(JSON.stringify(rows));

        }


        function LoadList() {
            $("#TableContainerPoint").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetPublicAreaSetList&' + $('#frmForm').serialize(),
                method: "get",
                title: '',
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                rownumbers: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                checkOnSelect: false,
                selectOnCheck: false,
                singleSelect: true,
                columns: column,
                //fit: true,
                fitColumns: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                border: false,
                onClickRow: function (rowIndex, rowData) {
                   
                },
                //onCheck: function (rowIndex, rowData) {
                //    var Id = $("#Id").val();
                //    Id += rowData.Id + ",";
                //    $("#Id").val(Id);
                    
                //    var name = $("#name").val();
                //    name += rowData.PublicAreaName + ",";
                //    $("#name").val(name);
                //},
                //onUncheck: function (rowIndex, rowData) {
                //    var kk = $("#Id").val();
                //    var ff = "";
                //    var jj = new Array();
                //    jj = kk.split(',');
                //    if (jj.length > 1) {
                //        for (var i = 0; i < jj.length - 1; i++) {
                //            if (jj[i] != rowData.Id) {
                //                ff += jj[i] + ",";
                //            }
                //        }
                //    } else {
                //        ff = "";
                //    }

                //    var name = $("#name").val();
                //    var temp = "";
                //    var list = new Array();
                //    list = name.split(',');
                //    if (list.length > 1) {
                //        for (var i = 0; i < list.length - 1; i++) {
                //            if (list[i] != rowData.PublicAreaName) {
                //                temp += list[i] + ",";
                //            }
                //        }
                //    } else {
                //        temp = "";
                //    }

                //    $("#Id").val(ff);
                //    $("#name").val(temp);
                //},
                //onCheckAll: function (rows) {
                //    var Id = "";
                //    var name = "";
                //    for (var i = 0; i < rows.length; i++) {
                //        Id += rows[i].Id + ",";
                //        name += rows[i].PublicAreaName + ",";
                //    }
                //    $("#Id").val(Id);
                //    $("#PublicAreaName").val(name);
                //},
                //onUncheckAll: function (rows) {
                //    $("#Id").val("");
                //    $("#PublicAreaName").val("");
                //}
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
