<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarparkBrowse.aspx.cs" Inherits="M_Main.CarparkNew.CarparkBrowse" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CarparkBrowse</title>
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
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <input hidden="hidden" id="HidCorpName" name="HidCorpName" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 100px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td width="25%">车位区域
                    </td>
                    <td width="75%">
                        <input id="CarparkName" style="width: 136px" size="17" name="CarparkName" maxlength="50" />
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>
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
        { field: 'CarparkID', title: 'CarparkID', width: 50, align: 'left', sortable: true, hidden: true },
        {
            field: 'CarparkName', title: '车位区域', width: 400, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = value;
                if (row.IsLock != "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改车位区域','update'," + row.CarparkID + ");\">" + row.CarparkName + "</a>";
                }
                return str;
            }
        },
        { field: 'CarparkPosition', title: '区域位置', width: 400, align: 'left', sortable: true },
        { field: 'DictionaryName', title: '车场名称', width: 400, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '是否锁定', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
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
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("新增车位区域", 'add', 0);
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row.IsLock == "1") {
                    HDialog.Info('车位区域已锁定，不允许删除！');
                    return;
                }
                DelRecord(row.CarparkID)
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
                param = $.JQForm.GetParam("Carpark", "search", "TableContainer", param);
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
                $.tool.DataGet('Carpark', 'delete', 'CarparkID=' + Id,
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

        HDialog.Open('420', '200', '../CarparkNew/CarparkManage.aspx?CarparkID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data)
        {
            LoadList();
        });
    }

</script>

