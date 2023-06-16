<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractList.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房屋租赁合同列表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #dlg_search_AuditSet {
            padding: 10px;
            width: auto;
            height: auto;
        }

        .SearchTable {
            width: 820px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 12%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 20%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 97%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
    </div>
    <div id="dlg_search_AuditSet" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom" runat="server">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">租户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TenantryCustName" name="TenantryCustName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="LeaseRoomSigns" name="LeaseRoomSigns" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">合同编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractSign" name="ContractSign" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractName" name="ContractName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">合同开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractBeginTimeBegin" name="ContractBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractBeginTimeEnd" name="ContractBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractEndTimeBegin" name="ContractEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractEndTimeEnd" name="ContractEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">机构部门/负责人</td>
                    <td class="TdContentSearch">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-searchbox" searcher="SelDutyDepNameAndUserName" data-options="editable:false" />
                        <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                        <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">签约时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractSignTimeBegin" name="ContractSignTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractSignTimeEnd" name="ContractSignTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">变更状态</td>
                    <td class="TdContentSearch">
                        <select id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value=""></option>
                            <option value="变更">变更</option>
                            <option value="退租">退租</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="WorkStartDateBegin" name="WorkStartDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="WorkStartDateEnd" name="WorkStartDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">审批状态</td>
                    <td class="TdContentSearch">
                        <select id="AuditStatus" name="AuditStatus" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value=""></option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="已驳回">已驳回</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否退租</td>
                    <td class="TdContentSearch">
                        <select id="IsRentOut" name="IsRentOut" class="easyui-combobox" style="width:60px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value=""></option>
                            <option value="否" selected>否</option>
                            <option value="是">是</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript"> 
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
        }

        function ClearWhere() {
            $('#frmFrom').form('clear');
            $('#IsRentOut').combobox("setValue", '否');
        }
        //选择机构/负责人
        function SelDutyDepNameAndUserName() {
            HDialog.Open(600, 450, "../DialogNew/ContractUserDlg.aspx", '机构部门/负责人选择', false, function callback(_Data) {
                if (_Data != "") {
                    var data = JSON.parse(_Data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').searchbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }

        var column = [[
            {
                field: 'TenantryCustName', title: '租户名称', width: 220, align: 'left', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"ViewTenantryCust('" + row.TenantryCustID + "')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            },
            {
                field: 'LeaseRoomSigns', title: '房屋编号', width: 200, align: 'left', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'FixedTel', title: '固定电话', width: 120, align: 'center' },
            { field: 'TenantryConnectTel', title: '移动电话', width: 120, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 180, align: 'left', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Detail('edit','" + row.ID + "','')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractTotalPrice', title: '合同总额', width: 100, align: 'center' },
            { field: 'DutyDepName', title: '机构部门', width: 200, align: 'center' },
            { field: 'DutyUserName', title: '负责人', width: 100, align: 'center' },
            {
                field: 'ContractSignTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 80, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];

        var toolbar = [
            {
                text: '新签',
                iconCls: 'icon-add',
                handler: function () {
                    Detail("insert", '', '新签');
                }
            }, '-',
            {
                text: '续签',
                iconCls: 'icon-add',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要续签的租赁合同数据!');
                        return;
                    }
                    Detail("insert", row.ID, '续签');
                }
            }, '-',
            {
                text: '变更合同签约、登记时间',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要变更租赁合同数据!');
                        return;
                    }
                    if (row.IsRentOut == "是") {
                        HDialog.Info('已退租的租赁合同不允许修改!');
                        return;
                    }
                    UpdateContractSignAndRegisterTime(row.ID);
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要删除的租赁合同数据!');
                        return;
                    }
                    if (row.AuditStatus != "未启动" || row.AuditStatus == "已驳回") {
                        HDialog.Info('当前应租赁合同不允许删除!');
                        return;
                    }
                    if (row.IsRentOut == "是") {
                        HDialog.Info('已退租的租赁合同不允许修改!');
                        return;
                    }
                    Del(row.ID);
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_AuditSet').dialog('open');
                }
            }, '-',
            {
                text: '查看更名历史',
                iconCls: 'icon-shape_square_edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要查看更名历史的租赁合同数据!');
                        return;
                    }
                    ViewChangeNameHistory(row.TenantryCustID);
                }
            }
        ];

        //查看租户信息
        function ViewTenantryCust(CustID) {
            var w = $(window).width() - 100;
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseContractCustinformationManage.aspx?OpType=edit&IsDetail=&CustID=' + CustID, "租户信息详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }

        //详情
        function Detail(OpType, ID, SignType) {
            var w = $(window).width() - 100;
            var h = $(window).height();
            HDialog.Open(w, h, '../LeaseManage/LeaseContractDetail.aspx?OpType=' + OpType + '&ID=' + ID + "&SignType=" + SignType, "租赁合同详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //变更合同登记时间、签约时间  
        function UpdateContractSignAndRegisterTime(ID) {
            var w = "440";
            var h = "320";
            HDialog.Open(w, h, '../LeaseManage/LeaseContractUpdateSignAndRegister.aspx?ID=' + ID, "变更合同签约、登记时间", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //删除
        function Del(IdList) {
            $.messager.confirm('温馨提示', '确定删除选择的租赁合同?', function (r) {
                if (r) {
                    $.tool.DataPostJson('LeaseManage', 'DelLeaseContract', "idList=" + IdList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                HDialog.Info("删除成功");
                                LoadList();
                            } else {
                                HDialog.Info(data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        //查看更名历史
        function ViewChangeNameHistory(ID) {
            var w = $(window).width() - 100;
            var h = $(window).height();
            HDialog.Open(w, h, '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + ID, '更名历史', false,
                function callback(_Data) {
                });
        }

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                remoteSort: false,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                pagination: true,
                toolbar: toolbar,
                border: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("LeaseManage", "GetLeaseContractList", "TableContainer", param);
                }
            });
            $("#dlg_search_AuditSet").dialog("close");
        }
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });
    </script>

</body>
</html>
