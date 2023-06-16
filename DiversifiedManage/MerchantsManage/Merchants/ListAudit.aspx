<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListAudit.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.Merchants.ListAudit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商登记</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true,onClick:function(){Audit('审核通过','已审核');}">审核通过</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-no',plain:true,onClick:function(){Audit('取消审核','未审核');}">取消审核</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){window.open('/HM/M_Main/DiversifiedManage/MerchantsManage/Merchants/Export.aspx?random=' + Math.random());}">导出</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看客商详情 / 客商跟进信息 / 客商限制信息 / 客商合同信息 / 客商点位信息 / 客商费用信息!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 510px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">客商信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客商类别</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="MerchantsCategoryID" name="MerchantsCategoryID" />
                        <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商类别');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsCategoryID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">单位/个人客商</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="MerchantsType" name="MerchantsType" class="easyui-combobox" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系地址</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ContactAddress" name="ContactAddress" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="CertificatesID" name="CertificatesID" />
                        <input id="CertificatesName" name="CertificatesName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCertificates();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CertificatesID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="CertificatesNo" name="CertificatesNo" class="easyui-textbox" data-options="width:'100%'" />
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="LegalPerson" name="LegalPerson" class="easyui-textbox UnitOrSingle" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal">
                        法定代表人<br />
                        证件号码&nbsp;&nbsp;</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="LegalPersonCertificatesNo" name="LegalPersonCertificatesNo" class="easyui-textbox UnitOrSingle" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ContactPeople" name="ContactPeople" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ContactPhoneNo" name="ContactPhoneNo" class="easyui-numberbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ZipCode" name="ZipCode" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">电子邮箱</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Email" name="Email" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">绑定手机户名</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="BindPhoneName" name="BindPhoneName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">绑定手机号码</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="BindPhoneNo" name="BindPhoneNo" class="easyui-numberbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">负责人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ChargePeople" name="ContactPeople" class="easyui-textbox UnitOrSingle" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">负责人电话</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ChargePeoplePhoneNo" name="ChargePeoplePhoneNo" class="easyui-numberbox UnitOrSingle" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客商经营业态</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="TradeStateID" name="TradeStateID" />
                        <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商经营业态');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#TradeStateID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客商经营范围</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Range" name="Range" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客商经营品牌</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Brand" name="Brand" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客商经营级别</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Level" name="Level" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">银行代扣信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">银行名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="WithholdBankName" name="WithholdBankName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">银行户名</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="WithholdBankAccount" name="WithholdBankAccount" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="WithholdBankAccountNo" name="WithholdBankAccountNo" class="easyui-numberbox" data-options="promptChar:'',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">确认银行账号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="WithholdBankAccountNoConfirm" name="WithholdBankAccountNoConfirm" class="easyui-numberbox" data-options="promptChar:'',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">代扣协议编号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="WithholdAgreementNo" name="WithholdAgreementNo" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">银行代扣备注</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="WithholdRemark" name="WithholdRemark" class="easyui-textbox" data-options="multiline:true,width:'100%',height:'50px'" />
                    </div>
                </div>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">客商开票信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">开户银行</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketBankName" name="TicketBankName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketBankAccountNo" name="TicketBankAccountNo" class="easyui-numberbox" data-options="promptChar:'',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">地址</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketAddress" name="TicketAddress" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketPhoneNo" name="TicketPhoneNo" class="easyui-numberbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">纳税人名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketPayTaxesName" name="TicketPayTaxesName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">纳税人识别号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketPayTaxesDiscernNo" name="TicketPayTaxesDiscernNo" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketPeople" name="TicketPeople" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">电子邮箱</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="TicketEmail" name="TicketEmail" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客商开票备注</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="TicketRemark" name="TicketRemark" class="easyui-textbox" data-options="multiline:true,width:'100%',height:'50px'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">审核状态</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="AuditState" name="AuditState" class="easyui-combobox" />
                    </div>
                </div>
            </fieldset>
            <%--<div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                </div>
            </div>--%>
        </form>
        <div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        function SelDictionary(type) {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": type }), '选择' + type, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    if (type == "客商类别") {
                        $("#MerchantsCategoryID").val(data.ID);
                        $("#MerchantsCategoryName").textbox('setValue', data.Name);
                    } else {
                        $("#TradeStateID").val(data.ID);
                        $("#TradeStateName").textbox('setValue', data.Name);
                    }
                }
            });
        }
        function SelCertificates() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Certificates.aspx?' + $.param({}), '选择证件名称', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#CertificatesID").val(data.DictionaryCode);
                    $("#CertificatesName").textbox('setValue', data.DictionaryName);
                }
            });
        }
        $(function () {
            InitPage();
        });
        function InitPage() {
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            var data = [{ id: '单位', text: '单位' }, { id: '个人', text: '个人' }];
            $('#MerchantsType').combobox({
                editable: false,
                required: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

            data = [{ id: '未审核', text: '未审核' }, { id: '已审核', text: '已审核' }];
            $('#AuditState').combobox({
                editable: false,
                required: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                value: '未审核',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'MerchantsUnit', title: '管理单位', width: 200, align: 'center', sortable: false },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 150, align: 'center', sortable: false },
            { field: 'MerchantsName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'CertificatesNo', title: '证件号码', width: 150, align: 'center', sortable: false },
            { field: 'ContactPeople', title: '联系人', width: 100, align: 'center', sortable: false },
            {
                field: 'ContactPhoneNo', title: '联系电话', width: 100, align: 'center', sortable: false
            },
            {
                field: 'ContactAddress', title: '联系地址', width: 250, align: 'center', sortable: false
            },
            { field: 'ChargePeople', title: '负责人', width: 100, align: 'center', sortable: false },
            { field: 'ChargePeoplePhoneNo', title: '负责人电话', width: 100, align: 'center', sortable: false },
            { field: 'TradeStateName', title: '客商经营业态', width: 150, align: 'center', sortable: false },
            { field: 'Brand', title: '客商经营品牌', width: 150, align: 'center', sortable: false },
            {
                field: 'Level', title: '客商经营级别', width: 150, align: 'center', sortable: false
            },
            {
                field: 'AuditState', title: '审核状态', width: 100, align: 'center', sortable: false, styler: function (value, row, index) {
                    if (row.AuditState == "已审核") {
                        return 'background-color:#66CC66;color:#fff;';
                    }
                }
            },
            { field: 'Sort', title: '序号', width: 100, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: false,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("DivfManage_Merchants", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/MerchantsManage/Merchants/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function Audit(opt, auditState) {
            var row = $("#dg").datagrid("getChecked");
            if (row.length > 0) {
                $.messager.confirm('确定', '确定' + opt + '?', function (r) {
                    if (r) {
                        var idList = "";
                        $.each(row, function (i, item) {
                            idList += "," + item.ID;
                        });
                        idList = idList.substr(1);
                        $.dataPostJson('DivfManage_Merchants', 'Audit', { "idList": idList, "AuditState": auditState }, true, false,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    $('#AuditState').combobox('setValue', "未审核");
                                    InitDataGrid();
                                } else { $.messager.alert("温馨提示", data.msg); }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                });
            } else {
                $.messager.alert("温馨提示", '请选择需要' + opt + '的数据!');
            }
        }

    </script>
</body>
</html>
