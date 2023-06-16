<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysStandardItem.aspx.cs" Inherits="M_Main.HouseInspect.SysStandardItem" %>

<!DOCTYPE html>
<html>
<head>
    <title>验房标准设置</title>
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
            height: 130px;
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
                    <td class="TdTitle">标准代码</td>
                    <td class="TdContent">
                        <input id="StandardCode" name="StandardCode" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid;width: 72%;height: 22px;" /></td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height: 24px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">重要程度</td>
                    <td class="TdContent">
                        <select id="Importance" name="Importance" onchange="FrequencyChange(this)" isdctype='true' dctype="重要程度" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height: 24px;">
                        </select>
                    </td>
                    <td class="TdTitle">适用产品形态</td>
                    <td class="TdContent">
                        <select id="Form" name="Form" onchange="FrequencyChange(this)" isdctype='true' dctype="产品形态" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height: 24px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">适用装修属性</td>
                    <td class="TdContent">
                        <select id="Decoration" name="Decoration" onchange="FrequencyChange(this)" isdctype='true' dctype="装修属性" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height: 24px;">
                        </select>
                    </td>
                    <td class="TdTitle">适用查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height: 24px;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ObjectId" name="ObjectId" />
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            function Clear() {
                $("#StandardCode").val('');
                $("#Profession").val('');
                $("#Importance").val('');
                $("#Form").val('');
                $("#Decoration").val('');
                $("#Batch").val('');
            }

            var column;
            column = [[
                { field: 'StandardId', title: '查验标准ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                {
                    field: 'StandardCode', title: '标准编码', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.StandardId + "','edit');\">" + row.StandardCode + "</a>";
                        return str;
                    }
                },
                { field: 'Content', title: '标准内容', width: 100, align: 'left', sortable: true },
                { field: 'Profession', title: '所属专业', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Importance', title: '重要程度', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'ProfessionName', title: '所属专业', width: 40, align: 'left', sortable: true },
                { field: 'ImportanceName', title: '重要程度', width: 40, align: 'left', sortable: true }
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

            function DelStandard(row) {
                $.messager.confirm('确定', '是否删除该查验标准', function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelStandard', 'StandardId=' + row.StandardId,
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

            function LoadList() {
                $("#ObjectId").val(GetQueryString('ObjectId'));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetStandardList&' + $('#frmForm').serialize(),
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
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function Detail(StandardId, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('740', '635', '../HouseInspect/SysStandardEdit.aspx?ObjectId=' + $("#ObjectId").val() + '&StandardId=' + StandardId + '&OpType=' + OpType, '标准详细', false, function callback(_Data) {
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
    </form>
</body>
</html>
