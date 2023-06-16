<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAuditSet.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractAuditSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经管理-合同流程设置</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            background-color: white;
        }

        .easyui-numberbox {
            width: 60px;
        }

        .textbox-label {
            cursor: pointer;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-header {
            background-color: white;
        }
    </style>
</head>
<body>
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'160'">
        <div id="tab0" data-issel="true" title="合同新签/续签审批流程" style="overflow: hidden;">
            <div id="TableContainerAdd" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="合同变更审批流程" style="overflow: hidden;">
            <div id="TableContainerChange" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab2" data-issel="false" title="合同执行审批流程" style="overflow: hidden;">
            <div id="TableContainerImplement" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab3" data-issel="false" title="合同提成审批流程" style="overflow: hidden;">
            <div id="TableContainerRoyalty" style="background-color: #cccccc;"></div>
        </div>
    </div>
    <div id="dlg_Addsearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 580px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmAdd">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>合同类别名称</span></td>
                    <td class="text">
                        <input id="ContractTypeName1" typ="text" name="ContractTypeName1" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>流程名称</span></td>
                    <td class="text">
                        <input id="WorkFlowName1" typ="text" name="WorkFlowName1" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitAddGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmAdd').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_Changesearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 800px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmChange">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
                <tr>
                    <td class="title"><span>变更类型</span></td>
                    <td class="text">
                        <input id="ChangeType2" name="ChangeType2" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                         valueField:'id',textField:'text',value:'',
                            data: [{id: '',text: ''},{id: '变更',text: '变更'},{id: '终止',text: '终止'}]" />
                    </td>
                    <td class="title"><span>退租类型</span></td>
                    <td class="text">
                        <input id="RentOutType2" name="RentOutType2" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                         valueField:'id',textField:'text',value:'',
                            data: [{id: '',text: ''},{id: '正常终止',text: '正常终止'},{id: '非正常终止',text: '非正常终止'}]" />
                    </td>
                    <td class="title"><span>流程名称</span></td>
                    <td class="text">
                        <input id="WorkFlowName2" typ="text" name="WorkFlowName2" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitChangeGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmChange').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_Implementsearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 580px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmImplement">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>合同类别名称</span></td>
                    <td class="text">
                        <input id="ContractTypeName3" typ="text" name="ContractTypeName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>流程名称</span></td>
                    <td class="text">
                        <input id="WorkFlowName3" typ="text" name="WorkFlowName3" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitImplementGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmImplement').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_Royaltysearch" class="easyui-dialog" title="筛选" style="padding: 5px; width: 580px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmRoyalty">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>合同类别名称</span></td>
                    <td class="text">
                        <input id="ContractTypeName4" typ="text" name="ContractTypeName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>流程名称</span></td>
                    <td class="text">
                        <input id="WorkFlowName4" typ="text" name="WorkFlowName4" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitRoyaltyGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmRoyalty').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            var w = $(window).width();
            $('.easyui-tabs').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitAddGrid();
        });
        function tabsSelect(title, index) {
            if (index == 1) {
                //合同变更审批流程
                if ($('#tab1').data("issel") == false) {
                    $('#tab1').data("issel", "true")
                    setTimeout(function () {
                        InitChangeGrid();
                    }, 300);
                }
            } else if (index == 2) {
                //合同执行审批流程
                if ($('#tab2').data("issel") == false) {
                    $('#tab2').data("issel", "true")
                    setTimeout(function () {
                        InitImplementGrid();
                    }, 300);
                }
            } else if (index == 3) {
                //合同提成审批流程
                if ($('#tab3').data("issel") == false) {
                    $('#tab3').data("issel", "true")
                    setTimeout(function () {
                        InitRoyaltyGrid();
                    }, 300);
                }
            }
        }
        /* 合同新签/续签审批流程绑定 */
        var toolbarAdd = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    AddDetail('', 'insert');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var Row = $("#TableContainerAdd").datagrid("getSelected");
                    if (Row == null) {
                        $.messager.alert("温馨提示", "请选择需要删除的合同新签/续签审批流程设置！");
                        return;
                    }
                    AddDel(Row.ID)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Addsearch').dialog('open');
                }
            }
        ];
        var columnAdd = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 100, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"AddDetail('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        function InitAddGrid() {
            $("#TableContainerAdd").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnAdd,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarAdd,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetLisContractAdutiSet";
                    param.AuditType = "1";
                    var paramJson = $.getFromParam("frmAdd");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Addsearch').dialog('close');
        }
        function AddDetail(id, OpType) {
            var param = { "ID": id, "OpType": OpType, "AuditType": "1" };
            LayerDialog.OpenWin('450', '300', '../DiversifiedManage/ContractManage/ContractAuditSetDetail.aspx?' + $.param(param), "合同新签/续签审批流程设置", false, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitAddGrid();
                }
            });
        }
        function AddDel(ID) {
            $.messager.confirm('确定', '确认删除当前选中的合同新签/续签审批流程设置?', function (r) {
                if (r) {
                    $.tool.DataPostJson('DiversifiedManage', 'DelContractAdutiSet', "idList=" + ID,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $.messager.alert("温馨提示", "删除成功")
                                InitAddGrid();
                            } else {
                                $.messager.alert("温馨提示", data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        /* 合同变更审批流程绑定 */
        var toolbarChange = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ChangeDetail('', 'insert');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var Row = $("#TableContainerChange").datagrid("getSelected");
                    if (Row == null) {
                        $.messager.alert("温馨提示", "请选择需要删除的合同变更审批流程设置！");
                        return;
                    }
                    ChangeDel(Row.ID)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Changesearch').dialog('open');
                }
            }
        ];
        var columnChange = [[
            { field: 'ChangeType', title: '变更类型', width: 100, align: 'left' },
            { field: 'RentOutType', title: '退租类型', width: 100, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 100, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ChangeDetail('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        function InitChangeGrid() {
            $("#TableContainerChange").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnChange,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarChange,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetLisContractAdutiSet";
                    param.AuditType = "2";
                    var paramJson = $.getFromParam("frmChange");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Changesearch').dialog('close');
        }
        function ChangeDetail(id, OpType) {
            var param = { "ID": id, "OpType": OpType };
            LayerDialog.OpenWin('450', '320', '../DiversifiedManage/ContractManage/ContractAuditSetChangeDetail.aspx?' + $.param(param), "合同变更审批流程设置", false, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitChangeGrid();
                }
            });
        }
        function ChangeDel(ID) {
            $.messager.confirm('确定', '确认删除当前选中的合同变更审批流程设置?', function (r) {
                if (r) {
                    $.tool.DataPostJson('DiversifiedManage', 'DelContractAdutiSet', "idList=" + ID,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $.messager.alert("温馨提示", "删除成功")
                                InitChangeGrid();
                            } else {
                                $.messager.alert("温馨提示", data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        /* 合同执行审批流程绑定 */
        var toolbarImplement = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ImplementDetail('', 'insert');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var Row = $("#TableContainerImplement").datagrid("getSelected");
                    if (Row == null) {
                        $.messager.alert("温馨提示", "请选择需要删除的合同执行审批流程设置！");
                        return;
                    }
                    ImplementDel(Row.ID)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Implementsearch').dialog('open');
                }
            }
        ];
        var columnImplement = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 100, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ImplementDetail('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        function InitImplementGrid() {
            $("#TableContainerImplement").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnImplement,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarImplement,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetLisContractAdutiSet";
                    param.AuditType = "3";
                    var paramJson = $.getFromParam("frmImplement");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('3', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Implementsearch').dialog('close');
        }
        function ImplementDetail(id, OpType) {
            var param = { "ID": id, "OpType": OpType, "AuditType": "3" };
            LayerDialog.OpenWin('450', '300', '../DiversifiedManage/ContractManage/ContractAuditSetDetail.aspx?' + $.param(param), "合同执行审批流程设置", false, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitImplementGrid();
                }
            });
        }
        function ImplementDel(ID) {
            $.messager.confirm('确定', '确认删除当前选中的合同执行审批流程设置?', function (r) {
                if (r) {
                    $.tool.DataPostJson('DiversifiedManage', 'DelContractAdutiSet', "idList=" + ID,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $.messager.alert("温馨提示", "删除成功")
                                InitImplementGrid();
                            } else {
                                $.messager.alert("温馨提示", data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        /* 合同提成审批流程绑定 */
        var toolbarRoyalty = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    RoyaltyDetail('', 'insert');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var Row = $("#TableContainerRoyalty").datagrid("getSelected");
                    if (Row == null) {
                        $.messager.alert("温馨提示", "请选择需要删除的合同提成审批流程设置！");
                        return;
                    }
                    RoyaltyDel(Row.ID)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Royaltysearch').dialog('open');
                }
            }
        ];
        var columnRoyalty = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 100, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"RoyaltyDetail('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        function InitRoyaltyGrid() {
            $("#TableContainerRoyalty").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnRoyalty,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarRoyalty,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetLisContractAdutiSet";
                    param.AuditType = "4";
                    var paramJson = $.getFromParam("frmRoyalty");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('4', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Royaltysearch').dialog('close');
        }
        function RoyaltyDetail(id, OpType) {
            var param = { "ID": id, "OpType": OpType, "AuditType": "4" };
            LayerDialog.OpenWin('450', '300', '../DiversifiedManage/ContractManage/ContractAuditSetDetail.aspx?' + $.param(param), "合同提成审批设置", false, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitRoyaltyGrid();
                }
            });
        }
        function RoyaltyDel(ID) {
            $.messager.confirm('确定', '确认删除当前选中的合同提成审批流程设置?', function (r) {
                if (r) {
                    $.tool.DataPostJson('DiversifiedManage', 'DelContractAdutiSet', "idList=" + ID,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $.messager.alert("温馨提示", "删除成功")
                                InitRoyaltyGrid();
                            } else {
                                $.messager.alert("温馨提示", data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }
    </script>
</body>
</html>

