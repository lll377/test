<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.FollowUp.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-招商管理-商机跟进查询页面</title>
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
                    <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustTypeName" name="CustTypeName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCustType();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CustTypeID').val('');
                                    }}] " />
                        <input type="hidden" id="CustTypeID" name="CustTypeID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">跟进阶段</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpStageName" name="FollowUpStageName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelFollowUpStage();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#FollowUpStageID').val('');
                                    }}] " />
                        <input type="hidden" id="FollowUpStageID" name="FollowUpStageID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">跟进时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpTimeStart" name="FollowUpTimeStart" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpTimeEnd" name="FollowUpTimeEnd" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户对接人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeople" name="CustMeetPeople" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">对接人职位</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeoplePosition" name="CustMeetPeoplePosition" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">对接人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeopleTel" name="CustMeetPeopleTel" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">跟进人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpUserName" name="FollowUpUserName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
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
            InitDataGrid();
        });

        function SelCustType() {
            var param = {
                IsMultiple: "是"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let CustTypeID = "";
                    let CustTypeName = "";
                    data.forEach((itemRow) => {
                        CustTypeID = CustTypeID + itemRow.CustTypeID + ",";
                        CustTypeName = CustTypeName + itemRow.CustTypeName + ",";
                    });
                    if (CustTypeID.endsWith(",")) {
                        CustTypeID = CustTypeID.substring(0, CustTypeID.length - 1)
                        CustTypeName = CustTypeName.substring(0, CustTypeName.length - 1)
                    }

                    $("#CustTypeID").val(CustTypeID); // 
                    $("#CustTypeName").textbox("setValue", CustTypeName); //
                }
            });
        }

        //选择跟进阶段
        function SelFollowUpStage() {
            var param = {
                IsMultiple: "是",
                Type: "跟进阶段"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择跟进阶段", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let FollowUpStageID = "";
                    let FollowUpStageName = "";
                    data.forEach((itemRow) => {
                        FollowUpStageID = FollowUpStageID + itemRow.ID + ",";
                        FollowUpStageName = FollowUpStageName + itemRow.Name + ",";
                    });
                    if (FollowUpStageID.endsWith(",")) {
                        FollowUpStageID = FollowUpStageID.substring(0, FollowUpStageID.length - 1)
                        FollowUpStageName = FollowUpStageName.substring(0, FollowUpStageName.length - 1)
                    }

                    $("#FollowUpStageID").val(FollowUpStageID); // 
                    $("#FollowUpStageName").textbox("setValue", FollowUpStageName); //
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
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainer').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = $.getParam();
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "客户跟进信息";
                    param.Class = 'Renting_PotentialCustomers_FollowUp';
                    param.Method = "GetListSqlWhereSearch";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];
        var column = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            {
                field: 'CustName', title: '客户名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"FollowUpEdit('" + row.ID + "','Detail')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'FollowUpStageName', title: '跟进阶段', width: 100, align: 'center' },
            {
                field: 'FollowUpTime', title: '跟进时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'CustMeetPeople', title: '客户对接人', width: 200, align: 'center' },
            { field: 'CustMeetPeoplePosition', title: '对接人职位', width: 100, align: 'center' },
            { field: 'CustMeetPeopleTel', title: '对接人电话', width: 120, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 100, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
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
                    param = $.getDataGridParam("Renting_PotentialCustomers_FollowUp", "GetListSearch", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_search').dialog('close');
        }
        function FollowUpEdit(id, OpType, PotentialCustomersID = '', CustName = '', ConnectPeople = '', ConnectPeopleTel = '') {
            var param = {
                OpType: OpType,
                ID: id,
                PotentialCustomersID: PotentialCustomersID,
                CustName: CustName,
                ConnectPeople: ConnectPeople,
                ConnectPeopleTel: ConnectPeopleTel
            }
            LayerDialog.OpenWin('900', '530', '/HM/M_Main/Renting/Merchants/PotentialCustomers/FollowUp/Edit.aspx?' + $.param(param), "客户跟进编辑", true, function callback(_Data) {
                if (_Data != "") {
                }
            });
        }
    </script>
</body>
</html>
