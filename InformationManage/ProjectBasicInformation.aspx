<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectBasicInformation.aspx.cs" Inherits="M_Main.InformationManage.ProjectBasicInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目基础信息</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/self-vilidate.js"></script>
    <script src="../jscript/help.js"></script>
    <script src="../jscript/jquery.form.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 14%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 36%;
            text-align: left;
        }
    </style>
</head>
<body>
    <input type="hidden" id="OpType" runat="server" name="OpType" />
    <div style="margin: 10px; display: block;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">项目合同/接管信息</legend>
            <div id="mianScheme">
                <table id="dgScheme" border="0" cellspacing="0" cellpadding="0"></table>
            </div>
        </fieldset>
        <form id="basicform" runat="server">
            <input type="hidden" id="IID" runat="server" name="IID" />
            <%-- <input type="hidden" id="LongTimeStamp" name="LongTimeStamp" />--%>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目名称</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>项目名称</span>
                        </td>
                        <td class="text">
                            <input type="hidden" id="CommID" name="CommID" runat="server" />
                            <label id="CommName" runat="server"></label>
                        </td>
                        <td class="title"><span>项目简称</span></td>
                        <td class="text">
                            <input id="CommSortName" name="CommSortName" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>推广(销售)名称</span></td>
                        <td class="text">
                            <input id="CommSellName" name="CommSellName" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                        <td class="title"><span>报建名称</span></td>
                        <td class="text">
                            <input id="CommBuildName" name="CommBuildName" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>项目编码</span></td>
                        <td class="text">
                            <input id="CommCode" name="CommCode" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                        <td class="title"><span>项目系统编码</span></td>
                        <td class="text">
                            <input id="SysCommID" name="SysCommID" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                </table>

            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目归属</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>所属片区</span>
                        </td>
                        <td class="text">
                            <label id="BelongArea" runat="server"></label>
                        </td>
                        <td class="title"><span>所属区域</span></td>
                        <td class="text">
                            <label id="BelongRegion" runat="server"></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>所属管理公司</span></td>
                        <td class="text">
                            <input runat="server" id="BelongManageCompanyName" type="text" searcher="SelManageCommpany" style="width: 250px" class="easyui-searchbox" data-options="required:true,editable:false" />
                            <input type="hidden" id="BelongManageCompany" name="BelongManageCompany" runat="server" />
                            <%--                            <select id="BelongManageCompany" runat="server" name="BelongManageCompany" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',multiline:false,width:140">
                            </select>--%>
                        </td>
                        <td class="title"><span>所属签约公司</span></td>
                        <td class="text">
                            <input runat="server" id="BelongSignCompanyName" name="BelongSignCompany" type="text" searcher="SelSignCompany" style="width: 250px" class="easyui-searchbox" data-options="required:true,editable:false" />
                            <input type="hidden" id="BelongSignCompany" name="BelongSignCompany" runat="server" />
                            <%--            <select id="BelongSignCompany" runat="server" name="BelongSignCompany" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',multiline:false,width:140">
                            </select>--%>

                        </td>
                    </tr>
                    <%--                    <tr>
                        <td class="title"><span>签约公司是否合资公司</span></td>
                        <td class="text">
                            <select id="SignIsJoint" runat="server" name="SignIsJoint" class="easyui-combobox" data-options="required:true,editable:false,width:100,panelHeight:80">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                        <td class="title"><span>签约公司是否并购公司</span></td>
                        <td class="text">
                            <select id="SignIsMerger" runat="server" name="SignIsMerger" class="easyui-combobox" data-options="required:true,editable:false,width:100,panelHeight:80,onChange:function(newValue,oldValue){ MergerChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>

                        <td class="title"><span>并购时间</span></td>
                        <td class="text">
                            <input id="MergerTime" runat="server" name="MergerTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>--%>
                </table>
                <input type="hidden" value="0" id="SignIsJoint" name="SignIsJoint" />
                <input type="hidden" value="0" id="SignIsMerger" name="SignIsMerger" />
                <input type="hidden" value="" id="MergerTime" name="MergerTime" />
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目位置</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>省</span>
                        </td>
                        <td class="text">
                            <input type="hidden" id="Province" runat="server" />
                            <input type="hidden" id="City" runat="server" />
                            <input type="hidden" id="County" runat="server" />
                            <select id="ProvinceId" runat="server" name="ProvinceId" class="easyui-combobox" data-options="required:true,width:140,onChange:function(newValue,oldValue){ ProvinceChange(newValue, oldValue)}" runat="server">
                            </select>
                        </td>
                        <td class="title"><span>市</span></td>
                        <td class="text">
                            <select id="CityId" runat="server" name="CityId" class="easyui-combobox" data-options="required:true,width:140,onChange:function(newValue,oldValue){ CityChange(newValue, oldValue)}" runat="server">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>区</span></td>
                        <td class="text">
                            <select id="CountyId" runat="server" name="CountyId" class="easyui-combobox" data-options="required:true,width:140" runat="server">
                            </select>
                        </td>
                        <td class="title"><span>乡</span></td>
                        <td class="text">
                            <input id="Township" runat="server" name="Township" class="easyui-textbox" data-options="tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>项目地址</span></td>
                        <td class="text">
                            <input id="CommAddress" runat="server" name="CommAddress" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                        <td class="title"><span>区域分布</span></td>
                        <td class="text">
                            <select id="RegionDistrib" runat="server" name="RegionDistrib" class="easyui-combobox" data-options="required:false,editable:false,width:100,panelHeight:170">
                                <option selected="selected"></option>
                                <option value="1">全部</option>
                                <option value="2">东部</option>
                                <option value="3">南部</option>
                                <option value="4">西部</option>
                                <option value="5">华北</option>
                                <option value="6">中部</option>
                                <option value="7">东北</option>
                                <option value="8">直管</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>邮政编码</span></td>
                        <td class="text">
                            <input id="PostalCode" runat="server" name="PostalCode" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目属性</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>所属业务板块</span>
                        </td>
                        <td class="text">
                            <select id="BusPlate" runat="server" name="BusPlate" class="easyui-combobox" data-options="required:true,width:100,panelHeight:90">
                                <option value="住宅">住宅</option>
                                <option value="商办">商办</option>
                                <option value="公服">公服</option>
                            </select>
                        </td>
                        <td class="title"><span>项目业态</span></td>
                        <td class="text">
                            <input runat="server" name="StateName" type="text" id="StateName" searcher="SelFormat" style="width: 150px" class="easyui-searchbox" data-options="required:true,editable:false" />

                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>项目包含业态</span></td>
                        <td class="text" colspan="3">
                            <input runat="server" name="StateNames" type="text" id="StateNames" searcher="SelFormats" style="width: 300px" class="easyui-searchbox" data-options="required:true,editable:false" />

                        </td>


                    </tr>
                    <tr>
                        <td class="title"><span>项目归属</span></td>
                        <td class="text">
                            <select id="CommBelong" runat="server" name="CommBelong" class="easyui-combobox" data-options="required:true,editable:false,width:100,panelHeight:60">
                                <option value="集团项目">集团项目</option>
                                <option value="第三方项目">第三方项目</option>
                            </select>
                        </td>
                        <td class="title"><span>项目来源</span></td>
                        <td class="text">
                            <select id="CommFrom" runat="server" name="CommFrom" class="easyui-combobox" data-options="required:true,editable:false,width:100,panelHeight:60">
                                <option value="非外拓项目">非外拓项目</option>
                                <option value="外拓项目">外拓项目</option>
                            </select>
                        </td>

                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目接管</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>开发时间</span>
                        </td>
                        <td class="text">
                            <input id="DevTime" runat="server" name="DevTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>开发主体</span></td>
                        <td class="text">
                            <input id="DevSubject" runat="server" name="DevSubject" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>预计首次交楼时间</span></td>
                        <td class="text">
                            <input id="ExpectHandTime" runat="server" name="ExpectHandTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>首次接管时间</span></td>
                        <td class="text">
                            <input id="TakeOverTime" runat="server" name="TakeOverTime" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>首次集中交付时间</span></td>
                        <td class="text">
                            <input id="DeliverTime" runat="server" name="DeliverTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>管理阶段</span></td>
                        <td class="text">
                            <select id="ManageStage" runat="server" name="ManageStage" class="easyui-combobox" data-options="required:true,editable:false,width:160,panelHeight:170">
                                <option value="早期介入项目">早期介入项目</option>
                                <option value="前期服务项目">前期服务项目</option>
                                <option value="物业服务项目">物业服务项目</option>
                                <option value="滚动开发项目">滚动开发项目</option>
                                <option value="已经退出项目">已经退出项目</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>服务模式</span></td>
                        <td class="text">
                            <select id="ServiceModel" runat="server" name="ServiceModel" class="easyui-combobox" data-options="required:true,editable:false,width:160,panelHeight:100">
                                <option value="全委">全委</option>
                                <option value="半委">半委</option>
                                <option value="顾问">顾问</option>
                            </select>
                        </td>
                        <td class="title"><span>收费模式</span></td>
                        <td class="text">
                            <select id="ChargeMode" runat="server" name="ChargeMode" class="easyui-combobox" data-options="required:true,editable:false,width:160,panelHeight:100">
                                <option selected="selected" value="包干制">包干制</option>
                                <option value="酬金制">酬金制</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>是否提供增值服务</span></td>
                        <td class="text">
                            <select id="IsValueAdd" runat="server" name="IsValueAdd" class="easyui-combobox" data-options="required:true,editable:false,width:100,panelHeight:80,onChange:function(newValue,oldValue){ ValueAddChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                        <td class="title"><span>提供增值服务内容</span></td>
                        <td class="text">
                            <input id="ValueAddContent" runat="server" name="ValueAddContent" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目退出</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>是否退出</span>
                        </td>
                        <td class="text">
                            <select id="IsSignOut" runat="server" name="IsSignOut" class="easyui-combobox" data-options="required:false,editable:false,width:100,panelHeight:80,onChange:function(newValue,oldValue){ SignOutChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                        <td class="title"><span>退出时间</span></td>
                        <td class="text">
                            <input id="SignOutTime" runat="server" name="SignOutTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" /></td>
                    </tr>
                    <tr>
                        <td class="title"><span>退出方式</span></td>
                        <td class="text">
                            <input id="SignOutWay" runat="server" name="SignOutWay" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                        <td class="title"><span>退出原因</span></td>
                        <td class="text">
                            <input id="SignOutReason" runat="server" name="SignOutReason" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />

                        </td>
                    </tr>

                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">项目业委会</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>是否成立业委会</span>
                        </td>
                        <td class="text">
                            <select id="IsSetCommittee" runat="server" name="IsSetCommittee" class="easyui-combobox" data-options="required:false,editable:false,width:100,panelHeight:80,onChange:function(newValue,oldValue){ CommitteeChange(newValue, oldValue)}">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                        <td class="title"><span>业委会成立时间</span></td>
                        <td class="text">
                            <input id="CommitteeTime" runat="server" name="CommitteeTime" class="easyui-datebox" data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>


                </table>
            </fieldset>

            <fieldset class="frame-fieldset">
                <legend class="frame-legend">规划信息</legend>
                <div id="PlanInfoScheme">
                    <table id="dgPlanInfoScheme" border="0" cellspacing="0" cellpadding="0"></table>
                </div>
            </fieldset>
        </form>



        <div style="height: 40px; display: block; text-align: center">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" runat="server" name="ID" id="ID" runat="server" />
        </div>
        <div style="height: 20px; display: block">
        </div>
    </div>


    <script type="text/javascript">

        function SelManageCommpany() {
            var conent = "../DialogNew/BaseCompanyDlg.aspx";

            var w = 700;
            var h = 550;
            HDialog.Open(w, h, conent, '管理公司选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);

                $('#BelongManageCompany').val(data.DictionaryCode);
                $('#BelongManageCompanyName').searchbox("setValue", data.DictionaryName);

            });
        }

        function SelSignCompany() {
            var conent = "../DialogNew/BaseCompanyDlg.aspx";

            var w = 700;
            var h = 550;

            HDialog.Open(w, h, conent, '签约公司选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#BelongSignCompany').val(data.DictionaryCode);
                $('#BelongSignCompanyName').searchbox("setValue", data.DictionaryName);

            });
        }

        function SelFormat() {

            HDialog.OpenWin("600", "400", '../InformationManage/ProjectStateSelectType.aspx?Ismultiple=0&WithParent=0', "选择项目业态", false, function callback(_Data) {
                if (_Data != "") {
                    var data = $.parseJSON(_Data);
                    console.log(data);
                    if (data.length > 1) {
                        var m = data[1].text + "-" + data[0].text;
                        $('#StateName').searchbox('setValue', m);
                        //第一个对象是 第二级类别  第二个对象是 第一级类别 但是包含子节点
                    }
                }
            });

        }
        function SelFormats() {
            HDialog.OpenWin("600", "400", '../InformationManage/ProjectStateSelectType.aspx?Ismultiple=1&WithParent=0', "选择项目业态", false, function callback(_Data) {
                if (_Data != "") {
                    console.log(_Data);
                    var data = $.parseJSON(_Data);
                    console.log(data);
                    var m = data.name;
                    $('#StateNames').searchbox('setValue', m);
                    //第一个对象是 第二级类别  第二个对象是 第一级类别 但是包含子节点

                }
            });
        }

        function MergerChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#MergerTime').datebox({
                    required: true
                });
            }
            else {
                $('#MergerTime').datebox({
                    required: false
                });
            }
        }
        function CommitteeChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#CommitteeTime').datebox({
                    required: true
                });
            }
            else {
                $('#CommitteeTime').datebox({
                    required: false
                });
            }
        }

        function ValueAddChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#ValueAddContent').textbox({
                    required: true
                });
            }
            else {
                $('#ValueAddContent').textbox({
                    required: false
                });
            }
        }

        function SignOutChange(newValue, oldValue) {
            if (newValue == "1") {
                $('#SignOutTime').datebox({
                    required: true
                });
                $('#SignOutWay').textbox({
                    required: true
                });
                $('#SignOutReason').textbox({
                    required: true
                });
            }
            else {
                $('#SignOutTime').datebox({
                    required: false
                });
                $('#SignOutWay').textbox({
                    required: false
                });
                $('#SignOutReason').textbox({
                    required: false
                });
            }
        }

        function ProvinceChange(newValue, oldValue) {
            var selValue = newValue;
            $("#CityId").combobox('clear');
            $("#CountyId").combobox('clear');
            var arr = new Array();
            $.each(city, function (k, p) {
                if (p.ProID == selValue) {
                    var ob = { "value": p.CityID, "text": p.CityName };
                    arr.push(ob);
                }
            });
            $("#CityId").combobox('loadData', arr);
        }

        function CityChange(newValue, oldValue) {
            var selValue = newValue;
            $("#CountyId").combobox('clear');
            var arr = new Array();
            $.each(District, function (k, p) {
                if (p.CityID == selValue) {
                    var ob = { "value": p.DisID, "text": p.DisName };
                    arr.push(ob);
                }
            });
            $("#CountyId").combobox('loadData', arr);
        }


        function selval() {
            $("#Province").val($("#ProvinceId").combobox('getText'));
            $("#City").val($("#CityId").combobox('getText'));
            $("#County").val($("#CountyId").combobox('getText'));
        }

        function InitCityList() {

            var FistP = 0;
            var FistC = 0;
            var FistCo = 0;

            var parr = new Array();
            $.each(province, function (k, p) {
                if ($("#Province").val() == p.ProName) {
                    FistP = p.ProID
                }
                var ob = { "value": p.ProID, "text": p.ProName };
                parr.push(ob);

            });

            $("#ProvinceId").combobox('loadData', parr);
            if (FistP == 0) {
                FistP = parr[0].value
            }

            $("#ProvinceId").combobox('setValue', FistP);
            var carr = new Array();
            $.each(city, function (k, p) {
                if (p.ProID == FistP) {
                    if ($("#City").val() == p.CityName) {
                        FistC = p.CityID
                    }
                    var ob = { "value": p.CityID, "text": p.CityName };
                    carr.push(ob);

                }
            });

            $("#CityId").combobox('loadData', carr);
            if (FistC == 0) {
                FistC = carr[0].value;
            }
            $("#CityId").combobox('setValue', FistC);

            var coarr = new Array();
            $.each(District, function (k, p) {
                if (p.CityID == FistC) {
                    if ($("#County").val() == p.DisName) {
                        FistCo = p.DisID
                    }
                    var ob = { "value": p.DisID, "text": p.DisName };
                    coarr.push(ob);

                }
            });
            $("#CountyId").combobox('loadData', coarr);
            if (FistCo == 0) {
                FistCo = coarr[0].value;
            }
            $("#CountyId").combobox('setValue', FistCo);



        }




        $(function () {
            //InitControl();
            InitPage();
            if ($("#SignIsMerger").combobox('getValue') == "1") {
                $('#MergerTime').datebox({
                    required: true
                });
            }

            if ($("#IsValueAdd").combobox('getValue') == "1") {
                $('#ValueAddContent').textbox({
                    required: true
                });
            }

            if ($("#IsSignOut").combobox('getValue') == "1") {
                $('#SignOutTime').datebox({
                    required: true
                });
                $('#SignOutWay').textbox({
                    required: true
                });
                $('#SignOutReason').textbox({
                    required: true
                });
            }

            if ($("#IsSetCommittee").combobox('getValue') == "1") {
                $('#CommitteeTime').datebox({
                    required: true
                });
            }
        });

        function InitPage() {

            if (OpType == "Edit") {
                InitData();
            } else {

            }
            InitDataGrid();
            InitDataGrid2();
        }


        function Save() {
            if ($('#basicform').form("validate")) {
                selval();
                $.dataPostJson('ProjectBasicInformation', 'BaseSave', $.getParam(), true, true,
                    function Init() {

                    },
                    function callback(data) {
                        if (data.msg == 'true') {
                            $("#IID").val(data.data);
                            $.messager.alert('温馨提示', '保存成功');
                        } else {

                        }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        }


        var column = [[
            {
                field: 'GetMethod', title: '获得方式', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'ContractName', title: '合同名称', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'ContractSign', title: '合同编码', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'GetTime', title: '获得时间', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ContractArea', title: '合同面积(㎡)', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'ManageContractArea', title: '管理口径合同面积(㎡)', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'YearPrice', title: '单年金额(元/年)', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'IsTakeOver', title: '是否接管', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value == 1) {
                        return "是";
                    }
                    else {
                        return "否";
                    }
                }
            },
            {
                field: 'TakeOverTime', title: '接管时间', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'TakeOverArea', title: '接管面积(㎡)', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'ManageTakeOverArea', title: '管理口径接管面积(㎡)', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'Opt', title: '接管详情', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return "<a href=\"javascript:Edit('编辑','" + row.ID + "')\" >编辑/查看</a>";
                }
            },
            {
                field: 'IsStop', title: '是否终止', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value == 1) {
                        return "是";
                    }
                    else {
                        return "否";
                    }
                }
            },
            {
                field: 'StopTime', title: '终止时间', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#IID").val() == "") {
                        $.messager.alert('温馨提示', '请先保存基本信息');
                    }
                    else {
                        Edit("新增", '');
                    }

                }
            }
            , '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dgScheme").datagrid("getSelected");
                    if (row) {
                        Edit('编辑', row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dgScheme").datagrid("getSelected");
                    if (row) {
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];

        var toolbar2 = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var rows = $("#dgPlanInfoScheme").datagrid("getRows");
                    if ($("#IID").val() == "") {
                        $.messager.alert('温馨提示', '请先保存基本信息');
                    }
                    else {
                        EditPlanInfo("新增规划信息", 'insert', "");
                    }

                }
            }
            , '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dgPlanInfoScheme").datagrid("getSelected");
                    if (row) {
                        EditPlanInfo('修改规划信息', 'Edit', row.PlanID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dgPlanInfoScheme").datagrid("getSelected");
                    if (row) {
                        DelPlanInfo(row.PlanID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }
        ];


        var loadType = "Init";
        function InitDataGrid() {

            $("#dgScheme").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 220,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                toolbar: toolbar,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    //param.Type_Name = typeName;
                    param = $.getDataGridParam("ProjectBasicInformation", "TakeOverList", param);


                },
                onLoadSuccess: function (data) {
                    //$("#" + dgName).datagrid('resize');

                    //if (loadType == "Init") {
                    //    if (dgName == "dgScheme") { InitDataGrid("dgRecord", "签到记录", "Init"); }
                    //}

                },
                onLoadError: function (data) {

                }
            });

        }

        function InitDataGrid2() {
            $("#dgPlanInfoScheme").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 220,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "PlanID",
                columns: [[
                    { field: 'PlanArea', title: '规划区域', rowspan: 2, sortable: true },
                    { title: '占地面积', colspan: 5 },
                    { title: '物业数量', colspan: 4 },
                    { title: '总建筑面积', colspan: 4 },
                    { field: 'VolumeRate', rowspan: 2, title: '容积率', width: 200, sortable: true }
                ],
                [
                    { field: 'PlanID', title: 'PlanID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'ResidentialArea', title: '住宅用地面积', width: 100, align: 'left', sortable: true },
                    { field: 'PublicArea', title: '公建用地面积', width: 100, align: 'left', sortable: true },
                    { field: 'RoadArea', title: '道路用地面积', width: 100, align: 'left', sortable: true },
                    { field: 'GreenArea', title: '绿地用地面积', width: 100, align: 'left', sortable: true },

                    { field: 'HouseQuantity', title: '住宅数量', width: 100, align: 'left', sortable: true },
                    { field: 'CommercialAuantity', title: '商业数量', width: 80, align: 'left', sortable: true },
                    { field: 'ParkeNumber', title: '车位数量', width: 100, align: 'left', sortable: true },
                    { field: 'OtherQuantity', title: '其他数量', width: 100, align: 'left', sortable: true },

                    { field: 'TotalResidentialArea', title: '住宅总面积', width: 100, align: 'left', sortable: true },
                    { field: 'TotalCommercialArea', title: '商业总面积', width: 100, align: 'left', sortable: true },
                    { field: 'TotalParkingArea', title: '车位总面积', width: 100, align: 'left', sortable: true },
                    { field: 'OtherTotalArea', title: '其他总面积', width: 100, align: 'left', sortable: true }
                ]],
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                toolbar: toolbar2,
                rowStyler: function (index, row) { },
                onSelect: function (index, row) { },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("ProjectBasicInformation", "GetPlanInfo", param);
                },
                onLoadSuccess: function (data) { },
                onLoadError: function (data) { }
            });
        }

        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; } else { id = ''; }
            var param = { "OpType": OpType, "IID": id, "ParentId": $("#IID").val() };
            LayerDialog.OpenWin('1000', '600', '../InformationManage/ProjectTakeoverInformation.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }

        function Del(id) {
            $.dataPostJson('ProjectBasicInformation', 'TakeOverDel', { "IID": id }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.msg == "true") {
                        $.messager.alert("温馨提示", '删除成功!');
                    }
                    InitDataGrid();
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //新增/修改
        function EditPlanInfo(title, OpType, planId) {
            var w = $(window).width();
            var h = $(window).height();
            HDialog.Open(w - 620, h - 70, '../InformationManage/PlanInfoManage.aspx?PlanID=' + planId + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data != "false" && _Data != "") {
                    InitDataGrid2();
                }
            });
        }

        //删除
        function DelPlanInfo(PlanID) {
            $.dataPostJson('ProjectBasicInformation', 'PlanInfoDel', { "PlanID": PlanID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.msg == "true") {
                        $.messager.alert("温馨提示", '删除成功!');
                    }
                    InitDataGrid2();
                },
                function completeCallback() {
                },
                function errorCallback() { }
            );
        }

        setTimeout(function () {
            InitCityList();
        }, 500);
    </script>
</body>
</html>

