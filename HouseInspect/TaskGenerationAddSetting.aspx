<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerationAddSetting.aspx.cs" Inherits="M_Main.HouseInspect.TaskGenerationAddSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>附加任务</title>
    
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
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/workflow.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>

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
            width: 160px;
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
                    <td class="TdTitle">当前任务甩项房屋/公区数：</td>
                    <td class="TdContentSearch">
                        <input id="HouseNum" name="HouseNum" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px;" disabled="disabled" />
                    </td>
                    <td class="TdTitle">当前任务甩项标准数：</td>
                    <td class="TdContentSearch">
                        <input id="StandardNum" name="StandardNum" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px;" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">查验岗位：</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" style="width: 200px;height:20px; border: 1px solid #cccccc;"  readonly="readonly" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                    <td class="TdTitle">查验范围：</td>
                    <td class="TdContentSearch">
                        <select id="Range" name="Range" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 202px;height:22px;" disabled="disabled">
                            <option value="IN" selected="selected">户内</option>
                            <option value="OUT">公区</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间：</td>
                    <td class="TdContentSearch">

                        <input class="Control_IteminputNoStyle" id="BeginTime" name="BeginTime"
                            style="width: 200px; border: 1px solid #cccccc;height:20px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" readonly="readonly" />

                    </td>
                    <td class="TdTitle">结束时间：</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="EndTime" name="EndTime"
                            style="width: 200px; border: 1px solid #cccccc;height:20px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" readonly="readonly" />

                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="BtnSave" onclick="Save();">生成附加任务</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" id="BtnClose" onclick=" HDialog.Close();">返回</a>
                    </td>
                </tr>
                <tr>
                    <th colspan="4" align="center" style="height: 50px">甩项明细</th>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <div style="border:1px solid #cccccc">
                            <div style="width: 95%;height:300px" id="TableContainer">
                        </div>
                        </div>
                        
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px;  padding: 10px;">
            
                <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                    <tr>
                        <td class="TdTitle">房屋/公区编号：</td>
                        <td class="TdContent">
                            <input id="pcode" name="pcode" type="text" class="easyui-validatebox" style="width: 95%" />
                        </td>
                        <td class="TdTitle">房屋/公区名称：</td>
                        <td class="TdContent">

                            <input id="pname" name="pname" type="text" class="easyui-validatebox" style="width: 95%" />
                        </td>

                    </tr>
                    <tr>

                        <td class="TdTitle">所属专业：</td>
                        <td class="TdContent">
                            <select id="Profession" name="Profession"  isdctype='true' dctype="所属专业" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%">
                            </select>
                        </td>
                        <td class="TdTitle">重要程度：</td>
                        <td class="TdContent">
                            <select id="Importance" name="Importance"  isdctype='true' dctype="重要程度" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center; padding-top: 5px;">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="emptyForm();">清空</a>
                        </td>
                    </tr>
                </table>

            </div>

        <input type="hidden" name="CommId" id="CommId" value="" />
        <input type="hidden" name="TaskId" id="TaskId" value="" />
        <input type="hidden" name="RangeType" id="RangeType" value="" />
         
    </form>

    <script>

        function emptyForm() {
            $("#pcode").val("");
            $("#pname").val("");
            $('#Profession').val('');
            $('#Importance').val('');
        }

        function load() {
            $("#CommId").val(GetQueryString("CommId"));
            $("#TaskId").val(GetQueryString("TaskId"));
            $("#RangeType").val(GetQueryString("Range"));
            $("#Range").val(GetQueryString("Range"));
            GetRoomOrPublicAreaNum();
            GetTaskStandardNum();
        }
        load();

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

        //选择岗位
        function SelRole() {
            HDialog.Open('650', '600', '../HouseInspect/RightFrameCommunityRightManage.aspx?DepCode=&CommId=' + $("#CommId").val(), '选择岗位', false, function callback(_Data) {
                if (_Data) {
                    _Data = _Data.substring(1, _Data.length);
                    var strs = new Array();
                    strs = _Data.split(',');
                    var code = "";
                    var name = "";
                    var all = "";
                    for (var i = 0; i < strs.length; i++) {
                        all = strs[i].trim().split(/\s+/);
                        code = code + all[0] + ",";
                        name = name + all[1] + ",";
                    }
                    code = code.substring(0, code.length - 1);
                    name = name.substring(0, name.length - 1);
                    $("#RoleName").val(name);
                    $("#RoleCode").val(code);
                };
            })
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'Id', title: 'Id', align: 'left', sortable: true, hidden: true },
            { field: 'TaskId', title: 'TaskId', align: 'left', sortable: true, hidden: true },
            { field: 'pcode', title: '房屋/公区编号', width: 100, align: 'left', sortable: true },
            { field: 'pname', title: '房屋/公区名称', width: 100, align: 'left', sortable: true },
            { field: 'ObjectId', title: '查验对象Id', align: 'left', sortable: true, hidden: true },
            { field: 'ObjectName', title: '查验对象', width: 100, align: 'left', sortable: true },
            { field: 'StandardId', title: '查验标准Id', align: 'left', sortable: true, hidden: true },
            { field: 'Content', title: '标准内容', width: 200, align: 'left', sortable: true },
            { field: 'Profession', title: '所属专业', align: 'left', sortable: true, hidden: true },
            { field: 'ProfessionName', title: '所属专业', width: 100, align: 'left', sortable: true },
            { field: 'Importance', title: '重要程度', align: 'left', sortable: true, hidden: true },
            { field: 'ImportanceName', title: '重要程度', width: 100, align: 'left', sortable: true },
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
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').dialog('open');
                }
            }, '-',

        ]

        function LoadList() {
            var Profession = "";
            var Importance = "";
            if ($("#Profession option:selected").val() != undefined) {
                Profession = $("#Profession option:selected").val();
            }
            if ($("#Importance option:selected").val() != undefined) {
                Importance = $("#Importance option:selected").val();
            }

            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskStandardList&pcode=' + $("#pcode").val() + "&pname=" + $("#pname").val() + "&Profession=" + Profession + "&Importance=" + Importance + "&TaskId=" + $("#TaskId").val() + "&RangeType=" + $("#RangeType").val() +"&OpType=Rejection",
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                rownumbers: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc"
            });
            $("#SearchDlg").dialog("close");
        }

        LoadList();

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function Save() {
            $("#frmFormStandard").form('validate');

            if ($("#RoleName").val() == "") {
                HDialog.Info('请选择查验岗位！');
                return;
            }
            if ($("#BeginTime").val() == "") {
                HDialog.Info('请选择开始时间！');
                return;
            }
            if ($("#EndTime").val() == "") {
                HDialog.Info('请选择结束时间！');
                return;
            }

            if ($("#BeginTime").val() > $("#EndTime").val()) {
                HDialog.Info("开始时间不能大于结束时间");
                return;
            }

            var _Data = $('#TableContainer').datagrid('getChecked');
            var row_index = _Data.length;
            if (row_index == 0) {
                HDialog.Info('请选择甩项！');
                return;
            }
            var TaskStandardId = '';
            for (var j = 0; j < row_index; j++) {
                TaskStandardId += "," + _Data[j].Id;
            }
            

            $.tool.DataPostChk('frmFormStandard', 'CsHouseInspect', 'GenerationAdditionalTask', "TaskStandardId=" + TaskStandardId + "&" + $('#frmFormStandard').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    HDialog.Info(_Data);
                    HDialog.Close();
                    
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }

    </script>

</body>
</html>
