<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplateListDialog_Ambient.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PlanTemplateListDialog_Ambient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>模板列表</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            width: 120px;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

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
            width: 80px;
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
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 200px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" readonly="readonly" onclick="SelComm();" style="border: 1px #cccccc solid; width: 580px; height: 50px;" />
                        <input type="hidden" id="CommId" name="CommId" value=""/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-validatebox" runat="server" style="border: 1px #cccccc solid;" />
                    </td>
                    <td class="TdTitle">任务级别</td>
                    <td class="TdContentSearch">
                        <select id="LevelId" name="LevelId" runat="server" style="border: 1px #cccccc solid;" class="easyui-validatebox">
                        </select>
                    </td>
                    <td class="TdTitle">责任岗位
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskRoleName" name="TaskRoleName" class="easyui-validatebox" readonly="readonly" onclick="SelRole();" runat="server" style="border: 1px #cccccc solid;" />
                        <input type="hidden" id="TaskRoleCode" name="TaskRoleCode" />
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="6" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClear();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="IsSingle" name="IsSingle" type="hidden" runat="server" />
        <script type="text/javascript">
            function btnClear() {
                $("#CommId").val("");
                $("#CommName").val("");
                $("#PlanName").val("");
                $("#LevelId").val("");
                $("#TaskRoleName").val("");
                $("#TaskRoleCode").val("");
            }

            function SelComm() {
                HDialog.Open('700', '500', '../ComprehensivePatrols/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            function SelRole() {
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelRole.aspx?LevelId=' + $("#LevelId").val() + '&CommId=' + $("#CommId").val(), '选择责任岗位', false, function callback(_Data) {
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
                        $("#TaskRoleName").val(name);
                        $("#TaskRoleCode").val(code);
                    };
                })
            }

            //加载巡查级别
            function LoadTaskLevel() {
                $.tool.DataPostAsync('CpComPatrols', 'BindTaskLevel', null,
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#LevelId").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            var option = "<option value='" + varObjects[i].LevelId + "'>" + varObjects[i].TaskLevelName + "</option>";
                            $("#LevelId").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                LoadTaskLevel();
            }
            InitTableHeight();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 15, align: 'left', sortable: true },
                { field: 'TaskLevelName', title: '任务级别', width: 20, align: 'left', sortable: true },
                { field: 'TaskRoleName', title: '责任岗位', width: 20, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 20, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划模板名称', width: 25, align: 'left', sortable: true },
                { field: 'FrequencyTitle', title: '计划周期', width: 25, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = '';
                        if ($("#IsSingle").val() == "1")
                            row = $("#TableContainer").datagrid("getSelected");
                        else
                            row = $("#TableContainer").datagrid("getChecked");
                        if (row.length == 0) {
                            if ($("#IsSingle").val() == "1")
                                HDialog.Info("请至少选择一行数据!");
                            else
                                HDialog.Info("请至少勾选一行数据!");
                            return;
                        } else {
                            HDialog.Close(GetSysPlanDataGridCheckId());
                        }
                    }
                }, '-',
                {
                    text: '筛选计划模板',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];


            //获取主table单选或者批量的ID
            function GetSysPlanDataGridCheckId() {
                var PlanId = "";
                var PlanName = [];
                var row = '';
                if ($("#IsSingle").val() != "1") {
                    row = $("#TableContainer").datagrid("getChecked");
                    if (row.length > 0) {
                        for (var i = 0; i < row.length; i++) {
                            PlanId += "," + row[i].PlanId;
                            PlanName[i] = '(' + String(i + 1) + ')' + row[i].PlanName;
                        }
                        if (PlanId.length > 0)
                            PlanId = PlanId.substr(1, PlanId.length - 1);
                        if (PlanName.length > 0)
                            PlanName = PlanName.join(',\r\n');
                    }
                } else {
                    row = $("#TableContainer").datagrid("getSelected");
                    PlanId = row.PlanId;
                    PlanName = row.PlanName;
                }
                return PlanId + "◆" + PlanName;
            }


            function LoadList() {
                if (localStorage.getItem('CpCommId') > '') {
                    $("#CommId").val(localStorage.getItem('CpCommId'));
                    $("#CommName").val(localStorage.getItem('CpCommName'));
                    $("#CommName").removeAttr("onclick");
                }
                if ($("#IsSingle").val() == "1") {
                    column = [[
                        { field: 'CommName', title: '项目名称', width: 15, align: 'left', sortable: true },
                        { field: 'TaskLevelName', title: '任务级别', width: 20, align: 'left', sortable: true },
                        { field: 'TaskRoleName', title: '责任岗位', width: 20, align: 'left', sortable: true },
                        { field: 'TaskUserName', title: '责任人', width: 20, align: 'left', sortable: true },
                        { field: 'PlanName', title: '计划模板名称', width: 25, align: 'left', sortable: true },
                        { field: 'FrequencyTitle', title: '计划周期', width: 25, align: 'left', sortable: true }
                    ]];
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetPlanTemplateList_GenerationTask_Ambient&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    singleSelect: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });

                $('#SearchDlg').dialog('close');
            }
            LoadList();
        </script>
    </form>
</body>
</html>
