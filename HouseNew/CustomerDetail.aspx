<%@ Page Language="c#" CodeBehind="CustomerDetail.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustomerDetail" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>客户管理--客户信息</title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <%--  <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>--%>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/help.js" type="text/javascript"></script>
    <style type="text/css">
        .tabs-container .panel-body {
            padding: 0px;
        }

        table tr {
            border: 1px double #F6F6F6;
        }
    </style>

</head>
<body>
    <form id="CustomerDetail" method="post" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <input id="CommID" type="hidden" size="1" name="CommID" runat="server">
        <input id="IsUnit" type="hidden" size="1" name="IsUnit" runat="server">
        <input id="IsHis" type="hidden" size="1" name="IsHis" runat="server">
        <input id="EditBeginDate" type="hidden" name="EditBeginDate" runat="server" />
        <input id="EditEndDate" type="hidden" name="EditEndDate" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input id="CostIDs" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server" />
        <input id="IsDel" type="hidden" name="IsDel" runat="server">
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />  

        <div id="Divreport" name="Divreport" style="width: 100%;" class="easyui-layout" title="">
            <%--  <div data-options="region:'center',title:'列表选项卡'" style="background: #ffffff; border: hidden"> --%>
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="custinfo" id="custpage" refpage="" refsel="1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="true">客户信息</a>
                    </li>
                    <li class="" name="roominfo" id="roompage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false">房屋信息</a>
                    </li>
                    <li class="" name="parkinfo" id="parkpage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-3" aria-expanded="false">车位信息</a>
                    </li>
                    <li class="" name="familyinfo" id="familypage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-4" aria-expanded="false">家庭信息</a>
                    </li>

                    <li class="" name="cardinfo" id="cardinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-5" aria-expanded="false">办卡信息</a>
                    </li>

                    <li class="" name="renovation" id="renovation" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-6" aria-expanded="false">装修信息</a>
                    </li>

                    <li class="" name="incidentinfo" id="incidentpage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-7" aria-expanded="false">报事信息</a>
                    </li>
                    <li class="" name="tousuinfo" id="tousuinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-8" aria-expanded="false">投诉信息</a>
                    </li>
                    <li class="" name="entrustinto" id="entrustinto" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-9" aria-expanded="false">委托信息</a>
                    </li>
                    <li class="" name="keyinfo" id="keyinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-10" aria-expanded="false">钥匙信息</a>
                    </li>
                    <%-- <li class="" name="youbaoinfo" id="youbaoinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-11" aria-expanded="false">邮包信息</a>
                    </li>--%>
                   <%-- <li class="" name="baifanginfo" id="baifanginfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-12" aria-expanded="false">拜访信息</a>
                    </li>--%>
                    <li class="" name="contractinfo" id="contract" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-13" aria-expanded="false">合同信息</a>
                    </li>
                    <li class="" name="waiversFeeBrowseinfo" id="waiversFeeBrowse" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-14" aria-expanded="false">减免申请信息</a>
                    </li>
                    <li class="" name="waiversFeeOffsetSearchinfo" id="waiversFeeOffsetSearch" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-15" aria-expanded="false">减免冲销信息</a>
                    </li>
                    <li class="" name="feesinfo" id="feespage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-16" aria-expanded="false">费用信息</a>
                    </li>
                    <li class="" name="preinfo" id="prepage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-17" aria-expanded="false">预交信息</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <%-- 客户信息--%>
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer7">
                                    <table class="DialogTable" id="Table1" style="line-height: 25px; background-color: #FFFFFF; text-align: left; font-family: 微软雅黑;">
                                        <tr>
                                            <td colspan="4" style="padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">客户基本信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">名  称</td>
                                            <td class="TdContent">
                                                <asp:Label ID="CustName" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">出入证号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PassSign" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">证件名称</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PaperName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">证件号码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PaperCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">客户类别</td>
                                            <td class="TdContentSearch">
                                                <asp:Label ID="CustTypeName" runat="server" Visible="false"></asp:Label>
                                                <select id="CustTypeID" name="CustTypeID" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle">固定电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="FixedTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">移动电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="MobilePhone" runat="server"></asp:Label></td>
                                            <td class="TdTitle">传真电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="FaxTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">联系地址</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Address" runat="server"></asp:Label></td>
                                            <td class="TdTitle">邮政编码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PostCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">收 件 人</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Recipient" runat="server"></asp:Label></td>
                                            <td class="TdTitle">电子邮件</td>
                                            <td class="TdContent">
                                                <asp:Label ID="EMail" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">绑定手机户名</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Linkman" runat="server"></asp:Label></td>
                                            <td class="TdTitle">绑定手机号码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LinkmanTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td class="TdTitle">账号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="UnCustID" runat="server"></asp:Label></td>
                                            <td class="TdTitle">卡号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="InquireAccount" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">当前欠费</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DueAmount" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td class="TdTitle"></td>
                                            <td class="TdContent"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">个人客户信息</span>
                                            </td>
                                        </tr>
                                        <asp:Panel ID="PanelName" runat="server" Visible="False">
                                            <tr>
                                                <td class="TdTitle" width="15%" align="right">姓</td>
                                                <td class="TdContent" width="10%" align="right">
                                                    <asp:Label ID="Surname" runat="server"></asp:Label></td>
                                                <td class="TdTitle" width="15%" align="right">名</td>
                                                <td class="TdContent" width="10%">
                                                    <asp:Label ID="Name" runat="server"></asp:Label></td>
                                            </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td class="TdTitle">性 别</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Sex" runat="server"></asp:Label></td>
                                            <td class="TdTitle">出生日期</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Birthday" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">国 籍</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Nationality" runat="server"></asp:Label></td>
                                            <td class="TdTitle">职 业</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Job" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">工作单位</td>
                                            <td class="TdContent" colspan="3">
                                                <asp:Label ID="WorkUnit" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">兴趣爱好</td>
                                            <td class="TdContentSearch" colspan="3">
                                                <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">单位客户信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">法定代表人</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LegalRepr" runat="server"></asp:Label></td>
                                            <td class="TdTitle">法定代表人电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LegalReprTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">负 责 人</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Charge" runat="server"></asp:Label></td>
                                            <td class="TdTitle">负责人电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="ChargeTel" runat="server"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">纳税主体信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">名称</td>
                                            <td class="TdContent">
                                                <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                                                <asp:Label ID="VATName" name="VATName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">纳税人识别号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATNumber" name="VATNumber" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">地址、电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATAddLinkTel" name="VATAddLinkTel" runat="server"></asp:Label></td>
                                            <td class="TdTitle">开户行及帐号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server"></asp:Label></td>
                                        </tr>

                                        <%--  </table><table class="DialogTable" id="Table4" align="center">--%>
                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">银行代收信息</span>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="TdTitle">托收类别</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">银行行别</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">开户行省份</td>
                                            <td>
                                                <asp:Label ID="ProvinceCity" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">委托单位代码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DelegateUnitCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">签约日期</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DateSigning" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">业务种类</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BusinessTypes" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">开户行行号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankNo" runat="server"></asp:Label></td>
                                            <td class="TdTitle">开户行名称</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankInfo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">银行户名</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankIDs" runat="server"></asp:Label></td>
                                            <td class="TdTitle">代收协议编号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAgreement" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">银行账号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAccount" runat="server"></asp:Label></td>
                                            <td class="TdTitle">确认银行账号</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAccountTwo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">持卡证件名称</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankPaperName" runat="server" /></td>
                                            <td class="TdTitle">持卡人证件号码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankPaperCode" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">持卡人联系电话</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankMobilePhone" runat="server"></asp:Label></td>
                                            <td class="TdTitle">银行客户编码</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankCustCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">备 注</td>
                                            <td class="TdContent" colspan="3">
                                                <asp:Label ID="Memo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr style="height: 40px;">
                                            <td class="TdTitle"></td>
                                            <td class="TdContent" colspan="3"></td>
                                        </tr>
                                        <%--                                        <tr>
                                            <td style="text-align: center;" colspan="4" class="DialogTdSubmit">
                                                <input type="button" class="button" value="保 存" id="btnSave" runat="server" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="button" class="button" value="关 闭" id="btnReturn" />
                                            </td>
                                        </tr>--%>
                                    </table>
                                    <table style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 22px; background-color: #f5f5f5; border-top: 1px solid #cccccc;">
                                        <tr>
                                            <td colspan="2">
                                                <input class="button" id="save" onclick="BtnSave()"
                                                    type="button" value="保存" name="btnFilter" runat="server">
                                                <input type="button" class="button" value="保存" style="display: none;" id="btnSave" runat="server" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                 <input type="button" class="button" value="关闭" id="btnReturn" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- 房屋信息--%>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 车位信息--%>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 家庭信息--%>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 办卡信息--%>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="CardInfoContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 装修信息--%>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="RenovationContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 报事信息--%>
                    <div id="tab-7" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer4"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 投诉信息--%>
                    <div id="tab-8" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer12"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 委托信息--%>
                    <div id="tab-9" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer8"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 钥匙信息--%>
                    <div id="tab-10" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="KeyContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 邮包信息--%>
                    <%-- <div id="tab-11" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer6"></div>
                            </div>
                        </div>
                    </div>--%>
                    <%-- 拜访信息--%>
                   <%-- <div id="tab-12" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer13"></div>
                            </div>
                        </div>
                    </div>--%>
                    <%-- 合同信息--%>
                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="ContractContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 减免申请信息--%>
                    <div id="tab-14" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="WaiversFeeBrowseContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 减免冲销信息--%>
                    <div id="tab-15" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="WaiversFeeOffsetSearchContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 费用信息--%>
                    <div id="tab-16" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer5"></div>
                            </div>
                        </div>
                    </div>
                    <%-- 预交信息--%>
                    <div id="tab-17" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer6"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table style="display: none;" class="DialogTable" id="Table5" align="center">
            <tr>
                <td style="background-color: #e6e6e6; height: 25px;" align="center" colspan="6"><strong>客户房屋信息</strong></td>
            </tr>
            <tr>
                <td class="TdContent" colspan="4">
                    <asp:DataGrid ID="DGridRoom" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="LiveID" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="RoomID" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="ActualSubDate" ReadOnly="True" HeaderText="实际交房时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomFittingTime" ReadOnly="True" HeaderText="装修时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomStayTime" ReadOnly="True" HeaderText="入住时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PayBeginDate" ReadOnly="True" HeaderText="开始缴费时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td class="formTable_Header" align="center" colspan="6"><strong>客户车位信息</strong></td>
            </tr>
            <tr>
                <td class="TdContent" colspan="4">
                    <asp:DataGrid ID="DGridCar" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="ParkID"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="HandID"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CarparkName" SortExpression="CarparkName" HeaderText="车位区域"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkCategoryName" SortExpression="ParkCategoryName" HeaderText="车位类别"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkType" SortExpression="ParkType" HeaderText="车位类型"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkName" SortExpression="ParkName" HeaderText="车位编号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="StanAmount" SortExpression="StanAmount" HeaderText="收费标准" DataFormatString="{0:N2}"></asp:BoundColumn>
                            <asp:TemplateColumn SortExpression="UseState" HeaderText="当前状态">
                                <ItemTemplate>
                                    <asp:Label ID="UseState" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.UseState") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="CustName" SortExpression="CustName" HeaderText="客户名称"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" SortExpression="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkingCarSign" SortExpression="ParkingCarSign" HeaderText="停车卡号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CarSign" SortExpression="CarSign" HeaderText="车牌号码"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkStartDate" SortExpression="ParkStartDate" HeaderText="开始时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkEndDate" SortExpression="ParkEndDate" HeaderText="结束时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ChargeCycleName" SortExpression="ChargeCycleName" HeaderText="计费周期"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CarEmission" SortExpression="CarEmission" HeaderText="排量"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[办理]">
                                <HeaderStyle Width="40px"></HeaderStyle>
                                <HeaderTemplate>
                                    [详情]
                                </HeaderTemplate>
                                <ItemTemplate>

                                    <asp:LinkButton ID="LB_Edit" runat="server" CommandName="Edit" CausesValidation="true">
																		<img src='../images/icons/Edit.gif' border='0' align='absmiddle' alt='详情'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn Visible="False" DataField="UseState" SortExpression="UseState"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="UseName"></asp:BoundColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid>
                </td>
            </tr>
            <tr>
                <td class="formTable_Header" align="center" colspan="4">家庭成员信息</td>
            </tr>
            <tr>
                <td class="TdContent" colspan="4">
                    <asp:DataGrid ID="DGridHD" Style="font-size: 12px" runat="server" AutoGenerateColumns="False"
                        Width="100%" CssClass="DataGrid">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="HoldID" ReadOnly="True">
                                <HeaderStyle Width="0px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="MemberName" HeaderText="成员名称"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Sex" HeaderText="性别"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Birthday" HeaderText="出生日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="MobilePhone" HeaderText="电话号码"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PaperCode" HeaderText="证件号码"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RelationshipName" HeaderText="与户主关系"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td class="formTable_Header" align="center" colspan="6"><strong>其它附件信息</strong></td>
            </tr>
            <tr>
                <td class="TdContent" colspan="4">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="AdjunctCode">
                                <HeaderStyle Width="0px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="AdjunctName" HeaderText="文件说明">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="FileSize" HeaderText="大小(KB)" DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[下载]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <asp:Panel ID="IncRep" runat="server">
                <tr>
                    <td class="formTable_Header" colspan="4" align="center">历史报事记录</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:DataGrid ID="IncDGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
                            AllowSorting="True" Height="100%">
                            <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                            <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                            <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                            <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="IncidentID"></asp:BoundColumn>
                                <asp:BoundColumn DataField="BigTypeName" SortExpression="BigTypeName" HeaderText="报事大类"></asp:BoundColumn>
                                <asp:BoundColumn DataField="FineTypeName" SortExpression="FineTypeName" HeaderText="报事细类"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentPlace" SortExpression="IncidentPlace" HeaderText="报事区域"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentNum" SortExpression="IncidentNum" HeaderText="报事编号"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="CustName" SortExpression="CustName" HeaderText="客户名称"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="IncidentContent" SortExpression="IncidentContent" HeaderText="报事内容"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentDate" SortExpression="IncidentDate" HeaderText="报事时间"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="Phone" SortExpression="Phone" HeaderText="联系电话"></asp:BoundColumn>
                                <asp:TemplateColumn SortExpression="IncidentContent" HeaderText="报事内容">
                                    <ItemTemplate>
                                        <asp:Label ID="lbContent" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="DispTypeName" SortExpression="DispTypeName" HeaderText="派工类别"></asp:BoundColumn>
                                <asp:BoundColumn DataField="CoordinateNum" SortExpression="CoordinateNum" HeaderText="派工/协调单"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DispMan" SortExpression="DispMan" HeaderText="派工人"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DispDate" SortExpression="DispDate" HeaderText="派工时间"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DealMan" SortExpression="DealMan" HeaderText="处理人"></asp:BoundColumn>
                                <asp:BoundColumn DataField="MainEndDate" SortExpression="MainEndDate" HeaderText="完结时间"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DueAmount" SortExpression="DueAmount" HeaderText="费用"></asp:BoundColumn>
                                <asp:BoundColumn DataField="FinishUser" SortExpression="FinishUser" HeaderText="完结人"></asp:BoundColumn>
                            </Columns>
                            <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                        </asp:DataGrid></td>
                </tr>
            </asp:Panel>

        </table>


        <div id="FyTb">
            合计金额：<span id="ToolBarDueAmount"></span>
        </div>

        <div id="FyYj">
            <span id="DvFeesHit"></span>
        </div>

        <input type="hidden" id="FeesHit" name="FeesHit" runat="server" />
    </form>
