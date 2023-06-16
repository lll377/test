<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractCustomer.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.SelContractCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同管理-选择当前项目业主、租户、临时客户和所有的客商</title>
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
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            background-color: white;
        }

        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
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
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'120'">
        <div id="tab0" data-issel="true" title="客商" style="overflow: hidden;">
            <div id="TableContainerKS" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="业主" style="overflow: hidden;">
            <div id="TableContainerYZ" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab2" data-issel="false" title="租户" style="overflow: hidden;">
            <div id="TableContainerZH" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab3" data-issel="false" title="临时" style="overflow: hidden;">
            <div id="TableContainerLS" style="background-color: #cccccc;"></div>
        </div>
    </div>
    <!-- 客商 -->
    <div id="toolbarKS" class="easyui-panel" data-options="closed:true">
        <form id="frmKS">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>管理单位</span></td>
                    <td class="text">
                        <input id="MerchantsUnit" typ="text" name="MerchantsUnit" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>客商名称</span></td>
                    <td class="text">
                        <input id="MerchantsName" typ="text" name="MerchantsName" runat="server" class="easyui-textbox" />
                        <input type="hidden" id="CommID1" name="CommID1" />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitKSGrid();">筛选</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 业主 -->
    <div id="toolbarYZ" class="easyui-panel" data-options="closed:true">
        <form id="frmYZ">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input id="CommName2" typ="text" name="CommName2" runat="server" class="easyui-textbox"
                            data-options="editable:false,tipPosition:'bottom',multiline:false,buttonText:'',buttonIcon:'icon-search',onClickButton:function(){selComm('yz');}" />
                        <input type="hidden" id="CommID2" name="CommID2" />
                    </td>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName2" typ="text" name="CustName2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns2" typ="text" name="RoomSigns2" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>联系电话</span></td>
                    <td class="text">
                        <input id="MobilePhone2" typ="text" name="MobilePhone2" runat="server" class="easyui-textbox" />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitYZGrid();">筛选</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 租户 -->
    <div id="toolbarZH" class="easyui-panel" data-options="closed:true">
        <form id="frmZH">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input id="CommName3" typ="text" name="CommName3" runat="server" class="easyui-textbox"
                            data-options="editable:false,tipPosition:'bottom',multiline:false,buttonText:'',buttonIcon:'icon-search',onClickButton:function(){selComm('zh');}" />
                        <input type="hidden" id="CommID3" name="CommID3" />
                    </td>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName3" typ="text" name="CustName3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns3" typ="text" name="RoomSigns3" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>联系电话</span></td>
                    <td class="text">
                        <input id="MobilePhone3" typ="text" name="MobilePhone3" runat="server" class="easyui-textbox" />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitZHGrid();">筛选</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 临时 -->
    <div id="toolbarLS" class="easyui-panel" data-options="closed:true">
        <form id="frmLS">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input id="CommName4" typ="text" name="CommName4" runat="server" class="easyui-textbox"
                            data-options="editable:false,tipPosition:'bottom',multiline:false,buttonText:'',buttonIcon:'icon-search',onClickButton:function(){selComm('ls');}" />
                        <input type="hidden" id="CommID4" name="CommID4" />
                    </td>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName4" typ="text" name="CustName4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns4" typ="text" name="RoomSigns4" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>联系电话</span></td>
                    <td class="text">
                        <input id="MobilePhone4" typ="text" name="MobilePhone4" runat="server" class="easyui-textbox" />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitLSGrid();">筛选</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script type="text/javascript">
        //页面初始化
        $(function () {
            var CommID = $.getUrlParam("CommID");
            var CommName = $.getUrlParam("CommName");
            if (CommID != null) {
                $("#CommID1").val(CommID);
                $("#CommID2").val(CommID);
                $("#CommID3").val(CommID);
                $("#CommID4").val(CommID);
                $("#CommName2").textbox("setValue", CommName);
                $("#CommName3").textbox("setValue", CommName);
                $("#CommName4").textbox("setValue", CommName);
            }
            $('.easyui-textbox').textbox({ "width": "130" });
            var h = $(window).height();
            $('.easyui-tabs').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitKSGrid();
        });

        function tabsSelect(title, index) {
            if (index == 1) {
                if ($('#tab1').data("issel") == false) {
                    $('#tab1').data("issel", "true")
                    setTimeout(function () {
                        InitYZGrid();
                    }, 300);
                }
            } else if (index == 2) {
                if ($('#tab2').data("issel") == false) {
                    $('#tab2').data("issel", "true")
                    setTimeout(function () {
                        InitZHGrid();
                    }, 300);
                }
            } else if (index == 3) {
                if ($('#tab3').data("issel") == false) {
                    $('#tab3').data("issel", "true")
                    setTimeout(function () {
                        InitLSGrid();
                    }, 300);
                }
            }
        }
        //选择当前登录用户具有项目权限的项目
        function selComm(Type) {
            LayerDialog.OpenWin('680', '500', '../DiversifiedManage/Dialog/SelContractCommByCommRole.aspx', "选择项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    if (Type == 'yz') {
                        $("#CommID2").val(data.attributes.CommID);
                        $("#CommName2").textbox("setValue", data.text);
                        InitYZGrid();
                    } else if (Type == 'zh') {
                        $("#CommID3").val(data.attributes.CommID);
                        $("#CommName3").textbox("setValue", data.text);
                        InitZHGrid();
                    } else if (Type == 'ls') {
                        $("#CommID4").val(data.attributes.CommID);
                        $("#CommName4").textbox("setValue", data.text);
                        InitLSGrid();
                    }
                }
            });
        }
        /* 客商 */
        var columnKS = [[
            { field: 'MerchantsUnit', title: '管理单位', width: 140, align: 'left' },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 120, align: 'left' },
            { field: 'MerchantsName', title: '客商名称', width: 160, align: 'left' },
            { field: 'CertificatesNo', title: '证件号码', width: 120, align: 'left' },
            { field: 'ContactPeople', title: '联系人', width: 100, align: 'left' },
            { field: 'ContactPhoneNo', title: '联系电话', width: 100, align: 'left' },
            { field: 'ContactAddress', title: '联系地址', width: 160, align: 'left' },
            { field: 'ChargePeople', title: '负责人', width: 100, align: 'left' },
            { field: 'ChargePeoplePhoneNo', title: '负责人电话', width: 100, align: 'left' },
            { field: 'TradeStateName', title: '客商经营业态', width: 100, align: 'left' },
            { field: 'Brand', title: '客商经营品牌', width: 100, align: 'left' },
            { field: 'Level', title: '客商经营级别', width: 100, align: 'left' }
        ]];
        function InitKSGrid() {
            $("#TableContainerKS").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnKS,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: "#toolbarKS",
                onDblClickRow: function (rowIndex, rowData) {
                    ValidateKS(rowData.ID);
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractMerchantsList";
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
        //验证当前选择的客商是否存在当前项目 如果存在 就选择当前项目的客户出来，如果不存在就新增一个临时客户，并且选择当前新增客户
        function ValidateKS(KSID) {
            $.tool.DataPostJson('DiversifiedManage', 'ContractValidateMerchants', "ID=" + KSID + "&CommID=" + $('#CommID1').val(),
                function Init() {
                },
                function callback(data) {
                    if (isValueNull(data)) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(data[0]);
                    }
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
                url: '/HM/M_Main/HC/DataPostControl.aspx',
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
                    //当前选择的客户是当前项目的
                    if ($('#CommID1').val() == rowData.CommID) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    } else {
                        ValidateCustomer(rowData.CustID);
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractCustomerList";
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
                url: '/HM/M_Main/HC/DataPostControl.aspx',
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
                    //当前选择的客户是当前项目的
                    if ($('#CommID1').val() == rowData.CommID) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    } else {
                        ValidateCustomer(rowData.CustID);
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractCustomerList";
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
                url: '/HM/M_Main/HC/DataPostControl.aspx',
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
                    //当前选择的客户是当前项目的
                    if ($('#CommID1').val() == rowData.CommID) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    } else {
                        ValidateCustomer(rowData.CustID);
                    }
                },
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "GetContractCustomerList";
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


        //验证客户是否是当前项目存在
        function ValidateCustomer(CustID) {
            $.tool.DataPostJson('DiversifiedManage', 'ContractValidateCustomer', "ID=" + CustID + "&CommID=" + $('#CommID1').val(),
                function Init() {
                },
                function callback(data) {
                    if (isValueNull(data)) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(data[0]);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }


    </script>
</body>
</html>

