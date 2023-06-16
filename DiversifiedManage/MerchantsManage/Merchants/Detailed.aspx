<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detailed.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.Merchants.Detailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>详情</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
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
    <style type="text/css">
        .col-sm-1, .col-sm-2, .col-sm-3 {
            background: #f9f9f9;
            border: 1px solid #eee;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .col-sm-6, .col-xs-6 {
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="mainForm" method="post" class="form-horizontal " role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商信息</legend>
            <div class="form-group">
                 <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">管理单位：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="MerchantsUnit" class="control-content">客户名称客称</label>
                    </div>
                </div>
                 <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">序号：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="Sort" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客商类别：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="MerchantsCategoryName" class="control-content">客户名称客称</label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">单位/个人客商：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="MerchantsType" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客户名称：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="MerchantsName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">联系地址：</label>

                    <div class="col-sm-9 col-xs-9">
                        <label id="ContactAddress" class="control-content"></label>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">证件名称：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="CertificatesName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">证件号码：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="CertificatesNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">法定代表人：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="LegalPerson" class="control-content"></label>
                    </div>
                </div>
                <label class="col-sm-2 col-xs-2 control-label">法定代表人证件号码：</label>
                <div class="col-sm-4 col-xs-4">
                    <label id="LegalPersonCertificatesNo" class="control-content"></label>
                </div>
                <%--<div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-4 col-xs-4 control-label">法定代表人证件号码：</label>
                    <div class="col-sm-8 col-xs-8">
                        <label id="LegalPersonCertificatesNo" class="control-content"></label>
                    </div>
                </div>--%>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">联系人：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="ContactPeople" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">联系人电话：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="ContactPhoneNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">邮政编码：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="ZipCode" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">电子邮箱：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="Email" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">绑定手机户名：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="BindPhoneName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">绑定手机号码：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="BindPhoneNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">负责人：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="ChargePeople" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">负责人电话：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="ChargePeoplePhoneNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客商经营业态：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TradeStateName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客商经营范围：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="Range" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客商经营品牌：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="Brand" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">客商经营级别：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="Level" class="control-content"></label>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">银行代扣信息</legend>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">银行名称：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="WithholdBankName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">银行户名：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="WithholdBankAccount" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">银行账号：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="WithholdBankAccountNo" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">代扣协议编号：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="WithholdAgreementNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注：</label>
                <div class="col-sm-11 col-xs-11">
                     <label id="WithholdRemark" class="control-content"></label>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商开票信息</legend>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">开户银行：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketBankName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">银行账号：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketBankAccountNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">地址：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketAddress" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">联系电话：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketPhoneNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">纳税人名称：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketPayTaxesName" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">纳税人识别号：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketPayTaxesDiscernNo" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">联系人：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketPeople" class="control-content"></label>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-6" style="padding: 0">
                    <label class="col-sm-3 col-xs-3 control-label">电子邮箱：</label>
                    <div class="col-sm-9 col-xs-9">
                        <label id="TicketEmail" class="control-content"></label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注：</label>
                <div class="col-sm-11 col-xs-11">
                    <label id="TicketRemark" class="control-content"></label>
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">客商附件</legend>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="padding: 0; padding-left: 10px">
                    <ul class="ul_annex_list" id="list_file"></ul>
                </div>
            </div>
        </fieldset>
    </form>
    <input type="hidden" name="ID" id="ID" />
    <script type="text/javascript">

        $(function () {
            InitPage();
        });

        function InitPage() {
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
            InitData();
        }
        function InitData() {
            $.dataPostJson('DivfManage_Merchants', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $.setParam(data);
                    InitDataFileAnnex(data.ID);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        function InitDataFileAnnex(AttachedID) {
            $.dataPostJson('DivfManage_FileAnnex', 'GetListDataTable', { "AttachedID": AttachedID }, true, false,
                function Init() {
                },
                function callback(data) {
                    AppendFile(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function AppendFile(arr) {
            if (!!arr) {
                console.log(arr);
                var html = "", FileSize = '';
                $.each(arr, function (i, item) {
                    FileSize = Number((parseFloat(item.FileSize) / 1024).toString()).toFixed(2);
                    html += "<li><a href=\"" + item.FullPath + "\" target=\"_blank\" filename=\"" + item.FileName + "\" filesize=\"" + item.FileSize + "\" fileremark=\"" + item.FileRemark + "\" title=\"<div><p style='text-align:center'>(点击下载文件)</p><p>文&nbsp;&nbsp;件&nbsp;&nbsp;名:" + item.FileName + "</p><p>文件大小:" + FileSize + "KB</p><p>文件备注:" + item.FileRemark + "</p></div>\" class=\"easyui-tooltip\" />" + item.FileName + "</a></li>";
                });
                $("#list_file").append(html);
                $(".easyui-tooltip").tooltip();
            }
        }
    </script>
</body>
</html>
