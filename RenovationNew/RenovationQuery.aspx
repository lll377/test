<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationQuery.aspx.cs" Inherits="M_Main.RenovationNew.RenovationQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修查询</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <style type="text/css">
      
    </style>
</head>
<body>
    <div id="tab" class="easyui-tabs">
        <div id="tab0" issel="false" dgname="renovation" title="装修登记">
            <table id="dg_renovation" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab1" issel="false" dgname="change" title="装修变更" style="overflow: hidden">
            <table id="dg_change" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab2" issel="false" dgname="stop" title="装修停工" style="overflow: hidden">
            <table id="dg_stop" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab3" issel="false" dgname="delay" title="装修延期" style="overflow: hidden">
            <table id="dg_delay" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab4" issel="false" dgname="HandleCertificate" title="装修办证" style="overflow: hidden">
            <table id="dg_HandleCertificate" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab5" issel="false" dgname="fees" title="装修收费" style="overflow: hidden">
            <table id="dg_fees" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab6" issel="false" dgname="ReleasePeople" title="装修人员放行" style="overflow: hidden">
            <table id="dg_ReleasePeople" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab7" issel="false" dgname="ReleaseMaterial" title="装修材料放行" style="overflow: hidden">
            <table id="dg_ReleaseMaterial" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab8" issel="false" dgname="patrol" title="装修巡查" style="overflow: hidden">
            <table id="dg_patrol" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="dlg_search_renovation" class="easyui-dialog" title="筛选" style="width: 800px; height: 253px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_renovation">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>装修开工时间</span></td>
                    <td class="text">
                        <input id="StartStartDate" name="StartStartDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndStartDate" name="EndStartDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>预计完工时间</span></td>
                    <td class="text">
                        <input id="StartEstimateEndDate" name="StartEstimateEndDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndEstimateEndDate" name="EndEstimateEndDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>施工单位</span></td>
                    <td class="text">
                        <input id="BuildCompany" name="BuildCompany" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>装修状态</span></td>
                    <td class="text">
                        <input id="RenovationState" name="RenovationState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                         valueField:'id',textField:'text',data: [{id: '装修',text: '装修'},{id: '停工',text: '停工'},{id: '完工',text: '完工'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>审核状态</span></td>
                    <td class="text" colspan="3">
                        <input id="AuditState" name="AuditState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField:'id',textField:'text',data: [{id: '未送审',text: '未送审'},{id: '审核中',text: '审核中'},{id: '审核不通过',text: '审核不通过'},{id: '已审核',text: '已审核'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_renovation').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_change" class="easyui-dialog" title="筛选" style="width: 800px; height: 173px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_change">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_Change" name="CustName_Change" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_Change" name="RoomSign_Change" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>经办时间</span></td>
                    <td class="text">
                        <input id="StartChargeTime_Change" name="StartChargeTime_Change" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndChargeTime_Change" name="EndChargeTime_Change" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>审核状态</span></td>
                    <td class="text">
                        <input id="AuditState_Change" name="AuditState_Change" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField:'id',textField:'text',data: [{id: '未送审',text: '未送审'},{id: '审核中',text: '审核中'},{id: '审核不通过',text: '审核不通过'},{id: '已审核',text: '已审核'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_change').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_stop" class="easyui-dialog" title="筛选" style="width: 800px; height: 173px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_stop">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_Stoppage" name="CustName_Stoppage" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_Stoppage" name="RoomSign_Stoppage" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>装修开工时间</span></td>
                    <td class="text">
                        <input id="StartChargeTime_Stoppage" name="StartChargeTime_Stoppage" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndChargeTime_Stoppage" name="EndChargeTime_Stoppage" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>审核状态</span></td>
                    <td class="text">
                        <input id="AuditState_Stoppage" name="AuditState_Stoppage" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField:'id',textField:'text',data: [{id: '未送审',text: '未送审'},{id: '审核中',text: '审核中'},{id: '审核不通过',text: '审核不通过'},{id: '已审核',text: '已审核'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_stop').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_delay" class="easyui-dialog" title="筛选" style="width: 800px; height: 173px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_delay">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_Delay" name="CustName_Delay" class="easyui-textbox" data-options="width:215" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_Delay" name="RoomSign_Delay" class="easyui-textbox" data-options="width:215" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>装修开工时间</span></td>
                    <td class="text">
                        <input id="StartChargeTime_Delay" name="StartChargeTime_Delay" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndChargeTime_Delay" name="EndChargeTime_Delay" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>审核状态</span></td>
                    <td class="text">
                        <input id="AuditState_Delay" name="AuditState_Delay" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField:'id',textField:'text',data: [{id: '未送审',text: '未送审'},{id: '审核中',text: '审核中'},{id: '审核不通过',text: '审核不通过'},{id: '已审核',text: '已审核'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_delay').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div id="dlg_search_HandleCertificate" class="easyui-dialog" title="筛选" style="width: 800px; height: 252px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_HandleCertificate">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_HandleCertificate" name="CustName_HandleCertificate" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_HandleCertificate" name="RoomSign_HandleCertificate" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>出入证编号</span></td>
                    <td class="text">
                        <input id="OutEnterCertificateNum" name="OutEnterCertificateNum" class="easyui-textbox" />
                    </td>

                    <td class="title"><span>姓名</span></td>
                    <td class="text">
                        <input id="Name" name="Name" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>身份证</span></td>
                    <td class="text">
                        <input id="IDCard" name="IDCard" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>办证时间</span></td>
                    <td class="text">
                        <input id="StartHandleCertificateDate" name="StartHandleCertificateDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndHandleCertificateDate" name="EndHandleCertificateDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>证件状态</span></td>
                    <td class="text" colspan="3">
                        <input id="CertificateState" name="CertificateState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).combobox('clear');
                            }}],
                         valueField:'id',textField:'text',value:'正常',data: [{id: '正常',text: '正常'},{id: '挂失',text: '挂失'},{id: '作废',text: '作废'},{id: '收回',text: '收回'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_HandleCertificate').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_fees" class="easyui-dialog" title="筛选" style="width: 800px; height: 173px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_fees">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_Fees" name="CustName_Fees" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_Fees" name="RoomSign_Fees" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用名称</span></td>
                    <td class="text">
                        <input id="CostName" name="CostName" class="easyui-textbox" />
                    </td>

                    <td class="title"><span>应收日期</span></td>
                    <td class="text">
                        <input id="StartAccountsDueDate" name="StartAccountsDueDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndAccountsDueDate" name="EndAccountsDueDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_fees').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_ReleasePeople" class="easyui-dialog" title="筛选" style="width: 800px; height: 252px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_ReleasePeople">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_ReleasePeople" name="CustName_ReleasePeople" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_ReleasePeople" name="RoomSign_ReleasePeople" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>放行时间</span></td>
                    <td class="text">
                        <input id="StartReleaseTime" name="StartReleaseTime" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndReleaseTime" name="EndReleaseTime" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>放行类别</span></td>
                    <td class="text">
                        <input id="ReleaseType" name="ReleaseType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).combobox('clear');
                            }}],
                         valueField:'id',textField:'text',data: [{id: '进场',text: '进场'},{id: '离场',text: '离场'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>出入证编号</span></td>
                    <td class="text">
                        <input id="OutEnterCertificateNum_ReleasePeople" name="OutEnterCertificateNum_ReleasePeople" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>姓名</span></td>
                    <td class="text">
                        <input id="Name_ReleasePeople" name="Name_ReleasePeople" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>经办人</span></td>
                    <td class="text" colspan="3">
                        <input id="HandlePerson" name="HandlePerson" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_ReleasePeople').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_ReleaseMaterial" class="easyui-dialog" title="筛选" style="width: 800px; height: 252px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_ReleaseMaterial">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_ReleaseMaterial" name="CustName_ReleaseMaterial" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_ReleaseMaterial" name="RoomSign_ReleaseMaterial" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>放行时间</span></td>
                    <td class="text">
                        <input id="StartReleaseTime_ReleaseMaterial" name="StartReleaseTime_ReleaseMaterial" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndReleaseTime_ReleaseMaterial" name="EndReleaseTime_ReleaseMaterial" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>材料名称</span></td>
                    <td class="text">
                        <input id="MaterialName" name="MaterialName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>是否违禁材料</span></td>
                    <td class="text">
                        <input id="Violate" name="Violate" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).combobox('clear');
                            }}],
                         valueField:'id',textField:'text',data: [{id: '是',text: '是'},{id: '否',text: '否'}]" />
                    </td>
                    <td class="title"><span>车牌号码</span></td>
                    <td class="text">
                        <input id="LicensePlate" name="LicensePlate" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>确认人</span></td>
                    <td class="text">
                        <input id="ConfirmPerson" name="ConfirmPerson" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>经办人</span></td>
                    <td class="text">
                        <input id="HandlePerson_ReleaseMaterial" name="HandlePerson_ReleaseMaterial" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_ReleaseMaterial').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div id="dlg_search_patrol" class="easyui-dialog" title="筛选" style="width: 800px; height: 211px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm_patrol">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName_Patrol" name="CustName_Patrol" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign_Patrol" name="RoomSign_Patrol" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>整改单号</span></td>
                    <td class="text" colspan="3">
                        <input id="RectificationSingleNum" name="RectificationSingleNum" class="easyui-textbox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>巡查时间</span></td>
                    <td class="text">
                        <input id="StartPatrolDate" name="StartPatrolDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />&nbsp;-
                        <input id="EndPatrolDate" name="EndPatrolDate" class="easyui-datebox" data-options="editable:false,width:122,icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span>巡查人</span></td>
                    <td class="text">
                        <input id="PatrolPeople" name="PatrolPeople" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_patrol').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div id="dlg_QRCode" class="easyui-dialog" data-options="modal:true,title:'图片',closed:true" style="width: 216px; height: 242px; padding: 1px">
        <img id="img_QRCode" width="200" height="200" />
    </div>


    <script type="text/javascript">

        $(function () {
            InitControl();
        });

        function LazyLoading() {
            InitDataGrid();
            $('#tab').tabs('resize');
        };

        var name = "renovation", tabindex = 0;
        function InitControl() {

            var h = $(window).height() - 37;
            var w = $(window).width();

            var issel = false;
            $('#tab').tabs({
                //height: h,
                //width: w,
                tabHeight: 35,
                tabWidth: 100,
                justified: true,
                fit: true,
                border: false,
                onSelect: function (title, index) {
                    $("form").each(function () {
                        $("#" + $(this).attr('id')).form('clear');
                    });
                    tabindex = index;
                    issel = $("#tab" + index).attr("issel");
                    name = $("#tab" + index).attr("dgname");
                    if (issel == "false") {
                        //$("#dg_" + name).css("height", h + "px");
                        InitDataGrid();
                        $("#tab" + index).attr("issel", "true");
                    }
                }
            });
            setTimeout("LazyLoading()", 1000); //延迟1秒

            //$('#RegionSNum').combobox({
            //    url: '/HM/M_Main/HC/DataPostControl.aspx',
            //    method: 'post',
            //    queryParams: {
            //        "Method": "DataPost",
            //        "Class": "Renovation",
            //        "Command": "GetListRegion",
            //    },
            //    valueField: 'RegionSNum',
            //    textField: 'RegionName',
            //    editable: false,
            //    tipPosition: 'bottom',
            //    panelHeight: 200,
            //    width: '250px',
            //    icons: [{
            //        iconCls: 'icon-clear',
            //        handler: function (e) {
            //            $(e.data.target).combobox('clear');
            //        }
            //    }]
            //});

            //$('#BuildSNum').combobox({
            //    url: '/HM/M_Main/HC/DataPostControl.aspx',
            //    method: 'post',
            //    queryParams: {
            //        "Method": "DataPost",
            //        "Class": "Renovation",
            //        "Command": "GetListBuild",
            //    },
            //    valueField: 'BuildSNum',
            //    textField: 'BuildName',
            //    editable: false,
            //    tipPosition: 'bottom',
            //    panelHeight: 200,
            //    width: '250px',
            //    icons: [{
            //        iconCls: 'icon-clear',
            //        handler: function (e) {
            //            $(e.data.target).combobox('clear');
            //        }
            //    }]
            //});

            //$('#HandOverHousesStateName').combobox({
            //    url: '/HM/M_Main/HC/DataPostControl.aspx',
            //    method: 'post',
            //    queryParams: {
            //        "Method": "DataPost",
            //        "Class": "Renovation",
            //        "Command": "GetListRoomState",
            //    },
            //    valueField: 'RoomState',
            //    textField: 'StateName',
            //    editable: false,
            //    tipPosition: 'bottom',
            //    panelHeight: 200,
            //    width: '250px',
            //    icons: [{
            //        iconCls: 'icon-clear',
            //        handler: function (e) {
            //            $(e.data.target).combobox('clear');
            //        }
            //    }]
            //});

        }

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_' + name).dialog('open');
                }
            }, '-', {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.open("RenovationExcel.aspx?random=" + Math.random() + "&Type=" + name);
                }
            },
        ];

        var column = [[[//装修登记
            { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: false },
            { field: 'RoomName', title: '房屋名称', width: 250, align: 'left', sortable: false },
            {
                field: 'StartDate', title: '装修开工时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'EstimateEndDate', title: '预计完工时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'BuildCompany', title: '施工单位', width: 150, align: 'left', sortable: false },
            { field: 'AuditState', title: '审核状态', width: 70, align: 'left', sortable: false },
            { field: 'FeesRoleNames', title: '未审岗位', width: 300, align: 'left', sortable: false },
            {
                field: 'QRCode', title: '二维码', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    if (isValueNull(value)) {
                        value = "<a  onclick=\"ShowQRCode('" + value + "');\" href=\"javascript:void()\">二维码</a>";
                    }
                    return value;
                }
            },
            { field: 'HandleCertificateCount', title: '出入证数量', width: 80, align: 'left', sortable: false },
            { field: 'CostTotalSum', title: '收费金额', width: 80, align: 'left', sortable: false },
            { field: 'PatrolCount', title: '整改单数量', width: 80, align: 'left', sortable: false },
            { field: 'RenovationState', title: '装修状态', width: 80, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Edit('详情', 'Detailed','" + row.ID + "','" + row.AuditState + "')\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]], [[//装修变更
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            { field: 'ChangeItem', title: '变更项目', width: 130, align: 'left', sortable: false },
            { field: 'ChargePerson', title: '经办人', width: 40, align: 'left', sortable: false },
            {
                field: 'ChargeTime', title: '经办时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'AuditState', title: '审核状态', width: 40, align: 'left', sortable: false },
            { field: 'FeesRoleNames', title: '未审岗位', width: 150, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 30, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]], [[//装修停工
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            {
                field: 'StoppageBeginTime', title: '停工开始时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'StoppageEndTime', title: '停工结束时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'ChargePerson', title: '经办人', width: 40, align: 'left', sortable: false },
            {
                field: 'ChargeTime', title: '经办时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'AuditState', title: '审核状态', width: 40, align: 'left', sortable: false },
            { field: 'FeesRoleNames', title: '未审岗位', width: 150, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 30, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]], [[//装修延期
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            { field: 'DelayDays', title: '延期天数', width: 30, align: 'left', sortable: false },
            { field: 'ChargePerson', title: '经办人', width: 40, align: 'left', sortable: false },
            {
                field: 'ChargeTime', title: '经办时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'AuditState', title: '审核状态', width: 40, align: 'left', sortable: false },
            { field: 'FeesRoleNames', title: '未审岗位', width: 150, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 30, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            },
        ]], [[//装修办证
            { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: false },
            { field: 'OutEnterCertificateNum', title: '出入证编号', width: 150, align: 'left', sortable: true },
            { field: 'OutEnterCertificateName', title: '出入证名称', width: 150, align: 'left', sortable: true },
            {
                field: 'Photo', title: '照片', width: 40, align: 'left', sortable: false, formatter: function (value, row, index) {
                    if (isValueNull(value)) {
                        value = "<a  onclick=\"ShowQRCode('" + value + "');\" href=\"javascript:void()\">查看</a>";
                    }
                    return value;
                }
            },
            { field: 'Name', title: '姓名', width: 100, align: 'left', sortable: false },
            { field: 'Sex', title: '性别', width: 40, align: 'left', sortable: false },
            { field: 'Phone', title: '电话', width: 130, align: 'left', sortable: false },
            { field: 'IDCard', title: '身份证', width: 180, align: 'left', sortable: false },
            {
                field: 'HandleCertificateDate', title: '办证时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'CertificateStartDate', title: '证件期限开始时间', width: 110, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'CertificateEndDate', title: '证件期限结束时间', width: 110, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'CertificateState', title: '证件状态', width: 60, align: 'left', sortable: false },
            { field: 'HandlePerson', title: '经办人', width: 100, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]], [[//装修费用
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            { field: 'CostName', title: '费用名称', width: 80, align: 'left', sortable: false },
            { field: 'StanName', title: '费用标准名称', width: 80, align: 'left', sortable: false },
            {
                field: 'AccountsDueDate', title: '应收日期', width: 55, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'DueAmount', title: '应收金额', width: 50, align: 'left', sortable: false },
            { field: 'PaidAmount', title: '实收金额', width: 50, align: 'left', sortable: false },
            { field: 'PrecAmount', title: '预交冲抵', width: 50, align: 'left', sortable: false },
            { field: 'WaivAmount', title: '减免冲销', width: 50, align: 'left', sortable: false },
            { field: 'RefundAmount', title: '退款金额', width: 50, align: 'left', sortable: false },
            { field: 'DebtsAmount', title: '欠收金额', width: 50, align: 'left', sortable: false }
        ]], [[//装修人员放行
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            {
                field: 'ReleaseTime', title: '放行时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd HH:mm");
                }
            },
            { field: 'ReleaseType', title: '放行类别', width: 40, align: 'left', sortable: false },
            { field: 'OutEnterCertificateNum', title: '出入证编号', width: 80, align: 'left', sortable: false },
            { field: 'OutEnterCertificateName', title: '出入证名称', width: 80, align: 'left', sortable: false },
            { field: 'Name', title: '姓名', width: 50, align: 'left', sortable: false },
            {
                field: 'CertificateStartDate', title: '办证期限开始时间', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'CertificateEndDate', title: '办证期限结束时间', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'CertificateState', title: '证件状态', width: 40, align: 'left', sortable: false },
            { field: 'HandlePerson', title: '经办人', width: 50, align: 'left', sortable: false },
        ]], [[//装修材料放行
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            {
                field: 'ReleaseTime', title: '放行时间', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'MaterialName', title: '材料名称', width: 200, align: 'left', sortable: false },
            { field: 'Violate', title: '是否违禁材料', width: 60, align: 'left', sortable: false },
            { field: 'CarQuantity', title: '车辆数量', width: 40, align: 'left', sortable: false },
            { field: 'LicensePlate', title: '车牌号码', width: 60, align: 'left', sortable: false },
            { field: 'HandlePerson', title: '经办人', width: 60, align: 'left', sortable: false },
            { field: 'ConfirmPerson', title: '确认人', width: 60, align: 'left', sortable: false }
        ]], [[//装修巡查
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: false },
            { field: 'PatrolPeople', title: '巡查人', width: 60, align: 'left', sortable: false },
            {
                field: 'PatrolDate', title: '巡查时间', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'ViolationSituation', title: '违章情况', width: 150, align: 'left', sortable: false },
            { field: 'RectificationSingle', title: '是否开据整改单', width: 60, align: 'left', sortable: false },
            {
                field: 'RectificationSingleDate', title: '整改单时间', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'RectificationSingleNum', title: '整改单号', width: 100, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 40, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]]];
        //查看二维码/照片
        function ShowQRCode(value) {
            $("#img_QRCode").attr("src", value);
            $("#dlg_QRCode").dialog("open");
        }
        var method = "GetListRenovation";
        function InitDataGrid() {
            var fitColumns = true
            if (tabindex == 0 || tabindex == 4) {
                fitColumns = false;
            }
            $("#dg_" + name).datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column[tabindex],
                rownumbers: true,
                fitColumns: fitColumns,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                    if (tabindex == 0) {

                    }
                },
                onBeforeLoad: function (param) {
                    switch (tabindex) {
                        case 0:
                            method = "GetListRenovation";
                            break;
                        case 1:
                            method = "GetListRenoChangeAuditByRenoID";
                            break;
                        case 2:
                            method = "GetListRenoStoppageAuditByRenoID";
                            break;
                        case 3:
                            method = "GetListRenoDelayAuditByRenoID";
                            break;
                        case 4:
                            method = "GetListHandleCertificate";
                            break;
                        case 5:
                            method = "GetListFees";
                            break;
                        case 6:
                            method = "GetListReleasePeople";
                            break;
                        case 7:
                            method = "GetListReleaseMaterial";
                            break;
                        case 8:
                            method = "GetListPatrol";
                            break;
                        default:
                    }
                    param = $.JQForm.GetParam("Renovation", method, "dg_" + name, param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            //$('#dg' + id).datagrid('clearSelections');
            //$('#dg' + id).datagrid('clearChecked');
            $("#dlg_search_" + name).dialog("close");


        }

        function Edit(title, OpType, ID, AuditState) {
            var urlParam = $.param({ "OpType": OpType, "ID": ID, "AuditState": AuditState });
            HDialog.OpenWin('1024', '620', '../RenovationNew/RenovationMainTab.aspx?' + urlParam, title, true, function callback(data) {
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }

        function Detailed(title, id) {
            var pageName = "RenoDelay";
            var h = 335, w = 900;
            switch (tabindex) {
                case 1:
                    pageName = "RenoChange";
                    break;
                case 2:
                    pageName = "RenoStoppage";
                    break;
                case 3:
                    pageName = "RenoDelay";
                    break;
                case 4:
                    h = 375;
                    pageName = "HandleCertificate";
                    break;
                case 8:
                    h = 450;
                    pageName = "Patrol";
                    break;
                default:
            }
            var pageParam = $.param({ "ID": id, "RID": $("#RID").val() });
            HDialog.OpenWin(w, h, '../RenovationNew/' + pageName + 'Detailed.aspx?' + pageParam, title, true, function callback(data) {
                InitDataGrid();
            });
        }
    </script>
</body>
</html>
