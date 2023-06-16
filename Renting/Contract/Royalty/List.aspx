<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Contract.Royalty.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-租赁合同-合同提成列表页面</title>
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
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="RoomNames" name="RoomNames" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractSign" name="ContractSign" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractBeginTime" name="StartContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractBeginTime" name="EndContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractName" name="ContractName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同结束时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractEndTime" name="StartContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractEndTime" name="EndContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        机构部门/<br />
                        负责人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#DutyDepCode').val('');
                                            $('#DutyUserCode').val('');
                                            }}] " />
                        <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                        <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeStart" name="SignUpTimeStart" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeEnd" name="SignUpTimeEnd" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">发起人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="WorkStartUserName" name="WorkStartUserName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">发起时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartWorkStartDate" name="StartWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndWorkStartDate" name="EndWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>

                    <%--<label class="col-sm-1 col-xs-1 control-label">审核状态</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="AuditStatus" name="AuditStatus" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',multiple:true,
                                    valueField:'id',textField:'text',data: [{id: '未启动',text: '未启动'},{id: '审核中',text: '审核中'},{id: '已审核',text: '已审核'}
                              ,{id: '审核不通过',text: '审核不通过'},{id: '已驳回',text: '已驳回'}]"
                            runat="server" />
                    </div>--%>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">变更类型</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractChangeType" name="ContractChangeType" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',multiple:true,
                                    valueField:'id',textField:'text',data: [{id: '变更',text: '变更'},{id: '退租',text: '退租'}]"
                            runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">是否退租</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="IsRentOut" name="IsRentOut" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '否',text: '否'},{id: '是',text: '是'}]"
                            runat="server" />
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
            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });

            InitDataGrid();
        });

        ///选择 机构部门/负责人
        function SelDutyDepNameAndUserName() {
            LayerDialog.OpenWin('640', '400', '/HM/M_Main/Renting/Dialog/DepartAndUserSelect.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }

        //加载 列表
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
        ];

        var column = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            {
                field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"ViewTenantryCust('" + row.TenantryCustID + "','" + row.CommID + "')\" \">" + value + "</a>";
                    return str;
                }
            },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 140, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"Edit('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 140, align: 'center' },
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
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '租金标准', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
            { field: 'ContractDepositPrice', title: '保证金(元)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '租金标准(元)', width: 100, align: 'center' },
            { field: 'DutyDepName', title: '机构部门', width: 140, align: 'center' },
            { field: 'DutyUserName', title: '负责人', width: 100, align: 'center' },
            {
                field: 'SignUpTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 100, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
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
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_ContractRoyalty", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_search').dialog('close');
        }
        function Edit(id, OpType) {
            var param = { "OpType": OpType, "ContractID": id };
            var w = '1200';
            var h = $(window).height();
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Royalty/Frame.aspx?' + $.param(param), "合同登记信息", true, function callback(_Data) {
                if (_Data != "") {
                    InitDataGrid();
                }
            });
        }
        //查看客户详情
        function ViewTenantryCust(TenantryCustID, CommID) {
            var param = { CommID: CommID, CustID: TenantryCustID };
            var w = '1200';
            var h = $(window).height();
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Merchants/RentSubscription/CustomerView.aspx?' + $.param(param), "查看客户详细信息", true, function callback(_Data) {
                if (_Data != "") {
                }
            });
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }
    </script>
</body>
</html>
