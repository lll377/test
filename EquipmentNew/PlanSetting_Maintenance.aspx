<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanSetting_Maintenance.aspx.cs" Inherits="M_Main.EquipmentNew.PlanSetting_Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>维保计划设置</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: auto;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .tabs-container .panel-body {
            border-color: #95B8E7;
            border-width: 1px;
            border-style: solid;
            padding: 0px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="divTree" data-options="region:'west',border:true,width:300,title:'项目列表'">
                <ul id="treeOrgan" class="easyui-tree"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true,">
                <div style="border-left: 1px solid #95B8E7; border-right: 1px solid #95B8E7;">
                    <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
                    </div>
                </div>
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" name="room" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">设备空间工艺路线</a>
                        </li>
                        <li class="" name="cust" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">设备级别工艺路线</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetailSpace">
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 850px; height: 160px; overflow: hidden; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
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
                    <td class="TdTitle">是否启用</td>
                    <td class="TdContentSearch">
                        <select name="IsEnable" id="IsEnable" style="width: 140px; border: 1px solid #cccccc;">
                            <option value="">全部</option>
                            <option value="1" selected="selected">启用</option>
                            <option value="0">停用</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="6" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadBind();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClear();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg1" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 850px; height: 130px; overflow: hidden; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">设备名称</td>
                    <td class="TdContentSearch">
                        <input type="hidden" id="EquipmentId" name="EquipmentId" />
                        <input type="text" id="EquipmentName" name="EquipmentName" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                    <td class="TdTitle">输入类型</td>
                    <td class="TdContentSearch">
                        <select id="InputType" name="InputType" runat="server" class="easyui-validatebox" style="width: 140px; border: 1px solid #cccccc;">
                            <option value=""></option>
                            <option value="1">选项</option>
                            <option value="2">数字</option>
                            <option value="3">文本</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备级别</td>
                    <td class="TdContentSearch">
                        <input type="hidden" id="RankId" name="RankId" />
                        <input type="text" id="RankName" name="RankName" class="easyui-validatebox" style="width: 95%; border: 1px #cccccc solid;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="6" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadBindDetail();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClearDetail();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg2" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 650px; height: 130px; overflow: hidden; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">输入类型</td>
                    <td class="TdContentSearch">
                        <select id="SpaceInputType" name="SpaceInputType" runat="server" class="easyui-validatebox" style="width: 140px; border: 1px solid #cccccc;">
                            <option value=""></option>
                            <option value="1">选项</option>
                            <option value="2">数字</option>
                            <option value="3">文本</option>
                        </select>
                    </td>
                    <td class="TdTitle">通用设备空间</td>
                    <td class="TdContentSearch">
                        <select id="SysSpaceId" name="SysSpaceId" runat="server" isdctype="true" dctype="通用设备空间" style="width: 70%; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="4" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadBindDetailSpace();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClearDetailSpace();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="CommName" name="CommName" />
        <input type="hidden" id="PlanId" name="PlanId" />
        <input type="hidden" id="IsAuditing" name="IsAuditing" />
        <input type="hidden" id="LoginRoleCode" name="LoginRoleCode" runat="server" />
        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
        <input type="hidden" id="HaveFunc" name="HaveFunc" />
        <script type="text/javascript">
            $(function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                InitTableHeight();
                LoadOrganTree();
                LoadBind();
                LoadBindDetail();
                LoadBindDetailSpace();
                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    $("#DivContainerDetail").datagrid("resize");
                    $("#DivContainerDetailSpace").datagrid("resize");
                });
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#layout").css("height", h + "px");
                $("#divTree").css("height", h - 10 + "px");
                $("#treeOrgan").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
                var h = $(window).height();
                $("#DivContainer").css("height", h / 2 - 15 + "px");
                $("#DivContainerDetail").css("height", h / 2 - 25 + "px");
                $("#DivContainerDetailSpace").css("height", h / 2 - 25 + "px");
            }

            function btnClear() {
                $("#SystemId").val("");
                $("#SystemName").val("");
                $("#SpaceId").val("");
                $("#SpaceName").val("");
                $("#PlanName").val("");
                $("#Content").val("");
                $("#TaskRoleName").val("");
                $("#IsEnable").val("");
            }

            function btnClearDetail() {
                $("#EquipmentId").val("");
                $("#EquipmentName").val("");
                $("#InputType").val("");
                $("#RankId").val("");
                $("#RankName").val("");
            }

            function btnClearDetailSapce() {
                $("#SapceInputType").val("");
                $("#SysSpaceId").val("");
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
                        param.Class = "CsEquipment";
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
                        LoadBind();
                    }
                });
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
                var CommID = $("#CommId").val();
                if (CommID == null || CommID == "" || CommID == undefined) {
                    HDialog.Info("请先选择项目");
                    return;
                }
                HDialog.Open('600', '450', '../EquipmentNew/SelSpace.aspx?CommId=' + CommID, '选择设备空间', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SpaceId").val(varObjects.SpaceId);
                        $("#SpaceName").val(varObjects.SpaceName);
                    }
                });
            }

            //删除计划
            function DelRecord(Ids) {
                $.tool.DataGet('CsEquipment', 'DelPlan_Maintenance', 'Ids=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadBind();

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //审核计划
            function Examine(Ids) {
                $.tool.DataGet('CsEquipment', 'ExaminePlan_Maintenance', 'Ids=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data > '')
                            HDialog.Info(_Data);
                        else {
                            HDialog.Info("审核成功");
                            LoadBind();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //启/停用计划
            function Enable(Ids) {
                $.tool.DataGet('CsEquipment', 'EnablePlan_Maintenance', 'Ids=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data > '') {
                            HDialog.Info(_Data);
                        } else {
                            HDialog.Info("启/停用成功");
                            LoadBind();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //删除工艺路线
            function DelRecordDetail(Ids) {
                $.tool.DataGet('CsEquipment', 'DelPlanDetail_Maintenance', 'Ids=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadBindDetail();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //删除工艺路线
            function DelRecordDetailSpace(Ids) {
                $.tool.DataGet('CsEquipment', 'DelPlanDetail_Maintenance_Space', 'Ids=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadBindDetailSpace();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //展示计划详情
            function ShowPlanDlg(Id, CommId, CommName, AddUserId, IsAuditing) {
                var w = top.$(window).width();
                var CanEdit = false;
                CanEdit = ($("#UserCode").val() == AddUserId && IsAuditing != "1");
                HDialog.Open(w, '600', '../EquipmentNew/PlanSettingDetail_Maintenance.aspx?OpType=edit&CanPass=false&Id=' + Id + '&CommId=' + CommId + "&CommName=" + encodeURI(encodeURI(CommName)) + '&CanEdit=' + CanEdit, '编辑计划', false, function callback(_Data) {
                    LoadBind();
                });
            }

            function AddPlanDetail_Maintenance_Space(Id) {
                $.tool.DataGet('CsEquipment', 'AddPlanDetail_Maintenance_Space', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("复位成功");
                        LoadBindDetailSpace();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 30, align: 'left', sortable: true },
                //{ field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.IsEnable == '1') {
                            str = "<a style=\"color:blue;\" onclick=\"ShowPlanDlg('" + row.Id + "','" + row.CommId + "','" + row.CommName + "','" + row.AddUserId + "','" + row.IsAuditing + "')\">" + row.PlanName + "</a>";
                        }
                        else {
                            str = "<a style=\"color:red;\" onclick=\"ShowPlanDlg('" + row.Id + "','" + row.CommId + "','" + row.CommName + "','" + row.AddUserId + "','" + row.IsAuditing + "')\">" + row.PlanName + "</a>";
                        }
                        return str;
                    }
                },
                { field: 'SystemName', title: '设备系统', width: 150, align: 'left', sortable: true },
                { field: 'SpaceName', title: '设备空间', width: 120, align: 'left', sortable: true },
                {
                    field: 'Content', title: '维保内容', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        //if (value.length > 10)
                        //    str = str.substr(0, 15) + '...';
                        return str;
                    }
                },
                { field: 'Frequency', title: '维保频次', width: 100, align: 'left', sortable: true },
                { field: 'RatedHours', title: '额定工时', width: 60, align: 'left', sortable: true },
                { field: 'Performance', title: '绩效系数', width: 60, align: 'left', sortable: true },
                { field: 'TaskRoleName', title: '责任岗位', width: 300, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 300, align: 'left', sortable: true },
                { field: 'AddUserName', title: '计划模板创建人', width: 150, align: 'left', sortable: true },
                {
                    field: 'IsAuditing', title: '审核状态', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "未审核";
                        if (value == '1')
                            str = "已审核";
                        if (value == '2')
                            str = "审核中";
                        if (value == '3')
                            str = "审核不通过";
                        return str;
                    }
                },
                {
                    field: 'IsEnable', title: '是否启用', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "否";
                        if (value == '1')
                            str = "是";
                        return str;
                    }
                },
                {
                    field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        //if (value.length > 10)
                        //    str = str.substr(0, 15) + '...';
                        return str;
                    }
                }
            ]];

            var columnDetail = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'RankName', title: '设备级别', width: 100, align: 'left', sortable: true },
                { field: 'EquipmentName', title: '设备名称', width: 150, align: 'left', sortable: true },
                { field: 'InspectionTypeName', title: '维保类别', width: 80, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 80, align: 'left', sortable: true },
                { field: 'StandardName', title: '标准名称', width: 150, align: 'left', sortable: true },
                {
                    field: 'InspectionContent', title: '维保项目、内容、方法、标准', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        //if (value.length > 10)
                        //    str = str.substr(0, 15) + '...';
                        return str;
                    }
                },
                {
                    field: 'InputType', title: '输入类型', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "文本";
                        if (value == '1')
                            str = "选项";
                        else if (value == '2')
                            str = "数字";
                        return str;
                    }
                },
                {
                    field: 'CheckType', title: '选择类型', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (value == '1')
                            str = "正常/不正常";
                        else if (value == '2')
                            str = "合格/不合格";
                        else if (value == '3')
                            str = "完成/未完成";
                        else if (value == '4')
                            str = "是/否";
                        return str;
                    }
                },
                {
                    field: 'NumType', title: '数字范围', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        var numArr = value.split(',');
                        if (numArr.length > 1) {
                            switch (numArr[0]) {
                                case "1":
                                    str = "＞" + numArr[1];
                                    break;
                                case "2":
                                    str = "＜" + numArr[1];
                                    break;
                                case "3":
                                    str = "≥" + numArr[1];
                                    break;
                                case "4":
                                    str = "≤" + numArr[1];
                                    break;
                                case "5":
                                    str = numArr[1] + "≤?≤" + numArr[2];
                                    break;
                                case "6":
                                    str = numArr[1] + "＜?＜" + numArr[2];
                                    break;
                                default:
                            }
                        }
                        return str;
                    }
                },
                {
                    field: 'IsInspectionRegistration', title: '必填', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == '')
                            str = "否";
                        return str;
                    }
                },
                {
                    field: 'IsControl', title: '异常是否强制报修', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == '')
                            str = "否";
                        return str;
                    }
                }
            ]];
            var columnDetailSpace = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'SpaceName', title: '设备空间', width: 150, align: 'left', sortable: true },
                { field: 'MaintenanceTypeName', title: '维保类别', width: 80, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 80, align: 'left', sortable: true },
                { field: 'StandardName', title: '标准名称', width: 150, align: 'left', sortable: true },
                {
                    field: 'MaintenanceContent', title: '维保项目、内容、方法、标准', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        //if (value.length > 10)
                        //    str = str.substr(0, 15) + '...';
                        return str;
                    }
                },
                {
                    field: 'InputType', title: '输入类型', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "文本";
                        if (value == '1')
                            str = "选项";
                        else if (value == '2')
                            str = "数字";
                        return str;
                    }
                },
                {
                    field: 'CheckType', title: '选择类型', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (value == '1')
                            str = "正常/不正常";
                        else if (value == '2')
                            str = "合格/不合格";
                        else if (value == '3')
                            str = "完成/未完成";
                        else if (value == '4')
                            str = "是/否";
                        return str;
                    }
                },
                {
                    field: 'NumType', title: '数字范围', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        var numArr = value.split(',');
                        if (numArr.length > 1) {
                            switch (numArr[0]) {
                                case "1":
                                    str = "＞" + numArr[1];
                                    break;
                                case "2":
                                    str = "＜" + numArr[1];
                                    break;
                                case "3":
                                    str = "≥" + numArr[1];
                                    break;
                                case "4":
                                    str = "≤" + numArr[1];
                                    break;
                                case "5":
                                    str = numArr[1] + "≤?≤" + numArr[2];
                                    break;
                                case "6":
                                    str = numArr[1] + "＜?＜" + numArr[2];
                                    break;
                                default:
                            }
                        }
                        return str;
                    }
                },
                {
                    field: 'IsMaintenanceRegistration', title: '必填', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == '')
                            str = "否";
                        return str;
                    }
                },
                {
                    field: 'IsControl', title: '异常是否强制报修', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == '')
                            str = "否";
                        return str;
                    }
                },
                {
                    field: 'IsCommCheck', title: '项目是否必选', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                }
            ]];

            var toolbar =
                [
                    {
                        text: '新增计划',
                        iconCls: 'icon-add',
                        handler: function () {
                            var w = top.$(window).width();
                            if ($("#CommId").val() != '') {
                                HDialog.Open(w, '600', '../EquipmentNew/PlanSettingDetail_Maintenance.aspx?OpType=add&CommId=' + $("#CommId").val() + "&CommName=" + encodeURI(encodeURI($("#CommName").val())), '新增计划', false, function callback(_Data) {
                                    LoadBind();
                                });
                            }
                            else {
                                HDialog.Info("请选择左侧项目进行添加!");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '复制计划',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var w = top.$(window).width();
                            var row = $("#DivContainer").datagrid("getSelected");
                            if (row != null) {
                                HDialog.Open(w, '600', '../EquipmentNew/PlanSettingDetail_Maintenance.aspx?Copys=1&OpType=add&Id=' + row.Id + '&CommId=' + row.CommId + "&CommName=" + encodeURI(encodeURI(row.CommName)), '复制计划', false, function callback(_Data) {
                                    LoadBind();
                                });
                            }
                            else {
                                HDialog.Info("请选择一条计划!");
                            }
                        }
                    }
                    //, '-',
                    //{
                    //    text: '修改',
                    //    iconCls: 'icon-edit',
                    //    handler: function () {
                    //        var w = top.$(window).width();
                    //        var row = $("#DivContainer").datagrid("getSelected");
                    //        var CanEdit = ($("#UserCode").val() == row.AddUserId && row.IsAuditing != "1");
                    //        if (row != null) {
                    //            HDialog.Open(w, '600', '../EquipmentNew/PlanSettingDetail_Maintenance.aspx?OpType=edit&Id=' + row.Id + '&CommId=' + row.CommId + "&CommName=" + encodeURI(encodeURI(row.CommName)) + '&CanEdit=' + CanEdit, '编辑计划', false, function callback(_Data) {
                    //                LoadBind();
                    //            });
                    //        } else {
                    //            HDialog.Info("请选中一行数据进行修改!");
                    //        }
                    //    }
                    //}
                    , '-',
                    {
                        text: '删除计划',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var str = "";
                            var row = $("#DivContainer").datagrid("getChecked");
                            if (row.length > 0) {
                                for (var i = 0; i < row.length; i++) {
                                    str += "," + row[i].Id;
                                    if (row[i].IsAuditing == "1") {
                                        HDialog.Info("选中数据中有已审核数据，无法删除！");
                                        return;
                                    }
                                }
                                if (str.length > 0)
                                    str = str.substr(1, str.length - 1);
                                HDialog.Prompt('是否删除选中的数据!', function () {
                                    DelRecord(str);
                                });
                            }
                            else {
                                HDialog.Info("请勾选一行数据进行删除！");
                            }
                        }
                    }
                    //, '-',
                    //{
                    //    text: '审核计划',
                    //    iconCls: 'icon-edit',
                    //    handler: function () {
                    //        $.tool.DataGet('CsEquipment', 'SelFunc_Maintenance', 'FunCode=8001',
                    //            function Init() {
                    //            },
                    //            function callback(_Data) {
                    //                if (_Data == "false") {
                    //                    HDialog.Info("无审核权限！");
                    //                    return;
                    //                }
                    //                var str = "";
                    //                var row = $("#DivContainer").datagrid("getChecked");

                    //                if (row.length > 0) {
                    //                    for (var i = 0; i < row.length; i++) {
                    //                        str += "," + row[i].Id;
                    //                        if (row[i].IsAuditing == "1") {
                    //                            HDialog.Info("选中数据中有已审核数据，无法反向审核！");
                    //                            return;
                    //                        }
                    //                    }
                    //                    if (str.length > 0)
                    //                        str = str.substr(1, str.length - 1);
                    //                    HDialog.Prompt('是否审核选中的数据!', function () {
                    //                        Examine(str);
                    //                    });
                    //                }
                    //                else {
                    //                    HDialog.Info("请勾选一行数据进行审核！");
                    //                }
                    //            },
                    //            function completeCallback() {
                    //            },
                    //            function errorCallback() {
                    //            });
                    //    }
                    //}
                    , '-',
                    {
                        text: '启/停用计划',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var str = "";
                            var row = $("#DivContainer").datagrid("getChecked");
                            if (row.length > 0) {
                                for (var i = 0; i < row.length; i++) {
                                    str += "," + row[i].Id;
                                }
                                if (str.length > 0)
                                    str = str.substr(1, str.length - 1);
                                Enable(str);
                            }
                            else {
                                HDialog.Info("请勾选一行数据进行操作！");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '修改模板责任人',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainer").datagrid("getChecked");
                            if (row.length > 0) {
                                var str = '';
                                for (var i = 0; i < row.length; i++) {
                                    if (row[i].IsAuditing == "2") {
                                        HDialog.Info("审核中计划无法修改！");
                                        return;
                                    }
                                    //if ($("#UserCode").val() != row[i].AddUserId) {
                                    //    HDialog.Info("只能修改本人添加的计划！");
                                    //    return;
                                    //}
                                    str += "," + row[i].Id;
                                }
                                if (str.length > 0)
                                    str = str.substr(1, str.length - 1);
                                HDialog.Open('720', '190', '../EquipmentNew/PlanTaskUserEdit_Maintenance.aspx?Id=' + str + '&CommId=' + row[0].CommId, '修改', true, function callback(_Data) {
                                    LoadBind();
                                });
                            } else {
                                HDialog.Info("请选择修改的数据。");
                                return;
                            }
                        }
                    }
                    , '-',
                    {
                        text: '筛选计划',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }

                ];

            var toolbarDetail =
                [
                    {
                        text: '工艺路线复位',
                        iconCls: 'icon-add',
                        handler: function () {
                            if ($("#PlanId").val() == "") {
                                HDialog.Info("请选择维保计划!");
                                return false;
                            }
                            HDialog.Open('700', '460', '../EquipmentNew/PlanDetail_Add_Maintenance.aspx?&PlanId=' + $("#PlanId").val(), '工艺路线复位', true, function callback(_Data) {
                                LoadBindDetail();
                            });
                        }
                    }
                    , '-',
                    {
                        text: '修改工艺路线',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainerDetail").datagrid("getSelected");

                            if (row != null) {
                                HDialog.Open('700', '460', '../EquipmentNew/PlanDetail_Edit_Maintenance.aspx?DetailId=' + row.DetailId, '修改工艺路线', true, function callback(_Data) {
                                    LoadBindDetail();
                                });
                            } else {
                                HDialog.Info("请选中一行数据进行修改!");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '删除工艺路线',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var str = "";
                            var row = $("#DivContainerDetail").datagrid("getChecked");
                            if (row.length > 0) {
                                for (var i = 0; i < row.length; i++) {
                                    str += "," + row[i].DetailId;
                                }
                                if (str.length > 0)
                                    str = str.substr(1, str.length - 1);
                                HDialog.Prompt('是否删除选中的数据!', function () {
                                    DelRecordDetail(str);
                                });
                            }
                            else {
                                alert("请选择一行数据进行删除！");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '筛选工艺路线',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg1').parent().appendTo($("form:first"))
                            $('#SearchDlg1').dialog('open');
                        }
                    }
                ];

            var toolbarDetailSpace =
                [
                    {
                        text: '工艺路线复位',
                        iconCls: 'icon-add',
                        handler: function () {
                            if ($("#PlanId").val() == "") {
                                HDialog.Info("请选择维保计划!");
                                return false;
                            }
                            AddPlanDetail_Maintenance_Space($("#PlanId").val());
                        }
                    }
                    , '-',
                    {
                        text: '修改工艺路线',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainerDetailSpace").datagrid("getSelected");
                            if (row.IsCommCheck == '1') {
                                HDialog.Info("总部设置为必选无法修改！");
                                return false;
                            }
                            if (row != null) {
                                HDialog.Open('700', '460', '../EquipmentNew/PlanDetail_Edit_Maintenance_Space.aspx?DetailId=' + row.DetailId, '修改工艺路线', true, function callback(_Data) {
                                    LoadBindDetailSpace();
                                });
                            } else {
                                HDialog.Info("请选中一行数据进行修改!");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '删除工艺路线',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var str = "";
                            var row = $("#DivContainerDetailSpace").datagrid("getChecked");
                            if (row.length > 0) {
                                for (var i = 0; i < row.length; i++) {
                                    str += "," + row[i].DetailId;
                                    if (row[i].IsCommCheck == '1') {
                                        HDialog.Info("总部设置为必选无法删除！");
                                        return false;
                                    }
                                }
                                if (str.length > 0)
                                    str = str.substr(1, str.length - 1);
                                HDialog.Prompt('是否删除选中的数据!', function () {
                                    DelRecordDetailSpace(str);
                                });
                            }
                            else {
                                alert("请选择一行数据进行删除！");
                            }
                        }
                    }
                    , '-',
                    {
                        text: '筛选工艺路线',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg2').parent().appendTo($("form:first"))
                            $('#SearchDlg2').dialog('open');
                        }
                    }
                ];

            var toolbarDetailAuditing =
                [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg1').parent().appendTo($("form:first"))
                            $('#SearchDlg1').dialog('open');
                        }
                    }
                ];

            var toolbarDetailAuditingSpace =
                [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg2').parent().appendTo($("form:first"))
                            $('#SearchDlg2').dialog('open');
                        }
                    }
                ];


            //加载数据
            function LoadBind() {
                $("#DivContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetPlan_Maintenance&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    border: false,
                    pagination: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    singleSelect: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        $("#PlanId").val(rowData.Id);
                        $("#IsAuditing").val(rowData.IsAuditing);
                        LoadSysSpaceId();
                        LoadBindDetail();
                        LoadBindDetailSpace();
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadSysSpaceId() {
                $.tool.DataPostAsync('CsEquipment', 'BindSysSpaceId_Maintenance', 'PlanId=' + $("#PlanId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#SysSpaceId").empty();
                        $("#SysSpaceId").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            option = "<option value='" + varObjects[i].ID + "'>" + varObjects[i].Name + "</option>";
                            $("#SysSpaceId").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }

            function LoadBindDetail() {
                var tool = [];
                if ($("#IsAuditing").val() == "1")
                    tool = toolbarDetailAuditing
                else
                    tool = toolbarDetail
                url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetPlanDetail_Maintenance&PlanId=' + $("#PlanId").val() + '&EquipmentName=' + $("#EquipmentName").val() + '&InputType=' + $("#InputType").val() + '&RankName=' + $("#RankName").val();
                $("#DivContainerDetail").datagrid({
                    url: url,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    singleSelect: true,
                    rownumbers: true,
                    columns: columnDetail,
                    fitColumns: false,
                    pagination: true,
                    remoteSort: false,
                    selectOnCheck: false,
                    checkOnSelect: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: tool,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg1").dialog("close");
                    }
                });
            }

            function LoadBindDetailSpace() {
                var tool = [];
                if ($("#IsAuditing").val() == "1")
                    tool = toolbarDetailAuditingSpace
                else
                    tool = toolbarDetailSpace
                url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetPlanDetail_Maintenance_Space&PlanId=' + $("#PlanId").val() + '&InputType=' + $("#SpaceInputType").val() + '&SysSpaceId=' + $("#SysSpaceId").val();
                $("#DivContainerDetailSpace").datagrid({
                    url: url,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    singleSelect: true,
                    rownumbers: true,
                    columns: columnDetailSpace,
                    fitColumns: false,
                    pagination: true,
                    remoteSort: false,
                    selectOnCheck: false,
                    checkOnSelect: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: tool,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg2").dialog("close");
                    }
                });
            }
        </script>

    </form>
</body>
</html>
