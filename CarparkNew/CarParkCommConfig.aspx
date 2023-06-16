<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarParkCommConfig.aspx.cs" Inherits="M_Main.CarparkNew.CarParkCommConfig" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>车场项目推送配置</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 120px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle" style="line-height: 15px;">项目名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" id="CarparkName" style="width: 180px" name="CarparkName" runat="server" /></td>
                    <td class="TdTitle">关联项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" id="CarparkNo" style="width: 180px" name="CarparkNo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script language="javascript" type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        { field: 'ID', title: 'ID', width: 50, align: 'left', sortable: true, hidden: true },
        { field: 'CommID', title: '关联项目', width: 120, align: 'left', sortable: true },
        {
            field: 'CommName', title: '车位区域', width: 400, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = value;
                if (row.IsLock != "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改推送配置','update'," + row.ID + ");\">" + row.CommName + "</a>";
                }
                return str;
            }
        },
        {
            field: 'IsDelete', title: '是否锁定', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "否";
                if (value == 1) {
                    str = "是";
                }
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '同步',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("同步项目配置", 'add', 0);
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                //if (row.IsLock == "1") {
                //    HDialog.Info('车位区域已锁定，不允许删除！');
                //    return;
                //}
                DelRecord(row.ID)
            }
        }, '-',

        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                //  $("#CarparkName").val("");
            }
        }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Carpark", "carparkcmmconfigsearch", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                //if (data.rows.length > 0) {
                //    //循环判断操作为新增的不能选择
                //    for (var i = 0; i < data.rows.length; i++) {
                //        //根据operate让某些行不可选
                //        if (data.rows[i].IsLock == "1") {
                //            $("input[type='checkbox']")[i + 1].disabled = true;
                //        }
                //    }
                //}
            }
        });
        $("#SearchDlg").dialog("close");
    }


    function DelRecord(Id) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('Carpark', 'carparkcmmconfigdelete', 'ID=' + Id,
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


    function ViewDetail(title, OpType, ID) {

        HDialog.Open('420', '180', '../CarparkNew/CarParkCommManage.aspx?ID=' + ID + '&OpType=' + OpType, title, false,
            function (_data) {
                if (_data != '') {
                    LoadList();
                } else {
                    LoadList();
                }

            });
        //HDialog.Open('420', '180', '../CarparkNew/CarparkManage.aspx?CarparkID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {

        //    if (_Data == "") {
        //        LoadList();
        //    }

        //});
    }

    </script>


</body>
</html>
