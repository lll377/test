<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceFeesBrowse.aspx.cs" Inherits="M_Main.ChargesNew.ReceFeesBrowse" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>单户收费</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />

    <script src="../Jscript-Ui/jquery-easyui-1.4.4/EasyuiChargeGrid.js"></script>
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js"></script>
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />

    <link href="../Jscript-Ui/jquery-ui-1.10.2/css/ui-lightness/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.position.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.menu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.autocomplete.js"></script>
    <script src="../jscript/Cache.js" type="text/javascript"></script>
    <style>
        .button {
            line-height: 28px;
            height: 30px;
            width: 70px;
            color: #ffffff;
            background-color: #3e73ca;
            font-size: 12px;
            font-weight: normal;
            font-family: 微软雅黑;
            border: 0px solid #dcdcdc;
            -webkit-border-top-left-radius: 3px;
            -moz-border-radius-topleft: 3px;
            border-top-left-radius: 3px;
            -webkit-border-top-right-radius: 3px;
            -moz-border-radius-topright: 3px;
            border-top-right-radius: 3px;
            -webkit-border-bottom-left-radius: 3px;
            -moz-border-radius-bottomleft: 3px;
            border-bottom-left-radius: 3px;
            -webkit-border-bottom-right-radius: 3px;
            -moz-border-radius-bottomright: 3px;
            border-bottom-right-radius: 3px;
            -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
            box-shadow: inset 0px 0px 0px 0px #ffffff;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }

            .button:hover {
                background-color: #2b58a0;
            }

        body {
            font-family: 微软雅黑;
            font-size: 12px;
            padding: 0px;
            margin: 0px;
            overflow-x: hidden;
        }

        .NavIcon {
            text-align: center;
            float: left;
            width: 100%;
            background-color: #f5f5f5;
            border-top: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
            color: #1773D1;
        }

        .CustNav {
            text-align: left;
            float: left;
            width: 100%;
            background-color: #f5f5f5;
            border-top: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
            color: #1773D1;
            width: 100%;
            height: 75px;
        }

        .CustNavInfo {
            text-align: right;
            float: left;
            width: 100%;
            background-color: #f5f5f5;
            border-top: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
            color: #1773D1;
        }

        .Navtable {
            width: 100%;
        }

            .Navtable td {
                text-align: center;
                cursor: pointer;
            }

        .dvChargeTable {
            text-align: center;
            width: 100%;
            height: auto;
            background-color: #f5f5f5;
            border-top: 1px solid #cccccc;
            border-bottom: 1px solid #cccccc;
        }

        .ChargeTable {
            width: 100%;
            height: auto;
        }

        .Title {
            width: 7.5%;
        }

        .Content {
            width: 15%;
            text-align: left;
        }

            .Content input[type='text'] {
                width: 70%;
                border: 1px solid #cccccc;
            }

            .Content select {
                border: none;
            }

        .ContentFees {
            width: 15%;
            text-align: left;
        }

            .ContentFees input {
                width: 40px;
                border: 1px solid #cccccc;
            }

        .ContentPay {
            width: 15%;
            text-align: left;
        }

            .ContentPay input {
                width: 45px;
                border: 1px solid #cccccc;
            }

        .ChkContent {
            width: 15%;
            text-align: left;
        }

        .MemoContent {
            width: 15%;
            text-align: left;
        }

            .MemoContent input {
                width: 100%;
                border: none;
                background-color: #f5f5f5;
            }

        .leftChargeContainer {
            width: 10%;
            font-size: 12px;
            font-weight: bold;
            color: #3E73CA;
            height: auto;
        }

        .SureCharge {
            border-top: 1px solid #cccccc;
            text-align: center;
            padding-top: 10px;
        }

        .SearchContainer {
            width: 96%;
            padding-left: 2%;
            padding-right: 2%;
            background-color: #f5f5f5;
        }

        .SearchContainerTable {
            width: 100%;
        }

            .SearchContainerTable input[type='text'] {
                border: 1px solid #cccccc;
                width: 100%;
            }

            .SearchContainerTable select {
                height: 22px;
                width: 100%;
                border: 1px solid #cccccc;
            }

        .SearchTitle {
            width: 10%;
            text-align: center;
        }

        .SearchContent {
            width: 20%;
            text-align: left;
        }

        .SearchFastContent {
            width: 80%;
            text-align: left;
        }

            .SearchFastContent input {
                width: 100%;
                border: 1px solid #cccccc;
            }

        .SearchButton {
            width: 10%;
            text-align: right;
        }

        .button_sel {
            font-size: 12px;
            width: 25px;
            height: 20px;
            border-style: none;
            background-color: transparent;
            background-image: url('../images/Button_Select.jpg');
            background-repeat: no-repeat;
        }

        .dstyle1 {
            color: #f00;
            font-size: 12px;
            font-weight: bold
        }

        .dstyle2 {
            color: #0000ff;
            font-size: 12px;
            font-weight: bold
        }


        .leftChargeContainer .leftDiv {
            width: 100%;
            text-align: center;
            color: red;
        }

        #DvPreStoreList {
            height: 69px;
            border: 1px solid #cccccc;
            position: absolute;
            z-index: 101;
            background-color: #f5f5f5;
        }

        #DvIncidentAcceptList {
            height: 34px;
            border: 1px solid #cccccc;
            position: absolute;
            z-index: 101;
            background-color: #f5f5f5;
        }

        .DvPreStoreList_DetailIn {
            border-bottom: 1px solid #cccccc;
            height: 34px;
            line-height: 34px;
            color: black;
            background-color: #f5f5f5;
            color: red;
        }

        .DvPreStoreList_DetailOut {
            border-bottom: 1px solid #cccccc;
            height: 34px;
            line-height: 34px;
            color: black;
            background-color: #ffffff;
        }

        .DvIncidentAcceptList_DetailIn {
            border-bottom: 1px solid #cccccc;
            height: 34px;
            line-height: 34px;
            color: black;
            background-color: #f5f5f5;
            color: red;
        }

        .DvIncidentAcceptList_DetailOut {
            border-bottom: 1px solid #cccccc;
            height: 34px;
            line-height: 34px;
            color: black;
            background-color: #ffffff;
        }
    </style>

    <link href="../Jscript-Ui/fSelect/fSelect.css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hidCorpId" type="hidden" name="hidCorpId" value="" runat="server" />
        <input id="SpecialTicketAmount" type="hidden" name="SpecialTicketAmount" runat="server" value="-1" />
        <input id="GeneralTicketAmount" type="hidden" name="GeneralTicketAmount" runat="server" value="-1" />
        <input id="EInvoiceAmount" type="hidden" name="EInvoiceAmount" runat="server" value="-1" />
        <input type="hidden" id="PreCostData" name="PreCostData" />
        <input type="hidden" id="IsShowInfo" name="IsShowInfo" />
        <input type="hidden" id="ShowInfo" name="ShowInfo" />
        <input type="hidden" id="ShowJS" name="ShowJS" runat="server" value="-1" />
        <input type="hidden" id="hiInvoiceType" name="hiInvoiceType" value="0" />
        <input type="hidden" id="hiSelCostIDs" name="hiSelCostIDs" value="0" runat="server" />
        <input type="hidden" id="HidBID" runat="server" />
        <input type="hidden" id="checkboxid" name="checkboxid" runat="server" />
        <input type="hidden" id="MonthNum" name="MonthNum" runat="server" />
        <input type="hidden" id="isHis" name="isHis" runat="server" />
        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepOne()">1：应收输入</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepTwo()">2：单户入账</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepSix()">3：单户抄表入账</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepThree()">4：收款确认</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepFour()">5：预存收款标准模式</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepFive()">6：预存收款快捷模式</div>
                <br />
                <div style="text-align: left; cursor: pointer; font-size: 30px" onclick="GetStepLast()">7：托收确认</div>
            </div>

        </div>


        <div class="SearchContainer">
            <div id="ContainerCliS" style="cursor: pointer; width: 30px; height: 20px; margin-top: 4px; margin-left: 3px; position: absolute;">
                <span id="SSDown" class="fa fa-arrow-circle-right "></span><span id="SSUP" class="fa fa-arrow-circle-left"></span>
            </div>
            <table class="SearchContainerTable">
                <tr>

                    <td class="SearchTitle">快速检索</td>
                    <td colspan="5" class="SearchFastContent">
                        <input id="FastKey" name="FastKey" placeholder="房屋编号/客户名称/联系电话" runat="server" />
                    </td>
                    <td rowspan="3" class="SearchButton">
                        <input type="button" class="button" value="查询" id="BtnSearch" runat="server" onserverclick="BtnSearch_ServerClick" />
                        <div style="height: 2px;"></div>
                        <input type="button" class="button" value="清空" id="BtnClear" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="SearchTitle">客户名称
                    </td>
                    <td class="SearchContent">
                        <input type="text" id="CustName" name="CustName" placeholder="输入或双击选择" autocomplete="off" runat="server" />
                    </td>
                    <td class="SearchTitle">房屋编号
                    </td>
                    <td class="SearchContent">
                        <input type="text" id="RoomSign" name="RoomSign" placeholder="输入或双击选择" autocomplete="off" runat="server" />
                    </td>
                    <td class="SearchTitle">车位车牌
                    </td>
                    <td class="SearchContent">
                        <input type="text" id="ParkName" name="ParkName" placeholder="输入或双击选择" autocomplete="off" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="SearchTitle">可选客户
                    </td>
                    <td class="SearchContent">
                        <asp:DropDownList ID="SelCustID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelCustID_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td class="SearchTitle">可选房号
                    </td>
                    <td class="SearchContent">
                        <asp:DropDownList ID="SelRoomID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelRoomID_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="SearchTitle">可选车位
                    </td>
                    <td class="SearchContent">
                        <asp:DropDownList ID="SelHandID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelHandID_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div class="NavIcon">
            <table class="Navtable">
                <tr>
                    <td>

                        <div><span class="fa fa-user"></span><span id="CustomerDetail">客户资料</span></div>
                    </td>
                    <td>
                        <%-- <div><span class="fa fa-group"></span> <span id="IncidentAccept">报事受理</span></div>--%>
                        <div id="DvIncidentAccept">
                            <span class="fa fa-qrcode"></span><span id="IncidentAccept">报事受理</span>
                        </div>
                    </td>
                    <td>
                        <div><span class="fa fa-truck"></span><span id="ParkingCar">车位办理</span></div>
                    </td>
                    <td>
                        <div><span class="fa fa-list-alt"></span><span id="WriteMeter">单户抄表</span></div>
                    </td>
                    <td>
                        <div><span class="fa fa-plus"></span><span id="AccountedFor">单户入账</span></div>
                    </td>
                    <td>
                        <div><span class="fa fa-tags"></span><span id="Receivable">应收输入</span></div>
                    </td>
                    <td>
                        <div id="DvPreStore">
                            <span class="fa fa-qrcode"></span><span id="yucun">预存收款</span>

                            <div id="DvPreStoreList">

                                <div reftype="DvPreStoreList" class="DvPreStoreList_DetailOut" id="PrestoreReceivables">标准模式</div>
                                <div reftype="DvPreStoreList" class="DvPreStoreList_DetailOut" id="FastPrestoreReceivables" style="border-bottom: none;">快捷模式</div>

                            </div>

                        </div>


                    </td>
                    <td>
                        <div><span class="fa fa-retweet"></span><span id="FeesConSign">托收确认</span></div>
                    </td>
                    <td>
                        <div><span class="fa fa-calendar"></span><span id="ReceiveFeesHis">收费历史</span></div>
                    </td>
                    <td>
                        <div><span class="fa fa-random"></span><span id="RepatedCustFees">关联欠费</span></div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="ContainerCli" style="cursor: pointer; width: 30px; height: 20px; margin-top: 4px; margin-left: 3px; position: absolute;"><span id="SDown" class="fa fa-arrow-circle-down "></span><span id="SUP" class="fa fa-arrow-circle-up"></span></div>
        <div class="CustNav" id="CustNav" style="height: 100%">
            <table style="width: 100%; text-align: left; vertical-align: top">
                <tr>
                    <td style="width: 80px">房屋状态</td>
                    <td>
                        <div id="DivRoomStateName"></div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">缴费信息</td>
                    <td>
                        <div id="DivFeesHit"></div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px;">开票信息</td>
                    <td>
                        <div id="DivInvoiceContent"></div>
                    </td>
                </tr>
                <tr style="vertical-align: top">
                    <td style="width: 80px; height: 30px">备注信息</td>
                    <td>
                        <div id="DivMemoContent"></div>
                    </td>
                </tr>
            </table>
        </div>

        <div id="TableContainer">
        </div>

        <div id="PreCostTableContainer">
        </div>

        <div class="dvChargeTable">
            <table class="ChargeTable">
                <tr>
                    <td id="leftChargeContainer" rowspan="6" class="leftChargeContainer">
                        <div class="leftDiv">合计：<span id="ShowTotalAmount" style="color: blue;">0.00</span></div>
                        <div class="leftDiv">实付：<span id="ShowPayTotalAmount" style="color: blue;">0.00</span></div>
                        <div class="leftDiv">找零：<span id="ShowSurplus" style="color: blue;">0.00</span></div>
                    </td>
                    <td class="Title">应收总计</td>
                    <td class="Content">
                        <input id="TotalAmount" readonly name="TotalAmount" runat="server" /></td>
                    <td class="Title">实收预收</td>
                    <td class="Content">
                        <input type="text" id="TotalPrecPadiAmount" readonly name="TotalPrecPadiAmount" runat="server" /><input type="hidden" id="TotalRecPrecAmount" readonly name="TotalRecPrecAmount" runat="server" /><input id="TotalPaidAmount" readonly name="TotalPaidAmount" type="hidden" runat="server" /></td>
                    <td class="Title">本次违约金</td>
                    <td class="Content">
                        <input id="TotalLateFeeAmount" readonly name="TotalLateFeeAmount" runat="server" /></td>
                    <td class="Title">本次预存</td>
                    <td class="Content">
                        <input id="TotalPrecAmount" readonly name="TotalPrecAmount" runat="server" value="0.00" /></td>
                </tr>
                <tr>
                    <td class="Title">预存冲抵</td>
                    <td class="Content">
                        <input id="OffsetPrecAmount" readonly name="OffsetPrecAmount" runat="server" /></td>
                    <td class="Title">零头结转</td>
                    <td class="Content">
                        <input id="PerSurplusAmount" onblur="javascript:if(PerSurplusAmount_Onblur()==false) return false;"
                            name="PerSurplusAmount" runat="server" />
                        <input id="IsEditPerSurplus" type="hidden" name="IsEditPerSurplus" runat="server" />
                        <input id="hiPerSurplusAmount" type="hidden" name="hiPerSurplusAmount" runat="server" /></td>
                    <td class="Title">结转余额</td>
                    <td class="Content">
                        <input id="SurplusAmount" readonly name="SurplusAmount" runat="server" /></td>
                    <td class="Title">本次合计</td>
                    <td class="Content">
                        <input id="TotalSumAmount" readonly name="TotalSumAmount" runat="server" /></td>
                </tr>
                <tr>
                    <td class="Title">费项笔数</td>
                    <td class="ContentFees">
                        <input id="FeesCount" readonly name="FeesCount" runat="server" />笔
                        <input id="PrintCount" readonly name="PrintCount" runat="server" />行

                    </td>
                    <td class="Title" style="color: red;">收款方式</td>
                    <td class="Content">
                        <select id="ChargeMode" style="border: 1px solid #cccccc;" onchange="RuleEvent.ChargeModeEvent();" name="ChargeMode" runat="server">
                            <option selected></option>
                        </select>

                        <input id="ChargeModeAmount" type="hidden" name="ChargeModeAmount" runat="server" /></td>
                    <td class="Title">多种方式</td>
                    <td class="Content">
                        <input id="ChargeModes" readonly name="ChargeModes" runat="server" /></td>
                    <td class="Title" style="color: red;">实付金额</td>
                    <td class="Content">
                        <input onblur="TotalPayAmount_onblur();" id="TotalPayAmount" name="TotalPayAmount" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="Title">收据样式</td>
                    <td class="Content">
                        <asp:DropDownList ID="UseRepID" runat="server" BorderColor="#cccccc" BorderWidth="1"></asp:DropDownList></td>
                    <td class="Title">收据类别</td>
                    <td class="Content">
                        <asp:DropDownList ID="BillType" runat="server" BorderColor="#cccccc" BorderWidth="1"></asp:DropDownList></td>
                    <td class="Title">收 据 号</td>
                    <td class="Content">
                        <input id="BillsSign" readonly name="BillsSign" runat="server" />

                        <input class="button_sel" id="btnSelBill" onclick="javascript: if (btnSelBill_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelBill" runat="server" /></td>
                    <td class="Title">开据发票</td>
                    <td class="Content">
                        <asp:CheckBox ID="IsInvoice" runat="server" Text="是"></asp:CheckBox></td>
                </tr>
                <tr id="TrInvoice" style="display: none;">
                    <td class="Title">发票类别</td>
                    <td class="Content">
                        <asp:DropDownList ID="InvoiceType" runat="server"></asp:DropDownList>
                    </td>
                    <td class="Title">发 票 号</td>
                    <td class="Content">
                        <input id="InvoiceBill" readonly name="InvoiceBill" runat="server" />
                        <input class="button_sel" id="btnSelInvoiceBill" onclick="javascript: if (btnSelInvoiceBill_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelInvoiceBill" runat="server" />
                    </td>
                    <td class="Title">发票抬头</td>
                    <td class="Content">
                        <input id="InvoiceUnit" name="InvoiceUnit" runat="server" placeholder="输入或双击选择" /></td>
                    <td class="Title">发票金额</td>
                    <td class="Content">
                        <input id="InvoiceAmount" name="InvoiceAmount" readonly runat="server" /></td>
                </tr>
                <tr id="TrCheck" style="display: none;">
                    <td class="Title">支票抬头</td>
                    <td class="Content">
                        <input id="RemitterUnit" name="RemitterUnit" runat="server" />

                        <input class="button_sel" id="btnSelRemitterUnit" disabled onclick="javascript: if (btnSelRemitterUnit_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelRemitterUnit" runat="server" /></td>
                    <td class="Title">银行名称</td>
                    <td class="Content">
                        <select id="BankName" name="BankName" disabled runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="Title">银行帐号</td>
                    <td class="Content">
                        <input id="BankAccount" readonly name="BankAccount" runat="server" /></td>
                    <td class="Title">支 票 号</td>
                    <td class="Content">
                        <input id="ChequeBill" readonly name="ChequeBill" runat="server" /></td>
                </tr>
                <tr id="TrBank" style="display: none;">
                    <td class="Title">交款类型</td>
                    <td class="Content">
                        <asp:DropDownList ID="RenderType" runat="server" BorderColor="#cccccc" BorderWidth="1"></asp:DropDownList>
                        <input id="hiRenderType" type="hidden" name="hiRenderType" runat="server" /></td>
                    <td class="Title">交款单位</td>
                    <td class="Content">
                        <input id="RenderCustName" name="RenderCustName" runat="server" />
                        <input id="RenderCustID" type="hidden" name="RenderCustID" runat="server" />
                        <input id="hiRenderCustName" type="hidden" name="hiRenderCustName" runat="server" />

                        <input class="button_sel" id="btnSelRenderCust" disabled onclick="javascript: if (btnSelRenderCust_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelRenderCust" runat="server" /></td>
                    <td class="Title">备注</td>
                    <td class="MemoContent">
                        <input id="ReceMemo" name="ReceMemo" maxlength="40" placeholder="请输入备注内容" runat="server" /></td>
                    <td class="Title"><%--开具电票--%></td>
                    <td class="Content">
                        <asp:CheckBox ID="IsEInvoice" Visible="false" runat="server" Text="是"></asp:CheckBox></td>
                </tr>

                <%--<td class="DialogTdContent">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankAccountSelbox" />
                        <input type="hidden" id="Hidden1" runat="server" />
                    </td>--%>
                <tr>
                    <td class="Title">入账银行</td>
                    <%-- <td class="Content"> --%>
                    <td class="DialogTdContent" style="text-align: left;">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankNameSel" name="BankNameSel" style="width: 100px" />
                        <input type="hidden" id="hiBankNameSel" name="hiBankNameSel" value="" runat="server" />
                        <input type="hidden" id="hiBankAccountSel" name="hiBankAccountSel" value="" runat="server" />

                    </td>
                    <td class="Title">入账账号</td>
                    <%--<td class="Content">--%>
                    <td class="DialogTdContent" style="text-align: left;">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankAccountSel" name="BankAccountSel" style="width: 100px" />
                    </td>
                    <td class="Title">备注</td>
                    <td class="MemoContent" colspan="3">
                        <input id="BillsMemo" name="BillsMemo" maxlength="500" placeholder="请输入备注内容" runat="server" /></td>
                </tr>
                <tr>
                    <td class="Title">付款码</td>
                    <td class="Content">
                        <input id="CustPaymentID" name="CustPaymentID" runat="server" />
                        <input id="CustPaymentKey" name="CustPaymentKey" type="hidden" runat="server" />
                        <input id="OrderResult" name="OrderResult" type="hidden" runat="server" />
                    </td>
                    <td class="Title eInvoice" style="display: none;">开票类型</td>
                    <td class="Content eInvoice" style="display: none;">
                        <select id="InfoKind" name="InfoKind" runat="server">
                            <option value="" selected="selected">&nbsp;</option>
                            <option value="1">增值税电子发票</option>
                            <option value="2">增值税专用发票</option>
                            <option value="3">增值税普通发票</option>
                        </select>
                    </td>
                    <td class="Title">&nbsp;</td>
                    <td class="Content">&nbsp;</td>
                    <td class="Title">&nbsp;</td>
                    <td class="Content">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="9" class="SureCharge">
                        <asp:CheckBox ID="CkIsSurplus" runat="server" Checked="true" Text="零头取整"></asp:CheckBox>
                        <asp:CheckBox ID="CkIsOffset" runat="server" Checked="false" Text="" CssClass="dstyle2"></asp:CheckBox>
                        <span id="WarnOffset">预交冲抵</span>
                        <asp:CheckBox ID="CkIsComb" runat="server" Checked="true" Text="合并打印"></asp:CheckBox>
                        <asp:CheckBox ID="CklsBatchReceFees" runat="server" Checked="false" Text="批量收费"></asp:CheckBox>
                        收取日期：<input id="CurChargeDate" class="Wdate" style="width: 135px"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" maxlength="50" size="26" name="CurChargeDate"
                            runat="server">
                        <input id="NowDate" name="NowDate" type="hidden" runat="server" />
                        <asp:CheckBox ID="CkIsInvoice" runat="server" Checked="false" Text="网上开票"></asp:CheckBox>
                        <input type="button" class="button" value="收款确认" id="btnReceive" runat="server" />
                        <input type="button" class="button" value="扫码确认" id="btnPayment" runat="server" />
                    </td>
                </tr>
            </table>
        </div>

        <div id="toolbar">
            <table style="width: 100%; vertical-align: middle;">
                <tr>
                    <%--<td style="padding-left: 5px;"><span class="fa fa-laptop"></span>应收取的费用列表</td><td>
                        <input type="button" style="display:none"  value="重新计算" id="BtnLateCut" runat="server" onserverclick="BtnLateCut_ServerClick" />
                        </td>--%>
                    <td style="padding-right: 40px;">显示应收数量：
                        <select id="ShowItemCount" name="ShowItemCount" runat="server">
                            <option value="150">150</option>
                            <option value="300">300</option>
                            <option value="500">500</option>
                            <option selected="selected" value="1000">1000</option>
                            <option value="2000">2000</option>
                        </select>
                        月份筛选：<asp:DropDownList ID="FeesYearMonth" runat="server" OnSelectedIndexChanged="FeesYearMonth_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        至
                        <asp:DropDownList ID="FeesEndYearMonth" runat="server" OnSelectedIndexChanged="FeesYearMonth_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        费用筛选：<asp:DropDownList ID="FeesCostItem" multiple="multiple" runat="server"></asp:DropDownList>
                        <asp:CheckBox ID="CkIsShieldPrec" runat="server" Checked="true" Text="屏蔽预收" AutoPostBack="true" OnCheckedChanged="CkIsShieldPrec_CheckedChanged" Visible="false"></asp:CheckBox>
                        <asp:CheckBox ID="CkIsCombShow" runat="server" Checked="True" Text="合并显示" AutoPostBack="true" OnCheckedChanged="CkIsCombShow_CheckedChanged"></asp:CheckBox>
                        <asp:CheckBox ID="CkIsLateFee" runat="server" Checked="false" Visible="false" Text="是否包含滞纳金" AutoPostBack="true" OnCheckedChanged="CkIsLateFee_CheckedChanged"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </div>

        <div id="PreCostToolbar" style="display: none;">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>预存费用列表</td>
                    <td style="text-align: right; padding-right: 40px;"></td>
                </tr>
            </table>
        </div>

        <input id="hiCommID" name="hiCommID" type="hidden" runat="server" />
        <input id="ReceID" type="hidden" name="ReceID" runat="server" />
        <input id="FeesIDs" type="hidden" name="FeesIDs" runat="server" />
        <input id="SubFeesIDs" type="hidden" name="SubFeesIDs" runat="server" />
        <input id="FeesLimitCount" type="hidden" name="FeesLimitCount" runat="server" />
        <input id="LimitCount" type="hidden" name="LimitCount" runat="server" />
        <input id="SelHit" type="hidden" name="SelHit" runat="server" />
        <input id="HadIsProperty" type="hidden" name="HadIsProperty" runat="server" />
        <input id="IsCostType3" type="hidden" name="IsCostType3" runat="server" />
        <input id="IsBankPay" type="hidden" name="IsBankPay" runat="server" />
        <input id="IsTax" type="hidden" name="IsTax" runat="server" />
        <input id="IsFirst" type="hidden" name="IsFirst" runat="server" />
        <input id="BusinessTradeNo" type="hidden" name="BusinessTradeNo" runat="server" />

        <input id="LateAmounts" type="hidden" name="LateAmounts" runat="server" />

        <input id="CommID" type="hidden" name="CommID" runat="server" />
        <input id="symbol" type="hidden" name="symbol" runat="server" />
        <input id="market" type="hidden" name="market" runat="server" />
        <input id="locadr" type="hidden" name="locadr" runat="server" />
        <input id="hiSelCustID" type="hidden" name="hiSelCustID" runat="server" />

        <input id="hiCustName" name="hiCustName" type="hidden" runat="server" />
        <input id="CustID" name="CustID" type="hidden" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiSelRoomID" type="hidden" name="hiSelRoomID" runat="server" />

        <input id="hiParkName" type="hidden" name="hiParkName" runat="server" />
        <input id="HandID" type="hidden" name="HandID" runat="server" />
        <input id="hiPrecAmount" type="hidden" name="hiPrecAmount" runat="server" />

        <input id="SelYearMonth" type="hidden" name="SelYearMonth" runat="server" />
        <input id="SelEndYearMonth" type="hidden" name="SelEndYearMonth" runat="server" />
        <input id="SelCostItem" type="hidden" name="SelCostItem" runat="server" />

        <input id="SearchResult" type="hidden" runat="server" />
        <input type="hidden" id="InvoiceContent" name="InvoiceContent" runat="server" />
        <input type="hidden" id="MemoContent" name="MemoContent" runat="server" />
        <input type="hidden" id="RoomStateName" name="RoomStateName" runat="server" />
        <input type="hidden" id="FeesHit" name="FeesHit" runat="server" />
        <input type="hidden" id="hiPrecAmountFees" name="hiPrecAmountFees" runat="server" />

        <input id="hiInvoiceBill" type="hidden" size="1" name="hiInvoiceBill" runat="server" />
        <input id="hiInvoiceBills" type="hidden" name="hiInvoiceBills" runat="server" />

        <input id="IsFixed" type="hidden" size="1" name="IsFixed" runat="server" />
        <input id="FixedAmount" type="hidden" name="FixedAmount" runat="server" />
        <input id="hiBillsSign" type="hidden" name="hiBillsSign" runat="server" />
        <input id="hiRemitterUnit" type="hidden" name="hiRemitterUnit" runat="server" />

        <input id="hiChargeModes" type="hidden" name="hiChargeModes" runat="server" />

        <input id="ChargeModeName" type="hidden" name="ChargeModeName" runat="server" />

        <input id="Path" name="Path" type="hidden" runat="server" />

        <input id="IsCan_CustomerDetail" type="hidden" runat="server" />
        <input id="IsCan_IncidentAccept" type="hidden" runat="server" />
        <input id="IsCan_ParkingCar" type="hidden" runat="server" />
        <input id="IsCan_WriteMeter" type="hidden" runat="server" />
        <input id="IsCan_AccountedFor" type="hidden" runat="server" />
        <input id="IsCan_Receivable" type="hidden" runat="server" />
        <input id="IsCan_FeesConSign" type="hidden" runat="server" />
        <input id="hiSearchFastKey" type="hidden" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>


        <script type="text/javascript" src="../Jscript-Ui/fSelect/fSelect.js"></script>

        <script type="text/javascript">

            $('#FeesCostItem').fSelect();

            //$('#FeesCostItem').prev(".fs-dropdown").find(".fs-options .fs-option").each(function () {
            //    $(this).removeClass('selected', false);
            //});

            //将选中的值重新进行赋值
            var _SelCostIDs = $("#hiSelCostIDs").val();

            if (_SelCostIDs != '0') {
                $(".fs-option").each(function () {
                    var _CID = $(this).attr("data-value");
                    if (_SelCostIDs.indexOf(_CID) >= 0) {
                        $(this).addClass('selected');
                        $('#FeesCostItem').fSelect('reloadDropdownLabel');
                    }
                });
            }

            function InitFunction() {
                //var h = $(window).height()-333;
                //$("#TableContainer").css("height", h + "px");
                //window.parent.document.getElementById("ContainerLeft").style = "display:none";
                //window.parent.document.getElementById("ContainerRight").style = "width:100%";
                $("#TableContainer").css("height", "auto");
                $("#SUP").hide();
                $("#SSDown").hide();
                $('#CustNav').hide();
                $('#IsShow').val('false');
                $('#btnPayment').hide();
                $('#CustPaymentID').attr("disabled", "disabled");
                if ($('#CustID').val() != '') {
                    $("#SDown").hide();
                    $("#SUP").show();
                    $("#SSDown").hide();
                    $("#SSUP").show();
                    $("#CustNav").show();
                    $('#IsShowInfo').val('false');
                    $('#ShowInfo').val('false');
                }
            }
            InitFunction();

            function Onblur_LateCut() {
                getObject("BtnLateCut").style.display = "block";
            }

            function Onblur_CurCharge() {
                getObject("BtnLateCut").style.display = "block";

                alert($('#CurChargeDate').val() + "  ---  " + $('#NowDate').val() + " 23:59:59");
                var vday = compareDate($('#CurChargeDate').val(), $('#NowDate').val() + " 23:59:59");
                if (vday) {
                    HDialog.Info("收取日期(" + $('#CurChargeDate').val() + ")应小于等于现在的时间(" + $('#NowDate').val() + ")！");

                    getObject("CurChargeDate").value = getObject("NowDate").value;
                    return false;
                }
                //getObject("LateCutDate").value = getObject("CurChargeDate").value;
            }

            //打开模态窗口
            function showModalDlg(URL, Arguments, Width, Height) {

                var iTop2 = (window.screen.availHeight - 20 - Width) / 2;
                var iLeft2 = (window.screen.availWidth - 10 - Height) / 2;

                var sFeatures = "status:no;help:no;resizable:no;scroll:no;dialogHeight:" + Height + "px;dialogWidth:" + Width + "px;dialogLeft=" + iLeft2 + "px;dialogTop=" + iTop2 + "px";
                var varReturn = window.showModalDialog(URL, Arguments, sFeatures);

                return varReturn;
            }
            //得到对象实体
            function getObject(objectId) {
                if (document.getElementById && document.getElementById(objectId)) {
                    // W3C DOM
                    return document.getElementById(objectId);
                } else if (document.all && document.all(objectId)) {
                    // MSIE 4 DOM
                    return document.all(objectId);
                } else if (document.layers && document.layers[objectId]) {
                    // NN 4 DOM.. note: this won't find nested layers
                    return document.layers[objectId];
                } else {
                    return false;
                }
            }


            function CheckCurCharge() {
                //当前日期
                var NowDate = $("#NowDate").val() + " 23:59:59";
                NowDate = new Date(NowDate.replace("-", "/").replace("-", "/"));
                //收取日期
                var setDate = $('#CurChargeDate').val();
                setDate = new Date(setDate.replace("-", "/").replace("-", "/"));
                //TODO:获取小区是否设置了结账延期日期
                $.tool.DataPost('ReverseOverAccountApply', 'GetData', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var res = _Data.split(',')[0];
                        if (res == "true") {
                            var AccountBeginDate = _Data.split(',')[1];
                            var AccountEndDate = _Data.split(',')[2];
                            var AccountSetDate = _Data.split(',')[3];

                            var ApplyOverAccountBeginDate = new Date(AccountBeginDate.replace("-", "/").replace("-", "/"));
                            var ApplyOverAccountEndDate = new Date(AccountEndDate.replace("-", "/").replace("-", "/"));
                            var ApplyOverAccountSetDate = new Date(AccountSetDate.replace("-", "/").replace("-", "/"));
                            //TODO:如果当前日期在结账结束日期和结账延期日期范围内，可以选结账开始日期到当前日期范围内的时间
                            //否则只能选择当前日期
                            if (NowDate > ApplyOverAccountEndDate && NowDate < ApplyOverAccountSetDate) {
                                if (setDate > ApplyOverAccountSetDate) {
                                    HDialog.Info("收取日期不能大于延期结账日期:" + AccountSetDate);
                                    return false;
                                } else if (setDate < ApplyOverAccountBeginDate) {
                                    HDialog.Info("收取日期不能小于结账开始日期:" + AccountBeginDate);
                                    return false;
                                } else if (setDate > NowDate) {
                                    HDialog.Info("收取日期不能大于当前日期:" + $("#NowDate").val());
                                    return false;
                                }
                            } else if (setDate > NowDate) {
                                HDialog.Info("收取日期不能大于当前日期:" + $("#NowDate").val());
                                return false;
                            }
                            else if (setDate > ApplyOverAccountEndDate) {
                                HDialog.Info("收取日期不能大于结账结束日期:" + AccountEndDate);
                                return false;
                            } else if (setDate < ApplyOverAccountBeginDate) {
                                HDialog.Info("收取日期不能小于结账开始日期:" + AccountBeginDate);
                                return false;
                            }
                        } else {
                            //根据当前日期的年月获取对应小区的结账开始时间，结束时间，结账时间
                            $.tool.DataPost('WriteOff', 'GetDateByCommIDByTime', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {

                                    if (_Data != "") {
                                        var AccountBeginDate = _Data.split(',')[0];
                                        var AccountEndDate = _Data.split(',')[1];
                                        var OverAccountBeginDate = new Date(AccountBeginDate.replace("-", "/").replace("-", "/"));
                                        var overAccountEndDate = new Date(AccountEndDate.replace("-", "/").replace("-", "/"));
                                        if (setDate > NowDate) {
                                            HDialog.Info("收取日期不能大于当前日期:" + $("#NowDate").val());
                                            return false;
                                        } else if (OverAccountBeginDate < setDate && setDate < overAccountEndDate) {
                                            HDialog.Info("收取日期不能在已结账日期:" + AccountBeginDate + "到" + AccountEndDate + "期间内");
                                            return false;
                                        }
                                    } else {
                                        if (setDate > NowDate) {
                                            HDialog.Info("收取日期不能大于当前日期:" + $("#NowDate").val());
                                            return false;
                                        }
                                    }
                                }, function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }


                    }, function completeCallback() {
                    },
                    function errorCallback() {
                    });

                return true;
            }


            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });

            //冻结列
            var frozenColumns =
                [[

                ]]
            //绑定列表列
            var column;
            column = [[


                {
                    field: 'Fids', checkbox: false, title: '<span id=\'SelAllSpan\' onclick=\'SelAllFees();\'>全选</span>', width: '26', align: 'center', sortable: false, formatter: function (value, row, index) {
                        if (value == 'footer') return "";
                        var Disabled = "";
                        var isLock = "false";
                        if (row.IsBank != 0 || row.IsFreeze != 0 || (row.IsPrec != 0 && row.IsPrec != null)) {
                            Disabled = "Disabled";
                            isLock = "true";
                        }
                        var str = "<input onclick=\"Fids_Click('" + index + "');\" id='Fids' name='Fids' type='checkbox' class='Fids' " + Disabled + " isLock=\"" + isLock + "\" value=\"" + row.FeesIDs + "\" >";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: '150', align: 'center', sortable: true },
                { field: 'ParkName', title: '车位编号', width: '150', align: 'center', sortable: true },

                { field: 'CostName', title: '费用名称', width: '150', align: 'center', sortable: true },
                { field: 'FeesIDs', title: '费项ID', align: 'left', sortable: true, hidden: true },
                { field: 'LateAmounts', title: '合同违约金', align: 'left', sortable: true, hidden: true },
                { field: 'ChargeCycle', title: '计费周期', width: '60', align: 'center', sortable: true, hidden: true },
                { field: 'FeeDueYearMonth', title: '费用日期', width: '120', align: 'center', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: '65', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: '75', align: 'center', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: '60', align: 'center', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: '60', align: 'center', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: '60', align: 'center', sortable: true },
                { field: 'LateFeeAmount', title: '合同违约金', width: '70', align: 'center', sortable: true },
                {
                    field: 'Fyts', title: '费用提示', width: '200', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";

                        var iStartDegree = changeTwoDecimal(GetStanMemoValue(row.StanMemo, "StartDegree"));
                        var iEndDegree = changeTwoDecimal(GetStanMemoValue(row.StanMemo, "EndDegree"));
                        var iPrice = changeTwoDecimal(GetStanMemoValue(row.StanMemo, "Price"));
                        var iStanAmount = changeTwoDecimal(GetStanMemoValue(row.StanMemo, "StanAmount"));
                        var iShareDosage = changeTwoDecimal(GetStanMemoValue(row.StanMemo, "ShareDosage"));

                        if (iStartDegree != 0 || iEndDegree != 0 || iPrice != 0) {
                            if (parseFloat(iShareDosage) != 0) {
                                str = "分摊数:" + iShareDosage + " 标准:" + iPrice;

                            }
                            else {
                                str = "起数:" + iStartDegree + " 止数:" + iEndDegree + " 标准:" + iPrice;
                            }
                        }
                        else {
                            if (iStanAmount != 0 && iPrice == 0) {
                                str = "标准:" + iStanAmount;
                            }
                        }
                        return str;
                    }
                },
                {
                    field: 'IsBank', title: '是否可托收', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (value == 'footer') return "";
                        var iBankPay = row.iBankPay;
                        if (($("#IsBankPay").val() == "0") || ($("#IsBankPay").val() == "")) {
                            str = "否";
                        }
                        else {
                            if (iBankPay == 0) {
                                str = "否";
                            }
                            else {
                                str = "是";
                            }
                        }
                        return str;
                    }
                },
                { field: 'IsBankName', title: '托收状态', width: '60', align: 'center', sortable: true },
                { field: 'IsFreezeName', title: '冻结状态', width: '60', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '预交状态', width: '60', align: 'center', sortable: true },
                { field: 'FeesMemo', title: '费用备注', width: '200', align: 'center', sortable: false },
                { field: 'RoomName', title: '房屋名称', width: '150', align: 'center', sortable: true },
                {
                    field: 'IsCf', title: '拆分', width: '60', align: 'center', sortable: false, formatter: function (value, row, index) {
                        var str = "";
                        //IsBank IsFreeze IsPrec CostName
                        if (row.IsBank == 0 && row.IsFreeze == 0 && row.IsPrec == 0 && row.IsProperty == 0 && row.IsProperty == 0 && getObject("CkIsCombShow").checked == false) {
                            str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"SplitFees('" + row.FeesID + "');\">拆分</a>";
                        }
                        return str;
                    }
                }
            ]];


            //绑定列表列
            var PreCostColumn;
            PreCostColumn = [[
                { field: 'CostName', title: '预存费用', width: 100, align: 'center', sortable: true },
                { field: 'PrecMemo', title: '预存摘要', width: 400, align: 'center', sortable: true },
                { field: 'PrecAmount', title: '预存金额', width: 100, align: 'center', sortable: true }
            ]];

            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }
            //指定列求和
            function ComputeGridCol(colName) {
                var rows = $('#PreCostTableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }


            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            //列表绑定定义
            $("#TableContainer").datagrid({
                //url: '/HM/M_Main/HC/DataPostControl.aspx',
                //method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: false,
                remoteSort: false,
                pagination: false,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: true,
                cascadeCheck: true,
                IsCustomHead: false,
                showFooter: true,
                striped: true,
                view: myview,
                width: "100%",
                toolbar: '#toolbar',
                border: false,
                sortOrder: "asc",
                frozenColumns: frozenColumns,

                rowStyler: function (rowIndex, rowData) {
                    //如果是页脚
                    if (rowData.Fids == 'footer') {
                        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    }
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainer').datagrid('reloadFooter', [
                        {
                            Fids: 'footer',
                            RoomSign: "<span style='color:red'>合计</span>",
                            DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                            PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                            WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                            DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>",
                            LateFeeAmount: "<span style='color:red'>" + compute("LateFeeAmount") + "</span>",
                            IsBank: 'footer'
                        }
                    ]);
                },
                onClickRow: function (rowIndex, rowData) {

                    if (getObject("CkIsCombShow").checked == false) {
                        $("#TableContainer").datagrid('addEditor', [
                            {
                                field: 'LateFeeAmount',
                                editor: {
                                    type: 'text'
                                }
                            }]);
                        //启动编辑合同违约金
                        $("#TableContainer").datagrid('beginEdit', rowIndex);
                        //编定文本变化事件
                        var ed = $('#TableContainer').datagrid('getEditor', { index: rowIndex, field: 'LateFeeAmount' });
                        $(ed.target).bind("click", function () {

                        }).bind("change", function () {
                            //文本变化事件
                            //计算费用
                            //得到FeesID的列表，并设置相应参数
                            GetFeesID();
                        });
                    }
                    RowClick(rowIndex, rowData);
                }
            });

            var IsLoadPreCostTableContainer = false;

            function LoadPreCostTableContainer() {
                if (IsLoadPreCostTableContainer == false) {
                    //列表绑定定义
                    $("#PreCostTableContainer").datagrid({
                        //url: '/HM/M_Main/HC/DataPostControl.aspx',
                        //method: "post",
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: PreCostColumn,
                        fitColumns: true,
                        singleSelect: true,
                        remoteSort: false,
                        pagination: false,
                        rownumbers: true,
                        checkOnSelect: true,
                        selectOnCheck: true,
                        cascadeCheck: true,
                        IsCustomHead: false,
                        width: "100%",
                        toolbar: '#PreCostToolbar',
                        border: false,
                        showFooter: true,
                        striped: true,
                        view: myview,
                        sortOrder: "asc",
                        rowStyler: function (index, row) {
                            //如果是页脚
                            if (row.CostName == "<span style='color:red'>合计</span>") {
                                return 'background-color:#F4F4F4;border:none;'; // return inline style
                            }
                        },
                        onLoadSuccess: function (data) {
                            //加载页脚
                            CalPreCostAmount();
                        },
                        onClickRow: function (index, row) {
                        },
                        onDblClickRow: function (rowIndex, rowData) {
                            $('#PreCostTableContainer').datagrid('deleteRow', rowIndex);

                            var Total = ComputeGridCol("PrecAmount");
                            $("#TotalPrecAmount").val(Total);
                            //设置零头结转规则
                            Rule.SetSurplusRule();
                            //设置单项预存结转规则
                            Rule.SetPreCostRule();
                            //计算合计金额
                            CalPreCostAmount();
                            //刷新收据数据,将预存也算进去
                            SendReceive();
                        }
                    });
                }
                IsLoadPreCostTableContainer = true;
            }

            function CalPreCostAmount() {
                $('#PreCostTableContainer').datagrid('reloadFooter', [
                    {
                        CostName: "<span style='color:red'>合计</span>",
                        PrecMemo: "",
                        PrecAmount: "<span style='color:red'>" + ComputeGridCol("PrecAmount") + "</span>",
                    }
                ]);
            }
            //增加预存收款行
            function AddPreCostRow(rows) {
                LoadPreCostTableContainer();
                var _Data = $('#PreCostTableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                $('#PreCostTableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        CostID: rows.CostID,
                        CostName: rows.CostName,
                        PrecAmount: ToDecimal(rows.PrecAmount, 2),
                        PrecMemo: rows.PrecMemo
                    }
                });

                var Total = ComputeGridCol("PrecAmount");
                $("#TotalPrecAmount").val(Total);

                //计算合计金额
                CalPreCostAmount();
                //设置零头结转规则
                Rule.SetSurplusRule();
                //设置单项预存结转规则
                Rule.SetPreCostRule();
                //设置发票类别规则
                RuleEvent.InvoiceTypeEvent();
                //刷新收据数据,将预存也算进去
                SendReceive();

                getObject("btnReceive").disabled = false;
            }

            //全选控制
            var IsSelAll = false;
            function SelAllFees() {
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    if (IsSelAll == false) {
                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        var IsLock = $("input[value='" + rows[i].FeesIDs + "']").attr("isLock");
                        if (IsLock == "true") {
                            $("#TableContainer").datagrid("unselectRow", RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", false);
                        }
                        if (IsLock == "false") {
                            $("#TableContainer").datagrid("selectRow", RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", true);
                        }
                    }
                    else {
                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        $("#TableContainer").datagrid("unselectRow", RI);
                        $("input[value='" + rows[i].FeesIDs + "']").prop("checked", false);
                    }
                }
                if (IsSelAll == false) {
                    IsSelAll = true;
                    $("#SelAllSpan").html("取消");
                }
                else {
                    IsSelAll = false;
                    $("#SelAllSpan").html("全选");
                }
                //得到FeesID的列表，并设置相应参数
                GetFeesID();
            }

            function SelRow(RowIndex, FeesIDs, IsClickCheckBox) {
                //如果是尾行统计则返回false;
                if (FeesIDs == undefined) {
                    $("#TableContainer").datagrid("unselectRow", RowIndex);
                    return false;
                }
                var IsLock = $("input[value='" + FeesIDs + "']").attr("isLock");
                if (IsLock == "true") {
                    $("#TableContainer").datagrid("unselectRow", RowIndex);
                    $("input[value='" + FeesIDs + "']").prop("checked", false);
                    return false;
                }
                else {
                    var IsSel = $("input[value='" + FeesIDs + "']").is(':checked');
                    //如果是从行点击，则控制状态
                    if (IsClickCheckBox == false) {
                        var Cmd = "selectRow";
                        if (IsSel == false) {
                            $("#TableContainer").datagrid("selectRow", RowIndex);
                            $("input[value='" + FeesIDs + "']").prop("checked", true);
                        }
                        if (IsSel == true) {
                            $("#TableContainer").datagrid("unselectRow", RowIndex);
                            $("input[value='" + FeesIDs + "']").prop("checked", false);

                            //取消编辑合同违约金
                            $("#TableContainer").datagrid('cancelEdit', RowIndex);

                        }
                    }
                }

                return true;
            }

            //CheckBox上面直接单击
            var IsCheckBoxClick = false;
            function Fids_Click(RowIndex) {
                IsCheckBoxClick = true;
            }
            //行点击,需要计算费用
            function RowClick(RowIndex, Row) {
                //RuleEvent.InvoiceTypeEvent();
                ////如果已经通过CheckBox单击了
                if (IsCheckBoxClick == true) {
                    var IsSel = $("input[value='" + Row.FeesIDs + "']").is(':checked');
                    if (IsSel == true) {
                        $("#TableContainer").datagrid("selectRow", RowIndex);
                    }
                    else {
                        $("#TableContainer").datagrid("unselectRow", RowIndex);
                        //取消编辑合同违约金
                        //$("#TableContainer").datagrid('cancelEdit', RowIndex);
                    }
                    //第三个参数：true:CheckBox单击 
                    FunRowClick(RowIndex, Row, true);
                    IsCheckBoxClick = false;
                    return false;
                }
                //第三个参数：true:CheckBox单击 
                FunRowClick(RowIndex, Row, false);
            }

            function FunRowClick(RowIndex, Row, IsClickCheckBox) {
                var tmpRoomID;
                var tmpFeesID;
                var tmpOwnerFeesID;
                var tmpSelRoomID;
                var tmpSysCostSign;
                var tmpPaymentBind;
                var tmpFeesDueDate;
                var tmpCostID;
                tmpRoomID = Row.RoomID;
                tmpFeesID = Row.FeesIDs;
                tmpOwnerFeesID = Row.OwnerFeesIDs;
                tmpSysCostSign = Row.SysCostSign;
                tmpSelRoomID = $("#hiSelRoomID").val();
                tmpIsTax = $("#IsTax").val();
                tmpPaymentBind = Row.PaymentBind;
                tmpFeesDueDate = Row.FeesDueDate
                tmpCostID = Row.CostID
                if (tmpSelRoomID != "") {
                }
                else {
                    getObject("hiSelRoomID").value = tmpRoomID;
                    tmpSelRoomID = tmpRoomID;
                }

                var R = SelRow(RowIndex, Row.FeesIDs, IsClickCheckBox);
                if (R == false) return false;

                //佣金与费项联动
                var IsSel = $("input[value='" + Row.FeesIDs + "']").is(':checked');
                var Cmd = "selectRow";
                if (IsSel == false) Cmd = "unselectRow";
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);

                    //仅仅在勾选时需要做联动，取消时一个一个取消
                    if (Cmd == "selectRow") {
                        if (rows[i].OwnerFeesIDs == tmpFeesID) {
                            $("#TableContainer").datagrid(Cmd, RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                        }

                        if (rows[i].FeesIDs == tmpOwnerFeesID) {
                            $("#TableContainer").datagrid(Cmd, RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                        }

                        //费项设置管控
                        //全部费用一次缴纳
                        if ($('#checkboxid').val() == '1') {
                            $("#TableContainer").datagrid(Cmd, RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                        } //单笔费用任意缴纳，同时缴纳历史欠费
                        else if ($('#checkboxid').val() == '2') {
                            if ($('#isHis').val() == '0') {
                                if (rows[i].FeesIDs == tmpFeesID) {
                                    $("#TableContainer").datagrid(Cmd, RI);
                                    $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                }
                            } else {
                                if (rows[i].CostID == tmpCostID && rows[i].FeesDueDate <= tmpFeesDueDate) {
                                    $("#TableContainer").datagrid(Cmd, RI);
                                    $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                }
                            }
                        } else {
                            if (getObject("CkIsCombShow").checked == true) {
                                if (tmpPaymentBind == '1') {
                                    if (rows[i].PaymentBind == '1') {
                                        $("#TableContainer").datagrid(Cmd, RI);
                                        $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                    }
                                }
                            } else {
                                if (tmpPaymentBind == '1') {
                                    if (rows[i].PaymentBind == '1') {
                                        //按照费项绑定设置，整月费用一次缴纳，同时缴纳历史欠费
                                        if ($('#checkboxid').val() == '4') {
                                            if (rows[i].FeesDueDate <= tmpFeesDueDate) {
                                                $("#TableContainer").datagrid(Cmd, RI);
                                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                            }
                                        }//按照费项绑定设置，整季费用一次缴纳，同时缴纳历史欠费
                                        if ($('#checkboxid').val() == '6') {
                                            var datefees = new Date(tmpFeesDueDate);
                                            var nowMonth = datefees.getMonth() + 1;
                                            var year = tmpFeesDueDate.split('-')[0];
                                            var item;
                                            if (1 <= nowMonth && nowMonth <= 3) {
                                                item = year + '-03-31 23:59:59'
                                            }
                                            else if (3 < nowMonth && nowMonth <= 6) {
                                                item = year + '-06-30 23:59:59'
                                            }
                                            else if (6 < nowMonth && nowMonth <= 9) {
                                                item = year + '-09-30 23:59:59'
                                            }
                                            else if (9 < nowMonth && nowMonth <= 12) {
                                                item = year + '-12-31 23:59:59'
                                            }
                                            if (rows[i].FeesDueDate <= item) {
                                                $("#TableContainer").datagrid(Cmd, RI);
                                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                            }
                                        }//按照费项绑定设置，半年费用一次缴纳，同时缴纳历史欠费
                                        if ($('#checkboxid').val() == '8') {
                                            var datefees = new Date(tmpFeesDueDate);
                                            var nowMonth = datefees.getMonth() + 1;
                                            var year = tmpFeesDueDate.split('-')[0];
                                            var item;
                                            if (1 <= nowMonth && nowMonth <= 6) {
                                                item = year + '-06-30 23:59:59'
                                            }
                                            if (6 < nowMonth && nowMonth <= 12) {
                                                item = year + '-12-31 23:59:59'
                                            }
                                            if (rows[i].FeesDueDate <= item) {
                                                $("#TableContainer").datagrid(Cmd, RI);
                                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                            }
                                        }//按照费项绑定设置，整年费用一次缴纳，同时缴纳历史欠费
                                        if ($('#checkboxid').val() == '10') {
                                            var datefees = new Date(tmpFeesDueDate);
                                            var year = tmpFeesDueDate.split('-')[0];
                                            var item = year + '-12-31 23:59:59'
                                            if (rows[i].FeesDueDate <= item) {
                                                $("#TableContainer").datagrid(Cmd, RI);
                                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                            }
                                        }
                                        //按照费项绑定设置，往后缴纳 X 月费用，同时缴纳历史欠费
                                        if ($('#checkboxid').val() == '12') {
                                            var MonthNum = $('#MonthNum').val();
                                            var datefees = new Date(tmpFeesDueDate);
                                            var addMonth = parseInt(datefees.getMonth()) + parseInt(MonthNum);
                                            datefees = datefees.setMonth(addMonth);
                                            datefees = new Date(datefees);
                                            var item = datefees.getFullYear() + '-' + (datefees.getMonth() + 1) + '-' + datefees.getDate().toString() + ' 23:59:59';
                                            if (new Date(rows[i].FeesDueDate) <= new Date(item)) {
                                                $("#TableContainer").datagrid(Cmd, RI);
                                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else {
                        if ($('#checkboxid').val() == '2') {
                            if ($('#isHis').val() == '0') {
                                //取消点击项
                                if (rows[i].FeesIDs == tmpFeesID) {
                                    $("#TableContainer").datagrid(Cmd, RI);
                                    $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                                }
                            } else {
                                //取消全部
                                $("#TableContainer").datagrid(Cmd, RI);
                                $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                            }
                        }
                        if ($('#checkboxid').val() != '' && $('#checkboxid').val() != '2') {
                            //取消全部
                            $("#TableContainer").datagrid(Cmd, RI);
                            $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                        }
                        //else {
                        //     //取消全部
                        //    $("#TableContainer").datagrid(Cmd, RI);
                        //    $("input[value='" + rows[i].FeesIDs + "']").prop("checked", IsSel);
                        //}
                    }
                }

                getObject("IsTax").value = tmpIsTax;
                //计算费用
                //得到FeesID的列表，并设置相应参数
                GetFeesID();
            }

            function GetFeesID() {
                var strFeesIDs = "";
                var strLateAmounts = "";
                var strIsProperty = "";
                var strIsCostType3 = "";
                var SelCount = 0;

                var rows = $('#TableContainer').datagrid('getChecked');

                //alert(JSON.stringify(rows));            
                //alert(rows[i].LateAmounts);

                var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');

                //如果是批量收费，则不用检查提交的笔数
                if (IsCklsBatchReceFees == false) {
                    if (rows.length > 90) {
                        HDialog.Info("提示：最多一次可选择90笔费用！");
                        return;
                    }
                }

                for (var i = 0; i < rows.length; i++) {

                    if (strFeesIDs != "") {
                        strFeesIDs = strFeesIDs + "," + rows[i].FeesIDs;
                    }
                    else {
                        strFeesIDs = rows[i].FeesIDs;
                    }

                    //获取合同违约金的值
                    if (getObject("CkIsCombShow").checked == false) {

                        var NowLateValue = rows[i].LateAmounts;

                        if (NowLateValue == "") {
                            NowLateValue = "0";
                        }

                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        var ed = $('#TableContainer').datagrid('getEditor', { index: RI, field: 'LateFeeAmount' });
                        if (ed != null) {
                            var _edControl = ed.target;
                            var MaxLateValue = rows[i].LateAmounts;

                            if (_edControl.val() == "") {
                                _edControl.val("0");
                            }
                            NowLateValue = _edControl.val();

                            if (parseFloat(NowLateValue) > parseFloat(MaxLateValue)) {
                                NowLateValue = MaxLateValue;
                                _edControl.val(NowLateValue);
                            }
                            if (parseFloat(NowLateValue) < 0) {
                                NowLateValue = 0;
                                _edControl.val(NowLateValue);
                            }
                        }

                        if (strLateAmounts != "") {
                            strLateAmounts = strLateAmounts + "," + NowLateValue;
                        }
                        else {
                            strLateAmounts = NowLateValue;
                        }
                    }
                    else {
                        if (strLateAmounts != "") {
                            strLateAmounts = strLateAmounts + "," + rows[i].LateAmounts;
                        }
                        else {
                            strLateAmounts = rows[i].LateAmounts;
                        }
                    }


                    if (rows[i].IsProperty == "1") {
                        strIsProperty = "1";
                    }

                    if (rows[i].CostType == "3") {
                        strIsCostType3 = "1";
                    }
                }

                //没有选择，房号为空
                if (strFeesIDs == "") {
                    getObject("hiSelRoomID").value = "";
                }
                if (strIsCostType3 == "1") {
                    getObject("IsInvoice").checked = false;
                    getObject("IsInvoice").disabled = true;
                    getObject("TrInvoice").style.display = "none";
                    getObject("BillType").disabled = false;
                    getObject("BillsSign").disabled = false;
                    getObject("btnSelBill").disabled = false;
                }
                else {
                    getObject("IsInvoice").disabled = false;
                }
                getObject("FeesIDs").value = strFeesIDs;

                //合同违约金
                getObject("LateAmounts").value = strLateAmounts;

                getObject("HadIsProperty").value = strIsProperty;
                getObject("IsCostType3").value = strIsCostType3;
                //是否修改零头
                getObject("IsEditPerSurplus").value = "0";
                //发票类别
                //getObject("InvoiceType").value = "";
                //设置交款类型
                SetRenderType();
                //刷新收据数据
                SendReceive();
            }

            //加载费项DataGrid列表
            if ($("#SearchResult").val() != "") {
                try {
                    var Rows = JSON.parse($("#SearchResult").val());
                    if (Rows.rows.length > 8) {
                        var h = $(window).height() - 415;
                        if (h < 250) {
                            h = 250;
                        }
                        $('#TableContainer').datagrid('resize', { height: h });
                    }

                    $('#TableContainer').datagrid('loadData', Rows);
                }
                catch (e) {

                }
            }

            //加载左边下侧栏
            //var Handle = parent.window.frames["ReceFeesLeft"].window;
            //Handle.$("#CustName").html("客户姓名：" + $("#CustName").val());
            //Handle.$("#FeesHit").html("费用提示：" + $("#FeesHit").val());
            //Handle.$("#RoomStateName").html("房屋状态：" + $("#RoomStateName").val());
            //Handle.$("#MemoContent").html("备注信息：" + $("#MemoContent").val() + "<font color=#767676> &nbsp;&nbsp;点击编辑</font>");
            //Handle.$("#CustID").val($("#CustID").val());

            $("#DivInvoiceContent").html($("#InvoiceContent").val() + "<font color=#767676> &nbsp;&nbsp;点击编辑</font>");
            $("#DivMemoContent").html($("#MemoContent").val() + "<font color=#767676> &nbsp;&nbsp;点击编辑</font>");

            $("#DivFeesHit").html($("#FeesHit").val());
            $("#DivRoomStateName").html($("#RoomStateName").val());

            $("#BtnClear").click(function () {
                $('#frmForm')[0].reset();

                $('#CustID').val(0);
                $('#RoomID').val(0);
                $('#CustName').val('');
                $('#RoomSign').val('');
                $('#RoomSign').val('');
                $('#hiCustName').val('');
                $('#FastKey').val('');
                $("#SearchResult").val('');
                $("#ParkName").val('');
                $("#HandID").val('');
                $("#SelCustID").val('');
                $("#SelRoomID").val('');
                $("#SelHandID").val('');
                $("#BtnSearch").click();
                //  window.location.href = "ReceFeesBrowse.aspx?CommID="+$("#CommID").val()+"&RoomID="+$("#RoomID").val();
            });

            //快速搜索
            var availableTags = [];
            $("#FastKey").autocomplete({
                source: function (request, response) {
                    $.tool.DataPostNoLoading('ReceFees', 'SearchFastKey', $('#frmForm').serialize(),
                        function Init() {
                            $('#CustID').val();
                            $('#RoomID').val();
                        },
                        function callback(_Data) {
                            for (var i = 0; i < 20; i++) { availableTags[i] = ''; }

                            $('#hiSearchFastKey').val(_Data);

                            var varObjects = eval("(" + _Data + ")"); //转换为json对象
                            //var j = 0;
                            for (var i = 0; i < varObjects.length; i++) {

                                if (varObjects[i].LiveType == '3') {
                                    availableTags[i] = i + '.　' + '\t' + '\t' + varObjects[i].CustName;
                                }
                                else {
                                    availableTags[i] = i + '.　' + '\t' + varObjects[i].RoomSign + "┃" + varObjects[i].RoomName + "┃" + '\t' + varObjects[i].CustName;
                                }
                            }
                            response(availableTags);
                        },
                        function _completeCallBack() {

                        },
                        function errorCallback() {
                        });
                },
                select: function (e, ui) {
                    var arrSel = ui.item.value;

                    var R = arrSel.split('\t');
                    $('#CustID').val('');
                    $('#RoomID').val('');

                    var j = R[0].split('.')[0];

                    var varObjects = eval("(" + $('#hiSearchFastKey').val() + ")"); //转换为json对象

                    //for (var i = 0; i < varObjects.length; i++) {
                    //    if($("#FastKey").val()==varObjects[j].CustID)
                    //}

                    $('#CustID').val(varObjects[j].CustID);
                    $('#RoomID').val(varObjects[j].RoomID);


                    $("#BtnSearch").click();

                    return false;
                },
                focus: function (event, ui) {
                    var arrSel = ui.item.value;
                    var R = arrSel.split('\t');
                    $("#FastKey").val(arrSel.split('.')[1].replace(/\t/g, '').replace('　', ''));

                    return false;
                },
            });
            //$("#FastKey").bind("input propertychange", 500, getData);
            //function getData() {
            //    $.tool.DataPostNoLoading('ReceFees', 'SearchFastKey', $('#frmForm').serialize(),
            //        function Init() {
            //            $('#CustID').val();
            //            $('#RoomID').val();
            //        },
            //        function callback(_Data) {
            //            for (var i = 0; i < 20; i++) { availableTags[i] = ''; }

            //            $('#hiSearchFastKey').val(_Data);

            //            var varObjects = eval("(" + _Data + ")"); //转换为json对象
            //            //var j = 0;
            //            for (var i = 0; i < varObjects.length; i++) {

            //                if (varObjects[i].LiveType == '3') {
            //                    availableTags[i] = i + '.　' + '\t' + '\t' + varObjects[i].CustName;
            //                }
            //                else {
            //                    availableTags[i] = i + '.　' + '\t' + varObjects[i].RoomSign + "┃" + varObjects[i].RoomName + "┃" + '\t' + varObjects[i].CustName;
            //                }
            //            }
            //        },
            //        function _completeCallBack() {

            //        },
            //        function errorCallback() {
            //        });
            //};

            $('#ParkName').dblclick(function (e) {
                var conent = "../DialogNew/ParkingHandDlg.aspx";
                HDialog.Open('650', '430', conent, '车位选择', false, function callback(_Data) {
                    var varObjects = JSON.parse(_Data);

                    frmForm.HandID.value = varObjects.HandID;
                    frmForm.ParkName.value = varObjects.ParkName;
                    if (varObjects.CarSign != '') {
                        frmForm.ParkName.value = frmForm.ParkName.value + '(' + varObjects.CarSign + ')';
                    }
                    frmForm.hiParkName.value = varObjects.ParkName;
                    frmForm.CustID.value = varObjects.NCustID;
                    frmForm.CustName.value = varObjects.CustName;
                    frmForm.hiCustName.value = varObjects.CustName;

                    // alert(_Data);
                    //SelRoomID
                    //$("#SelRoomID").val(varObjects.RoomID);

                    $('#RoomID').val(varObjects.RoomID);


                    $("#BtnSearch").click();

                });

            })

            $('#BtnSearch').click(function (e) {

                $.tool.pageLoadInfo("正在查询,请稍侯...  ");

            })

            $('#CustName').dblclick(function (e) {
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open('1336', '600', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').val(data.CustName);
                    $("#CustID").val(data.CustID);
                    $("#BtnSearch").click();
                });
            })

            $('#InvoiceUnit').dblclick(function (e) {
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#InvoiceUnit').val(data.CustName);
                });
            })

            $('#RoomSign').dblclick(function (e) {
                var conent = "../DialogNew/RoomDlg.aspx";
                HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').val(data.RoomSign);
                    $('#CustName').val("");
                    $("#BtnSearch").click();
                });
            })

            //设置交款类型
            function SetRenderType() {
                var strRenderType = getObject("RenderType").value;

                //自付
                if (strRenderType == "1") {
                    getObject("btnSelRenderCust").disabled = true;

                    if (getObject("FeesIDs").value == "") {
                        getObject("RenderCustName").value = "";
                        getObject("hiRenderCustName").value = "";
                    }
                    else {
                        getObject("RenderCustName").value = getObject("hiCustName").value;
                        getObject("hiRenderCustName").value = getObject("hiCustName").value;
                    }
                }
                else {
                    getObject("btnSelRenderCust").disabled = false;
                    getObject("RenderCustName").value = "";
                    getObject("hiRenderCustName").value = "";
                }
            }

            //刷新收据数据
            function SendReceive() {
                var strFeesIDs = getObject("FeesIDs").value;
                var strLateAmounts = getObject("LateAmounts").value;
                var strCurChargeDate = getObject("CurChargeDate").value;
                //预交冲抵
                var strIsOffset = "1";
                if (getObject("CkIsOffset").checked == true) {
                    strIsOffset = "1";
                }
                else {
                    strIsOffset = "0";
                }
                //零头取整
                var strIsSurplus = "1";
                if (getObject("CkIsSurplus").checked == true) {
                    strIsSurplus = "1";
                }
                else {
                    strIsSurplus = "0";
                }

                //合并打印
                var strIsComb = "1";
                if (getObject("CkIsComb").checked == true) {
                    strIsComb = "1";
                }
                else {
                    strIsComb = "0";
                }

                var strRenderType = getObject("RenderType").value;
                var strBillTypeID = "";

                if (getObject("IsInvoice").checked == false) {
                    strBillTypeID = getObject("BillType").value;
                }
                else {
                    strBillTypeID = getObject("InvoiceType").value;
                }

                var strPerSurplusAmount = getObject("PerSurplusAmount").value;
                var strIsEditPerSurplus = getObject("IsEditPerSurplus").value;

                var TotalPrecAmount = getObject("TotalPrecAmount").value;

                //bug 25470 浏览器的渲染(UI)线程和js线程是互斥的，在执行js耗时操作时，页面渲染会被阻塞掉;
                var ReceiveFeesThdSelParameter = "FeesIDs=" + strFeesIDs + "&IsOffset=" + strIsOffset + "&IsSurplus=" + strIsSurplus + "&IsComb=" + strIsComb + "&RenderType=" + strRenderType + "&BillTypeID=" + strBillTypeID + "&PerSurplusAmount=" + strPerSurplusAmount + "&IsEditPerSurplus=" + strIsEditPerSurplus + "&TotalPrecAmount=" + TotalPrecAmount + "&LateAmounts=" + strLateAmounts + "&CurChargeDate=" + strCurChargeDate + "&Rdm=" + Math.random();
                $.when(ReceiveFeesThdSel(ReceiveFeesThdSelParameter)).done(function (_Data) {
                    callbackReceiveFees(_Data);
                });
            }

            function ReceiveFeesThdSel(ReceiveFeesThdSelParameter) {
                var defer = $.Deferred();
                $.tool.DataPostInfoAsync('ReceFees', 'ReceiveFeesThdSel', ReceiveFeesThdSelParameter,
                    function Init() {
                    },
                    function callback(_Data) {
                        //callbackReceiveFees(_Data);
                        defer.resolve(_Data)
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                    }, '正在计算,请稍侯', true);
                return defer.promise();
            }



            function callbackReceiveFees(_Data) {
                var varReturn = _Data;
                if (varReturn != "") {
                    var Search = eval('(' + varReturn + ')');
                    getObject("SelHit").value = Search.SelData.Hit;
                    var SearchData = Search.SelData.Data;
                    for (var i = 0; i < SearchData.length; i++) {
                        //如果是票据类别
                        if (SearchData[i].Name == "BillType") {
                            //如果没有点击开据发票
                            if (getObject("IsInvoice").checked == false) {
                                var length = $("#BillType").find("option[value='" + SearchData[i].Val + "']").size();
                                //如果找到了相应的值并且不为空，则直接绑定

                                if (length == 1 && SearchData[i].Val != '') {
                                    getObject(SearchData[i].Name).value = SearchData[i].Val;
                                }
                                else {
                                    //如果是第一项为空，则绑定第二项，否则绑定第一项
                                    var BillTypeValue = $("#BillType option:first").val();
                                    if (BillTypeValue == "") {
                                        $("#BillType").prop('selectedIndex', 1);
                                    }
                                    else {
                                        $("#BillType").prop('selectedIndex', 0);
                                    }
                                }
                            }
                            GetFirstBillsSign();
                        }

                        if (SearchData[i].Name != "BillType" && SearchData[i].Name != "UseRepID"
                            && SearchData[i].Name != "InvoiceType" && SearchData[i].Name != "InvoiceBill"
                            && SearchData[i].Name != "hiInvoiceBill" && SearchData[i].Name != "hiInvoiceBills") {

                            getObject(SearchData[i].Name).value = SearchData[i].Val;
                        }

                        //实付默认等于本次合计,直接赋值
                        $("#TotalPayAmount").val($("#TotalSumAmount").val());
                    }
                    //定额发票
                    if (getObject("IsFixed").value == "1") {
                        getObject("InvoiceAmount").value = getObject("FixedAmount").value;
                    }
                    else {
                        getObject("InvoiceAmount").value = getObject("TotalSumAmount").value;
                    }
                    CheckLimitCount();
                    CheckIsProperty();
                }

                //如果费用列表或者预存列表都为空
                var PreCostDataRowsLength = 0;

                try {
                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                    if (PreCostDataRows != undefined) PreCostDataRowsLength = PreCostDataRows.length;
                }
                catch (e) {
                    PreCostDataRowsLength = 0;
                }
                if (getObject("FeesIDs").value == "" && PreCostDataRowsLength == 0) {
                    getObject("InvoiceUnit").value = "";
                    getObject("btnReceive").disabled = true;
                }
                else {
                    getObject("InvoiceUnit").value = getObject("hiCustName").value;
                    getObject("btnReceive").disabled = false;
                }

                if (getObject("SelHit").value != "") {
                    alert(getObject("SelHit").value);
                    getObject("btnReceive").disabled = true;
                }

                TotalPayAmount_onblur();
            }

            //检查是否超过了最大收款笔数限制
            function CheckLimitCount() {
                var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');
                //如果是批量收费，则不用检查提交的笔数
                if (IsCklsBatchReceFees == true) {
                    return true;
                }
                var tmpLimitCount = 80;//parseInt(getObject("LimitCount").value, 10);
                var tmpFeesLimitCount = parseInt(getObject("FeesLimitCount").value, 10);
                if (tmpFeesLimitCount > tmpLimitCount) {
                    HDialog.Info("本次选取的费用笔数(" + tmpFeesLimitCount + ")超过限定笔数(" + tmpLimitCount + "笔,请勾选批量收款选项)！");
                    return false;
                }
                var tmpPrintCount = parseInt(getObject("PrintCount").value, 10);
                var strUseRepIDs = getObject("UseRepID").value;
                var tmpLimitPrintCount = 80;
                if (strUseRepIDs != "") {
                    var varObjects = strUseRepIDs.split("\t");
                    tmpLimitPrintCount = parseInt(varObjects[1], 10);
                    if (tmpLimitPrintCount <= 0) {
                        tmpLimitPrintCount = 10;
                    }
                }
                if (tmpPrintCount > tmpLimitPrintCount) {
                    HDialog.Info("本次打印行数超过限定行数(" + tmpLimitPrintCount + "行)！");
                    return false;
                }
                return true;
            }

            //选择是否有垫付的款项
            function CheckIsProperty() {
                var tmpHadIsProperty = getObject("HadIsProperty").value;
                var strRenderType = getObject("RenderType").value;

                if ((tmpHadIsProperty == "1") && (strRenderType != "1")) {
                    HDialog.Info("本次选取的费用有垫付的，只能选自付方式，请重新选择！");
                    return false;
                }
                return true;
            }



            //预交冲抵CheckBox单击
            $("#CkIsOffset").click(function () {
                frmForm.ChargeModes.value = "";
                frmForm.hiChargeModes.value = "";
                frmForm.ChargeModeAmount.value = "";
                frmForm.ChargeMode.value = "";
                //刷新收据数据
                SendReceive();
            });

            //零头取整CheckBox单击
            $("#CkIsSurplus").click(function () {
                var varChargeMode = frmForm.ChargeMode[frmForm.ChargeMode.selectedIndex].innerText;
                if (getObject("CkIsSurplus").checked == true) {
                    frmForm.PerSurplusAmount.disabled = false;
                    if (varChargeMode == "多种收款方式") {
                        frmForm.ChargeModes.value = "";
                        frmForm.hiChargeModes.value = "";
                        frmForm.ChargeModeAmount.value = "";
                        frmForm.ChargeMode.value = "";
                    }
                }
                else {
                    frmForm.PerSurplusAmount.disabled = true;
                }
                //刷新收据数据
                SendReceive();
            });

            function GetHiddenRows() {
                var _n = 0;
                if (getObject("IsInvoice").checked == true) _n = _n + 1;
                var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                if (varChargeMode == "支票") _n = _n + 1;
                return 6 + _n;
            }
            //开具发票CheckBox单击
            $("#IsInvoice").click(function () {
                RuleEvent.InvoiceEvent();
                //刷新收据数据
                SendReceive();
                if ($("#IsEInvoice").is(":checked")) {
                    $("#IsEInvoice").prop("checked", false);
                }
            });
            //开具电子发票checkbox单机
            $("#IsEInvoice").click(function () {
                if ($("#IsInvoice").is(":checked")) {
                    $("#IsInvoice").click();
                    $("#IsEInvoice").prop("checked", true);
                }
            });

            //合并打印CheckBox单击
            $("#CkIsComb").click(function () {

                //刷新收据数据
                SendReceive();
            });

            //交款类型变更
            $("#RenderType").change(function () {
                var strRenderType = getObject("RenderType").value;
                if (strRenderType == "1") {
                    //自付
                    getObject("CkIsOffset").checked = true;
                    getObject("CkIsOffset").disabled = false;
                    getObject("CkIsSurplus").checked = true;
                }
                else {
                    //垫付,代付
                    getObject("CkIsOffset").checked = false;
                    getObject("CkIsOffset").disabled = true;
                    getObject("CkIsSurplus").checked = false;
                }
                SetRenderType();
                //刷新收据数据
                SendReceive();
            });

            //发票类别变更
            $("#InvoiceType").change(function () {

                RuleEvent.InvoiceTypeEvent();

            });

            //收据类别变更,获取票据号
            $("#BillType").change(function () {
                GetFirstBillsSign();
            });

            function GetFirstBillsSign() {
                var strBillType = getObject("BillType").value;
                var strBillsSign = getObject("BillsSign").value;

                $.tool.DataPostInfo('ReceFees', 'GetFirstBillsSign', "InvoiceType=" + strBillType + "&BillsSign=" + strBillsSign + "&Rdm=" + Math.random(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varReturn = _Data;
                        if (varReturn != "") {
                            var Search = eval('(' + varReturn + ')');
                            var SearchData = Search.SelData.Data;
                            getObject("BillsSign").value = "";
                            getObject("hiBillsSign").value = "";

                            for (var i = 0; i < SearchData.length; i++) {
                                getObject(SearchData[i].Name).value = SearchData[i].Val;
                            }

                            BillUseUpdateSel();
                        }
                        else {
                            getObject("BillsSign").value = "";
                            getObject("hiBillsSign").value = "";
                        }
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                    }, '正在获取票据号,请稍侯');


            }

            function BillUseUpdateSel() {
                var strBillType = getObject("BillType").value;
                var strBillsSign = getObject("BillsSign").value;

                $.tool.DataPostInfo('ReceFees', 'BillUseUpdateSel', "InvoiceType=" + strBillType + "&BillsSign=" + strBillsSign + "&Rdm=" + Math.random(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                    }, '正在更新票据号使用');
            }

            //交款单位单击事件
            function btnSelRenderCust_OnClick() {
                //老界面有家庭成员选择,新版把家庭成员去掉了

                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    frmForm.RenderCustID.value = data.CustID;
                    frmForm.RenderCustName.value = data.CustName;
                    frmForm.hiRenderCustName.value = data.CustName;
                });

            }
            //零头结转onblur事件
            function PerSurplusAmount_Onblur() {
                var iSurAmount = parseFloat(getObject("PerSurplusAmount").value);
                var ihiSurAmount = parseFloat(getObject("hiPerSurplusAmount").value);
                if (iSurAmount > 1 || iSurAmount < -1) {
                    HDialog.Info("零头结转不能超过1元!");
                    return false;
                }
                if (iSurAmount == ihiSurAmount) {
                    //alert("零头结转应小于1，大于-1。");
                    getObject("IsEditPerSurplus").value = "0";
                    //刷新收据数据
                    SendReceive();
                    //return false;
                }
                else {
                    //是否修改零头
                    getObject("IsEditPerSurplus").value = "1";
                    //刷新收据数据
                    SendReceive();
                }
                return true;
            }
            //支票抬头选择
            function btnSelRemitterUnit_OnClick() {

                var strCustID = getObject("CustID").value;
                var strRoomID = getObject("RoomID").value;
                var strSourceType = 1;

                if ((strCustID == "0") || (strCustID == "")) {
                    return false;
                }

                var w = '650';
                var h = '430';
                var conent = "../dialogNew/RemitterUnitDlg.aspx?CustID=" + strCustID + "&RoomID=" + strRoomID + "&SourceType=" + strSourceType + "&Rdm=" + Math.random();
                HDialog.Open(w, h, conent, '支票抬头选择', true, function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = JSON.parse(_Data);
                        frmForm.RemitterUnit.value = varObjects.RemitterUnit;
                        frmForm.hiRemitterUnit.value = varObjects.RemitterUnit;
                    }
                });

            }

            //输入实收计算零头
            function TotalPayAmount_onblur() {
                var iTotalSumAmount = 0;
                var varTotalSumAmount = getObject("TotalSumAmount").value

                if (varTotalSumAmount != "") {
                    iTotalSumAmount = parseFloat(varTotalSumAmount);
                }

                var iTotalPayAmount = 0;
                var varTotalPayAmount = getObject("TotalPayAmount").value;
                if (varTotalPayAmount != "") {
                    iTotalPayAmount = parseFloat(varTotalPayAmount);
                }
                var iTotalSurplusAmount = iTotalPayAmount - iTotalSumAmount;
                $("#ShowSurplus").html(changeTwoDecimal(Math.round(iTotalSurplusAmount * 100) / 100));

                $("#ShowTotalAmount").html(changeTwoDecimal(iTotalSumAmount));
                $("#ShowPayTotalAmount").html(changeTwoDecimal(iTotalPayAmount));
                if ($("#ShowPayTotalAmount").html() == "0") $("#ShowPayTotalAmount").html("0.00");


            }

            function btnSelBill_OnClick() {

                var strBillTypeID = getObject("BillType").value;
                if (strBillTypeID == '系统票号') return;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    HDialog.Info("请选择收据类别,此项不能为空!");
                    frmForm.BillType.focus();
                    return false;
                }

                var w = '650';
                var h = '430';
                var conent = "../DialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();
                HDialog.Open(w, h, conent, '收据号选择', true, function callback(_Data) {
                    if (_Data != '') {
                        frmForm.BillsSign.value = _Data;
                        frmForm.hiBillsSign.value = _Data;

                        BillUseUpdateSel();
                    }
                });


            }

            //选择发票
            function btnSelInvoiceBill_OnClick() {
                var strBillTypeID = getObject("InvoiceType").value;
                var strIsFixed = getObject("IsFixed").value;
                var strBillsSigns;
                var iFixedAmount = 0;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    alert("请选择发票类别,此项不能为空!");
                    frmForm.InvoiceType.focus();
                    return false;
                }

                var w = '720';
                var h = '450';

                var varReturn;
                //定额发票
                if (strIsFixed == "1") {

                    HDialog.Open(w, h, "../DialogNew/MultiBillsSignMoreDlg.aspx?BillTypeID=" + strBillTypeID + "&BillsSigns=" + strBillsSigns + "&Rdm=" + Math.random(), '定额发票号选择', true, function callback(_Data) {
                        if (_Data != '') {
                            var varObjects = _Data.split("\t");
                            frmForm.InvoiceBill.value = varObjects[0];
                            frmForm.hiInvoiceBills.value = varObjects[1];
                            frmForm.InvoiceAmount.value = varObjects[2];
                            frmForm.ReceMemo.value = varObjects[3];

                            alert(varObjects[3]);
                            return true;
                        }
                        else {
                            frmForm.InvoiceBill.value = "";
                            frmForm.hiInvoiceBills.value = "";
                            frmForm.InvoiceAmount.value = "";
                            frmForm.ReceMemo.value = "";
                            return true;
                        }
                    });

                }
                else {

                    HDialog.Open(w, h, "../DialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), '发票号选择', true, function callback(_Data) {
                        if (_Data != '') {
                            alert(_Data);
                            frmForm.InvoiceBill.value = _Data;
                            frmForm.hiInvoiceBill.value = _Data;
                            //frmForm.InvoiceAmount.value = "";
                            frmForm.ReceMemo.value = _Data;
                            return true;
                        }
                        else {
                            frmForm.InvoiceBill.value = "";
                            frmForm.hiInvoiceBills.value = "";
                            //frmForm.InvoiceAmount.value = "";
                            frmForm.ReceMemo.value = "";
                            return true;
                        }
                    });

                }
                return false;
            }

            //收款确定
            function ReceFeesCheck() {

                if (CheckLimitCount() == false) {
                    return false;
                }

                if (CheckIsProperty() == false) {
                    return false;
                }

                if (CheckIsCostType3() == false) {
                    return false;
                }

                //if (PerSurplusAmount_Onblur() == false) {
                //    return false;
                //}

                var iTotalAmount = 0;
                var iInvoiceAmount = 0;

                if (getObject("TotalSumAmount").value != "") {
                    iTotalAmount = parseFloat(getObject("TotalSumAmount").value).toFixed(2);
                }

                //有费用实收时，选票据
                if (parseFloat(iTotalAmount) > 0) {
                    if (getObject("IsInvoice").checked == false) {
                        if (frmForm.BillType.value == "") {
                            HDialog.Info("请选择收据类别!");
                            frmForm.BillType.focus();
                            return false;
                        }
                        if (frmForm.BillType.value != "系统票号") {
                            if (frmForm.BillsSign.value == "") {
                                HDialog.Info("请选择收据号!");
                                frmForm.btnSelBill.focus();
                                return false;
                            }
                        }
                    }

                    if (getObject("IsInvoice").checked == true) {
                        if (frmForm.InvoiceType.value == "") {
                            HDialog.Info("请选择发票类别!");
                            frmForm.InvoiceType.focus();
                            return false;
                        }
                        if (getObject("InvoiceBill").value == "") {
                            HDialog.Info("请选择发票号!");
                            frmForm.btnSelInvoiceBill.focus();
                            return false;

                        }
                    }

                    if (frmForm.ChargeMode.value == "") {
                        if (frmForm.hiChargeModes.value == "") {
                            HDialog.Info("请选择收款方式,此项不能为空!");
                            frmForm.ChargeMode.focus();
                            return false;
                        }
                    }

                    var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                    //收款方式的文本
                    $("#ChargeModeName").val(varChargeMode);

                    var varhiChargeModes = frmForm.hiChargeModes.value;

                    if ((frmForm.RemitterUnit.value != "") || (frmForm.BankAccount.value != "")
                        || (frmForm.BankName.value != "") || (frmForm.ChequeBill.value != "")) {
                        if (varChargeMode == "现金") {
                            HDialog.Info("请选择其它收款方式!");
                            frmForm.ChargeMode.focus();
                            return false;
                        }
                    }
                }

                //定额发票
                var strIsFixed = getObject("IsFixed").value;

                //如果是定额发票
                if (strIsFixed == "1") {
                    if (getObject("TotalSumAmount").value != "") {
                        iTotalAmount = parseFloat(getObject("TotalSumAmount").value).toFixed(2);
                    }
                    if (getObject("InvoiceAmount").value != "") {
                        iInvoiceAmount = parseFloat(getObject("InvoiceAmount").value).toFixed(2);
                    }

                    if (parseFloat(iTotalAmount) > 0) {
                        //if (iTotalAmount != iInvoiceAmount) {
                        //    HDialog.Info("定额发票金额与收款金额不相等!");
                        //    frmForm.InvoiceType.value = "";
                        //    frmForm.btnSelInvoiceBill.focus();
                        //    return false;
                        //}

                        //针对定额限制票据修改
                        if (parseFloat(iInvoiceAmount) < parseFloat(iTotalAmount)) {
                            HDialog.Info("定额发票金额(" + iInvoiceAmount.toString() + ")与收款金额(" + iTotalAmount.toString() + ")不符!");
                            frmForm.InvoiceType.value = "";
                            frmForm.btnSelInvoiceBill.focus();
                            return false;
                        }
                    }
                }

                if (varChargeMode == "凤凰会APP调账") {
                    if (frmForm.ReceMemo.value == "") {
                        HDialog.Info("补录凤凰会APP调账，备注必须填写通联交易号。");
                        frmForm.ReceMemo.focus();
                        return false;
                    }
                }

                var iChargeModeAmount = 0;

                if ((varChargeMode != "") && (varhiChargeModes != "")) {
                    if (getObject("TotalSumAmount").value != "") {
                        iTotalAmount = parseFloat(getObject("TotalSumAmount").value).toFixed(2);
                    }

                    if (getObject("ChargeModeAmount").value != "") {
                        iChargeModeAmount = parseFloat(getObject("ChargeModeAmount").value).toFixed(2);
                    }

                    if (parseFloat(iTotalAmount) > 0) {
                        if (parseFloat(iTotalAmount) != parseFloat(iChargeModeAmount)) {
                            HDialog.Info("收款方式金额(" + iChargeModeAmount.toString() + ")与收款金额(" + iTotalAmount.toString() + ")不相等!");
                            return false;
                        }
                    }
                }

                var strRenderType = getObject("RenderType").value;
                var strRenderCustID = getObject("RenderCustID").value;
                var strCustID = getObject("CustID").value;

                //代收
                if (strRenderType == "3") {
                    if (strRenderCustID == "") {
                        HDialog.Info("请选择代付客户!");
                        frmForm.btnSelRenderCust.focus();
                        return false;
                    }

                    if (strCustID == strRenderCustID) {
                        HDialog.Info("代付请选择不同的客户!");
                        frmForm.btnSelRenderCust.focus();
                        return false;
                    }

                }

                //垫付
                if (strRenderType == "2") {
                    if (strRenderCustID == "") {
                        HDialog.Info("请选择垫付客户!");
                        frmForm.btnSelRenderCust.focus();
                        return false;
                    }

                    if (strCustID == strRenderCustID) {
                        HDialog.Info("垫付请选择不同的客户!");
                        frmForm.btnSelRenderCust.focus();
                        return false;
                    }

                }
                return true;
            }

            //暂收类费用选取,不能开发票判断
            function CheckIsCostType3() {
                var tmpIsCostType3 = getObject("IsCostType3").value;
                if ((tmpIsCostType3 == "1") && (getObject("IsInvoice").checked == true)) {
                    alert("本次选取的费用有暂收类费用，不能开发票！");
                    return false;
                }
                return true;
            }



            //定时器扫码支付结果
            var SearchQueryOrder;

            var iCount = 0;

            //定时器扫码支付结果
            function QueryOrder() {

                $.tool.pageLoadInfo("　");
                $.tool.DataPostNoLoading('ReceFees', "QueryOrder", $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $.tool.pageUnLoading();
                        if (_Data != '') {
                            var d = _Data;
                            if (d != '') {
                                clearInterval(SearchQueryOrder);

                                $('#BusinessTradeNo').val(d);
                                //是否批量收费
                                var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');

                                var ReceFeesClass = "ReceFees";
                                if (IsCklsBatchReceFees == true) {
                                    ReceFeesClass = "ReceFeesBatch";
                                }

                                var PCostRowsLength = 0;
                                try {
                                    var PCostRows = $("#PreCostTableContainer").datagrid("getRows");
                                    if (PCostRows != undefined) PCostRowsLength = PCostRows.length;
                                }
                                catch (e) {
                                    PCostRowsLength = 0;
                                }
                                if (PCostRowsLength == 0) IsLoadPreCostTableContainer = false;
                                if (IsLoadPreCostTableContainer == true) {
                                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                                    $("#PreCostData").val(JSON.stringify(PreCostDataRows));
                                }
                                else {
                                    $("#PreCostData").val("[]");
                                }

                                //是否有单项预存
                                var IsPreCost = false;
                                if (IsLoadPreCostTableContainer == true) {
                                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                                    if (PreCostDataRows.length > 0) IsPreCost = true;
                                }
                                //是否开据发票
                                var IsInvoick = getObject("IsInvoice").checked;

                                //是否有应收款
                                var IsReceFees = false;
                                if ($("#FeesIDs").val() != "") IsReceFees = true;

                                // var Ret = ReceFeesCheck();

                                $.tool.DataPostInfo('ReceFees', ReceFeesClass, $('#frmForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data != '') {

                                            var Obj = JSON.parse(_Data);
                                            ClostLayer();
                                            var EReceID = "";
                                            //提示信息汇总
                                            var precReceId = 0;
                                            var receId = 0;
                                            var ReturnMessage = "";

                                            if (IsReceFees == true && IsPreCost == true) {
                                                ReturnMessage = Obj[0].Result + Obj[1].Result + Obj[2].Result;
                                                HDialog.Info(ReturnMessage);

                                                if (IsInvoick == true) {
                                                    //打印实收及预存
                                                    PrintReceFees(Obj[0]);
                                                    PrintPreCost(Obj[1]);
                                                }
                                                else {
                                                    //打印实收
                                                    if (IsReceFees == true) PrintReceFees(Obj[0]);
                                                    //打印预存
                                                    if (IsPreCost == true) PrintPreCost(Obj[1]);
                                                }
                                                EReceID = Obj[0].ReceID;
                                            }
                                            else {
                                                ReturnMessage = Obj.Result;
                                                HDialog.Info(ReturnMessage);
                                                //打印实收
                                                if (IsReceFees == true) PrintReceFees(Obj);
                                                //打印预存
                                                if (IsPreCost == true) PrintPreCost(Obj);
                                                EReceID = Obj.ReceID;
                                            }

                                            if ($("#IsEInvoice").is(":checked")) {
                                                //if ($("#RoomID").val() != "") {
                                                $.tool.DataPost("EInvoiceManage", "GetReceFees", "ReceID=" + EReceID, function Init() {
                                                },
                                                    function callback(_Data) {
                                                        var ob = JSON.parse(_Data);

                                                        var FeesMsgs = new Array();
                                                        for (var i = 0; i < ob.length; i++) {
                                                            FeesMsgs.push(ob[i].RFID + "|" + ob[i].RoomID + "|" + ob[i].FType);
                                                        }

                                                        sessionStorage.setItem("BillFeesMsg", FeesMsgs.join(","));
                                                        var w = 900;
                                                        var h = $(window).height();

                                                        HDialog.OpenWin(w, h, "../ChargesNew/EInvoiceManage.aspx?CustName=" + $("#CustName").val() + "&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val(), "开票确认", true, function callback(_Data) {
                                                            if (_Data != '') {

                                                            }
                                                        });
                                                        //window.location.href = "ReceFeesBrowse.aspx?RoomID=" + $("#RoomID").val();

                                                    },
                                                    function completeCallback() {
                                                    },
                                                    function errorCallback() {
                                                    });
                                                //}
                                                // window.location.href = "ReceFeesBrowse.aspx?RoomID=" + $("#RoomID").val();

                                            }
                                            else {

                                                window.location.href = "ReceFeesBrowse.aspx?RoomID=" + $("#RoomID").val();
                                            }

                                        }
                                    },
                                    function _completeCallBack() {
                                    },
                                    function errorCallback() {
                                    }, '正在保存数据,请稍侯');

                            }
                        }
                        else {
                            iCount++;
                        }



                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
                if (iCount > 60) {
                    clearInterval(SearchQueryOrder);
                    ClostLayer();

                    HDialog.MessageBoxThird("获取订单超时,请确认支付状态，支付成功手动确认收款", "确认", '取消', "关闭", function () {
                        $('#btnReceive').show();
                        $('#btnPayment').hide();
                        getObject("btnReceive").disabled = false;
                    }, function () {


                    }, function () { });




                    //HDialog.Prompt('获取订单超时,请确认支付状态，若支付成功是否需要手动处理!', function () {

                    //});


                    $('#CustPaymentID').val('');
                }

            }


            function ClostLayer() {

                top.layer.closeAll();
                $.tool.pageUnLoading();
            }
            $('#btnPayment').click(function (e) {

                CheckAuthority('1020', function callback(_Data) {
                    if (_Data != 'false') {
                        HDialog.Prompt("是否确认收款?", function a() {
                            if ($('#CustPaymentID').val() == '') {
                                HDialog.Info("请扫码!");
                                $('#CustPaymentID').focus();
                            }
                            else {
                                if (parseFloat($('#TotalPayAmount').val()) > 10000.00) {
                                    HDialog.Info("单次扫码金额不能超过10000!");
                                }
                                var Ret = ReceFeesCheck();


                                if (Ret == true) {
                                    $.tool.DataPostInfo('ReceFees', "PayMentFees", $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            if (_Data != '') {
                                                var d = _Data.split('|');
                                                if (d[0] == 'true') {
                                                    $('#CustPaymentKey').val(d[1]);

                                                    $.tool.pageLoadInfo("　");
                                                    top.layer.load(1, { shade: [0.8, '#cccccc'], time: 0 });
                                                    top.layer.msg('获取订单中，请稍后', {
                                                        icon: 1,
                                                        time: 0 //2秒关闭（如果不配置，默认是3秒）
                                                    }, function () {
                                                        //关闭后执行
                                                    });
                                                    SearchQueryOrder = setInterval(QueryOrder, 1000);

                                                }
                                                else {
                                                    HDialog.Info(d[1]);
                                                }

                                            }
                                            else {
                                                HDialog.Info("扫码支付失败!");
                                            }

                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {

                                        });
                                }
                            }

                        });
                    }
                    else {
                        alert("你没有收款权限，请联系管理员开通！");
                    }
                });

            });

            $("#btnReceive").click(function (e) {
                CheckAuthority('1020', function callback(_Data) {
                    if (_Data != 'false') {
                        //检查收取时间
                        if (CheckCurCharge() == false) {
                            return false;
                        }
                        HDialog.Prompt("是否确认收款?", function a() {

                            //是否批量收费
                            var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');

                            var ReceFeesClass = "ReceFees";
                            if (IsCklsBatchReceFees == true) {
                                ReceFeesClass = "ReceFeesBatch";
                            }
                            if ($("#ChargeMode").val() == "undefined" || $("#ChargeMode").val() == undefined || $("#ChargeMode").val() == "") {
                                HDialog.Info("请选择收款方式!");
                            }
                            else {
                                var PCostRowsLength = 0;
                                try {
                                    var PCostRows = $("#PreCostTableContainer").datagrid("getRows");
                                    if (PCostRows != undefined) PCostRowsLength = PCostRows.length;
                                }
                                catch (e) {
                                    PCostRowsLength = 0;
                                }
                                if (PCostRowsLength == 0) IsLoadPreCostTableContainer = false;
                                if (IsLoadPreCostTableContainer == true) {
                                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                                    $("#PreCostData").val(JSON.stringify(PreCostDataRows));
                                }
                                else {
                                    $("#PreCostData").val("[]");
                                }

                                //是否有单项预存
                                var IsPreCost = false;
                                if (IsLoadPreCostTableContainer == true) {
                                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                                    if (PreCostDataRows.length > 0) IsPreCost = true;
                                }
                                //是否开据发票
                                var IsInvoick = getObject("IsInvoice").checked;

                                var strBillsMemo = $("#BillsMemo").val();
                                if (IsInvoick == false && strBillsMemo != '') {
                                    $("#ReceMemo").val('');
                                }
                                var strcorpid = $("#hidCorpId").val();
                                //当选择网上开票时验证发票限额
                                if ($("#CkIsInvoice").is(':checked') && (strcorpid == "1528")) {
                                    var InfoKind = $("#InfoKind").find("option:selected").val();
                                    if (InfoKind == "") {
                                        HDialog.Info("请选择发票类型!");
                                        return;
                                    }

                                    var invoiceQuota = 0;
                                    var flag = false;
                                    var rows = $('#TableContainer').datagrid('getChecked');
                                    switch (InfoKind) {
                                        case "1":
                                            invoiceQuota = parseFloat($("#EInvoiceAmount").val());
                                            break;
                                        case "2":
                                            invoiceQuota = parseFloat($("#SpecialTicketAmount").val());
                                            break;
                                        case "3":
                                            invoiceQuota = parseFloat($("#GeneralTicketAmount").val());
                                            break;
                                    }

                                    for (var i = 0; i < rows.length; i++) {
                                        if (parseFloat(rows[i].DebtsAmount) > invoiceQuota) {
                                            flag = true;
                                            break;
                                        }
                                    }
                                    if (flag == true) {
                                        HDialog.Info("所选费用存在单笔超出发票限额" + invoiceQuota + "元，请做费用拆分后再收取!");
                                        return;
                                    }
                                }

                                //是否有应收款
                                var IsReceFees = false;
                                if ($("#FeesIDs").val() != "") IsReceFees = true;

                                var Ret = ReceFeesCheck();
                                //检查规则，如果检查通过,则允许提交

                                if (Ret == true) {
                                    $.tool.DataPostInfo('ReceFees', ReceFeesClass, $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {

                                            if (_Data != '') {


                                                var Obj = JSON.parse(_Data);
                                                console.log(Obj);
                                                var EReceID = "";
                                                //提示信息汇总
                                                var precReceId = 0;
                                                var receId = 0;
                                                var ReturnMessage = "";
                                                var msg = "是否需要打印票据";
                                                if (getObject("CkIsOffset").checked == true && ((IsReceFees == true && IsPreCost == true && Obj[0].ReceID == 0) || (IsReceFees == true && IsPreCost == false && Obj.ReceID == 0))) {
                                                    HDialog.Info("已冲抵！");
                                                }
                                                else {
                                                    if (window.confirm(msg) == true) {
                                                        if (IsReceFees == true && IsPreCost == true) {
                                                            ReturnMessage = Obj[0].Result + Obj[1].Result + Obj[2].Result;
                                                            HDialog.Info(ReturnMessage);

                                                            if (IsInvoick == true) {
                                                                //打印实收及预存
                                                                PrintReceFees(Obj[0]);
                                                                PrintPreCost(Obj[1]);
                                                            }
                                                            else {
                                                                //打印实收
                                                                if (IsReceFees == true) PrintReceFees(Obj[0]);
                                                                //打印预存
                                                                if (IsPreCost == true) PrintPreCost(Obj[1]);
                                                            }
                                                            EReceID = Obj[0].ReceID;
                                                        }
                                                        else {
                                                            ReturnMessage = Obj.Result;
                                                            HDialog.Info(ReturnMessage);
                                                            //打印实收
                                                            if (IsReceFees == true) PrintReceFees(Obj);
                                                            //打印预存
                                                            if (IsPreCost == true) PrintPreCost(Obj);
                                                            EReceID = Obj.ReceID;
                                                        }
                                                    }
                                                }

                                                //网上开票
                                                if (strcorpid == 1528 || IsInvoick == true) {
                                                    if (getObject("CkIsInvoice").checked == true) {
                                                        //10.0没有预收
                                                        //if (EReceID == 0 && precReceId == 0) {
                                                        //    HDialog.Info("预交冲抵费用无法开票！");
                                                        //    return;
                                                        //}
                                                        console.log(EReceID);
                                                        OnlineInvoice(EReceID);
                                                    }
                                                }

                                                if ($("#IsEInvoice").is(":checked")) {
                                                    //if ($("#RoomID").val() != "") {
                                                    $.tool.DataPost("EInvoiceManage", "GetReceFees", "ReceID=" + EReceID, function Init() {
                                                    },
                                                        function callback(_Data) {
                                                            var ob = JSON.parse(_Data);

                                                            var FeesMsgs = new Array();
                                                            for (var i = 0; i < ob.length; i++) {
                                                                FeesMsgs.push(ob[i].RFID + "|" + ob[i].RoomID + "|" + ob[i].FType);
                                                            }

                                                            sessionStorage.setItem("BillFeesMsg", FeesMsgs.join(","));
                                                            var w = 900;
                                                            var h = $(window).height();

                                                            HDialog.OpenWin(w, h, "../ChargesNew/EInvoiceManage.aspx?CustName=" + $("#CustName").val() + "&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val(), "开票确认", true, function callback(_Data) {
                                                                if (_Data != '') {

                                                                }
                                                                window.location.href = "ReceFeesBrowse.aspx?RoomID=" + $("#RoomID").val();
                                                            });
                                                        },
                                                        function completeCallback() {
                                                        },
                                                        function errorCallback() {
                                                        });

                                                }
                                                else {
                                                    var isCombShow = document.getElementById("CkIsCombShow").checked ? 1 : 0;
                                                    window.location.href = "ReceFeesBrowse.aspx?IsCombShow=" + isCombShow + "&RoomID=" + $("#RoomID").val();
                                                }
                                            }
                                        },
                                        function _completeCallBack() {
                                        },
                                        function errorCallback() {
                                        }, '正在保存数据,请稍侯');
                                }
                            }
                        });
                    }
                    else {
                        alert("你没有收款权限，请联系管理员开通！");
                    }
                });



            })

            //打印实收
            function PrintReceFees(Obj) {
                var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');
                var bl = $("#IsEInvoice").is(":checked");
                //如果不是批量收费
                if (IsCklsBatchReceFees == false && !bl) {
                    //实收预收金额大于0
                    var TSM = parseFloat($("#TotalPrecPadiAmount").val());
                    //是否预交冲抵
                    var IsSel = $("#CkIsOffset").is(':checked');
                    if (TSM > 0) {
                        //打印票据
                        var RepUrl = "../ChargesNew/ReceFeesReceipt.aspx";
                        RepUrl = RepUrl + "?ReceiptType=" + Obj.ReceiptType + "&ReceID=" + Obj.ReceID + "&UseRepID=" + Obj.UseRepID + "&CommID=" + Obj.CommID + "&IsComb=" + Obj.IsComb + "&re=7";
                        window.open(RepUrl);
                    }
                }
            }

            //打印预存
            function PrintPreCost(Obj) {
                var bl = $("#IsEInvoice").is(":checked");
                if (!bl) {
                    var RepUrl = "../ChargesNew/PreCostsReceiptBrowse.aspx";
                    RepUrl = RepUrl + "?ReceiptType=1&ReceID=" + Obj.ReceID + "&CommID=" + Obj.CommID;
                    window.open(RepUrl);
                }

            }

            function SplitFees(FeesID) {
                var conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + FeesID;
                HDialog.Open('800', '400', conent, '费用拆分', false, function callback(_Data) {
                    if (_Data != '') {
                        //拆分后重新查询数据
                        document.getElementById("BtnSearch").onclick();
                    }
                });
            }

            //操作指引打开应收输入页面
            function GetShowStepOpenDilog() {

                var w = 900;
                var h = 450;
                var conent = "../ChargesNew/FeesSporadicManage.aspx?CostGeneType=2&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val() + "&ShowType=1";
                HDialog.Open(w, h, conent, '应收输入', false, function callback(_Data) {
                    GetStepOneChild();
                });


            }
            function ChangeColor() {
                if (getObject("WarnOffset").className == "dstyle1")
                    getObject("WarnOffset").className = "dstyle2";
                else
                    getObject("WarnOffset").className = "dstyle1";
                setTimeout("ChangeColor()", 200);
            }
            //$("#WarnOffset").css("color","blue");
            ChangeColor();

            //操作指引打开预存收款标准模式页面
            function GetShowStepThreeOpenDilog() {

                var w = $(window).width();
                var h = $(window).height();
                if (w < 1024) {
                    w = 1024;
                }
                var conent = "../ChargesNew/PreCostsFrame.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val() + "&ShowType=1";
                HDialog.Open(w, h, conent, '预存收款-标准模式', false, function callback(_Data) {
                    GetStepOneChild();
                });


            }

            //预存收款-标准模式
            $("#PrestoreReceivables").click(function (e) {
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                if (w < 1024) {
                    w = 1024;
                }
                var conent = "../ChargesNew/PreCostsFrame.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '预存收款-标准模式', false, function callback(_Data) {
                    $('#BtnSearch').click();
                });
            });


            //操作指引打开预存收款快捷模式页面
            function GetShowStepFourOpenDilog() {

                var w = $(window).width();
                var h = $(window).height();
                if (w < 1024) {
                    w = 1024;
                }
                var conent = "../ChargesNew/SinglePreStore.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val() + "&ShowType=1";
                HDialog.Open(600, 500, conent, '预存收款-快捷模式', false, function callback(_Data) {
                    GetStepOneChild();
                });


            }
            //预存收款-快捷模式
            $("#FastPrestoreReceivables").click(function (e) {
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                if (w < 1024) {
                    w = 1024;
                }
                var conent = "../ChargesNew/SinglePreStore.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(600, 200, conent, '预存收款-快捷模式', false, function callback(_Data) {
                    var row = JSON.parse(_Data);
                    AddPreCostRow(row);
                });
            });


            //操作指引打开单户入账页面
            function GetShowStepTwoOpenDilog() {

                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesNew/FeesBrowse.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val() + '&ShowType=1';
                HDialog.Open(w, h, conent, '单户入账', false, function callback(_Data) {
                    GetStepOneChild();
                });


            }

            //单户入账
            $("#AccountedFor").click(function (e) {
                if ($("#IsCan_AccountedFor").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesNew/FeesBrowse.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '单户入账', false, function callback(_Data) {
                    $('#BtnSearch').click();
                });
            });

            //应收输入
            $("#Receivable").click(function (e) {
                if ($("#IsCan_Receivable").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = 900;
                var h = 450;
                var conent = "../ChargesNew/FeesSporadicManage.aspx?CostGeneType=2&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '应收输入', false, function callback(_Data) {
                    $('#BtnSearch').click();
                });
            });

            //客户资料
            $("#CustomerDetail").click(function (e) {
                if ($("#IsCan_CustomerDetail").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../HouseNew/CustomerDetail.aspx?Back=&CustID=" + $("#CustID").val();
                HDialog.Open(w, h, conent, '客户资料详细', false, function callback(_Data) {
                });
            });
            //报事受理
            $("#IncidentAccept").click(function (e) {
                if ($("#IsCan_IncidentAccept").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../IncidentNewJH/IncidentAcceptManage.aspx?IncidentID=0&OpType=insert&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '报事受理', false, function callback(_Data) {
                });
            });
            //
            $("#FastIncidentAccept").click(function (e) {
                //var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(600, h, '../IncidentNew/NewIncidentManage.aspx', '报事登记', false, function callback(_Data) {
                });
            });
            //车位办理
            $("#ParkingCar").click(function (e) {
                if ($("#IsCan_ParkingCar").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesProcessNew/ParkingCarBrowse.aspx";
                HDialog.Open(w, h, conent, '车位续费办理', false, function callback(_Data) {
                });


            });


            //操作指引打开单户抄表页面
            function GetShowStepFiveOpenDilog() {
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../HouseNew/NewMeteNewResultManage.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&ReceFees=111&ShowType=1";
                HDialog.Open(w, h, conent, '单户抄表', false, function callback(_Data) {

                    GetStepOneChild();

                });

            }

            //单户抄表
            $("#WriteMeter").click(function (e) {
                if ($("#IsCan_WriteMeter").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                if ($("#RoomSign").val() == "") {
                    HDialog.Info("请选择房号");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../HouseNew/NewMeteNewResultManage.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&ReceFees=111";
                HDialog.Open(w, h, conent, '单户抄表', false, function callback(_Data) {

                    $('#BtnSearch').click();

                });
            });

            //操作指引打开托收确认页面
            function GetShowStepLastOpenDilog() {
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesNew/FeesConSignFrame.aspx?ShowType=1&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '托收确认', false, function callback(_Data) {
                    GetStepOneChild();
                });

            }


            //托收确认
            $("#FeesConSign").click(function (e) {
                if ($("#IsCan_FeesConSign").val() == "0") {
                    HDialog.Info("无此权限");
                    return;
                }
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesNew/FeesConSignFrame.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '托收确认', false, function callback(_Data) {
                });
            });

            //收费历史
            $("#ReceiveFeesHis").click(function (e) {
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }

                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesProcessNew/ReceiveFeesHisFrame.aspx?CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&CustName=" + $("#CustName").val() + "&RoomSign=" + $("#RoomSign").val();
                HDialog.Open(w, h, conent, '收费历史', true, function callback(_Data) {
                });
            });


            //跳转网上开票页面
            $("#OnlineInvoice").click(function (e) {
                var w = $(window).width();
                var h = $(window).height();
                var corpId = $("#hidCorpId").val();
                if (corpId == "1753" || corpId == "1824") {
                    var conent = "../OnlineInvoice_SL/OnlineInvoiceBrowse.aspx?CustId=" + $("#CustID").val();
                    HDialog.Open(w, h, conent, '网上开票', false, function callback(_Data) { });
                } else {
                    Cache.SetData('OnlineCust', $("#CustID").val() + ',' + $("#CustName").val() + ',,,,')
                    var conent = "../ChargesNew/OnlineInvoice.aspx";
                    HDialog.Open(w, h, conent, '网上开票', false, function callback(_Data) { });
                }

            });

            var InfoKind = $("#InfoKind").find("option:selected").val();

            //网上开票
            function OnlineInvoice(precReceId) {
                var w = $(window).width();
                var h = $(window).height();
                var corpId = $("#hidCorpId").val();
                var commId = <%=LoginCommID %>;
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }

                if (corpId == 1753 || corpId == 1824) {
                    var recdIds = '';
                    $.ajax({
                        url: $("#ApiBaseUrl").val().replace("###", "GetRecdIds"),
                        type: 'POST',
                        data: JSON.stringify({ "commId": commId, "feesIds": $("#FeesIDs").val(), "precReceId": precReceId }),
                        dataType: 'json',
                        cache: false,
                        async: false,
                        success: function (_data) {
                            if (_data.code == 200) {
                                recdIds = _data.message;
                            }
                        }
                    });

                    var invoiceType = $("#InfoKind").find("option:selected").val();
                    //alert(invoiceType);
                    var conent = "../OnlineInvoice_SL/OnlineInvoice_Invoicing.aspx?CustId=" + $("#CustID").val() + "&RecdIds=" + recdIds + "&InvoicingType=Immediate&InvoiceType=" + invoiceType;
                    HDialog.Open(w, h, conent, '网上开票', false, function callback(_Data) { });
                } else {
                    //合并显示
                    var strIsComb = "1";
                    if (getObject("CkIsComb").checked == true) {
                        strIsComb = "1";
                    }
                    else {
                        strIsComb = "0";
                    }
                    var BillsSign = $("#InvoiceBill").val();
                    Cache.SetData('OnlineCust', $("#CustID").val() + ',' + $("#CustName").val() + ',' + getObject("InvoiceType").value + ',' + strIsComb + ',' + BillsSign + ',' + InfoKind)
                    var conent = "../ChargesNew/OnlineInvoice.aspx";
                    HDialog.Open(w, h, conent, '网上开票', false, function callback(_Data) { });
                }
            }

            //关联欠费
            $("#RepatedCustFees").click(function (e) {
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                if ($("#RoomSign").val() == "") {
                    HDialog.Info("请选择房号");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../ChargesNew/RepatedCustFeesBrowse.aspx?CustID=" + $("#CustID").val();
                HDialog.Open(w, h, conent, '关联欠费', false, function callback(_Data) {
                });
            });
            $('#BtnSearch').click(function () {

                $.tool.pageLoadInfo("正在查询,请稍侯...  ");
            });

            function GetStanMemoValue(v, s) {
                if (v != undefined) {
                    var _a = v.split('|');
                    for (var i = 0; i < _a.length; i++) {
                        var _n = _a[i].split(':');
                        if (_n[0] == s) {
                            return _n[1];
                        }
                    }
                }
                else {
                    return "0.00";
                }
            }



            var MenuListWidth = $("#DvPreStore").width();
            var MenuListIncidentAcceptWidth = $("#DvIncidentAccept").width();

            $("#DvPreStoreList").css("width", MenuListWidth + 'px');



            $("div[reftype='DvPreStoreList']").hover(function () {
                $(this).prop('class', 'DvPreStoreList_DetailIn');
                $("#DvPreStoreList").css('display', '');
            }, function () {
                $(this).prop('class', 'DvPreStoreList_DetailOut');
                $("#DvPreStoreList").css('display', 'none');
            });
            $("#DvPreStoreList").css('display', 'none');
            $("#DvPreStore").hover(function () {
                $("#DvPreStoreList").css('display', '');
            }, function () {
                $("#DvPreStoreList").css('display', 'none');
            });

            //多种收款方式单击
            function ChargeModeSelect() {
                getObject("ChargeMode").value = "多种收款方式";
                if (getObject("FeesIDs").value == "") {
                    HDialog.Info("请选择要收取的费用!");
                    $('#ChargeMode')[0].selectedIndex = 0;
                    return false;
                }

                //是否有单项预存
                var IsPreCost = false;
                if (IsLoadPreCostTableContainer == true) {
                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                    if (PreCostDataRows.length > 0) IsPreCost = true;
                }
                if (IsPreCost == true) {
                    HDialog.Info("有单项预存不允许多种收款方式收款");
                    $('#ChargeMode')[0].selectedIndex = 0;
                    return false;
                }
                var iTotalAmount = 0;
                var varTotalSumAmount = getObject("TotalSumAmount").value

                if (varTotalSumAmount != "") {
                    iTotalAmount = parseFloat(varTotalSumAmount);
                }

                var w = '650';
                var h = '500';
                var conent = "../dialogNew/ChargeModeDlg.aspx?TotalAmount=" + iTotalAmount + "&Rdm=" + Math.random();
                HDialog.Open(w, h, conent, '多种收款方式', true, function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = _Data.split("\t");
                        frmForm.ChargeModes.value = varObjects[0];
                        frmForm.hiChargeModes.value = varObjects[1];
                        frmForm.ChargeModeAmount.value = varObjects[2];
                    }
                    else {
                        $('#ChargeMode')[0].selectedIndex = 0;
                        Rule.SetSurplusRule();
                    }
                });
                return false;
            }

            var RuleEvent = {
                //收款方式变更
                ChargeModeEvent: function () {

                    var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                    $("#ChargeModeName").val(varChargeMode);
                    //设置零头结转规则
                    Rule.SetSurplusRule();

                    if (varChargeMode == "扫码支付") {
                        $('#btnReceive').hide();
                        $('#btnPayment').show();
                        $('#CustPaymentID').removeAttr("disabled");
                        $('#CustPaymentID').focus();// 135724404116692165


                    }
                    else {
                        $('#btnReceive').show();
                        $('#btnPayment').hide();
                        $('#CustPaymentID').val('');
                        $('#CustPaymentID').attr("disabled", "disabled");
                    }

                    if (varChargeMode == "现金") {
                        frmForm.RemitterUnit.readOnly = true;
                        frmForm.BankName.disabled = true;
                        frmForm.BankAccount.readOnly = true;
                        frmForm.ChequeBill.readOnly = true;
                        frmForm.btnSelRemitterUnit.disabled = true;
                        frmForm.RemitterUnit.value = "";
                        frmForm.BankName.value = "";
                        frmForm.BankAccount.value = "";
                        frmForm.ChequeBill.value = "";

                        frmForm.ChargeModes.value = "";
                        frmForm.hiChargeModes.value = "";
                        frmForm.ChargeModeAmount.value = "";
                        $("#TrCheck").css("display", "none");
                        var rows_n = GetHiddenRows();
                        getObject("leftChargeContainer").rowSpan = rows_n;
                    }
                    else {
                        if (varChargeMode == "POS刷卡") {
                            $.tool.DataPostChk('AccountedBankBindManageForm', 'AccountedBankBindManage', 'GetInfo', "",
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data) {
                                        $('#BankNameSel').searchbox('setValue', _Data.split(',')[0]);
                                        $('#BankAccountSel').searchbox('setValue', _Data.split(',')[1]);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                })
                        }

                        $("#TrBank").css("display", "none");
                        frmForm.RemitterUnit.readOnly = false;
                        frmForm.BankName.disabled = false;
                        frmForm.BankAccount.readOnly = false;
                        frmForm.ChequeBill.readOnly = false;
                        frmForm.btnSelRemitterUnit.disabled = false;
                        if (getObject("CkIsSurplus").checked) {
                            if (varChargeMode == "多种收款方式") {
                                frmForm.ChargeModes.value = "";
                                frmForm.hiChargeModes.value = "";
                                frmForm.ChargeModeAmount.value = "";
                                frmForm.ChargeMode.value = "";
                            }
                        }
                        if (varChargeMode == "支票") {
                            $("#TrCheck").css("display", "");
                            var rows_n = GetHiddenRows();
                            getObject("leftChargeContainer").rowSpan = rows_n;
                        }
                        else {
                            $("#TrCheck").css("display", "none");
                        }

                        //多种收款方式
                        if (varChargeMode == "多种收款方式") {
                            var strRenderType = getObject("RenderType").value;
                            if (strRenderType == "1") {
                                ChargeModeSelect();
                            }
                            else {
                                frmForm.ChargeModes.value = "";
                                frmForm.hiChargeModes.value = "";
                                frmForm.ChargeModeAmount.value = "";

                                frmForm.ChargeMode.value = "";
                                HDialog.Info("请选择其他收款方式!");
                            }
                        }
                        else {
                            if (varChargeMode != "") {
                                frmForm.ChargeModes.value = "";
                                frmForm.hiChargeModes.value = "";
                                frmForm.ChargeModeAmount.value = "";
                            }
                        }
                    }
                    //刷新收据数据
                    SendReceive();
                },
                InvoiceTypeEvent: function () {
                    var strInvoiceType = getObject("InvoiceType").value;
                    //$("#hiInvoiceType").val($("#InvoiceType").get(0).selectedIndex);
                    var strBillsSign = getObject("InvoiceBill").value;
                    var Url = "InvoiceType=" + strInvoiceType + "&BillsSign=" + strBillsSign + "&Rdm=" + Math.random;

                    $.tool.DataPostInfo('ReceFees', 'GetFirstBillsSign', Url,
                        function Init() {
                        },
                        function callback(_Data) {
                            var varReturn = _Data;
                            if (varReturn != "") {
                                var Search = eval('(' + varReturn + ')');
                                var SearchData = Search.SelData.Data;
                                getObject("InvoiceBill").value = "";
                                getObject("ReceMemo").value = "";
                                getObject("IsFixed").value = "";
                                getObject("FixedAmount").value = "";
                                getObject("hiInvoiceBill").value = "";
                                getObject("hiInvoiceBills").value = "";
                                for (var i = 0; i < SearchData.length; i++) {
                                    getObject(SearchData[i].Name).value = SearchData[i].Val;
                                }

                                //是否有单项预存
                                var IsPreCost = false;
                                if (IsLoadPreCostTableContainer == true) {
                                    var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                                    if (PreCostDataRows.length > 0) IsPreCost = true;
                                }
                                //是否有应收款
                                var IsReceFees = false;
                                if ($("#FeesIDs").val() != "") IsReceFees = true;

                                if (getObject("IsFixed").value == "1") {
                                    if (IsPreCost == true && IsReceFees == true) {
                                        $('#InvoiceType')[0].selectedIndex = 0;
                                        getObject("InvoiceBill").value = "";
                                        getObject("ReceMemo").value = "";
                                        getObject("IsFixed").value = "";
                                        getObject("FixedAmount").value = "";
                                        getObject("hiInvoiceBill").value = "";
                                        getObject("hiInvoiceBills").value = "";
                                        return;
                                    }
                                }

                                //定额发票
                                var strIsFixed = getObject("IsFixed").value;
                                if (strIsFixed == "1") {
                                    getObject("InvoiceAmount").value = getObject("FixedAmount").value;
                                }
                                else {
                                    getObject("InvoiceAmount").value = getObject("TotalSumAmount").value;
                                }
                            }
                            else {
                                getObject("InvoiceBill").value = "";
                                getObject("ReceMemo").value = "";
                                getObject("IsFixed").value = "";
                                getObject("FixedAmount").value = "";
                                getObject("hiInvoiceBill").value = "";
                                getObject("hiInvoiceBills").value = "";
                            }
                        },
                        function _completeCallBack() {
                        },
                        function errorCallback() {
                        }, '正在获取票号,请稍侯');
                },
                InvoiceEvent: function () {
                    //收款方式
                    var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                    //是否有单项预存
                    var IsPreCost = false;
                    if (IsLoadPreCostTableContainer == true) {
                        var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                        if (PreCostDataRows.length > 0) IsPreCost = true;
                    }

                    var rows_n = GetHiddenRows();
                    if (getObject("IsInvoice").checked == true) {
                        getObject("TrInvoice").style.display = "";
                        getObject("leftChargeContainer").rowSpan = rows_n;
                        getObject("BillType").disabled = true;
                        getObject("BillsSign").disabled = true;
                        getObject("btnSelBill").disabled = true;
                    }
                    else {
                        getObject("TrInvoice").style.display = "none";
                        getObject("leftChargeContainer").rowSpan = rows_n;
                        getObject("BillType").disabled = false;
                        getObject("BillsSign").disabled = false;
                        getObject("btnSelBill").disabled = false;
                        $("#InvoiceBill").val('');

                    }

                    getObject("BillType").value = "";
                    getObject("BillsSign").value = "";
                    getObject("hiBillsSign").value = "";
                    //设置零头结转规则
                    Rule.SetSurplusRule();
                }
            }
            //设置规则
            var Rule = {
                //单项预存规则
                SetPreCostRule: function () {
                    //收款方式
                    var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                    //是否有单项预存
                    var IsPreCost = false;
                    if (IsLoadPreCostTableContainer == true) {
                        var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                        if (PreCostDataRows.length > 0) IsPreCost = true;
                    }
                    //单项预存情况下的规则
                    if (IsPreCost == true) {
                        //frmForm.PerSurplusAmount.disabled = true;
                        //frmForm.CkIsSurplus.disabled = true;
                        //getObject("CkIsSurplus").checked = false;
                        //是否允许批量收款
                        //frmForm.CklsBatchReceFees.disabled = true;
                        //getObject("CklsBatchReceFees").checked = false;
                    }
                    else {
                        frmForm.CklsBatchReceFees.disabled = false;
                    }
                },
                //设置零头结转规则
                SetSurplusRule: function () {
                    //默认置为是
                    frmForm.PerSurplusAmount.disabled = false;
                    frmForm.CkIsSurplus.disabled = false;

                    //收款方式
                    var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                    //是否有单项预存
                    var IsPreCost = false;
                    if (IsLoadPreCostTableContainer == true) {
                        var PreCostDataRows = $("#PreCostTableContainer").datagrid("getRows");
                        if (PreCostDataRows.length > 0) IsPreCost = true;
                    }

                    //是否开据发票
                    var IsInvoick = getObject("IsInvoice").checked;

                    if (varChargeMode == "现金") {
                        //getObject("CkIsSurplus").checked = true;
                        //frmForm.CkIsSurplus.disabled = false;
                    }
                    else {
                        getObject("CkIsSurplus").checked = false;
                    }
                    if (varChargeMode == "多种收款方式") {
                        $("#PerSurplusAmount").val("0");
                        $("#IsEditPerSurplus").val("0");
                        PerSurplusAmount_Onblur();

                        frmForm.PerSurplusAmount.disabled = true;
                        frmForm.CkIsSurplus.disabled = true;
                        getObject("CkIsSurplus").checked = false;
                    }
                    //如果是发票或者有单项预存,则零头结转默认不勾选
                    if (IsPreCost == true || IsInvoick == true) {
                        getObject("CkIsSurplus").checked = false;
                    }
                }
            }

            $('#ContainerCli').click(function () {

                if ($('#IsShowInfo').val() == 'false') {
                    $("#SUP").hide();
                    $("#SDown").show();
                    $('#IsShowInfo').val('true');
                    $("#CustNav").hide();

                }
                else {
                    $("#SDown").hide();
                    $("#SUP").show();
                    $("#CustNav").show();
                    $('#IsShowInfo').val('false');
                }
            });

            var _ContainerRight = window.parent.document.getElementById("ContainerRight").style.width;

            $('#ContainerCliS').click(function () {

                if ($('#ShowInfo').val() == 'false') {

                    $("#SSDown").hide();
                    $("#SSUP").show();
                    $('#ShowInfo').val('true');

                    window.parent.document.getElementById("ContainerLeft").style = "display:block;";
                    window.parent.document.getElementById("ContainerRight").style = "width:" + _ContainerRight + ";overflow:hidden;";

                }
                else {

                    $("#SSDown").show();
                    $("#SSUP").hide();
                    $('#ShowInfo').val('false');

                    window.parent.document.getElementById("ContainerLeft").style = "display:none;";
                    window.parent.document.getElementById("ContainerRight").style = "width:100%;";

                }
            });

            $("#DivInvoiceContent").click(function () {
                if ($("#CustID").val() != "") {
                    HDialog.Open('850', '300', '../ChargesNew/ChargeCustBillInfo.aspx?CustID=' + $("#CustID").val() + '', '开票信息', false, function callback(_Data) {
                        if (_Data != '') {
                            $("#DivInvoiceContent").html(_Data);
                        }
                    });
                }
            });


            $("#DivMemoContent").click(function () {
                if ($("#CustID").val() != "") {
                    HDialog.Open('800', '280', '../ChargesNew/ChargeCustMemo.aspx?CustID=' + $("#CustID").val() + '&OpType=edit', '备注信息', false, function callback(_Data) {
                        if (_Data != '') {
                            $("#DivMemoContent").html(_Data);
                        }
                    });
                }
            });


            //操作指引入口
            function GetShow() {

                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [{
                        popup: {
                            content: '#walkthrough-1',
                            type: 'modal'
                        }
                    }],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '结束 &#10004;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            };


            //应收输入操作指引
            function GetStepOne() {
                $('body').pagewalkthrough({
                    name: 'introduction2',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        isFunction: false

                    }, {
                        wrapper: '#Receivable',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击应收输入</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepOpenDilog();
                            }

                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }


            //网上开票CheckBox单击
            $("#CkIsInvoice").click(function () {
                var corpId = $("#hidCorpId").val();
                if (corpId == 1528) {
                    if ($("#IsInvoice").is(':checked')) {
                        $("#IsInvoice").click();
                    }
                    if ($("#CkIsInvoice").is(':checked')) {
                        $(".eInvoice").show();
                        getObject("BillType").disabled = true;
                        getObject("BillsSign").disabled = true;
                        getObject("btnSelBill").disabled = true;

                        getObject("BillType").value = "";
                        getObject("BillsSign").value = "";
                        getObject("hiBillsSign").value = "";
                        $("#BillsSign").val('系统票号');
                        $("#hiBillsSign").val('系统票号');

                    } else {
                        $(".eInvoice").hide();
                        getObject("BillType").disabled = false;
                        getObject("BillsSign").disabled = false;
                        getObject("btnSelBill").disabled = false;
                        //刷新收据数据
                        SendReceive();
                    }
                }
            });

            //单户入账操作指引
            function GetStepTwo() {
                $('body').pagewalkthrough({
                    name: 'introduction3',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '#AccountedFor',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击单户入账</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepTwoOpenDilog();
                            }
                        }

                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }

            //收款确认操作指引
            function GetStepThree() {
                $('body').pagewalkthrough({
                    name: 'introduction4',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '.datagrid-view',
                        popup: {
                            content: '<span style=\'font-size:30px\'>选择应收取的费用列表</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#ChargeMode',
                        popup: {
                            content: '<span style=\'font-size:30px\'>选择收款方式</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#TotalPayAmount',
                        popup: {
                            content: '<span style=\'font-size:30px\'>输入实付金额</span>',
                            type: 'tooltip',
                            position: 'left'
                        }
                    }, {
                        wrapper: '#btnReceive',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击收款确认</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '结束 &#10004;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }

            //预存收款标准模式操作指引
            function GetStepFour() {
                $('body').pagewalkthrough({
                    name: 'introduction5',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '#yucun',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击预存收款-标准模式</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepThreeOpenDilog();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }

            //预存收款快捷模式操作指引
            function GetStepFive() {
                $('body').pagewalkthrough({
                    name: 'introduction6',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '#yucun',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击预存收款-快捷模式</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepFourOpenDilog();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }


            //单户抄表操作指引
            function GetStepSix() {
                $('body').pagewalkthrough({
                    name: 'introduction7',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '#WriteMeter',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击单户抄表</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepFiveOpenDilog();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }


            //托收确认操作指引
            function GetStepLast() {
                $('body').pagewalkthrough({
                    name: 'introduction8',
                    steps: [{
                        wrapper: '#FastKey',
                        popup: {
                            content: '<span style=\'font-size:30px\'>在这里输入房屋编号/客户名称</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }

                    }, {
                        wrapper: '#FeesConSign',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击托收确认</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepLastOpenDilog();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        $('#CaoZuoHelp', window.parent.parent.document).css("background-color", "")

                    }
                });

                $('body').pagewalkthrough('show');
            }

            function GetStepOneChild() {
                $('body').pagewalkthrough('close');
            }

            function SelBankSel() {
                var conent = "../DialogNew/SelBankInfoSet.aspx";
                HDialog.Open('1000', '600', conent, '入账银行选择', false, function callback(_Data) {

                    var data = JSON.parse(_Data);
                    $('#BankNameSel').searchbox("setValue", data.BankName);
                    $('#BankAccountSel').searchbox("setValue", data.BankAccount);
                    $("#BID").val(data.BID);
                    $.tool.DataGet('BankAccountInfoSet', 'searchPayType', 'BID=' + data.BID,
                        function Init() {
                        },
                        function callback(_Data) {
                            var data = JSON.parse(_Data);
                            $("#ChargeMode").find("option").remove();
                            for (var i = 0; i < data.rows.length; i++) {
                                $("#ChargeMode").append("<option value='" + data.rows[i]["PayType"] + "'>" + data.rows[i]["PayType"] + "</option>");
                            }


                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        })
                    //$('#stanid').val(data.attributes.stanid);
                    //$('#stanname').val(data.attributes.stanname);
                });
            }

            function InitBank() {

                var varChargeMode = $('#ChargeMode').find("option:selected").text();
                if (varChargeMode == "POS刷卡") {
                    $.tool.DataPostChk('AccountedBankBindManageForm', 'AccountedBankBindManage', 'GetInfo', "",
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data) {
                                $('#BankNameSel').searchbox('setValue', _Data.split(',')[0]);
                                $('#BankAccountSel').searchbox('setValue', _Data.split(',')[1]);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        })
                }
            }


            $(function () {
                InitBank();
                RuleEvent.InvoiceEvent();
                //设置发票类别规则
                RuleEvent.InvoiceTypeEvent();
                //刷新收据数据
                SendReceive();
                $('#InvoiceType')[0].selectedIndex = 0;
                if ($("#IsEInvoice").is(":checked")) {
                    $("#IsEInvoice").prop("checked", false);
                }

                var varChargeMode = frmForm.ChargeMode.options[frmForm.ChargeMode.selectedIndex].text;
                $("#ChargeModeName").val(varChargeMode);
                //设置零头结转规则
                Rule.SetSurplusRule();

                if (varChargeMode == "扫码支付") {
                    $('#btnReceive').hide();
                    $('#btnPayment').show();
                    $('#CustPaymentID').removeAttr("disabled");
                    $('#CustPaymentID').focus();// 135724404116692165


                }
                else {
                    $('#btnReceive').show();
                    $('#btnPayment').hide();
                    $('#CustPaymentID').val('');
                    $('#CustPaymentID').attr("disabled", "disabled");
                }


                //设置入账银行

                $('#BankNameSel').searchbox('setValue', $("#hiBankNameSel").val());
                $('#BankAccountSel').searchbox('setValue', $("#hiBankAccountSel").val());
            })

        </script>

    </form>
</body>
</html>
