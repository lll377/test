<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerView.aspx.cs" Inherits="M_Main.Renting.Merchants.RentSubscription.CustomerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查看客户详细信息</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客户信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="CustName" name="CustName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">出入证号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="PassSign" name="PassSign" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="PaperName" name="PaperName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="PaperCode" name="PaperCode" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="CustTypeName" name="CustTypeName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">固定电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="FixedTel" name="FixedTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">移动电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="MobilePhone" name="MobilePhone" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">传真电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="FaxTel" name="FaxTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">联系地址</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Address" name="Address" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="PostCode" name="PostCode" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">收 件 人</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Recipient" name="Recipient" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">电子邮件</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="EMail" name="EMail" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Linkman" name="Linkman" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="LinkmanTel" name="LinkmanTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">登录账号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="InquireAccount" name="InquireAccount" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                <div class="col-sm-2 col-xs-2">
                    <input id="IsUnit1" value="0" checked type="radio" name="IsUnit" runat="server" disabled="disabled">个人客户
                    <input id="IsUnit2" value="1" type="radio" name="IsUnit" runat="server" disabled="disabled">单位客户
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">个人客户信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">姓</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Surname" name="Surname" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">名字</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Name" name="Name" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">性别</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Sex" name="Sex" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">国籍</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Nationality" name="Nationality" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">出生日期</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Birthday" name="Birthday" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">工作单位</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="WorkUnit" name="WorkUnit" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">兴趣爱好</label>
                <div class="col-sm-5 col-xs-5">
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">单位客户信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="LegalRepr" name="LegalRepr" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">法定代表人电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="LegalReprTel" name="LegalReprTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">负责人</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="Charge" name="Charge" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">负责人电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="ChargeTel" name="ChargeTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">纳税主体信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="VATName" name="VATName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">纳税人识别号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="VATNumber" name="VATNumber" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">地址、电话</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="VATAddLinkTel" name="VATAddLinkTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">开户行及帐号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">银行代收信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">银行名称</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="BankName" name="BankName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">银行户名</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="BankIDs" name="BankIDs" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="BankAccount" name="BankAccount" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">确认银行账号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="BankAccountTwo" name="BankAccountTwo" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">代收协议编号</label>
                <div class="col-sm-2 col-xs-2">
                    <input type="text" id="BankAgreement" name="BankAgreement" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">备注</label>
                <div class="col-sm-8 col-xs-8">
                    <input type="text" id="Memo" name="Memo" runat="server" data-options="disabled:true,width:'100%',height:'40px',multiline:true" class="easyui-textbox" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="CustID" name="CustID" runat="server" />
    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            $('#mainForm').css("height", h - 60 + "px");

            let param = $.getUrlParam();
            if (!!param.CustID) {
                $("#CustID").val(param.CustID);
            }
            if (!!param.CommID) {
                $("#CommID").val(param.CommID);
            }
            InitData();
        });
        //初始化数据
        function InitData() {
            $.dataPostJson("Renting_RentalContract", 'GetCustomerDetailInfo', { CommID: $('#CommID').val(), CustID: $('#CustID').val() }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        $('#mainForm').form('load', data[0]);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function PageClose() {
            LayerDialog.Close('');
        }

    </script>
</body>
</html>
