<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Programming.BusinessPlaning.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-经营规划列表页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 360px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">考核年度</label>
                    <div class="col-sm-10 col-xs-10">
                        <input id="AssessmentYear" name="AssessmentYear" class="easyui-numberbox" data-options="required:false,precision:0,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSearch').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            InitDataGrid();
        });

        //加载 列表
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var guid = new GUID();
                    Edit(guid.newGUID(), 'add');
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row) {
                        Edit(row.ID, 'edit');
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的经营规划信息?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_BusinessPlaning', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        InitDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainer').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = $.getParam();
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "经营规划信息";
                    param.Class = 'Renting_BusinessPlaning';
                    param.Method = "GetListSqlWhere";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];
        var column = [[
            {
                field: 'AssessmentYear', title: '考核年度', width: 100, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"Edit('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'TreatyPlaningTypeCount', title: '合约类型数量', width: 80, align: 'center' },
            { field: 'RoomCount', title: '房屋数量(套)', width: 80, align: 'center' },
            { field: 'BuildAreaCount', title: '建筑面积(平米)', width: 80, align: 'center' },
            { field: 'GuaranteedIncomeTotal', title: '保底收入合计(元)', width: 80, align: 'center' },
            { field: 'TargetIncomeTotal', title: '目标收入合计(元)', width: 80, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AssessmentYear desc,AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_BusinessPlaning", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_search').dialog('close');
        }
        function Edit(id, OpType) {
            var param = { "OpType": OpType, "ID": id };
            LayerDialog.OpenWin('900', '600', '/HM/M_Main/Renting/Programming/BusinessPlaning/Edit.aspx?' + $.param(param), "经营规划登记", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitDataGrid();
                }
            });
        }
    </script>
</body>
</html>
