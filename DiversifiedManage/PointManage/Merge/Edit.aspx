<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Merge.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>点位合并</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-2.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        /*.col-sm-1 {
            background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }*/
    </style>
</head>
<body>

    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="ChangeType" name="ChangeType" value="合并" />
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">功能诠释:</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <p><b>点位合并功能诠释：</b>1、正在使用的点位/生成的新点位/合并的新点位禁止合并。<sm style="color: red">(注:禁止合并的点位系统已自动屏蔽)</sm></p>
                    <p style="text-indent: 110px">2、原点位被合并后将进行逻辑删除。</p>
                    <p><b>取消合并功能诠释：</b>1、正在使用的新点位将禁止取消合并功能操作。</p>
                    <p style="text-indent: 110px">2、新点位进行逻辑删除，并记录到合并历史。</p>
                    <p style="text-indent: 110px">3、新点位取消合并后，原点位将还原。</p>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">第一步、原始点位编号<a href="javascript:void(0)" style="margin-left: 10px" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SelChange();">选择原始点位</a><a href="javascript:void(0)" style="margin-left: 10px" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="Del();">删除原始点位</a></legend>
            <div class="form-group" style="margin-bottom: 0">
                <div class="col-sm-12 col-xs-12" style="padding: 0">
                    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">第二步、设置合并点位</legend>
            <div class="form-group" style="margin-bottom: 0">
                <label class="col-sm-1 col-xs-1 control-label">新点位编号</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="Number" name="Number" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',validType:'unnormal'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">新点位面积</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="Area" name="Area" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',precision:'2',value:'0',min:0,suffix:' ㎡'" />
                    <label class="control-text">(单位:平米)</label>
                </div>
                <label class="col-sm-2 col-xs-2 control-label">原点位面积合计：</label>
                <div class="col-sm-2 col-xs-2" style="padding: 0">
                    <label class="control-content" id="lbl_Original_Area">0</label><label class="control-content">&nbsp;㎡</label>
                </div>
            </div>
        </fieldset>
        <div class="form-group" style="margin-bottom: 0">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="SaveCheck();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
            </div>
        </div>
    </form>
    <%--<div style="height: 30px"></div>
    <div class="fixed-tool-btn">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="SaveCheck();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
    </div>--%>
    <script type="text/javascript">
        function SelChange() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Point.aspx?' + $.param({ "IsCheckbox": "是", "OriginalPoint": "是" }), '选择点位', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $('#dg').datagrid('load', data);
                    var editIndex;
                    $.each(data, function (i, item) {
                        editIndex = $("#dg").datagrid("getRowIndex", item.ID);
                        if (editIndex == -1) {
                            $('#dg').datagrid('appendRow', item);
                        }
                    });
                    AreaStatistic();
                }
            });
        }
        $(function () {
            InitPage();
        });

        function InitPage() {
            InitDataGrid();

        }
        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 150, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 250, align: 'center', sortable: false },
            {
                field: 'OptNumber1', title: '房屋编号', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "房屋") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            {
                field: 'OptNumber2', title: '车位编号', width: 150, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "车位") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            { field: 'Name', title: '点位名称', width: 250, align: 'center', sortable: false },
            { field: 'Position', title: '点位位置', width: 250, align: 'center', sortable: false },
            { field: 'StoreyLayer', title: '所属楼宇', width: 200, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积(平方米)', width: 110, align: 'center', sortable: false },
            {
                field: 'SizeLength', title: '点位尺寸(厘米)', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "长:&nbsp;" + row.SizeLength + "&emsp;宽:&nbsp;" + row.SizeWidth + "&emsp;高:&nbsp;" + row.SizeHeight;
                    return value;
                }
            },
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },
            { field: 'IsDisable', title: '是否停用', width: 100, align: 'center', sortable: false },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!value && value.length >= 14) {
                        value = value.substring(0, 14) + "...";
                    }
                    return value;
                }
            },
            { field: 'TradePlanName', title: '招商规划', width: 100, align: 'center', sortable: false },
            { field: 'Price', title: '指导价格(元)', width: 100, align: 'center', sortable: false },
            { field: 'CalculateCostUnit', title: '计费单位', width: 100, align: 'center', sortable: false },
            {
                field: 'PriceUnit', title: '价格单位', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!row.CalculateCostUnit) {
                        value = row.PriceUnit + "&nbsp;/&nbsp;" + row.CalculateCostUnit;
                    }
                    return value;
                }
            },
            { field: 'TradePlanName1', title: '当前状态', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName2', title: '当前客户', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName3', title: '开始时间', width: 100, align: 'center', sortable: false },
            { field: 'TradePlanName4', title: '结束时间', width: 100, align: 'center', sortable: false },

            { field: 'Sort', title: '序号', width: 80, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                nowrap: false,
                fitColumns: false,
                fit: false,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: false,
                checkOnSelect: true,
                selectOnCheck: true,
                border: true,
                pagination: false,
                width: "100%",
                height: 220,
                //toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {

                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
        }


        function AreaStatistic() {
            var total = 0;
            var data = $("#dg").datagrid("getData");
            var Number = "";
            if (data.total > 0) {
                $.each(data.rows, function (i, item) {
                    if (!Number) {
                        Number = item.Number + "[H]";
                    }
                    total = NumAdd(total, item.Area);
                });
            }
            $("#Number").textbox('setValue', Number);
            $("#Area").numberbox('setValue', total);
            $("#lbl_Original_Area").html(total);
        }
        function NumAdd(num1, num2) {
            var baseNum, baseNum1, baseNum2;
            try {
                baseNum1 = num1.toString().split(".")[1].length;
            } catch (e) {
                baseNum1 = 0;
            }
            try {
                baseNum2 = num2.toString().split(".")[1].length;
            } catch (e) {
                baseNum2 = 0;
            }
            baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));
            var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;//精度
            return ((num1 * baseNum + num2 * baseNum) / baseNum).toFixed(precision);;
        };
        function SaveCheck() {
            if ($('#mainForm').form("validate")) {
                var data = $("#dg").datagrid("getData");
                if (data.total == 0) {
                    $.messager.alert('温馨提示', "请选择原始点位!");
                    return;
                } else if (data.total == 1) {
                    $.messager.alert('温馨提示', "至少选择两个以上的原始点位!");
                    return;
                }
                var IDList = "", ID = "";
                $.each(data.rows, function (i, item) {
                    if (!ID) {
                        ID = item.ID;
                    }
                    IDList += "," + item.ID;
                });
                IDList = IDList.substr(1);
                var Number = $("#Number").textbox('getValue');
                var Area = $("#Area").numberbox('getValue');
                var postData = { "IDList": IDList, "Number": Number, "Area": Area, "ID": ID };
                if (parseFloat($("#Area").numberbox('getValue')) != parseFloat($("#lbl_Original_Area").html())) {
                    $.messager.confirm('确定', '新面积之和不等于原点位面积确定保存?', function (r) {
                        if (r) {
                            Save(postData);
                        }
                    });
                }
                else {
                    Save(postData);
                }
            }
        }

        function Save(postData) {
            $.dataPostJson('DivfManage_Point_Split_Merge', 'SaveMerge', postData, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $('#mainForm').form('clear');
                        $("#dg").datagrid("loadData", [{}]);
                        Close();
                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {
                });
        }
        function Detailed(ID) {
            var urlParam = { "ID": ID };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function Del() {
            var row = $("#dg").datagrid("getChecked");
            if (row.length > 0) {
                var editIndex = -1;
                var delData = [];
                $.each(row, function (i, item) {
                    delData.push(item);
                });
                $.each(delData, function (i, item) {
                    editIndex = $("#dg").datagrid("getRowIndex", item.ID);
                    $("#dg").datagrid('deleteRow', editIndex);
                });
                $('#dg').datagrid('clearSelections');
                $('#dg').datagrid('clearChecked');
                AreaStatistic();
            } else {
                $.messager.alert('温馨提示', '请选择要删除的原点位!');
            }
        }
        function Close() {
            LayerDialog.Close();
        }


    </script>
</body>
</html>
