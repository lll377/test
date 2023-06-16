<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.Merchants.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客商登记编辑</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-2.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
       
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" method="post" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">管理单位</label>
                <div class="col-sm-5 col-xs-5">
                    <label id="MerchantsUnit" class="control-content" runat="server"></label>
                </div>
                <label class="col-sm-1 col-xs-1 control-label">序号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0',disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客商类别</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="MerchantsCategoryID" name="MerchantsCategoryID" />
                    <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
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
                    <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',validType:'ajaxCheckRepeatData[\'DivfManage_Merchants\',\'CheckData\',\'MerchantsName\',\'IsDelete\',\'0\',\'ID\',\'#ID\']',invalidMessage:'总部或区域已登记该客商名称,不能重复录入!',onChange:function(newValue, oldValue){
                            if(!!newValue){
                                 var TicketPayTaxesName = $('#TicketPayTaxesName').textbox('getValue');
                                 if(!TicketPayTaxesName){ $('#TicketPayTaxesName').textbox('setValue',newValue);}
                            }}" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系地址</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ContactAddress" name="ContactAddress" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',onChange:function(newValue, oldValue){
                            if(!!newValue){
                                 var TicketAddress = $('#TicketAddress').textbox('getValue');
                                 if(!TicketAddress){ $('#TicketAddress').textbox('setValue',newValue);}
                            }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="CertificatesID" name="CertificatesID" />
                    <input id="CertificatesName" name="CertificatesName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
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
                    <input id="CertificatesNo" name="CertificatesNo" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',validType:'ajaxCheckRepeatData[\'DivfManage_Merchants\',\'CheckData\',\'CertificatesNo\',\'IsDelete\',\'0\',\'ID\',\'#ID\']',invalidMessage:'总部或区域已登记该证件号码,不能重复录入!'" />
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="LegalPerson" name="LegalPerson" class="easyui-textbox UnitOrSingle" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal">
                    法定代表人<br />
                    证件号码&nbsp;&nbsp;</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="LegalPersonCertificatesNo" name="LegalPersonCertificatesNo" class="easyui-textbox UnitOrSingle" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ContactPeople" name="ContactPeople" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',onChange:function(newValue, oldValue){
                            if(!!newValue){
                                 var BindPhoneName = $('#BindPhoneName').textbox('getValue');
                                 if(!BindPhoneName){ $('#BindPhoneName').textbox('setValue',newValue)}
                                 var TicketPeople = $('#TicketPeople').textbox('getValue');
                                 if(!TicketPeople){ $('#TicketPeople').textbox('setValue',newValue)}
                            }
                        }" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ContactPhoneNo" name="ContactPhoneNo" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',validType:['phoneAndMobile'],onChange:function(newValue, oldValue){
                        if(!!newValue){
                                 var BindPhoneNo = $('#BindPhoneNo').textbox('getValue');
                                 if(!BindPhoneNo){ $('#BindPhoneNo').textbox('setValue',newValue);}
                                 var TicketPhoneNo = $('#TicketPhoneNo').textbox('getValue');
                                 if(!TicketPhoneNo){ $('#TicketPhoneNo').textbox('setValue',newValue);}
                                 
                            }
                        }" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ZipCode" name="ZipCode" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">电子邮箱</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Email" name="Email" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',validType:'email',width:'100%',onChange:function(newValue, oldValue){
                            if(!!newValue){
                                 var TicketEmail = $('#TicketEmail').textbox('getValue');
                                 if(!TicketEmail){ $('#TicketEmail').textbox('setValue',newValue);}
                            }}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">绑定手机户名</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="BindPhoneName" name="BindPhoneName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">绑定手机号码</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="BindPhoneNo" name="BindPhoneNo" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%',validType:['phoneAndMobile']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">负责人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ChargePeople" name="ContactPeople" class="easyui-textbox UnitOrSingle" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">负责人电话</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ChargePeoplePhoneNo" name="ChargePeoplePhoneNo" class="easyui-textbox UnitOrSingle" data-options="required:true,tipPosition:'bottom',width:'100%',validType:['phoneAndMobile']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客商经营业态</label>
                <div class="col-sm-5 col-xs-5">
                    <input type="hidden" id="TradeStateID" name="TradeStateID" />
                    <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
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
                    <input id="Range" name="Range" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客商经营品牌</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Brand" name="Brand" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">客商经营级别</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Level" name="Level" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">银行代扣信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">银行名称</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="WithholdBankName" name="WithholdBankName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">银行户名</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="WithholdBankAccount" name="WithholdBankAccount" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="WithholdBankAccountNo" name="WithholdBankAccountNo" class="easyui-textbox" data-options="promptChar:'',required:false,tipPosition:'bottom',width:'100%',validType:['length[0,25]'],onChange:function(newValue, oldValue){
                            if(!!newValue){
                                ControlWithholdBankAccountNo(true);
                            }else{
                                ControlWithholdBankAccountNo(false);
                            }
                        }" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">确认银行账号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="WithholdBankAccountNoConfirm" name="WithholdBankAccountNoConfirm" class="easyui-textbox" data-options="promptChar:'',required:true,tipPosition:'bottom',width:'100%',validType:'equalTo[\'#WithholdBankAccountNo\']',invalidMessage:'两次输入的银行账号不匹配'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">代扣协议编号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="WithholdAgreementNo" name="WithholdAgreementNo" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:['length[0,80]']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">银行代扣备注</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="WithholdRemark" name="WithholdRemark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%',height:'50px'" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商开票信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">开户银行</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketBankName" name="TicketBankName" class="easyui-textbox UnitOrSingle" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketBankAccountNo" name="TicketBankAccountNo" class="easyui-textbox UnitOrSingle" data-options="promptChar:'',required:false,tipPosition:'bottom',width:'100%',validType:['length[0,25]']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">地址</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketAddress" name="TicketAddress" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketPhoneNo" name="TicketPhoneNo" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:['phoneAndMobile']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">纳税人名称</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketPayTaxesName" name="TicketPayTaxesName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">纳税人识别号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketPayTaxesDiscernNo" name="TicketPayTaxesDiscernNo" class="easyui-textbox UnitOrSingle" data-options="required:true,tipPosition:'bottom',width:'100%',validType:['length[0,40]']" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketPeople" name="TicketPeople" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">电子邮箱</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="TicketEmail" name="TicketEmail" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'email'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客商开票备注</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="TicketRemark" name="TicketRemark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%',height:'50px'" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商附件</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding-left: 10px">
                    <div id="fileForm">
                        <input type="hidden" name="FileType" id="FileType" />
                        <input type="hidden" name="FilePath" id="FilePath" />
                        <input type="hidden" name="FileCode" id="FileCode" />
                        <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:false,width:'200px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                        <input id="FileRemark" name="FileRemark" class="easyui-textbox" data-options="required:false,width:'250px',prompt:'文件备注(选填)',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" onclick="SaveFile()" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80">上传</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="<div><p>1、文件限制最大为2M。</p><p>2、文件新增/删除后点击保存才会生效。</p></div>" data-options="plain:true,iconCls:'icon-help'"></a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding: 0; padding-left: 10px">
                    <ul class="ul_annex_list" id="list_file"></ul>
                </div>
            </div>
        </fieldset>
        <%--<div class="form-group">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
            </div>
        </div>--%>
    </form>
    <div style="height: 50px"></div>
    <div class="fixed-tool-btn">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
    </div>
    <script type="text/javascript">
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
            $.extend($.fn.validatebox.defaults.rules, {
                merchantsCopyValue: {
                    validator: function (value, param) {
                        var isFocus = $(this).is(':focus');//返回false:说明已失去焦点
                        if (!isFocus) {
                            alert(1);
                            var text = $(param[0]).textbox('getValue');
                            if (!text) { $(param[0]).textbox('setValue', value); }
                        }
                        return true;
                    },
                    message: ''
                }
            });
            InitPage();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            InitControl();
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
            } else {
                GetMaxSort();
                IsVerification(false);
            }

        }
        function GetMaxSort() {
            $.dataPostJson('DivfManage_Merchants', 'GetMaxSort', { "IsLevel": "是" }, true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function InitControl() {
            ControlWithholdBankAccountNo(false);
            var data = [{ id: '单位', text: '单位' }, { id: '个人', text: '个人' }];
            $('#MerchantsType').combobox({
                editable: false,
                required: true,
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
                }],
                onSelect: function (record) {
                    if (record.text == "个人") {
                        IsVerification(false);
                    } else {
                        IsVerification(true);
                    }
                }
            });
        }

        function ControlWithholdBankAccountNo(isBool) {
            if (isBool) {
                $('#WithholdBankAccountNoConfirm').textbox('enableValidation');
            } else {
                $('#WithholdBankAccountNoConfirm').textbox('disableValidation').textbox('setValue', '');
            }
        }
        function IsVerification(isBool) {
            //if (isBool) {
            //    $(".UnitOrSingle").textbox("enableValidation");
            //} else {
            //    $(".UnitOrSingle").textbox("disableValidation");
            //}
            if (isBool) {
                $(".UnitOrSingle").textbox({ required: true });
            } else {
                $(".UnitOrSingle").textbox({ required: false });
            }

        }
        function InitData() {
            $.dataPostJson('DivfManage_Merchants', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                    $('#WithholdBankAccountNoConfirm').textbox('setValue', data.WithholdBankAccountNo);
                    GetListDataTableFileAnnex(data.ID);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function GetListDataTableFileAnnex(AttachedID) {
            var param = $.getUrlParam();
            param.AttachedID = AttachedID;
            $.dataPostJson('DivfManage_FileAnnex', 'GetListDataTable', param, true, false,
                function Init() {
                },
                function callback(data) {
                    AppendFile(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function Save() {
            var param = $.getParam();
            var param = $.getParam();
            var fileData = [];
            $('a[filename]').each(function (i, item) {
                fileData.push({ "FileName": $(this).attr("filename"), "FileSize": $(this).attr("filesize"), "FullPath": $(this).attr("href"), "FileRemark": $(this).attr("fileremark") });
            });
            console.log(fileData);
            param.FileData = JSON.stringify(fileData);
            if ($('#mainForm').form("validate")) {
                $.dataPostJson('DivfManage_Merchants', 'Save', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function Close() {
            LayerDialog.Close();
        }

        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (!file) {
                $.messager.alert('温馨提示', '请选择文件!');
            }
            var FileRemark = $("#FileRemark").textbox('getValue');
            //if (!$("#fileForm").form('validate')) { return false; };
            //var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var fileType = file.type;
            var fileSize = file.size;
            var fileName = file.name;

            //if (fileType != "image/bmp" && fileType != "image/jpeg" && fileType != "image/png" && fileType != "image/gif") {
            //    $.messager.alert('温馨提示', '图片格式不正确!', 'error');
            //    return false;
            //}
            if (fileSize > parseInt(maxsize)) {
                $.messager.alert('温馨提示', "不能上传超过" + tipFileSize + "M的附件！", 'error');
                return false;
            }
            var lastIndex = fileName.lastIndexOf(".");
            var suffix = fileName.substr(lastIndex + 1);//后缀

            var formData = new FormData();
            formData.append('file', file);
            formData.append('CorpId', "1241");
            formData.append('ExtName', suffix);
            formData.append('DicName', "");
            $.ajax({
                //url: "http://localhost:1241/HM/FileUpload/FileUpload.aspx",
                url: "/HM/M_Main/FileTransferred/FileTransferred.ashx",
                type: 'post',
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                async: false,
                data: formData,
                beforeSend: function (xhr) { $.messager.progress({ title: "温馨提示", msg: "正在上传...", interval: 3000 }); },
                success: function (data, status) {
                    if (data.result) {
                        var lastIndex = data.data.lastIndexOf("/");
                        var fileName = data.data.substr(lastIndex + 1);//后缀
                        var jsonData = [{ "FullPath": data.data, "FileName": fileName, "FileSize": fileSize, "FileRemark": FileRemark }];
                        AppendFile(jsonData);
                        $("#uploadFile").filebox('clear');
                        $("#FileRemark").textbox('clear');
                    } else {
                        $.messager.alert('错误', "图片服务器发生错误!", 'error');
                    }
                    $.messager.progress('close');
                },
                error: function (data) {
                    $.messager.alert('错误', "图片服务器发生错误!", 'error');
                    $.messager.progress('close');
                }
            });
            return false;
        }

        function AppendFile(arr) {
            if (!!arr) {
                console.log(arr);
                var html = "", FileSize = '';
                $.each(arr, function (i, item) {
                    FileSize = Number((parseFloat(item.FileSize) / 1024).toString()).toFixed(2);
                    html += "<li><a href=\"" + item.FullPath + "\" target=\"_blank\" filename=\"" + item.FileName + "\" filesize=\"" + item.FileSize + "\" fileremark=\"" + item.FileRemark + "\" title=\"<div><p style='text-align:center'>(点击下载文件)</p><p>文&nbsp;&nbsp;件&nbsp;&nbsp;名:" + item.FileName + "</p><p>文件大小:" + FileSize + "KB</p><p>文件备注:" + item.FileRemark + "</p></div>\" class=\"easyui-tooltip\" />" + item.FileName + "</a><a class=\"btn_del\"  onclick=\"javascript:$(this).parent().remove();\"href=\"javascript:void(0);\"title=\"删除附件\"class=\"btn_del\"></a></li>";
                });
                $("#list_file").append(html);
                $(".easyui-tooltip").tooltip();
            }
        }
    </script>
</body>
</html>
