<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplateList_Safe.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PlanTemplateList_Safe" %>

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
            width: 180px;
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
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="divTree" data-options="region:'west',border:true,width:300,title:'项目列表'">
                <ul id="treeOrgan" class="easyui-tree"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true,">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerTemplate">
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 180px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">任务级别</td>
                    <td class="TdContentSearch">
                        <select id="LevelId" name="LevelId" runat="server" style="width: 100%; border: 1px #cccccc solid;" class="easyui-validatebox">
                        </select>
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">计划周期</td>
                    <td class="TdContentSearch">
                        <select id="FrequencyTitle" name="FrequencyTitle" style="border: 1px solid #cccccc; height: 23px; width: 130px;">
                            <option value=""></option>
                            <option value="1次/1小时">1次/1小时</option>
                            <option value="1次/2小时">1次/2小时</option>
                            <option value="1次/3小时">1次/3小时</option>
                            <option value="1次/4小时">1次/4小时</option>
                            <option value="1次/6小时">1次/6小时</option>
                            <option value="1次/8小时">1次/8小时</option>
                            <option value="1次/12小时">1次/12小时</option>
                            <option value="1次/天">1次/天</option>
                            <option value="1次/周">1次/周</option>
                            <option value="2次/周">2次/周</option>
                            <option value="3次/周">3次/周</option>
                            <option value="1次/10天">1次/10天</option>
                            <option value="1次/15天">1次/15天</option>
                            <option value="1次/月">1次/月</option>
                            <option value="1次/2月">1次/2月</option>
                            <option value="1次/季">1次/季</option>
                            <option value="1次/半年">1次/半年</option>
                            <option value="1次/年">1次/年</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划模板名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">是否启用</td>
                    <td class="TdContentSearch">
                        <select id="IsEnable" name="IsEnable" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 99%;">
                            <option value="">全部</option>
                            <option value="1" selected="selected">启用</option>
                            <option value="0">停用</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContentSearch">
                        <select id="IsAuditing" name="IsAuditing" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 99%;">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="6" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="CommName" type="hidden" name="CommName" runat="server" />
        <input id="LoginRoleCode" type="hidden" name="LoginRoleCode" runat="server" />
        <input id="UserCode" type="hidden" name="UserCode" runat="server" />
        <script type="text/javascript">
            $(function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadTaskLevel();
                InitTableHeight();
                LoadOrganTree();
                LoadList();
            });
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#frmFrom").css("height", h + "px");
                $("#layout").css("height", h + "px");
                $("#divTree").css("height", h + "px");
                $("#treeOrgan").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
                $("#TableContainerTemplate").css("height", h - 2 + "px");
            }

            //机构
            function LoadOrganTree() {
                $("#treeOrgan").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'text',
                    idField: 'id',
                    lines: true,
                    animate: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadSuccess: function (node, data) {
                    },
                    onBeforeLoad: function (row, param) {
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "DepMenuList";
                        //控制用户权限
                        param.SelRoleCode = $("#LoginRoleCode").val();

                    },
                    onSelect: function (row) {
                        var isLeaf = $("#treeOrgan").tree('isLeaf', row.target);
                        if (isLeaf) {
                            $("#CommId").val(row.attributes.CommID);
                            $("#CommName").val(row.text);
                        } else {
                            $("#CommId").val('');
                            $("#CommName").val('');
                        }
                        LoadList();
                    }
                });
            }
            function btnClear() {
                $("#PlanName").val("");
                $("#FrequencyTitle").val("");
                $("#RoleName").val("");
                $("#TaskRoleCode").val("");
                $("#LevelId").val("");
                $("#IsEnable").val("");
                $("#IsAuditing").val("");
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

            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                {
                    field: 'PlanName', title: '计划模板名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsEnable == '1') {
                            str = "<a style=\"color:blue;\" onclick=\"ShowPlanDlg('" + row.PlanId + "','" + row.CommId + "','" + row.CommName + "','" + row.AddUserCode + "','" + row.IsAuditing + "')\">" + row.PlanName + "</a>";
                        }
                        else {
                            str = "<a style=\"color:red;\" onclick=\"ShowPlanDlg('" + row.PlanId + "','" + row.CommId + "','" + row.CommName + "','" + row.AddUserCode + "','" + row.IsAuditing + "')\">" + row.PlanName + "</a>";
                        }
                        return str;
                    }
                },
                //{ field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                { field: 'TaskTypeName', title: '任务类型', width: 120, align: 'left', sortable: true },
                { field: 'TaskLevelName', title: '任务级别', width: 120, align: 'left', sortable: true }
            ]];

            var column = [[
                { field: 'TaskRoleName', title: '责任岗位<span style="color:red">(具体岗位)<span/>', width: 300, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 300, align: 'left', sortable: true },
                { field: 'FrequencyTitle', title: '计划周期', width: 100, align: 'left', sortable: true },
                { field: 'PointNum', title: '任务点位数', width: 120, align: 'left', sortable: true },
                { field: 'MustCheckPointNum', title: '必查点位数', width: 120, align: 'left', sortable: true },
                { field: 'OtherPointPercentage', title: '抽查点位覆盖率', width: 120, align: 'left', sortable: true },
                {
                    field: 'IsAuditing', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsAuditing == '1') {
                            str = '已审核';
                        }
                        else if (row.IsAuditing == '2') {
                            str = '审核不通过';
                        }
                        else {
                            str = '未审核';
                        }
                        return str;
                    }
                },
                { field: 'AuditingRemark', title: '审核备注', width: 200, align: 'left', sortable: true },
                {
                    field: 'IsEnable', title: '是否启用', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsEnable == '1') {
                            str = '启用';
                        }
                        else {
                            str = '停用';
                        }
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '新增计划模板',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CommId").val().length < 3) {
                            HDialog.Info("请选择需要生成的小区!");
                        }
                        else {
                            var w = top.$(window).width();
                            localStorage.setItem("CpPlanOpType", "add");
                            localStorage.setItem("CpPlanCommId", $("#CommId").val());
                            localStorage.setItem("CpPlanCommName", $("#CommName").val());
                            localStorage.setItem("CpPlanCanEdit", false);
                            localStorage.setItem("CpCopyPlanId", '');
                            HDialog.Open(w, '600', '../ComprehensivePatrols/PlanTemplateFrame_Safe.aspx', '新增计划模板', true, function callback(_Data) {
                                LoadList();
                                ClearStorage();
                            });
                        }
                    }
                }
                , '-',
                {
                    text: '复制计划模板',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainerTemplate").datagrid("getSelected");
                        if (row != "" && row != null && row != undefined) {
                            var w = top.$(window).width();
                            localStorage.setItem("CpPlanOpType", "add");
                            localStorage.setItem("CpPlanCommId", $("#CommId").val());
                            localStorage.setItem("CpPlanCommName", $("#CommName").val());
                            localStorage.setItem("CpPlanCanEdit", false);
                            localStorage.setItem("CpCopyPlanId", row.PlanId);
                            HDialog.Open(w, '600', '../ComprehensivePatrols/PlanTemplateFrame_Safe.aspx', '复制计划模板', true, function callback(_Data) {
                                LoadList();
                                ClearStorage();
                            });
                        } else {
                            HDialog.Info("请选择需要复制的计划模板");
                        }
                    }
                }
                , '-',
                {
                    text: '删除计划模板',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainerTemplate").datagrid("getSelected");
                        if (row != "" && row != null && row != undefined) {
                            if (row.IsAuditing == '1') {
                                HDialog.Info("选中模板已审核不能删除！");
                            }
                            else {
                                HDialog.Prompt('是否删除该计划模板!', function () {
                                    DelRecordById(row.PlanId, row.LevelId);
                                });
                            }
                        } else {
                            HDialog.Info("请选择需要删除的计划模板");
                        }
                    }
                }
                , '-',
                {
                    text: '审核计划模板',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainerTemplate").datagrid("getSelected");
                        if (row != "" && row != null && row != undefined) {
                            if (row.IsAuditing == "1") {
                                HDialog.Info("选中模板已经审核通过无需再次审核！");
                            } else {
                                //HDialog.Prompt('是否审核该计划模板!', function () {
                                Examine(row.PlanId, row.LevelId);
                                //});
                            }
                        }
                        else {
                            HDialog.Info("请选择一行记录进行审核！");
                        }
                    }
                }
                , '-',
                {
                    text: '启/停用计划模板',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainerTemplate").datagrid("getSelected");
                        if (row != "" && row != null && row != undefined) {
                            Enable(row.PlanId, row.LevelId);
                        }
                        else {
                            HDialog.Info("请选择一行记录进行操作！");
                        }
                    }
                }
                , '-',
                {
                    text: '修改模板责任人',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainerTemplate").datagrid("getChecked");
                        if (row.length > 0) {
                            var str = '';
                            for (var i = 0; i < row.length; i++) {
                                //if ($("#UserCode").val() != row[i].AddUserCode) {
                                //    HDialog.Info("只能修改本人添加的计划！");
                                //    return;
                                //}
                                str += "," + row[i].PlanId;
                            }
                            if (str.length > 0)
                                str = str.substr(1, str.length - 1);
                            HDialog.Open('720', '190', '../ComprehensivePatrols/PlanTaskUserEdit_Safe.aspx?Id=' + str + '&CommId=' + row[0].CommId, '修改', true, function callback(_Data) {
                                LoadList();
                            });
                        } else {
                            HDialog.Info("请选择修改的数据。");
                            return;
                        }
                    }
                }
                , '-',
                {
                    text: '筛选计划模板',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function ClearStorage() {
                localStorage.removeItem('CpPlanOpType');
                localStorage.removeItem('CpPlanCommId');
                localStorage.removeItem('CpPlanCommName');
                localStorage.removeItem('CpPlanId');
                localStorage.removeItem('CpPlanCanEdit');
                localStorage.removeItem('CpCopyPlanId');
            }

            function ShowPlanDlg(PlanId, CommId, CommName, AddUserCode, IsAuditing) {
                var w = top.$(window).width();
                var CanEdit = false;
                CanEdit = ($("#UserCode").val() == AddUserCode && IsAuditing != "1");
                localStorage.setItem("CpPlanOpType", "edit");
                localStorage.setItem("CpPlanId", PlanId);
                localStorage.setItem("CpPlanCommId", CommId);
                localStorage.setItem("CpPlanCommName", CommName);
                localStorage.setItem("CpPlanCanEdit", CanEdit);
                HDialog.Open(w, '600', '../ComprehensivePatrols/PlanTemplateFrame_Safe.aspx', '计划模板详情', false, function callback(_Data) {
                    LoadList();
                    ClearStorage();
                });
            }

            function DelRecordById(Id, LevelId) {
                $.tool.DataGet('CpComPatrols', 'ExaminePlanTemplateGetCheck', 'LevelId=' + LevelId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == '1') {
                            $.tool.DataGet('CpComPatrols', 'DelPlanTemplateList_Safe', 'Id=' + Id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    LoadList();
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info("无设置权限！");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //审核计划模板
            function Examine(Id, LevelId) {
                $.tool.DataGet('CpComPatrols', 'ExaminePlanTemplateGetAuditing', 'LevelId=' + LevelId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == '1') {
                            HDialog.Open('500', '170', '../ComprehensivePatrols/PlanTemplateAuditing_Safe.aspx?PlanId=' + Id, '审核', true, function callback(_Data) {
                                LoadList();
                            });
                        }
                        else {
                            HDialog.Info("无审核权限！");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //启用/停用计划模板
            function Enable(Id, LevelId) {
                $.tool.DataGet('CpComPatrols', 'ExaminePlanTemplateGetAuditing', 'LevelId=' + LevelId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == '1') {
                            $.tool.DataGet('CpComPatrols', 'EnablePlanTemplateById_Safe', 'PlanId=' + Id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    HDialog.Info("操作成功！");
                                    LoadList();
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info("无审核权限！");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList() {
                $("#TableContainerTemplate").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetPlanTemplateList_Safe&' + $('#frmFrom').serialize(),
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    remoteSort: false,
                    singleSelect: true,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    onClickRow: function (rowIndex, rowData) {
                    }
                });
                $("#SearchDlg").dialog("close");
            }
        </script>
    </form>
</body>
</html>
