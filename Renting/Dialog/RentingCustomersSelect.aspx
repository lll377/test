<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RentingCustomersSelect.aspx.cs" Inherits="M_Main.Renting.Dialog.RentingCustomersSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-选择承租方（潜在客户和正式客户）</title>
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
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }

            .form-horizontal .form-group {
                margin: 0;
                margin-top: 5px;
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: auto;">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="潜在客户" style="overflow: hidden;">
            <table id="TableContainerKS" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab1" data-issel="false" title="正式业主" style="overflow: hidden;">
            <table id="TableContainerYZ" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab2" data-issel="false" title="租赁客户" style="overflow: hidden;">
            <table id="TableContainerZH" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab3" data-issel="false" title="临时客户" style="overflow: hidden;">
            <table id="TableContainerLS" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <!-- 潜在客户 -->
    <div id="toolbarKS" class="easyui-panel" data-options="closed:true">
        <form id="frmKS" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="CustTypeName" name="CustTypeName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
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
                <div class="col-sm-4 col-xs-4">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitKSGrid();">筛选</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 业主 -->
    <div id="toolbarYZ" class="easyui-panel" data-options="closed:true">
        <form id="frmYZ" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="CustName2" typ="text" name="CustName2" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="RoomSigns2" typ="text" name="RoomSigns2" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="MobilePhone2" typ="text" name="MobilePhone2" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <div class="col-sm-3 col-xs-3">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitYZGrid();">筛选</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 租户 -->
    <div id="toolbarZH" class="easyui-panel" data-options="closed:true">
        <form id="frmZH" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="CustName3" typ="text" name="CustName3" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="RoomSigns3" typ="text" name="RoomSigns3" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="MobilePhone3" typ="text" name="MobilePhone3" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <div class="col-sm-3 col-xs-3">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitZHGrid();">筛选</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 临时 -->
    <div id="toolbarLS" class="easyui-panel" data-options="closed:true">
        <form id="frmLS" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="CustName4" typ="text" name="CustName4" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="RoomSigns4" typ="text" name="RoomSigns4" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="MobilePhone4" typ="text" name="MobilePhone4" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <div class="col-sm-3 col-xs-3">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitLSGrid();">筛选</a>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            $('.easyui-tabs').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitKSGrid();
        });

        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    setTimeout(function () {
                        InitYZGrid();
                    }, 300);
                } else if (index == 2) {
                    setTimeout(function () {
                        InitZHGrid();
                    }, 300);
                } else if (index == 3) {
                    setTimeout(function () {
                        InitLSGrid();
                    }, 300);
                }
            }
        }

        /* 潜在客户 */
        function SelCustType() {
            var param = {
                IsMultiple: "否"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    $("#CustTypeID").val(data[0].CustTypeID);
                    $("#CustTypeName").textbox("setValue", data[0].CustTypeName);
                }
            });
        }

        var columnKS = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'PaperCode', title: '证件号码', width: 140, align: 'center' },
            { field: 'LegalRepr', title: '法定代表人', width: 160, align: 'center' },
            { field: 'LegalReprTel', title: '法定代表人电话', width: 140, align: 'center' },
            { field: 'ConnectPeople', title: '联系人', width: 180, align: 'center' },
            { field: 'ConnectPeopleTel', title: '联系人电话', width: 100, align: 'center' },
            //{ field: 'TradeStateName', title: '客户经营业态', width: 100, align: 'center' },
            //{ field: 'BusinessBrand', title: '客户经营品牌', width: 140, align: 'center' },
            //{ field: 'BusinessLevel', title: '客户经营级别', width: 140, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 100, align: 'center' },
            { field: 'AssignUserName', title: '分派人', width: 100, align: 'center' },
            {
                field: 'AssignTime', title: '分派时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'FollowUpStageName', title: '跟进阶段', width: 120, align: 'center' }
        ]];
        function InitKSGrid() {
            $("#TableContainerKS").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: columnKS,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbarKS",
                remoteSort: false,
                onDblClickRow: function (rowIndex, rowData) {
                    ValidateKS(rowData.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_PotentialCustomers";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("frmKS");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                }
            });
        }
        //验证当前选择的潜在客户 是否已生成正式客户如果不存在就新增一个临时客户，并且选择当前新增客户，如果存在就选择对应的客户
        function ValidateKS(KSID) {
            $.dataPostJson('RentingPublicClass', 'ValidatePotentialCustomers', { "ID": KSID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        var Resultdata = $.parseJSON(data.data);
                        LayerDialog.ReturnIsJson = true;
                        LayerDialog.Close(Resultdata[0]);
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        /* 业主 */
        var columnYZ = [[
            { field: 'CustName', title: '客户名称', width: 160, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left' },
            { field: 'PaperCode', title: '身份证号', width: 120, align: 'left' },
            { field: 'MobilePhone', title: '联系电话', width: 120, align: 'left' },
            { field: 'LiveTypeName', title: '分类', width: 50, align: 'left' }
        ]];
        function InitYZGrid() {
            $("#TableContainerYZ").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnYZ,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: "#toolbarYZ",
                onDblClickRow: function (rowIndex, rowData) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(rowData);
                },
                onBeforeLoad: function (param) {
                    param.Class = "RentingPublicClass";
                    param.Method = "GetCustomerList";
                    param.LiveType = "1";
                    var paramJson = $.getFromParam("frmYZ");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
        }


        /* 租户 */
        var columnZH = [[
            { field: 'CustName', title: '客户名称', width: 140, align: 'left' },
            { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left' },
            { field: 'PaperCode', title: '身份证号', width: 140, align: 'left' },
            { field: 'MobilePhone', title: '联系电话', width: 120, align: 'left' },
            { field: 'LiveTypeName', title: '分类', width: 50, align: 'left' }
        ]];
        function InitZHGrid() {
            $("#TableContainerZH").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnZH,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: "#toolbarZH",
                onDblClickRow: function (rowIndex, rowData) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(rowData);
                },
                onBeforeLoad: function (param) {
                    param.Class = "RentingPublicClass";
                    param.Method = "GetCustomerList";
                    param.LiveType = "2";
                    var paramJson = $.getFromParam("frmZH");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('3', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
        }

        /* 临时 */
        var columnLS = [[
            { field: 'CustName', title: '客户名称', width: 180, align: 'left' },
            { field: 'PaperCode', title: '身份证号', width: 100, align: 'left' },
            { field: 'MobilePhone', title: '联系电话', width: 120, align: 'left' },
            { field: 'LiveTypeName', title: '分类', width: 50, align: 'left' }
        ]];
        function InitLSGrid() {
            $("#TableContainerLS").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnLS,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: "#toolbarLS",
                onDblClickRow: function (rowIndex, rowData) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(rowData);
                },
                onBeforeLoad: function (param) {
                    param.Class = "RentingPublicClass";
                    param.Method = "GetCustomerList";
                    param.LiveType = "3";
                    var paramJson = $.getFromParam("frmLS");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('4', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
        }
    </script>
</body>
</html>


