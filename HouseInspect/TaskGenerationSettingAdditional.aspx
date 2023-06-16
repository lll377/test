<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerationSettingAdditional.aspx.cs" Inherits="M_Main.HouseInspect.TaskGenerationSettingAdditional" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>附加任务</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            margin-bottom: 53px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        /*  .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }*/

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body>
    <form id="frmFormStandard" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">选择查验任务：</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="Task" name="Task" type="text" onclick="SelTaskGeneration()" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 560px;height:20px" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">当前任务甩项房屋/公区数：</td>
                    <td class="TdContentSearch">
                        <input id="HouseNum" name="HouseNum" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px" disabled="disabled" />
                    </td>
                    <td class="TdTitle">当前任务甩项标准数：</td>
                    <td class="TdContentSearch">
                        <input id="StandardNum" name="StandardNum" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <th colspan="4" align="center" style="height: 50px">甩项明细</th>
                </tr>
                <tr>
                    <td colspan="4" align="center" class="TdContentSearch">
                        <div>
                            <div id="TableContainer" style="width: 564px; background-color: #cccccc;">
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="返回" id="BtnClose" onclick="Close();" />
        </div>
        <input type="hidden" name="TaskId" id="TaskId" value="0" />
    </form>

    <script>

        //function InitTableHeight() {
        //    $("#TableContainer").css("height", "280px");
        //}
        //InitTableHeight();

        function SelTaskGeneration() {
            $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });//清空
            var Range = $(window.parent.$("#TaskGenerationSetting")).contents().find("#Range option:selected").val();
            var HiCommID = window.parent.$("#CommId").val();
            HDialog.Open('1100', '500', '../HouseInspect/SelTaskGeneration.aspx?Range=' + Range + "&HiCommID=" + HiCommID, '选择任务', false, function callback(_Data) {
                var obj = JSON.parse(_Data);
                $("#TaskId").val(obj.TaskId);
                $("#Task").val(obj.TaskNo);
                GetRoomOrPublicAreaNum();
                GetTaskStandardNum();
                LoadList();
            })
        }

        function Close() {
            window.parent.LayerDialog.Close();
        }

        function GetRoomOrPublicAreaNum() {
            $.tool.DataGet('CsHouseInspect', 'GetRoomOrPublicAreaNum', 'TaskId=' + $("#TaskId").val(),
                function Init() {
                },
                function callback(_Data) {
                    $("#HouseNum").val(_Data)
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        function GetTaskStandardNum() {
            $.tool.DataGet('CsHouseInspect', 'GetTaskStandardNum', 'TaskId=' + $("#TaskId").val(),
                function Init() {
                },
                function callback(_Data) {
                    $("#StandardNum").val(_Data)
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        var column = [[
            { field: 'Id', title: 'Id', align: 'left', sortable: true, hidden: true },
            { field: 'TaskId', title: 'TaskId', align: 'left', sortable: true, hidden: true },
            { field: 'ObjectId', title: '查验对象Id', align: 'left', sortable: true, hidden: true },
            { field: 'ObjectName', title: '查验对象', width: 100, align: 'left', sortable: true },
            { field: 'StandardId', title: '查验标准Id', align: 'left', sortable: true, hidden: true },
            { field: 'Content', title: '标准内容', width: 200, align: 'left', sortable: true },
            { field: 'Profession', title: '所属专业', align: 'left', sortable: true, hidden: true },
            { field: 'ProfessionName', title: '所属专业', width: 80, align: 'left', sortable: true },
            { field: 'Importance', title: '重要程度', align: 'left', sortable: true, hidden: true },
            { field: 'ImportanceName', title: '重要程度', width: 80, align: 'left', sortable: true },
            {
                field: 'IsInspect', title: '是否查验', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var result = "否";
                    if (row.IsInspect == "1") {
                        result = "是";
                    }
                    return result;
                }
            },
            {
                field: 'IsQualified', title: '合格/不合格/甩项', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var result = "";
                    if (row.IsQualified == "1") {
                        result = "合格";
                    }
                    if (row.IsQualified == "2") {
                        result = "甩项";
                    }
                    if (row.IsQualified == "0") {
                        result = "不合格";
                    }
                    return result;
                }
            },
            { field: 'ProblemType', title: '问题类型', align: 'left', sortable: true, hidden: true },
            { field: 'ProblemTypeName', title: '问题类型', width: 100, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '全部加载',
                iconCls: 'icon-add',
                handler: function () {
                    $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });//清空
                    LoadList()
                }
            }, '-',
            {
                text: '全部取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });//清空
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelections");
                    if (row.length == 0) {
                        HDialog.Info("请选择删除数据");
                        return;
                    }
                    var selectRows = [];
                    for (var i = 0; i < row.length; i++) {
                        selectRows.push(row[i]);
                    }
                    for (var i = row.length - 1; i >= 0; i--) {

                    }
                    for (var j = 0; j < selectRows.length; j++) {
                        var index = $('#TableContainer').datagrid('getRowIndex', selectRows[j]);
                        $('#TableContainer').datagrid('deleteRow', index);
                    }
                }
            }
            //, '-',
            //{
            //    text: '筛选',
            //    iconCls: 'icon-search',
            //    handler: function () {
            //        $('#SearchDlg').dialog('open');
            //    }
            //}, '-',

        ]

        function LoadList() {
            //var Profession = "";
            //var Importance = "";
            //if ($("#Profession option:selected").val() != undefined) {
            //    Profession = $("#Profession option:selected").val();
            //}
            //if ($("#Importance option:selected").val() != undefined) {
            //    Importance = $("#Importance option:selected").val();
            //}
            var HiCommID = window.parent.$("#CommId").val();
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskStandardList&TaskId=' + $("#TaskId").val() +
                    "&OpType=Rejection" + "&HiCommID=" + HiCommID,
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                height: 280,
                rownumbers: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                //border: false,
                width: "100%",
                pagination: true,
                toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    console.log(data);
                }
            });
        }
        LoadList();
        GetRoomOrPublicAreaNum();
        GetTaskStandardNum();


        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function GetRejectionRow() {
            var _Data = $('#TableContainer').datagrid('getData');
            var row_index = _Data.rows.length;

            var TaskStandardId = '';
            for (var j = 0; j < row_index; j++) {
                TaskStandardId += "," + _Data.rows[j].Id;
            }
            TaskStandardId = TaskStandardId.substring(1, TaskStandardId.length);
            return TaskStandardId
        }

    </script>

</body>
</html>
