<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelPlan_Maintenance.aspx.cs" Inherits="M_Main.EquipmentNew.SelPlan_Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划列表</title>
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
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 230px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" readonly="readonly" onclick="SelComm();" style="border: 1px #cccccc solid; width: 580px; height: 50px;" />
                        <input type="hidden" id="CommId" name="CommId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">设备系统</td>
                    <td class="TdContentSearch">
                        <input type="hidden" id="SystemId" name="SystemId" />
                        <input type="text" id="SystemName" name="SystemName" onclick="SelSystem();" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>

                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                        <input type="text" id="SpaceName" name="SpaceName" onclick="SelSpace();" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">维保内容</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Content" name="Content" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskRoleName" name="TaskRoleName" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
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
                $("#SystemId").val("");
                $("#SystemName").val("");
                $("#SpaceId").val("");
                $("#SpaceName").val("");
                $("#PlanName").val("");
                $("#Content").val("");
                $("#TaskRoleName").val("");
                $("#IsEnable").val("");
            }

            //选择设备系统
            function SelSystem() {
                HDialog.Open('700', '450', '../EquipmentNew/SelSystem.aspx', '选择设备系统', true, function callback(_Data) {
                    if (_Data != "") {
                        var str = _Data.split('|');
                        $("#SystemId").val(str[0]);
                        $("#SystemName").val(str[1]);
                    }
                });
            }

            //设备空间名称
            function SelSpace() {
                HDialog.Open('600', '450', '../EquipmentNew/SelSpace.aspx', '选择设备空间', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SpaceId").val(varObjects.SpaceId);
                        $("#SpaceName").val(varObjects.SpaceName);
                    }
                });
            }

            function SelComm() {
                HDialog.Open(700, 500, '../EquipmentNew/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 40, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 160, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 300, align: 'left', sortable: true },
                {
                    field: 'Content', title: '维保内容', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        if (value.length > 10)
                            str = str.substr(0, 15) + '...';
                        return str;
                    }
                },
                { field: 'Frequency', title: '维保频次', width: 120, align: 'left', sortable: true },
                { field: 'TaskRoleName', title: '责任岗位', width: 120, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 120, align: 'left', sortable: true },
                {
                    field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        if (value.length > 10)
                            str = str.substr(0, 15) + '...';
                        return str;
                    }
                }
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
                var Id = "";
                var PlanName = [];
                var row = '';
                if ($("#IsSingle").val() != "1") {
                    row = $("#TableContainer").datagrid("getChecked");
                    if (row.length > 0) {
                        for (var i = 0; i < row.length; i++) {
                            Id += "," + row[i].Id;
                            PlanName[i] = '(' + String(i + 1) + ')' + row[i].PlanName;
                        }
                        if (Id.length > 0)
                            Id = Id.substr(1, Id.length - 1);
                        if (PlanName.length > 0)
                            PlanName = PlanName.join(',\r\n');
                    }
                } else {
                    row = $("#TableContainer").datagrid("getSelected");
                    Id = row.Id;
                    PlanName = row.PlanName;
                }
                return Id + "◆" + PlanName;
            }


            function LoadList() {
                if (localStorage.getItem('EqCommId') > '') {
                    $("#CommId").val(localStorage.getItem('EqCommId'));
                    $("#CommName").val(localStorage.getItem('EqCommName'));
                    $("#CommName").removeAttr("onclick");
                }
                if ($("#IsSingle").val() == "1") {
                    column = [[
                        { field: 'Sort', title: '序号', width: 40, align: 'left', sortable: true },
                        { field: 'CommName', title: '项目名称', width: 160, align: 'left', sortable: true },
                        { field: 'PlanName', title: '计划名称', width: 300, align: 'left', sortable: true },
                        {
                            field: 'Content', title: '维保内容', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                                var str = value;
                                if (value.length > 10)
                                    str = str.substr(0, 15) + '...';
                                return str;
                            }
                        },
                        { field: 'Frequency', title: '维保频次', width: 120, align: 'left', sortable: true },
                        { field: 'TaskRoleName', title: '责任岗位', width: 120, align: 'left', sortable: true },
                        { field: 'TaskUserName', title: '责任人', width: 120, align: 'left', sortable: true },
                        {
                            field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                                var str = value;
                                if (value.length > 10)
                                    str = str.substr(0, 15) + '...';
                                return str;
                            }
                        }
                    ]];
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GenerationGetPlan_Maintenance&' + $('#frmFrom').serialize(),
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
                    fitColumns: false,
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
