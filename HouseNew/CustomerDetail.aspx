<%@ Page Language="c#" CodeBehind="CustomerDetail.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustomerDetail" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>�ͻ�����--�ͻ���Ϣ</title>
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
            <%--  <div data-options="region:'center',title:'�б�ѡ�'" style="background: #ffffff; border: hidden"> --%>
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="custinfo" id="custpage" refpage="" refsel="1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="true">�ͻ���Ϣ</a>
                    </li>
                    <li class="" name="roominfo" id="roompage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false">������Ϣ</a>
                    </li>
                    <li class="" name="parkinfo" id="parkpage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-3" aria-expanded="false">��λ��Ϣ</a>
                    </li>
                    <li class="" name="familyinfo" id="familypage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-4" aria-expanded="false">��ͥ��Ϣ</a>
                    </li>

                    <li class="" name="cardinfo" id="cardinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-5" aria-expanded="false">�쿨��Ϣ</a>
                    </li>

                    <li class="" name="renovation" id="renovation" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-6" aria-expanded="false">װ����Ϣ</a>
                    </li>

                    <li class="" name="incidentinfo" id="incidentpage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-7" aria-expanded="false">������Ϣ</a>
                    </li>
                    <li class="" name="tousuinfo" id="tousuinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-8" aria-expanded="false">Ͷ����Ϣ</a>
                    </li>
                    <li class="" name="entrustinto" id="entrustinto" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-9" aria-expanded="false">ί����Ϣ</a>
                    </li>
                    <li class="" name="keyinfo" id="keyinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-10" aria-expanded="false">Կ����Ϣ</a>
                    </li>
                    <%-- <li class="" name="youbaoinfo" id="youbaoinfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-11" aria-expanded="false">�ʰ���Ϣ</a>
                    </li>--%>
                   <%-- <li class="" name="baifanginfo" id="baifanginfo" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-12" aria-expanded="false">�ݷ���Ϣ</a>
                    </li>--%>
                    <li class="" name="contractinfo" id="contract" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-13" aria-expanded="false">��ͬ��Ϣ</a>
                    </li>
                    <li class="" name="waiversFeeBrowseinfo" id="waiversFeeBrowse" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-14" aria-expanded="false">����������Ϣ</a>
                    </li>
                    <li class="" name="waiversFeeOffsetSearchinfo" id="waiversFeeOffsetSearch" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-15" aria-expanded="false">���������Ϣ</a>
                    </li>
                    <li class="" name="feesinfo" id="feespage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-16" aria-expanded="false">������Ϣ</a>
                    </li>
                    <li class="" name="preinfo" id="prepage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-17" aria-expanded="false">Ԥ����Ϣ</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <%-- �ͻ���Ϣ--%>
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer7">
                                    <table class="DialogTable" id="Table1" style="line-height: 25px; background-color: #FFFFFF; text-align: left; font-family: ΢���ź�;">
                                        <tr>
                                            <td colspan="4" style="padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                                                <span style="font-size: 16px">�ͻ�������Ϣ</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��  ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="CustName" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">����֤��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PassSign" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">֤������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PaperName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">֤������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PaperCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�ͻ����</td>
                                            <td class="TdContentSearch">
                                                <asp:Label ID="CustTypeName" runat="server" Visible="false"></asp:Label>
                                                <select id="CustTypeID" name="CustTypeID" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle">�̶��绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="FixedTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�ƶ��绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="MobilePhone" runat="server"></asp:Label></td>
                                            <td class="TdTitle">����绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="FaxTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��ϵ��ַ</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Address" runat="server"></asp:Label></td>
                                            <td class="TdTitle">��������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="PostCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�� �� ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Recipient" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�����ʼ�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="EMail" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">���ֻ�����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Linkman" runat="server"></asp:Label></td>
                                            <td class="TdTitle">���ֻ�����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LinkmanTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td class="TdTitle">�˺�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="UnCustID" runat="server"></asp:Label></td>
                                            <td class="TdTitle">����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="InquireAccount" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��ǰǷ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DueAmount" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                            <td class="TdTitle"></td>
                                            <td class="TdContent"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                                                <span style="font-size: 16px">���˿ͻ���Ϣ</span>
                                            </td>
                                        </tr>
                                        <asp:Panel ID="PanelName" runat="server" Visible="False">
                                            <tr>
                                                <td class="TdTitle" width="15%" align="right">��</td>
                                                <td class="TdContent" width="10%" align="right">
                                                    <asp:Label ID="Surname" runat="server"></asp:Label></td>
                                                <td class="TdTitle" width="15%" align="right">��</td>
                                                <td class="TdContent" width="10%">
                                                    <asp:Label ID="Name" runat="server"></asp:Label></td>
                                            </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td class="TdTitle">�� ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Sex" runat="server"></asp:Label></td>
                                            <td class="TdTitle">��������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Birthday" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�� ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Nationality" runat="server"></asp:Label></td>
                                            <td class="TdTitle">ְ ҵ</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Job" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">������λ</td>
                                            <td class="TdContent" colspan="3">
                                                <asp:Label ID="WorkUnit" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��Ȥ����</td>
                                            <td class="TdContentSearch" colspan="3">
                                                <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                                                <span style="font-size: 16px">��λ�ͻ���Ϣ</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">����������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LegalRepr" runat="server"></asp:Label></td>
                                            <td class="TdTitle">���������˵绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="LegalReprTel" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�� �� ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="Charge" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�����˵绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="ChargeTel" runat="server"></asp:Label></td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                                                <span style="font-size: 16px">��˰������Ϣ</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">����</td>
                                            <td class="TdContent">
                                                <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                                                <asp:Label ID="VATName" name="VATName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">��˰��ʶ���</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATNumber" name="VATNumber" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��ַ���绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATAddLinkTel" name="VATAddLinkTel" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�����м��ʺ�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server"></asp:Label></td>
                                        </tr>

                                        <%--  </table><table class="DialogTable" id="Table4" align="center">--%>
                                        <tr>
                                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                                                <span style="font-size: 16px">���д�����Ϣ</span>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�����б�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankCode" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">������ʡ��</td>
                                            <td>
                                                <asp:Label ID="ProvinceCity" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">ί�е�λ����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DelegateUnitCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">ǩԼ����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="DateSigning" runat="server"></asp:Label>
                                            </td>
                                            <td class="TdTitle">ҵ������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BusinessTypes" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�������к�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankNo" runat="server"></asp:Label></td>
                                            <td class="TdTitle">����������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankInfo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">���л���</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankIDs" runat="server"></asp:Label></td>
                                            <td class="TdTitle">����Э����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAgreement" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�����˺�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAccount" runat="server"></asp:Label></td>
                                            <td class="TdTitle">ȷ�������˺�</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankAccountTwo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�ֿ�֤������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankPaperName" runat="server" /></td>
                                            <td class="TdTitle">�ֿ���֤������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankPaperCode" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�ֿ�����ϵ�绰</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankMobilePhone" runat="server"></asp:Label></td>
                                            <td class="TdTitle">���пͻ�����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankCustCode" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�� ע</td>
                                            <td class="TdContent" colspan="3">
                                                <asp:Label ID="Memo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr style="height: 40px;">
                                            <td class="TdTitle"></td>
                                            <td class="TdContent" colspan="3"></td>
                                        </tr>
                                        <%--                                        <tr>
                                            <td style="text-align: center;" colspan="4" class="DialogTdSubmit">
                                                <input type="button" class="button" value="�� ��" id="btnSave" runat="server" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="button" class="button" value="�� ��" id="btnReturn" />
                                            </td>
                                        </tr>--%>
                                    </table>
                                    <table style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 22px; background-color: #f5f5f5; border-top: 1px solid #cccccc;">
                                        <tr>
                                            <td colspan="2">
                                                <input class="button" id="save" onclick="BtnSave()"
                                                    type="button" value="����" name="btnFilter" runat="server">
                                                <input type="button" class="button" value="����" style="display: none;" id="btnSave" runat="server" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                 <input type="button" class="button" value="�ر�" id="btnReturn" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- ������Ϣ--%>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ��λ��Ϣ--%>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ��ͥ��Ϣ--%>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3"></div>
                            </div>
                        </div>
                    </div>
                    <%-- �쿨��Ϣ--%>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="CardInfoContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- װ����Ϣ--%>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="RenovationContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ������Ϣ--%>
                    <div id="tab-7" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer4"></div>
                            </div>
                        </div>
                    </div>
                    <%-- Ͷ����Ϣ--%>
                    <div id="tab-8" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer12"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ί����Ϣ--%>
                    <div id="tab-9" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer8"></div>
                            </div>
                        </div>
                    </div>
                    <%-- Կ����Ϣ--%>
                    <div id="tab-10" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="KeyContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- �ʰ���Ϣ--%>
                    <%-- <div id="tab-11" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer6"></div>
                            </div>
                        </div>
                    </div>--%>
                    <%-- �ݷ���Ϣ--%>
                   <%-- <div id="tab-12" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer13"></div>
                            </div>
                        </div>
                    </div>--%>
                    <%-- ��ͬ��Ϣ--%>
                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="ContractContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ����������Ϣ--%>
                    <div id="tab-14" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="WaiversFeeBrowseContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ���������Ϣ--%>
                    <div id="tab-15" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="WaiversFeeOffsetSearchContainer"></div>
                            </div>
                        </div>
                    </div>
                    <%-- ������Ϣ--%>
                    <div id="tab-16" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer5"></div>
                            </div>
                        </div>
                    </div>
                    <%-- Ԥ����Ϣ--%>
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
                <td style="background-color: #e6e6e6; height: 25px;" align="center" colspan="6"><strong>�ͻ�������Ϣ</strong></td>
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
                            <asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="ActualSubDate" ReadOnly="True" HeaderText="ʵ�ʽ���ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomFittingTime" ReadOnly="True" HeaderText="װ��ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomStayTime" ReadOnly="True" HeaderText="��סʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PayBeginDate" ReadOnly="True" HeaderText="��ʼ�ɷ�ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td class="formTable_Header" align="center" colspan="6"><strong>�ͻ���λ��Ϣ</strong></td>
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
                            <asp:BoundColumn DataField="CarparkName" SortExpression="CarparkName" HeaderText="��λ����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkCategoryName" SortExpression="ParkCategoryName" HeaderText="��λ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkType" SortExpression="ParkType" HeaderText="��λ����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkName" SortExpression="ParkName" HeaderText="��λ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="StanAmount" SortExpression="StanAmount" HeaderText="�շѱ�׼" DataFormatString="{0:N2}"></asp:BoundColumn>
                            <asp:TemplateColumn SortExpression="UseState" HeaderText="��ǰ״̬">
                                <ItemTemplate>
                                    <asp:Label ID="UseState" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.UseState") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="CustName" SortExpression="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" SortExpression="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkingCarSign" SortExpression="ParkingCarSign" HeaderText="ͣ������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CarSign" SortExpression="CarSign" HeaderText="���ƺ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkStartDate" SortExpression="ParkStartDate" HeaderText="��ʼʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkEndDate" SortExpression="ParkEndDate" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ChargeCycleName" SortExpression="ChargeCycleName" HeaderText="�Ʒ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CarEmission" SortExpression="CarEmission" HeaderText="����"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[����]">
                                <HeaderStyle Width="40px"></HeaderStyle>
                                <HeaderTemplate>
                                    [����]
                                </HeaderTemplate>
                                <ItemTemplate>

                                    <asp:LinkButton ID="LB_Edit" runat="server" CommandName="Edit" CausesValidation="true">
																		<img src='../images/icons/Edit.gif' border='0' align='absmiddle' alt='����'></asp:LinkButton>
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
                <td class="formTable_Header" align="center" colspan="4">��ͥ��Ա��Ϣ</td>
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
                            <asp:BoundColumn DataField="MemberName" HeaderText="��Ա����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Sex" HeaderText="�Ա�"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Birthday" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="MobilePhone" HeaderText="�绰����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PaperCode" HeaderText="֤������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RelationshipName" HeaderText="�뻧����ϵ"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td class="formTable_Header" align="center" colspan="6"><strong>����������Ϣ</strong></td>
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
                            <asp:BoundColumn DataField="AdjunctName" HeaderText="�ļ�˵��">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="FileSize" HeaderText="��С(KB)" DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[����]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='����'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <asp:Panel ID="IncRep" runat="server">
                <tr>
                    <td class="formTable_Header" colspan="4" align="center">��ʷ���¼�¼</td>
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
                                <asp:BoundColumn DataField="BigTypeName" SortExpression="BigTypeName" HeaderText="���´���"></asp:BoundColumn>
                                <asp:BoundColumn DataField="FineTypeName" SortExpression="FineTypeName" HeaderText="����ϸ��"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentPlace" SortExpression="IncidentPlace" HeaderText="��������"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentNum" SortExpression="IncidentNum" HeaderText="���±��"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="CustName" SortExpression="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="IncidentContent" SortExpression="IncidentContent" HeaderText="��������"></asp:BoundColumn>
                                <asp:BoundColumn DataField="IncidentDate" SortExpression="IncidentDate" HeaderText="����ʱ��"></asp:BoundColumn>
                                <asp:BoundColumn Visible="False" DataField="Phone" SortExpression="Phone" HeaderText="��ϵ�绰"></asp:BoundColumn>
                                <asp:TemplateColumn SortExpression="IncidentContent" HeaderText="��������">
                                    <ItemTemplate>
                                        <asp:Label ID="lbContent" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="DispTypeName" SortExpression="DispTypeName" HeaderText="�ɹ����"></asp:BoundColumn>
                                <asp:BoundColumn DataField="CoordinateNum" SortExpression="CoordinateNum" HeaderText="�ɹ�/Э����"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DispMan" SortExpression="DispMan" HeaderText="�ɹ���"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DispDate" SortExpression="DispDate" HeaderText="�ɹ�ʱ��"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DealMan" SortExpression="DealMan" HeaderText="������"></asp:BoundColumn>
                                <asp:BoundColumn DataField="MainEndDate" SortExpression="MainEndDate" HeaderText="���ʱ��"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DueAmount" SortExpression="DueAmount" HeaderText="����"></asp:BoundColumn>
                                <asp:BoundColumn DataField="FinishUser" SortExpression="FinishUser" HeaderText="�����"></asp:BoundColumn>
                            </Columns>
                            <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                        </asp:DataGrid></td>
                </tr>
            </asp:Panel>

        </table>


        <div id="FyTb">
            �ϼƽ�<span id="ToolBarDueAmount"></span>
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

        //���÷��ò�ѯʱ���
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


    //�Ƿ�ת����ʷ
    function ViewDetail(RoomSign) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../HouseNew/SaleRoomSearch.aspx?RoomSign=' + RoomSign,
            '����ת����ʷ', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //��ƾ��ʷ
    function ViewRentalDetail(RoomSign) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../RentalNew/NewLeaseInfoSeach.aspx?RoomSign=' + RoomSign,
            '������ƾ��ʷ', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //������Ϣ
    //������Ϣ
    var RoomInfofrozenColumns = [[
        { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 100, align: 'left', sortable: true },
        { field: 'RoomModel', title: '����', width: 100, align: 'left', sortable: true },
    ]]

    var RoomInfoColumn = [[
        {
            field: 'IsSale', title: '�Ƿ�ת��', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = '��';
                if (row.IsSale == 1) {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.RoomSign + "');\">��</a>";
                }
                return str;
            }
        },
        {
            field: 'UsesState', title: '�Ƿ�����', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = '��';
                if (row.UsesState == 2) {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRentalDetail('" + row.RoomSign + "');\">��</a>";
                }
                return str;
            }
        },
        { field: 'BuildArea', title: '�������', width: 100, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '�������', width: 100, align: 'left', sortable: true },
        { field: 'CommonArea', title: '��̯���', width: 100, align: 'left', sortable: true },
        { field: 'GardenArea', title: '��԰���', width: 100, align: 'left', sortable: true },
        { field: 'StateName', title: '����״̬', width: 100, align: 'left', sortable: true },
        {
            field: 'ContSubDate', title: '��ͬ����ʱ��', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ActualSubDate', title: '����ʱ��', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomFittingTime', title: 'װ��ʱ��', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomFittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomStayTime', title: '��סʱ��', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomStayTime, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'PayBeginDate', title: '��ʼ�ɷ�ʱ��', width: 110, align: 'left', sortable: true },

        { field: 'BankName', title: '�������', width: 100, align: 'left', sortable: true },
        { field: 'BankCodeName', title: '�����б�', width: 100, align: 'left', sortable: true },
        { field: 'BankProvince', title: '������ʡ��', width: 100, align: 'left', sortable: true },
        { field: 'BankCity', title: '��������', width: 100, align: 'left', sortable: true },
        { field: 'BankNo', title: '�������к�', width: 100, align: 'left', sortable: true },
        { field: 'BankInfo', title: '����������', width: 100, align: 'left', sortable: true },
        { field: 'BankIDs', title: '���л���', width: 100, align: 'left', sortable: true },
        { field: 'BankAccount', title: '�����˺�', width: 100, align: 'left', sortable: true },
        { field: 'BankAgreement', title: '����Э����', width: 100, align: 'left', sortable: true },
        { field: 'BankPaperName', title: '�ֿ�֤������', width: 100, align: 'left', sortable: true },
        { field: 'BankPaperCode', title: '�ֿ���֤������', width: 100, align: 'left', sortable: true },
        { field: 'BankMobilePhone', title: '�ֿ�����ϵ�绰', width: 100, align: 'left', sortable: true },
        { field: 'BankCustCode', title: '���пͻ�����', width: 100, align: 'left', sortable: true }

    ]]
    function LoadRoomInfo() {
        $("#TableContainer1").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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

    //��λ��Ϣ
    var ParkInfoColumn = [[
        { field: 'CarparkName', title: '��λ����', width: 150, align: 'left', sortable: true },
        { field: 'ParkCategoryName', title: '��λ���', width: 150, align: 'left', sortable: true },
        { field: 'ParkType', title: '��λ����', width: 150, align: 'left', sortable: true },
        { field: 'ParkName', title: '��λ���', width: 180, align: 'left', sortable: true },
        { field: 'ParkArea', title: '��λ���', width: 180, align: 'left', sortable: true },
        { field: 'StanAmount', title: '�շѱ�׼', width: 100, align: 'left', sortable: true },
        { field: 'UseState', title: '��ǰ״̬', width: 100, align: 'left', sortable: true },
        { field: 'NCustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
        { field: 'NRoomSign', title: '���ݱ��', width: 150, align: 'left', sortable: true },
        { field: 'ParkingCarSign', title: 'ͣ������', width: 150, align: 'left', sortable: true },
        { field: 'CarSign', title: '���ƺ���', width: 150, align: 'left', sortable: true },
        {
            field: 'ParkStartDate', title: '��ʼʱ��', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ParkEndDate', title: '����ʱ��', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ChargeCycleName', title: '�Ʒ�����', width: 180, align: 'left', sortable: true }

    ]];


    function BtnSave() {

        if ($("#CustTypeID").val() == "") {
            HDialog.Info("��ѡ��ͻ����!");
        }
        else {
            document.getElementById('btnSave').click();
        }



    }
    function LoadParkInfo() {
        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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


    //��ͥ��Ϣ
    var FamilyInfoColumn = [[
        {
            field: 'MemberName', title: '��Ա����', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                console.log(row);
                var str = "";
                var Params = "";
                Params = "HoldID=" + row.HoldID + "&CustID=" + row.CustID;

                if (row.IsLock == "1") {
                    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetailCY('��ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "(������)</a>";
                } else {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetailCY('��ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                }
                return str;
            }
        },
        { field: 'Sex', title: '�Ա�', width: 100, align: 'left', sortable: true },
        {
            field: 'Birthday', title: '��������', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.Birthday, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'PaperCode', title: '֤������', width: 150, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '�ƶ��绰', width: 150, align: 'left', sortable: true },
        { field: 'RelationshipName', title: '�뻧����ϵ', width: 150, align: 'left', sortable: true }
    ]]

    //2018-05-17 �����쿨��Ϣ��ť
    var CardInfoToolBarForFamily = [
        {
            text: '�����쿨��Ϣ',
            iconCls: 'icon-add',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("��ѡ����Ҫ������뿨�ļ�ͥ��Ϣ");
                    return;
                }
                var Params = "";
                Params = "HoldID=" + row.HoldID + "&CustId=" + row.CustID;
                ViewCardInfoDetail("���뿨����", 'Insert', Params);
            }
        }
    ];
    //�쿨��Ϣ��ϸҳ��
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
            loadMsg: '���ݼ�����,���Ժ�...',
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

    //������Ϣ
    var frozenColumns = [[
        { field: 'BigTypeName', title: '�������', width: 210, align: 'left', sortable: true },
        { field: 'IncidentPlace', title: '��������', width: 100, align: 'left', sortable: true },
        { field: 'IncidentNum', title: '���±��', width: 100, align: 'left', sortable: true },
    ]];
    var IncidentInfoColumn = [[
        {
            field: 'IncidentDate', title: '����ʱ��', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.IncidentDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        {
            field: 'IncidentContent', title: '��������', width: 200, align: 'left', sortable: true,
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
        { field: 'DispTypeName', title: '�ɹ����', width: 100, align: 'left', sortable: true },
        { field: 'CoordinateNum', title: '�ɹ�/Э����', width: 100, align: 'left', sortable: true },
        { field: 'DispMan', title: '�ɹ���', width: 100, align: 'left', sortable: true },
        {
            field: 'DispDate', title: '�ɹ�ʱ��', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.DispDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        { field: 'DealMan', title: '������', width: 100, align: 'left', sortable: true },
        {
            field: 'MainEndDate', title: '���ʱ��', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.MainEndDate, "yyyy-MM-dd HH:mm:ss ");
                return str;
            }
        },
        { field: 'DueAmount', title: '����', width: 100, align: 'left', sortable: true },
        { field: 'FinishUser', title: '�����', width: 100, align: 'left', sortable: true }
    ]]
    function LoadIncidentInfo() {
        $("#TableContainer4").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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


    //������Ϣ
    var FeesfrozenColumns = [[

        { field: 'CustName', title: '�ͻ�����', align: 'left', sortable: true, width: 150 },
        { field: 'RoomSign', title: '���ݱ��', align: 'left', sortable: true, width: 200 },
        { field: 'ParkName', title: '��λ���', align: 'left', sortable: true, width: 100 },
    ]]
    var FeesInfoColumn = [[

        { field: 'BuildArea', title: '�������', align: 'left', sortable: true, width: 120 },
        { field: 'CostName', title: '��������', align: 'left', sortable: true, width: 120 },
        { field: 'StanName', title: '��׼����', align: 'left', sortable: true, width: 120 },
        { field: 'FeeDueYearMonth', title: '��������', align: 'left', sortable: true, width: 120 },
        {
            field: 'AccountsDueDate', title: 'Ӧ������', align: 'left', sortable: true, width: 120,
            formatter: function (value, row, index) {
                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                return str;
            }
        },

        {
            field: 'FeesStateDate', title: '��ʼ����', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },

        {
            field: 'FeesEndDate', title: '��������', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'StartDegree', title: '���', align: 'left', sortable: true, width: 50 },
        { field: 'EndDegree', title: 'ֹ��', align: 'left', sortable: true, width: 50 },
        { field: 'CalcAmount', title: '����1', align: 'left', sortable: true, width: 50 },
        { field: 'CalcAmount2', title: '����2', align: 'left', sortable: true, width: 50 },
        { field: 'DueAmount', title: 'Ӧ�ս��', align: 'left', sortable: true, width: 80 },
        { field: 'PaidAmount', title: 'ʵ�ս��', align: 'left', sortable: true, width: 80 },
        { field: 'PrecAmount', title: 'Ԥ�����', align: 'left', sortable: true, width: 80 },
        { field: 'WaivAmount', title: '������', align: 'left', sortable: true, width: 80 },
        { field: 'RefundAmount', title: '�˿���', align: 'left', sortable: true, width: 80 },
        { field: 'DebtsAmount', title: 'Ƿ�ս��', align: 'left', sortable: true, width: 80 },
        { field: 'LateFeeAmount', title: '��ͬΥԼ��', align: 'left', sortable: true, width: 80 },
        { field: 'IsPrecName', title: '�Ƿ�Ԥ��', align: 'left', sortable: true, width: 60 },
        { field: 'FeesMemo', title: '��ע', align: 'left', sortable: true, width: 120 }
    ]];
    function LoadFeesInfo() {
        $("#TableContainer5").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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

    //Ԥ����Ϣ
    var PrefrozenColumns = [[
        { field: 'CustName', title: '�ͻ�����', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 230, align: 'left', sortable: true },
    ]]
    var PreInfoColumn = [[

        { field: 'ParkNames', title: '��λ', width: 150, align: 'left', sortable: true },
        { field: 'FixedTel', title: '��ϵ�绰', width: 120, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '�ƶ��绰', width: 120, align: 'left', sortable: true },
        { field: 'PrecAmount', title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
        { field: 'IsPrecName', title: '�Ƿ������', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '��ַ�����Ŀ', width: 100, align: 'left', sortable: true },
        { field: 'PrecMemo', title: '��ע', width: 180, align: 'left', sortable: true },
        {
            field: '�����ʾ', title: '�����ʾ', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "�������";
                if (row.PrecAmount < row.OffsetAmountMonth) {
                    str = "<font color=red>����</font>";
                }
                return str;
            }
        }

    ]]
    function LoadPreInfo() {
        $("#TableContainer6").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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
        { field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
        { field: 'EntrustType', title: 'ί�����', width: 100, align: 'left', sortable: true },
        { field: 'EntrustMobile', title: 'ί������ϵ�绰', width: 90, align: 'left', sortable: true },
        {
            field: 'StartDate', title: 'ί��ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.StartDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'EntrustBook', title: 'ί����', width: 60, align: 'left', sortable: true },
        { field: 'Trustee', title: '������', width: 90, align: 'left', sortable: true },
        { field: 'Relationship', title: '��ί���˹�ϵ', width: 90, align: 'left', sortable: true },
        { field: 'Mobile', title: '�����˵绰', width: 90, align: 'left', sortable: true },
        { field: 'EntrustThing', title: 'ί������', width: 90, align: 'left', sortable: true },
        { field: 'IsHandle', title: '�Ƿ����', width: 100, align: 'left', sortable: true },
        { field: 'HandleUserName', title: '������', width: 90, align: 'left', sortable: true },
        {
            field: 'HandleDate', title: '����ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (row.HandleDate != "") {
                    str = formatDate(row.HandleDate, "yyyy-MM-dd");
                }
                return str;
            }
        }
    ]];

    //ί����Ϣ
    function LoadEntrustinto() {
        $("#TableContainer8").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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
            field: 'CustName', title: '��������', width: 140, align: 'left', sortable: true
        },
        { field: 'YzRoomSign', title: '��������', width: 300, align: 'left', sortable: true },
        {
            field: 'MemberName', title: '��Ա����', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                console.log(row);
                var str = "";
                var Params = "";
                Params = "HoldID=" + row.HoldId + "&CustID=" + row.CustId;

                if (row.IsLock == "1") {
                    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetailCY('��ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "(������)</a>";
                } else {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetailCY('��ͥ��Ա','Edit','" + Params + "');\">" + row.MemberName + "</a>";
                }
                console.log(str);
                return str;
            }
        },
        { field: 'CyRoomSign', title: '��Ա����', width: 300, align: 'left', sortable: true },
        { field: 'RelationshipName', title: '�뻧����ϵ', width: 100, align: 'left', sortable: true },
        { field: 'CardDate', title: '�쿨����', width: 130, align: 'left', sortable: true },
        { field: 'CardNum', title: '����', width: 140, align: 'left', sortable: true },
        { field: 'CardState', title: '״̬', width: 100, align: 'left', sortable: true }
    ]];
    //2018-05-17 ���  �쿨��Ϣ�༭��ť
    var CardInfoToolBar = [
        {
            text: '�༭',
            iconCls: 'icon-edit',
            handler: function () {
                var row = $("#CardInfoContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("��ѡ����Ҫ�༭�İ쿨��Ϣ");
                    return;
                }
                var Params = "";
                Params = "Id=" + row.Id;
                ViewCardInfoDetail("���뿨����", 'Edit', Params);
            }
        }
    ];

    //�쿨��Ϣ
    function LoadCardInfo() {
        $("#CardInfoContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
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
        { field: 'CustName', title: '�ͻ�����', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 300, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 250, align: 'left', sortable: true },
        {
            field: 'StartDate', title: 'װ�޿���ʱ��', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                return formatDate(value, "yyyy-MM-dd");
            }
        },
        {
            field: 'EstimateEndDate', title: 'Ԥ���깤ʱ��', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                return formatDate(value, "yyyy-MM-dd");
            }
        },
        { field: 'BuildCompany', title: 'ʩ����λ', width: 150, align: 'left', sortable: false },
        { field: 'AuditState', title: '���״̬', width: 70, align: 'left', sortable: false },
        { field: 'FeesRoleNames', title: 'δ���λ', width: 300, align: 'left', sortable: false },
        {
            field: 'QRCode', title: '��ά��', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                if (isValueNull(value)) {
                    value = "<a  onclick=\"ShowQRCode('" + value + "');\" href=\"javascript:void(0)\">��ά��</a>";
                }
                return value;
            }
        },
        { field: 'HandleCertificateCount', title: '����֤����', width: 80, align: 'left', sortable: false },
        { field: 'CostTotalSum', title: '�շѽ��', width: 80, align: 'left', sortable: false },
        { field: 'PatrolCount', title: '���ĵ�����', width: 80, align: 'left', sortable: false },
        { field: 'RenovationState', title: 'װ��״̬', width: 80, align: 'left', sortable: false }
    ]];

    //װ����Ϣ
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
        { field: 'KeyTypeIDName', title: 'Կ������', width: 150, align: 'center' },
        { field: 'CustName', title: '�ͻ�����', width: 200, align: 'center' },
        { field: 'RoomSign', title: '���ݱ��', width: 200, align: 'left', halign: 'center' },
        { field: 'KeyCode', title: 'Կ�ױ��', width: 100, align: 'center' },
        { field: 'KeyCount', title: 'Կ������', width: 100, align: 'center' },
        {
            field: 'RegisterDate', title: '�Ǽ�ʱ��', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'ReceiveDate', title: '��ȡʱ��', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'RecoveryDate', title: '�黹ʱ��', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        {
            field: 'ReturnDate', title: '����ʱ��', width: 100, align: 'center', formatter: function (value, row, index) {
                return $.dateFormat(value);
            }
        },
        { field: 'State', title: '״̬', width: 100, align: 'center' }
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

    //��ͬ��Ϣ
    var ContractfrozenColumns = [[
        { field: 'CommName', title: '��Ŀ����', align: 'left', sortable: true, width: 100 },
        { field: 'NewContTypeName', title: '��ͬ���', align: 'left', sortable: true, width: 100 },
        {
            field: 'ContSign', title: '��ͬ���', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('��ͬ����','Detail'," + row.ContID + ");\">" + row.ContSign + "</a>";
                return str;
            }
        }
    ]];

    var ContractColumns = [[
        { field: 'ContName', title: '��ͬ����', width: 100, align: 'left', sortable: true },
        { field: 'CustName', title: '�ͻ�����', width: 100, align: 'left', sortable: true },
        { field: 'UnitName', title: '�Է���λ', width: 100, align: 'left', sortable: true },
        { field: 'Vender', title: '��ϵ��', width: 100, align: 'left', sortable: true },
        { field: 'VenderTel', title: '��ϵ�绰', width: 100, align: 'left', sortable: true },
        { field: 'ContractPeriod', title: '��ͬ����', width: 100, align: 'left', sortable: true },
        {
            field: 'ContStartDate', title: '��ͬ��ʼʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ContStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ContEndDate', title: '��ͬ����ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ContEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ContAmount', title: '��ͬ���', width: 100, align: 'left', sortable: true },
        { field: 'Margin', title: '��ͬ��֤��', width: 100, align: 'left', sortable: true },
        { field: 'DutyDepName', title: '��������', width: 100, align: 'left', sortable: true },
        { field: 'DutyUserName', title: '������', width: 100, align: 'left', sortable: true },
        {
            field: 'SignDate', title: 'ǩԼʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.SignDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'IsExpire', title: '�Ƿ���', width: 100, align: 'left', sortable: true },
        { field: 'IsCloseName', title: '�Ƿ�ر�', width: 100, align: 'left', sortable: true },
        { field: 'CloseUserName', title: '�ر���', width: 100, align: 'left', sortable: true },
        { field: 'CloseDate', title: '�ر�ʱ��', width: 150, align: 'left', sortable: true }
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
                if (row.IsExpire == '��' && row.IsDelete == 0 && row.IsClose == 0) {
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

    //�����������
    var WaiversFeeBrowsefrozenColumns = [[
        {
            field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var param = "WaivID=" + row.WaivID + "";
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸ļ������','Edit','" + param + "');\">" + row.CustName + "</a>";
                return str;
            }
        },
        { field: 'RoomSign', title: '���ݱ��', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 150, align: 'left', sortable: true },
    ]];
    var WaiversFeeBrowsecolumn = [[
        { field: 'ParkName', title: '��λ���', width: 100, align: 'left', sortable: true },
        { field: 'MeterName', title: '�������', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '��������', width: 180, align: 'left', sortable: true },
        // { field: 'ParkCategoryName', title: '��λ���', width: 100, align: 'left', sortable: true },
        { field: 'WaivContent', title: '����Э������', width: 100, align: 'left', sortable: true },
        { field: 'WaivAmount', title: '�����ܽ��', width: 100, align: 'left', sortable: true },
        { field: 'WaivedAmount', title: '�Ѽ�����', width: 100, align: 'left', sortable: true },
        { field: 'WaivModifyAmount', title: 'ȡ��������', width: 100, align: 'left', sortable: true },
        { field: 'WaivMonthAmount', title: 'ÿ�¼�����', width: 100, align: 'left', sortable: true },
        { field: 'WaivRates', title: '�������', width: 80, align: 'left', sortable: true },
        { field: 'WaivTypeName', title: '���ⷽʽ', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivStateDuring', title: '��ʼʱ��', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivEndDuring', title: '����ʱ��', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'UserName', title: '����Ǽ���', width: 100, align: 'left', sortable: true },
        { field: 'WaivCreDate', title: '����Ǽ�ʱ��', width: 180, align: 'left', sortable: true },
        { field: 'WaivReason', title: '����ԭ��', width: 130, align: 'left', sortable: true },
        { field: 'WaivMemo', title: '��ע', width: 120, align: 'left', sortable: true },
        {
            field: 'IsAudit', title: '���״̬', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.IsAudit == 1) {
                    str = "<font  style='color:Red;'>��ͨ��</font>";
                } else if (row.IsAudit == 2) {
                    str = "<font  style='color:Blue;'>δͨ��</font>";
                }
                else {
                    str = "<font  style='color:Green;'>δ���</font>";
                }
                return str;
            }
        },
        { field: 'WaivAgreement', title: 'Э����', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivAgreementDate', title: 'Э��ʱ��', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivAgreementDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'LastMoney', title: '�����ʣ����', width: 100, align: 'left', sortable: true },
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

    //����������
    var WaiversFeeOffsetSearchcolumn = [[
        { field: 'test', title: 'test', align: 'left', sortable: true, width: 120, fixed: true, hidden: true },
        { field: 'CustName', title: '�ͻ�����', width: 140, align: 'left', sortable: true, fixed: true },
        { field: 'RoomSign', title: '���ݱ��', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'RoomName', title: '��������', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'RoomPropertyRights', title: '���ݲ�Ȩ����', width: 100, align: 'left', sortable: true },
        { field: 'RoomPropertyUses', title: '����ʹ������', width: 100, align: 'left', sortable: true },
        { field: 'ParkName', title: '��λ���', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'ParkingPropertyUses', title: '��λ��Ȩ����', width: 100, align: 'left', sortable: true },
        { field: 'CostName', title: '��������', width: 120, align: 'left', sortable: true, fixed: true },
        { field: 'CreYear', title: '�������', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'CreMonth', title: '�����·�', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'WaivReason', title: '����ԭ��', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'WaivMemo', title: '��ע', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'UserName', title: '����Ǽ���', width: 100, align: 'left', sortable: true, fixed: true },
        {
            field: 'WaivCreDate', title: '�Ǽ�ʱ��', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivCreDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'IsWaivName', title: '�Ƿ����', width: 90, align: 'left', sortable: true, fixed: true },
        { field: 'OldWaivAmount', title: 'δ������', width: 100, align: 'left', sortable: true, fixed: true },
        { field: 'OffsetAmount', title: '�Ѽ�����', width: 100, align: 'left', sortable: true, fixed: true },
        {
            field: 'FeesDueDate', title: '��������', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivDate', title: '���ʱ��', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DelUserName', title: '������', width: 90, align: 'left', sortable: true, fixed: true },
        {
            field: 'DelDate', title: '����ʱ��', width: 110, align: 'left', sortable: true, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.DelDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'WaivAgreement', title: 'Э����', width: 100, align: 'left', sortable: true }

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
            //               //����ҳ��
            //               $('#WaiversFeeOffsetSearchContainer').datagrid('reloadFooter', [
            //                           {
            //                               test: 'footer',
            //                               CustName: "<span style='color:red'>�ۼƺϼ�</span>",
            //                               OffsetAmount: "<span style='color:red'>0.00</span>"
            //                           }
            //               ]);
            //           },
            //           function callback(_Data) {
            //               //����ҳ��
            //               $('#WaiversFeeOffsetSearchContainer').datagrid('reloadFooter', [
            //                           {
            //                               test: 'footer',
            //                               CustName: "<span style='color:red'>�ۼƺϼ�</span>",
            //                               OffsetAmount: "<span style='color:red'>" + _Data + "</span>"
            //                           }
            //               ]);
            //           });
            //}
        });
    }


</script>
