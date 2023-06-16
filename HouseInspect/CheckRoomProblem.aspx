<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckRoomProblem.aspx.cs" Inherits="M_Main.HouseInspect.CheckRoomProblem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查验问题设置</title>
  <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 80px;
        }

        .SearchTable {
            width: 600px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer" style="width: 100%; background-color: #cccccc;">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">问题类型</td>
                    <td class="TdContent">
                        <input id="ProblemType" name="ProblemType" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 72%;height:20px" /></td>
                    <td class="TdTitle">问题级别</td>
                    <td class="TdContent">
                        <select id="ProblemLevel" name="ProblemLevel"  isdctype='true' dctype="问题级别" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 74%;height:22px">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="$('#frmForm').form('clear');">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ObjectId" name="ObjectId" />
    </form>
    <script type="text/javascript">
        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitFunction();

        var column = [[
            { field: 'ID', title: 'ID',  align: 'left', sortable: true, hidden: true },
            { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
            {
                field: 'Content', title: '问题类型', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.ID + "','edit');\">" + row.Content + "</a>";
                    return str;
                }
            },
            { field: 'ProblemLevelName', title: '问题级别',width:40, align: 'left', sortable: true },
            { field: 'TimeLimit', title: '整改时限（天）', width: 40, align: 'left', sortable: true},
            { field: 'Remark', title: '备注', width: 50, align: 'left', sortable: true }
        ]];
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#ObjectId").val() == "") {
                        HDialog.Info("请在左侧选择查验对象");
                        return;
                    }
                    if (IsChild()) {
                        Detail('', 'insert');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info("请选择需要删除的选项!");
                        return false;
                    }
                    DelStandard(row)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp; *鼠标右击左侧查验对象进行增删改操作。</font>'
            }

        ];
        function LoadList() {
           $("#ObjectId").val(GetQueryString('ObjectId'));
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetCheckRoomProblemList&' + $('#frmForm').serialize(),
                method: "get",
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                nowrap: false,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    
                   
                }
            });
            $("#SearchDlg").dialog("close");
        }
        LoadList();

        function DelStandard(row) {
            $.messager.confirm('确定', '是否删除该查验问题', function (r) {
                if (r) {
                    $.tool.DataGet('CsHouseInspect', 'DelCheckRoomProblem', 'ID=' + row.ID,
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });
        }

        //检验是否子节点
        function IsChild() {
            var result;
            $.ajax({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=IsChild&ObjectId=' + $("#ObjectId").val(),
                type: 'GET',
                dataType: 'text',
                cache: false,
                async: false,
                success: function (_Data) {
                    if (_Data != "0") {
                        HDialog.Info("左侧选中对象不是末级节点，无法新增标准！");
                        result = false;
                    } else {
                        result = true;
                    }
                },
                complete: function (XMLHttpRequest, textStatus, errorThrown) {

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    HDialog.Info("数据读取错误");
                    bool = false;
                }
            });
            return result;
        }

        function Detail(ID, OpType) {
            $('.easyui-dialog').parent().appendTo($("form:first"));
            HDialog.Open('700', '250', '../HouseInspect/CheckRoomProblemEdit.aspx?ObjectId=' + $("#ObjectId").val() + '&ID=' + ID + '&OpType=' + OpType, '问题详细', false, function callback(_Data) {
                if (_Data != '') {
                    LoadList();
                }
            });
        }

        

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    </script>
</body>
</html>