</body>
</html>

<script type="text/javascript">

    $("#ToolBarDueAmount").html($("#DueAmount").html());
    $("#DvFeesHit").html($("#FeesHit").val());

    $("#btnReturn").click(function ()
    {
        //HDialog.Close('');
        parent.window.close();
    });
    $(function () {
        InitTableHeight();
        //LoadRoomInfo();

        //设置费用查询时间断
        var date = new Date();
        var year = date.getFullYear() + 50;
        var month = date.getMonth() + 1;
        var day = date.getDate();
        var enddate = year + "-" + month + "-" + day;
        $("#EditBeginDate").val("2000-01-01");
        $("#EditEndDate").val(enddate);

    })
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) { return pair[1]; }
        }
        return (false);
    }

    function InitFrom() {
        var com = getQueryVariable("FromIndex");
        if (com != "") {
            $("#FromIndex").val(com);
        }
    }
    InitFrom();

    function InitTableHeight() {

        var h = $(window).height() - 38;

        $(".Frm").css({ "height": h + "px" });


        $("#TableContainer1").css("height", h + "px");
        $("#TableContainer2").css("height", h + "px");
        $("#TableContainer3").css("height", h + "px");
        $("#TableContainer4").css("height", h + "px");
        $("#TableContainer5").css("height", h + "px");
        $("#TableContainer6").css("height", h + "px");
        $("#TableContainer7").css("height", h + "px");
        $("#TableContainer8").css("height", h + "px");

        $("#CardInfoContainer").css("height", h + "px");
        $("#RenovationContainer").css("height", h + "px");
        $("#KeyContainer").css("height", h + "px");
        $("#ContractContainer").css("height", h + "px");
        $("#WaiversFeeBrowseContainer").css("height", h + "px");
        $("#WaiversFeeOffsetSearchContainer").css("height", h + "px");
    }

    $(".tabs-container li").click(function () {
        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");
        $('#tab-3').attr("class", "tab-pane");
        $('#tab-4').attr("class", "tab-pane");
        $('#tab-5').attr("class", "tab-pane");
        $('#tab-6').attr("class", "tab-pane");
        $('#tab-7').attr("class", "tab-pane");
        $('#tab-8').attr("class", "tab-pane");
        $('#tab-9').attr("class", "tab-pane");
        $('#tab-10').attr("class", "tab-pane");
        //$('#tab-11').attr("class", "tab-pane");
        //$('#tab-12').attr("class", "tab-pane");
        $('#tab-13').attr("class", "tab-pane");
        $('#tab-14').attr("class", "tab-pane");
        $('#tab-15').attr("class", "tab-pane");
        $('#tab-16').attr("class", "tab-pane");
        $('#tab-17').attr("class", "tab-pane");

        $('#custinfo').attr("refsel", "0");
        $('#roominfo').attr("refsel", "0");
        $('#parkinfo').attr("refsel", "0");
        $('#familyinfo').attr("refsel", "0");
        $('#incidentinfo').attr("refsel", "0");
        $('#entrustinto').attr("refsel", "0");
        $('#feesinfo').attr("refsel", "0");
        $('#preinfo').attr("refsel", "0");

        $('#keyinfo').attr("refsel", "0");
        $('#cardinfo').attr("refsel", "0");
        $('#baifanginfo').attr("refsel", "0");
        $('#contractinfo').attr("refsel", "0");
        $('#waiversFeeBrowseinfo').attr("refsel", "0");
        $('#waiversFeeOffsetSearchinfo').attr("refsel", "0");


        $('#custinfo').attr("class", "");
        $('#roominfo').attr("class", "");
        $('#parkinfo').attr("class", "");
        $('#familyinfo').attr("class", "");
        $('#incidentinfo').attr("class", "");
        $('#entrustinto').attr("class", "");

        $('#feesinfo').attr("class", "");
        $('#preinfo').attr("class", "");
        $('#keyinfo').attr("class", "");
        $('#cardinfo').attr("class", "");
        $('#baifanginfo').attr("class", "");
        $('#contractinfo').attr("class", "");
        $('#waiversFeeBrowseinfo').attr("class", "");
        $('#waiversFeeOffsetSearchinfo').attr("class", "");


        switch ($(this).attr("name")) {
            case "custinfo":

                $('#tab-1').attr("class", "tab-pane active");
                $('#custinfo').attr("refsel", "1");
                $('#custinfo').attr("class", "active");

                break;
            case "roominfo":

                $('#tab-2').attr("class", "tab-pane active");
                $('#roominfo').attr("refsel", "1");
                $('#roominfo').attr("class", "active");
                LoadRoomInfo();
                break;
            case "parkinfo":

                $('#tab-3').attr("class", "tab-pane active");
                $('#parkinfo').attr("refsel", "1");
                $('#parkinfo').attr("class", "active");
                LoadParkInfo();
                break;
            case "familyinfo":

                $('#tab-4').attr("class", "tab-pane active");
                $('#familyinfo').attr("refsel", "1");
                $('#familyinfo').attr("class", "active");
                LoadFamilyInfo();
                break;
            case "cardinfo":

                $('#tab-5').attr("class", "tab-pane active");
                $('#cardinfo').attr("refsel", "1");
                $('#cardinfo').attr("class", "active");
                LoadCardInfo();
                break;
            case "renovation":

                $('#tab-6').attr("class", "tab-pane active");
                $('#renovation').attr("refsel", "1");
                $('#renovation').attr("class", "active");
                LoadRenovation();
                break;

            case "incidentinfo":

                $('#tab-7').attr("class", "tab-pane active");
                $('#incidentinfo').attr("refsel", "1");
                $('#incidentinfo').attr("class", "active");
                LoadIncidentInfo();
                break;

            case "entrustinto":

                $('#tab-8').attr("class", "tab-pane active");
                $('#tousuinfo').attr("refsel", "1");
                $('#tousuinfo').attr("class", "active");
                //LoadEntrustinto();
                break;
            case "entrustinto":

                $('#tab-9').attr("class", "tab-pane active");
                $('#entrustinto').attr("refsel", "1");
                $('#entrustinto').attr("class", "active");
                LoadEntrustinto();
                break;
            case "keyinfo":

                $('#tab-10').attr("class", "tab-pane active");
                $('#keyinfo').attr("refsel", "1");
                $('#keyinfo').attr("class", "active");
                LoadKeyInfo();
                break;
            //case "youbaoinfo":
            //    $('#tab-11').attr("class", "tab-pane active");
            //    $('#youbaoinfo').attr("refsel", "1");
            //    $('#youbaoinfo').attr("class", "active");
            //    //LoadKeyInfo();
            //    break;

            //case "baifanginfo":

            //    $('#tab-12').attr("class", "tab-pane active");
            //    $('#baifanginfo').attr("refsel", "1");
            //    $('#baifanginfo').attr("class", "active");
            //    //LoadContractInfo();
            //    break;
             case "contractinfo":

                $('#tab-13').attr("class", "tab-pane active");
                $('#contractinfo').attr("refsel", "1");
                $('#contractinfo').attr("class", "active");
                LoadContractInfo();
                break;

            case "waiversFeeBrowseinfo":

                $('#tab-14').attr("class", "tab-pane active");
                $('#waiversFeeBrowseinfo').attr("refsel", "1");
                $('#waiversFeeBrowseinfo').attr("class", "active");
                WaiversFeeBrowseLoadList();
                break;
             
            case "waiversFeeOffsetSearchinfo":

                $('#tab-15').attr("class", "tab-pane active");
                $('#waiversFeeOffsetSearchinfo').attr("refsel", "1");
                $('#waiversFeeOffsetSearchinfo').attr("class", "active");
                WaiversFeeOffsetSearchLoadList();
                break;
            case "feesinfo":

                $('#tab-16').attr("class", "tab-pane active");
                $('#feesinfo').attr("refsel", "1");
                $('#feesinfo').attr("class", "active");
                LoadFeesInfo();
                break;
            case "preinfo":

                $('#tab-17').attr("class", "tab-pane active");
                $('#preinfo').attr("refsel", "1");
                $('#preinfo').attr("class", "active");
                LoadPreInfo();
                break;

        }
    });


    //是否转让历史
    function ViewDetail(RoomSign) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../HouseNew/SaleRoomSearch.aspx?RoomSign=' + RoomSign,
            '房屋转让历史', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //租凭历史
    function ViewRentalDetail(RoomSign) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../RentalNew/NewLeaseInfoSeach.aspx?RoomSign=' + RoomSign,
            '房屋租凭历史', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //房屋信息
    //费用信息
    var RoomInfofrozenColumns = [[
        { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomModel', title: '户型', width: 100, align: 'left', sortable: true },
    ]]

    var RoomInfoColumn = [[
        {
            field: 'IsSale', title: '是否转让', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = '否';
                if (row.IsSale == 1) {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.RoomSign + "');\">是</a>";
                }
                return str;
            }
        },
        {
            field: 'UsesState', title: '是否租赁', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = '否';
                if (row.UsesState == 2) {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRentalDetail('" + row.RoomSign + "');\">是</a>";
                }
                return str;
            }
        },
        { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '套内面积', width: 100, align: 'left', sortable: true },
        { field: 'CommonArea', title: '公摊面积', width: 100, align: 'left', sortable: true },
        { field: 'GardenArea', title: '花园面积', width: 100, align: 'left', sortable: true },
        { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
        {
            field: 'ContSubDate', title: '合同交房时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ActualSubDate', title: '交房时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomFittingTime', title: '装修时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomFittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomStayTime', title: '入住时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomStayTime, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'PayBeginDate', title: '开始缴费时间', width: 110, align: 'left', sortable: true },

        { field: 'BankName', title: '托收类别', width: 100, align: 'left', sortable: true },
        { field: 'BankCodeName', title: '银行行别', width: 100, align: 'left', sortable: true },
        { field: 'BankProvince', title: '开户行省份', width: 100, align: 'left', sortable: true },
        { field: 'BankCity', title: '开户行市', width: 100, align: 'left', sortable: true },
        { field: 'BankNo', title: '开户行行号', width: 100, align: 'left', sortable: true },
        { field: 'BankInfo', title: '开户行名称', width: 100, align: 'left', sortable: true },
        { field: 'BankIDs', title: '银行户名', width: 100, align: 'left', sortable: true },
        { field: 'BankAccount', title: '银行账号', width: 100, align: 'left', sortable: true },
        { field: 'BankAgreement', title: '代收协议编号', width: 100, align: 'left', sortable: true },
        { field: 'BankPaperName', title: '持卡证件名称', width: 100, align: 'left', sortable: true },
        { field: 'BankPaperCode', title: '持卡人证件号码', width: 100, align: 'left', sortable: true },
        { field: 'BankMobilePhone', title: '持卡人联系电话', width: 100, align: 'left', sortable: true },
        { field: 'BankCustCode', title: '银行客户编码', width: 100, align: 'left', sortable: true }

    ]]
    function LoadRoomInfo() {
        $("#TableContainer1").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: RoomInfoColumn,
            frozenColumns: RoomInfofrozenColumns,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "LoadRoomInfo", "TableContainer1", param);
            }
        });
    }

    //车位信息
    var ParkInfoColumn = [[
        { field: 'CarparkName', title: '车位区域', width: 150, align: 'left', sortable: true },
        { field: 'ParkCategoryName', title: '车位类别', width: 150, align: 'left', sortable: true },
        { field: 'ParkType', title: '车位类型', width: 150, align: 'left', sortable: true },
        { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
        { field: 'ParkArea', title: '车位面积', width: 180, align: 'left', sortable: true },
        { field: 'StanAmount', title: '收费标准', width: 100, align: 'left', sortable: true },
        { field: 'UseState', title: '当前状态', width: 100, align: 'left', sortable: true },
        { field: 'NCustName', title: '客户名称', width: 200, align: 'left', sortable: true },
        { field: 'NRoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'ParkingCarSign', title: '停车卡号', width: 150, align: 'left', sortable: true },
        { field: 'CarSign', title: '车牌号码', width: 150, align: 'left', sortable: true },
        {
            field: 'ParkStartDate', title: '开始时间', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ParkEndDate', title: '结束时间', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ChargeCycleName', title: '计费周期', width: 180, align: 'left', sortable: true }

    ]];


    function BtnSave() {

        if ($("#CustTypeID").val() == "") {
            HDialog.Info("请选择客户类别!");
        }
        else {
            document.getElementById('btnSave').click();
        }



    }
    function LoadParkInfo() {
        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: ParkInfoColumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "LoadParkInfo", "TableContainer2", param);
            }
        });
    }


    //家庭信息
    var FamilyInfoColumn = [[
        {
            field: 'MemberName', title: '成员名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                console.log(row);
                var str = "";
                var Params = "";
                Params = "HoldID=" + row.HoldID + "&CustID=" + row.CustID;

                if (row.IsLock == "1") {
                    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetailCY('家庭成员','Edit','" + Params + "');\">" + row.MemberName + "(已锁定)</a>";
                } else {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetailCY('家庭成员','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                }
                return str;
            }
        },
        { field: 'Sex', title: '性别', width: 100, align: 'left', sortable: true },
        {
            field: 'Birthday', title: '出生日期', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.Birthday, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'PaperCode', title: '证件号码', width: 150, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 150, align: 'left', sortable: true },
        { field: 'RelationshipName', title: '与户主关系', width: 150, align: 'left', sortable: true }
    ]]

    //2018-05-17 新增办卡信息按钮
    var CardInfoToolBarForFamily = [
        {
            text: '新增办卡信息',
            iconCls: 'icon-add',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("请选择需要办理出入卡的家庭信息");
                    return;
                }
                var Params = "";
                Params = "HoldID=" + row.HoldID + "&CustId=" + row.CustID;
                ViewCardInfoDetail("出入卡办理", 'Insert', Params);
            }
        }
    ];
    //办卡信息详细页面
    function ViewCardInfoDetail(title, OpType, Params) {
        HDialog.Open("1024", "578", '../HouseNew/AccessCardManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data != "false" && _Data != "") {
                LoadCardInfo();
            }
        });
    }

    function LoadFamilyInfo() {
        $("#TableContainer3").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: FamilyInfoColumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            toolbar: CardInfoToolBarForFamily,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "LoadFamilyInfo", "TableContainer3", param);
            }
        });
    }

    //报事信息
    var frozenColumns = [[
        { field: 'BigTypeName', title: '报事类别', width: 210, align: 'left', sortable: true },
        { field: 'IncidentPlace', title: '报事区域', width: 100, align: 'left', sortable: true },
        { field: 'IncidentNum', title: '报事编号', width: 100, align: 'left', sortable: true },
    ]];
    var IncidentInfoColumn = [[
        {
            field: 'IncidentDate', title: '报事时间', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.IncidentDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        {
            field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.IncidentContent.length > 20) {
                    str = row.IncidentContent.substr(0, 20) + "...";
                } else {
                    str = row.IncidentContent;
                }
                return str;
            }
        },
        { field: 'DispTypeName', title: '派工类别', width: 100, align: 'left', sortable: true },
        { field: 'CoordinateNum', title: '派工/协调单', width: 100, align: 'left', sortable: true },
        { field: 'DispMan', title: '派工人', width: 100, align: 'left', sortable: true },
        {
            field: 'DispDate', title: '派工时间', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.DispDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        { field: 'DealMan', title: '处理人', width: 100, align: 'left', sortable: true },
        {
            field: 'MainEndDate', title: '完结时间', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.MainEndDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        { field: 'DueAmount', title: '费用', width: 100, align: 'left', sortable: true },
        { field: 'FinishUser', title: '完结人', width: 100, align: 'left', sortable: true }
    ]]
    function LoadIncidentInfo() {
        $("#TableContainer4").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: IncidentInfoColumn,
            frozenColumns: frozenColumns,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "LoadIncidentInfo", "TableContainer4", param);
            }
        });
    }


    //费用信息
    var FeesfrozenColumns = [[

        { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 150 },
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
        { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 },
    ]]
    var FeesInfoColumn = [[

        { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 120 },
        { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 120 },
        { field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 120 },
        { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 120 },
        {
            field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 120,
            formatter: function (value, row, index) {
                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                return str;
            }
        },

        {
            field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },

        {
            field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'StartDegree', title: '起度', align: 'left', sortable: true, width: 50 },
        { field: 'EndDegree', title: '止度', align: 'left', sortable: true, width: 50 },
        { field: 'CalcAmount', title: '数量1', align: 'left', sortable: true, width: 50 },
        { field: 'CalcAmount2', title: '数量2', align: 'left', sortable: true, width: 50 },
        { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 80 },
        { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 80 },
        { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 80 },
        { field: 'WaivAmount', title: '减免冲抵', align: 'left', sortable: true, width: 80 },
        { field: 'RefundAmount', title: '退款金额', align: 'left', sortable: true, width: 80 },
        { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, width: 80 },
        { field: 'LateFeeAmount', title: '合同违约金', align: 'left', sortable: true, width: 80 },
        { field: 'IsPrecName', title: '是否预收', align: 'left', sortable: true, width: 60 },
        { field: 'FeesMemo', title: '备注', align: 'left', sortable: true, width: 120 }
    ]];
    function LoadFeesInfo() {
        $("#TableContainer5").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: FeesInfoColumn,
            frozenColumns: FeesfrozenColumns,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            toolbar: '#FyTb',
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Customer", "LoadFeeInfo", "TableContainer5", param);
            }
        });
    }

    //预交信息
    var PrefrozenColumns = [[
        { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 230, align: 'left', sortable: true },
    ]]
    var PreInfoColumn = [[

        { field: 'ParkNames', title: '车位', width: 150, align: 'left', sortable: true },
        { field: 'FixedTel', title: '联系电话', width: 120, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 120, align: 'left', sortable: true },
        { field: 'PrecAmount', title: '预交余额', width: 100, align: 'left', sortable: true },
        { field: 'IsPrecName', title: '是否参与冲抵', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '冲抵费用项目', width: 100, align: 'left', sortable: true },
        { field: 'PrecMemo', title: '备注', width: 180, align: 'left', sortable: true },
        {
            field: '余额提示', title: '余额提示', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "余额正常";
                if (row.PrecAmount < row.OffsetAmountMonth) {
                    str = "<font color=red>余额不足</font>";
                }
                return str;
            }
        }

    ]]
    function LoadPreInfo() {
        $("#TableContainer6").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: PreInfoColumn,
            frozenColumns: PrefrozenColumns,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            toolbar: '#FyYj',
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "LoadPreInfo", "TableContainer6", param);
            }
        });
    }



    var EntrustintoColumn = [[
        { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
        { field: 'EntrustType', title: '委托类别', width: 100, align: 'left', sortable: true },
        { field: 'EntrustMobile', title: '委托人联系电话', width: 90, align: 'left', sortable: true },
        {
            field: 'StartDate', title: '委托时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.StartDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'EntrustBook', title: '委托书', width: 60, align: 'left', sortable: true },
        { field: 'Trustee', title: '受托人', width: 90, align: 'left', sortable: true },
        { field: 'Relationship', title: '与委托人关系', width: 90, align: 'left', sortable: true },
        { field: 'Mobile', title: '受托人电话', width: 90, align: 'left', sortable: true },
        { field: 'EntrustThing', title: '委托内容', width: 90, align: 'left', sortable: true },
        { field: 'IsHandle', title: '是否办理', width: 100, align: 'left', sortable: true },
        { field: 'HandleUserName', title: '办理人', width: 90, align: 'left', sortable: true },
        {
            field: 'HandleDate', title: '办理时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (row.HandleDate != "") {
                    str = formatDate(row.HandleDate, "yyyy-MM-dd");
                }
                return str;
            }
        }
    ]];

    //委托信息
    function LoadEntrustinto() {
        $("#TableContainer8").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: EntrustintoColumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("RoomRental", "EntrustList", "TableContainer8", param);
            }
        });
    }

    function ViewDetailCY(title, OpType, Params) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h + 20, '../ComprehensiveAuditing/HouseholdManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {

            //if (_Data != "false" && _Data != "") {

            // }
        });
    }

    var CardColumn = [[
        {
            field: 'CustName', title: '户主名称', width: 140, align: 'left', sortable: true
        },
        { field: 'YzRoomSign', title: '户主房号', width: 300, align: 'left', sortable: true },
        {
            field: 'MemberName', title: '成员名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                console.log(row);
                var str = "";
                var Params = "";
                Params = "HoldID=" + row.HoldId + "&CustID=" + row.CustId;

                if (row.IsLock == "1") {
                    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetailCY('家庭成员','Edit','" + Params + "');\">" + row.MemberName + "(已锁定)</a>";
                } else {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetailCY('家庭成员','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                }
                console.log(str);
                return str;
            }
        },
        { field: 'CyRoomSign', title: '成员房号', width: 300, align: 'left', sortable: true },
        { field: 'RelationshipName', title: '与户主关系', width: 100, align: 'left', sortable: true },
        { field: 'CardDate', title: '办卡日期', width: 130, align: 'left', sortable: true },
        { field: 'CardNum', title: '卡号', width: 140, align: 'left', sortable: true },
        { field: 'CardState', title: '状态', width: 100, align: 'left', sortable: true }
    ]];
    //2018-05-17 添加  办卡信息编辑按钮
    var CardInfoToolBar = [
        {
            text: '编辑',
            iconCls: 'icon-edit',
            handler: function () {
                var row = $("#CardInfoContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("请选择需要编辑的办卡信息");
                    return;
                }
                var Params = "";
                Params = "Id=" + row.Id;
                ViewCardInfoDetail("出入卡办理", 'Edit', Params);
            }
        }
    ];

    //办卡信息
    function LoadCardInfo() {
        $("#CardInfoContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: CardColumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            toolbar: CardInfoToolBar,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Customer", "SearchCustAccessCardListAll", "CardInfoContainer", param);
            }
        });
    }


    var RenoCustColumn = [[
        { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 250, align: 'left', sortable: true },
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
                    value = "<a  onclick=\"ShowQRCode('" + value + "');\" href=\"javascript:void(0)\">二维码</a>";
                }
                return value;
            }
        },
        { field: 'HandleCertificateCount', title: '出入证数量', width: 80, align: 'left', sortable: false },
        { field: 'CostTotalSum', title: '收费金额', width: 80, align: 'left', sortable: false },
        { field: 'PatrolCount', title: '整改单数量', width: 80, align: 'left', sortable: false },
        { field: 'RenovationState', title: '装修状态', width: 80, align: 'left', sortable: false }
    ]];

    //装修信息
    function LoadRenovation() {
        $("#RenovationContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            idField: "ID",
            columns: RenoCustColumn,
            rownumbers: true,
            fitColumns: false,
            checkbox: true,
            singleSelect: true,
            checkOnSelect: true,
            selectOnCheck: true,
            border: false,
            pagination: true,
            width: "100%",
            sortOrder: "desc",
            remoteSort: false,
            onBeforeLoad: function (param) {
                param.RoomID = $("#RoomIDs").val();
                param = $.JQForm.GetParam("Renovation", "GetListRenovation", "RenovationContainer", param);

            }
        });
    }



    var Keycolumn = [[
        { field: 'KeyTypeIDName', title: '钥匙类型', width: 150, align: 'center' },
        { field: 'CustName', title: '客户名称', width: 200, align: 'center' },
        { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', halign: 'center' },
        { field: 'KeyCode', title: '钥匙编号', width: 100, align: 'center' },
        { field: 'KeyCount', title: '钥匙数量', width: 100, align: 'center' },
        {
            field: 'RegisterDate', title: '登记时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'ReceiveDate', title: '领取时间', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'RecoveryDate', title: '归还时间', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'ReturnDate', title: '回收时间', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        { field: 'State', title: '状态', width: 100, align: 'center' }
    ]];

    function LoadKeyInfo() {
        $("#KeyContainer").datagrid({
            url: '/HM/M_Main/HC/DataPost.aspx',
            method: "post",
            nowrap: false,
            fitColumns: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            fit: true,
            idField: "ID",
            columns: Keycolumn,
            rownumbers: true,
            checkbox: true,
            singleSelect: true,
            checkOnSelect: false,
            selectOnCheck: false,
            border: false,
            pagination: true,
            width: "100%",
            remoteSort: false,
            sortOrder: "asc",
            onBeforeLoad: function (param)
            {
                param = $.getDataGridParam("Key_KeyInfo", "GetList", param);
            }   
        });
    }

    //合同信息
    var ContractfrozenColumns = [[
        { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
        { field: 'NewContTypeName', title: '合同类别', align: 'left', sortable: true, width: 100 },
        {
            field: 'ContSign', title: '合同编号', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('合同详情','Detail'," + row.ContID + ");\">" + row.ContSign + "</a>";
                return str;
            }
        }
    ]];

    var ContractColumns = [[
        { field: 'ContName', title: '合同名称', width: 100, align: 'left', sortable: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'UnitName', title: '对方单位', width: 100, align: 'left', sortable: true },
        { field: 'Vender', title: '联系人', width: 100, align: 'left', sortable: true },
        { field: 'VenderTel', title: '联系电话', width: 100, align: 'left', sortable: true },
        { field: 'ContractPeriod', title: '合同期限', width: 100, align: 'left', sortable: true },
        {
            field: 'ContStartDate', title: '合同开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ContStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ContEndDate', title: '合同结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ContEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ContAmount', title: '合同金额', width: 100, align: 'left', sortable: true },
        { field: 'Margin', title: '合同保证金', width: 100, align: 'left', sortable: true },
        { field: 'DutyDepName', title: '机构部门', width: 100, align: 'left', sortable: true },
        { field: 'DutyUserName', title: '负责人', width: 100, align: 'left', sortable: true },
        {
            field: 'SignDate', title: '签约时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.SignDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'IsExpire', title: '是否到期', width: 100, align: 'left', sortable: true },
        { field: 'IsCloseName', title: '是否关闭', width: 100, align: 'left', sortable: true },
        { field: 'CloseUserName', title: '关闭人', width: 100, align: 'left', sortable: true },
        { field: 'CloseDate', title: '关闭时间', width: 150, align: 'left', sortable: true }
    ]];


    function LoadContractInfo() {
        $("#ContractContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: ContractColumns,
            frozenColumns: ContractfrozenColumns,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            sortOrder: "asc",
            rowStyler: function (index, row) {
                if (row.IsExpire == '是' && row.IsDelete == 0 && row.IsClose == 0) {
                    return 'color:red'; // return inline style
                }
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Contract", "ContractList", "ContractContainer", param);
            },
            onLoadSuccess: function (data) {

            }
        });
    }

    //减免申请情况
    var WaiversFeeBrowsefrozenColumns = [[
        {
            field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var param = "WaivID=" + row.WaivID + "";
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改减免费用','Edit','" + param + "');\">" + row.CustName + "</a>";
                return str;
            }
        },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
    ]];
    var WaiversFeeBrowsecolumn = [[
        { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
        { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '费用名称', width: 180, align: 'left', sortable: true },
        // { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'left', sortable: true },
        { field: 'WaivContent', title: '减免协议内容', width: 100, align: 'left', sortable: true },
        { field: 'WaivAmount', title: '减免总金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivedAmount', title: '已减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivModifyAmount', title: '取消减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivMonthAmount', title: '每月减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivRates', title: '减免比例', width: 80, align: 'left', sortable: true },
        { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivStateDuring', title: '开始时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivEndDuring', title: '结束时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'UserName', title: '减免登记人', width: 100, align: 'left', sortable: true },
        { field: 'WaivCreDate', title: '减免登记时间', width: 180, align: 'left', sortable: true },
        { field: 'WaivReason', title: '减免原因', width: 130, align: 'left', sortable: true },
        { field: 'WaivMemo', title: '备注', width: 120, align: 'left', sortable: true },
        {
            field: 'IsAudit', title: '审核状态', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.IsAudit == 1) {
                    str = "<font  style='color:Red;'>已通过</font>";
                } else if (row.IsAudit == 2) {
                    str = "<font  style='color:Blue;'>未通过</font>";
                }
                else {
                    str = "<font  style='color:Green;'>未审核</font>";
                }
                return str;
            }
        },
        { field: 'WaivAgreement', title: '协议编号', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivAgreementDate', title: '协议时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivAgreementDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'LastMoney', title: '结算后剩余金额', width: 100, align: 'left', sortable: true },
    ]];

    function WaiversFeeBrowseLoadList() {
        $("#WaiversFeeBrowseContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: WaiversFeeBrowsecolumn,
            frozenColumns: WaiversFeeBrowsefrozenColumns,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            freezeRow: 1,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("WaiversFees", "getwaiversfeelist", "WaiversFeeBrowseContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //减免冲销情况
    var WaiversFeeOffsetSearchcolumn = [[
        { field: 'test', title: 'test', align: 'left', sortable: true, width: 120, fixed: true, hidden: true },
        { field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true, fixed: true },
        { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'RoomPropertyRights', title: '房屋产权性质', width: 100, align: 'left', sortable: true },
        { field: 'RoomPropertyUses', title: '房屋使用性质', width: 100, align: 'left', sortable: true },
        { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'ParkingPropertyUses', title: '车位产权性质', width: 100, align: 'left', sortable: true },
        { field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'CreYear', title: '减免年份', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'CreMonth', title: '减免月份', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'WaivReason', title: '减免原因', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'WaivMemo', title: '备注', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'UserName', title: '减免登记人', width: 100, align: 'left', sortable: true, fixed: true },
        {
            field: 'WaivCreDate', title: '登记时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivCreDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'IsWaivName', title: '是否减免', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'OldWaivAmount', title: '未减免金额', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'OffsetAmount', title: '已减免金额', width: 100, align: 'left', sortable: true, fixed: true },
        {
            field: 'FeesDueDate', title: '费用日期', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivDate', title: '冲抵时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DelUserName', title: '撤销人', width: 90, align: 'left', sortable: true, fixed: true },
        {
            field: 'DelDate', title: '撤销时间', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.DelDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'WaivAgreement', title: '协议编号', width: 100, align: 'left', sortable: true }

    ]];
    function WaiversFeeOffsetSearchLoadList() {
        $("#WaiversFeeOffsetSearchContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: WaiversFeeOffsetSearchcolumn,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            //view: myview,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            showFooter: true,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("WaiversFees", "getwaiversfeeoffsetlist", "WaiversFeeOffsetSearchContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.test == 'footer') {
                    return 'background-color:#F4F4F4;border:none;';
                }

            },
            //onLoadSuccess: function (data) {
            //    $.tool.DataPostNoLoading('WaiversFees', "getwaiversfeeoffsetlistSum", $('#frmForm').serialize(),
            //           function Init() {
            //               //加载页脚
            //               $('#WaiversFeeOffsetSearchContainer').datagrid('reloadFooter', [
            //                           {
            //                               test: 'footer',
            //                               CustName: "<span style='color:red'>累计合计</span>",
            //                               OffsetAmount: "<span style='color:red'>0.00</span>"
            //                           }
            //               ]);
            //           },
            //           function callback(_Data) {
            //               //加载页脚
            //               $('#WaiversFeeOffsetSearchContainer').datagrid('reloadFooter', [
            //                           {
            //                               test: 'footer',
            //                               CustName: "<span style='color:red'>累计合计</span>",
            //                               OffsetAmount: "<span style='color:red'>" + _Data + "</span>"
            //                           }
            //               ]);
            //           });
            //}
        });
    }


</script>
