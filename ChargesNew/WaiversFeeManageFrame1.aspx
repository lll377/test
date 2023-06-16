<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeManageFrame1.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeManageFrame1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WaiversFeeManageFrame1</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <%--    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />--%>
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }

        .auto-style1 {
            height: 24px;
            width: 15%;
            text-align: center;
        }

        .auto-style2 {
            height: 24px;
            width: 35%;
            text-align: left;
        }

        td {
            height: 30px;
        }

        .hiHide {
            display: none;
        }

        .panel-body {
            padding: 0px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />

        <input id="strLoginCommID" size="1" type="hidden" name="strLoginCommID" runat="server" />
        <input id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server" />
        <input id="IsTotal" size="1" type="hidden" name="IsTotal" runat="server" value="1" />
        <input id="WaivID" size="1" type="hidden" name="WaivID" runat="server" />
        <input id="IsAudit" size="1" type="hidden" name="IsAudit" runat="server" />
        <input id="PageIndex" size="1" type="hidden" name="PageIndex" runat="server" />
        <input id="hiWaivType" size="1" type="hidden" name="hiWaivType" runat="server" />
        <input id="hiIsTransfer" size="1" type="hidden" name="hiIsTransfer" runat="server" />
        <input id="SysCostSign" size="1" type="hidden" name="SysCostSign" runat="server" />
        <input style="width: 24px; height: 22px" id="WaivDate" size="1" type="hidden" name="WaivDate" runat="server" />

        <input id="IsClose" size="1" type="hidden" name="IsClose" runat="server" />
        <input id="CostID" class="Control_ItemInput" size="1" type="hidden" name="CostID" runat="server" />
        <input id="hiCostName" size="1" type="hidden" name="hiCostName" runat="server" />
        <input id="hiTab" name="hiTab" size="1" runat="server" type="hidden" />
        <input id="HidiIsAudit" name="HidiIsAudit" runat="server" type="hidden" value="0" />
        <input id="nowMonth" type="hidden" runat="server" />
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" name="WaiversFeeBase" id="WaiversFeeBase" refpage="" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="false">减免基本信息</a>
                </li>
                <li class="" name="WaiversFeeAgreement" id="WaiversFeeAgreement" refpage="" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="true">减免协议信息</a>
                </li>
                <li class="" name="WaiverReceivableDetails1" id="WaiverReceivableDetails1" refpage="" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="true">减免结算信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <div class="Frm">
                            <div class="" id="TableContainer1">
                                <table id="Table1" class="DialogTable" align="center" style="border-collapse: separate; border-spacing: 0px 10px;">
                                    <tr>
                                        <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                            <span style="font-size: 16px">减免基本信息</span> </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免业务类型</td>
                                        <td class="TdContentSearch">
                                            <asp:DropDownList ID="DListPolicy" Width="26%" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="1">政策性减免</asp:ListItem>
                                                <asp:ListItem Value="0">非政策性减免</asp:ListItem>
                                            </asp:DropDownList><span style="color: red;">*</span>
                                        </td>
                                        <td class="TdTitle">是否参与冲抵</td>
                                        <td class="TdContentSearch">
                                            <select id="IsUseOffset" name="IsUseOffset" runat="server">
                                                <option value="0">是</option>
                                                <option value="1">否</option>
                                            </select>
                                            <input id="btnIsUseOffset" class="button" value="修改" type="button" name="btnFilter" runat="server" style="margin: 0 0 0 37px; display: none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">客户名称</td>
                                        <td class="TdContentSearch">
                                            <input id="CustName" class="easyui-searchbox" data-options="editable:false" searcher="SelCust"
                                                style="width: 63%;" name="CustName" runat="server" />
                                            <input id="btnSelCust" class="button_sel" value=" " type="button" name="btnSelCust" runat="server" />
                                            <input id="CustID" class="Control_ItemInput" size="1" type="hidden" name="CustID" runat="server" />
                                            <input id="hiCustName" class="Control_ItemInput" size="1" type="hidden" name="hiCustName" runat="server" /></td>
                                        <td class="TdTitle">可选房号</td>
                                        <td class="TdContentSearch">
                                            <asp:DropDownList ID="SelRoomID" Style="width: 63%; height: 22px;" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input id="RoomSign" name="RoomSign" style="width: 63%; height: 22px;" data-options="editable:false" class="easyui-searchbox" searcher="SelRoom" runat="server" />
                                            <input style="height: 22px" id="btnSelRoom" class="button_sel" value=" " type="button" name="btnSelRoom" runat="server" />
                                            <input id="RoomID" class="Control_ItemInput" size="1" type="hidden" name="RoomID" runat="server" />
                                            <input id="hiRoomSign" class="Control_ItemInput" size="1" type="hidden" name="hiRoomSign" runat="server" />
                                        </td>
                                        <td class="TdTitle">车位</td>
                                        <td class="TdContentSearch">
                                            <asp:DropDownList ID="HandID" Style="width: 63%; height: 22px;" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免费用项目</td>
                                        <td class="TdContentSearch">
                                            <input id="CostName" style="width: 63%;" class="easyui-searchbox" data-options="editable:false" name="CostName" runat="server" visible="false" />
                                            <input id="btnSelCost" type="button" name="btnSelCost" runat="server" style="display: none;" />
                                            <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
                                            <input style="width: 63%;" id="CostNames" class="easyui-searchbox" data-options="editable:false" size="14" name="CostNames" runat="server" searcher="SelCost" />
                                        </td>
                                        <td class="TdTitle">减免本金/佣金</td>
                                        <td class="TdContentSearch">
                                            <input id="WaivCostName" style="width: 63%;" class="easyui-searchbox" name="WaivCostName" searcher="SelWaivCost" data-options="editable:false" runat="server" />
                                            <input id="btnSelWaivCost" class="button_sel" onclick="javascript: if (btnSelWaivCost_OnClick() == false) return false;"
                                                value=" " type="button" name="btnSelWaivCost" runat="server" />
                                            <input style="width: 8px; height: 22px;" id="hiWaivCostName" class="Control_ItemInput" size="1" type="hidden" name="hiWaivCostName" runat="server" />
                                            <input style="width: 8px; height: 22px;" id="WaivCostID" class="Control_ItemInput" size="1" type="hidden" name="WaivCostID" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbMeterSign" runat="server">表　　计</asp:Label></td>
                                        <td class="TdContentSearch">
                                            <asp:DropDownList Width="63%" ID="MeterSign" runat="server">
                                            </asp:DropDownList>
                                            <input style="width: 63%; height: 22px;" id="hiMeterSign" size="1" type="hidden" name="hiMeterSign" runat="server" /></td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContent"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免方式</td>
                                        <td class="TdContentSearch">
                                            <asp:DropDownList ID="WaivType" Style="width: 63%; height: 22px;" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="1">按每月减免</asp:ListItem>
                                                <asp:ListItem Value="2">按总额减免</asp:ListItem>
                                                <asp:ListItem Value="3">按比例减免</asp:ListItem>
                                                <asp:ListItem Value="4">按均摊减免</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbWaivMonthAmount" runat="server">单月减免金额</asp:Label></td>
                                        <td class="TdContent">
                                            <input id="WaivMonthAmount" style="width: 63%; height: 22px;" name="WaivMonthAmount" runat="server" />
                                            <asp:Label ID="lbXin1" runat="server" ForeColor="Red">*</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbWaivRates" runat="server">减免比例</asp:Label></td>
                                        <td class="TdContent">
                                            <input id="WaivRates" style="width: 63%; height: 22px;" onkeypress="CheckNumeric();" name="WaivRates" runat="server" />%<asp:Label ID="lbXin3" runat="server" ForeColor="Red" />*</asp:Label></td>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbWaivAmount" runat="server">减免总金额</asp:Label></td>
                                        <td class="TdContent">
                                            <input id="WaivAmount" style="width: 63%; height: 22px;" name="WaivAmount" runat="server" /><asp:Label ID="lbXin2" runat="server" ForeColor="Red">*</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbShareWaivAmount" runat="server">均摊减免总金额</asp:Label></td>
                                        <td class="TdContent">
                                            <input id="ShareWaivAmount" style="width: 63%; height: 22px;" name="ShareWaivAmount" runat="server" />
                                            <asp:Label ID="lbXin4" runat="server" ForeColor="Red">*</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">费用日期从</td>
                                        <td class="TdContent">
                                            <input onkeypress="CheckSmallDate();" id="WaivStateDuring" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="WaivStateDuring"
                                                runat="server"></td>
                                        <td class="TdTitle">到</td>
                                        <td class="TdContent">
                                            <input onkeypress="CheckSmallDate();" id="WaivEndDuring" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="WaivEndDuring"
                                                runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">费用开始结束日期从</td>
                                        <td class="TdContent">
                                            <input onkeypress="CheckSmallDate();" id="FeesStateDate1" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="FeesStateDate1"
                                                runat="server">
                                            <input onkeypress="CheckSmallDate();" id="FeesStateDate2" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="FeesStateDate2" visible="false"
                                                runat="server">
                                        </td>
                                        <td class="TdTitle">到</td>
                                        <td class="TdContent">
                                            <input onkeypress="CheckSmallDate();" id="FeesEndDate1" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="FeesEndDate1" visible="false"
                                                runat="server">
                                            <input onkeypress="CheckSmallDate();" id="FeesEndDate2" class="Wdate" style="width: 63%;"
                                                onclick="WdatePicker()" name="FeesEndDate2"
                                                runat="server"></td>
                                        <td class="TdContent"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免原因</td>
                                        <td class="TdContent">
                                            <select id="SelWaivReason" name="SelWaivReason" runat="server" style="height: 22px; width: 63%;">
                                                <option selected="selected"></option>
                                            </select>
                                            <%--<input id="WaivReason" name="WaivReason" style="width: 47%; height: 22px;" class="easyui-validatebox" data-options="required:true" runat="server" readonly="readonly" /></td>--%>
                                            <td class="TdTitle">备 注</td>
                                            <td class="TdContent">
                                                <input id="WaivMemo" style="width: 63%; height: 22px;" name="WaivMemo" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免协议编号</td>
                                        <td class="TdContent">
                                            <input id="WaivAgreement" style="width: 63%;" name="WaivAgreement" runat="server" readonly="readonly" />
                                        </td>
                                        <td class="auto-style1">协议签订时间</td>
                                        <td class="auto-style2">
                                            <input id="WaivAgreementDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" style="width: 63%;" name="WaivAgreementDate" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">减免协议内容</td>
                                        <td class="TdContent" colspan="3">
                                            <textarea id="WaivContent" style="height: 128px; width: 85%" name="WaivContent" rows="13"
                                                cols="83" runat="server"></textarea>
                                        </td>
                                    </tr>
                                    <tr style="display: none">

                                        <td class="auto-style1">协议登记时间</td>
                                        <td class="auto-style2">
                                            <input id="WaivAgreementRegisterDate" class="Wdate" style="width: 63%;" name="WaivAgreementRegisterDate" runat="server" /></td>
                                    </tr>

                                    <tr>
                                        <td class="TdTitle">文件上传</td>
                                        <td class="TdContent">
                                            <input id="btnFile" type="file" name="btnFile" runat="server" style="width: 63%;" />
                                        </td>
                                        <td class="TdTitle">
                                            <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                                                type="button" value="上传" name="btnFileUp" runat="server" />
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td class="TdTitle">文件说明</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="AdjunctName" name="AdjunctName" runat="server" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTittle"></td>
                                        <td class="formTable_ItemInput" height="150px" colspan="2">
                                            <asp:DataGrid ID="DGrid" BorderColor="#cccccc" runat="server" CssClass="DataGrid" AutoGenerateColumns="False"
                                                Width="100%">
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
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
                                                                CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="[删除]">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"
                                                                CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid></td>
                                        <td class="TdTittle"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">
                                            <asp:Label ID="lbAuditReason" runat="server">审核信息</asp:Label></td>
                                        <td class="TdContent" colspan="3">
                                            <input id="AuditReason" style="width: 85%;" readonly="readonly" maxlength="100" size="26" name="AuditReason" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <input id="btnSave" class="button" onclick="javascript: if (CheckData() == false) return false;" value="保 存" type="button" name="btnFilter" runat="server" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <input id="btnClear" class="button" value="清空" type="button" name="btnClear" runat="server" />
                                            &nbsp;&nbsp;&nbsp;
                                    <input id="btnReturn" class="button" value="放弃返回" type="button" name="btnReturn" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SchTable" colspan="4" align="left">备注：1、当一个费项包含佣金时（比如车位租金350元/月，其中包含车位租金300元/月和车位物管50元/月），可具体指定减免本金还是佣金。2、当减免的费用属于已经生成的费用时，审核通过后立即生效；当减免的费用属于尚未生成的费用时，今后费用生成时生效。</td>
                                    </tr>
                                </table>
                                <div id='dTitle' style='width: 100%; height: 30px; line-height: 30px; background-color: #e6e6e6; text-align: center'></div>
                                <table class="DialogTable" style="height: 310px; border: none">
                                    <%--                          <tr style="height:25px">
                                        <td style="background-color: #e6e6e6; height: 25px;" align="center">
                                            
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            <div style="width: 80%; background-color: #cccccc;" id="TableContainer">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div id="PeriodFees" class="" style="height: 300px; display: none"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="WaiversFeeSettlement" src="WaiversFeeSettlement.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <div class="Frm">
                            <div class="" id="TableContainer3">
                                <table id="Table2" class="DialogTable" align="center" style="border-collapse: separate; border-spacing: 0px 10px;">
                                    <tr>
                                        <td colspan="5" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">减免协议信息</span> </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">代付单位</td>
                                        <td class="TdContent">
                                            <input id="PaidUnitName" name="PaidUnitName" type="text" placeholder="输入或双击选择" autocomplete="off"
                                                runat="server" style="width: 63%; height: 22px;" ondblclick="SelConstUnitName()" />
                                            <input type="hidden" id="PaidUnit" name="PaidUnit" runat="server" size="1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">登记人</td>
                                        <td class="TdContent">
                                            <input id="Registrant" style="width: 63%;" name="Registrant" runat="server" readonly="readonly" /></td>
                                        <td class="TdTitle">结算周期</td>
                                        <td class="TdContentSearch">
                                            <select id="SettlementCycle" name="SettlementCycle" runat="server" style="width: 63%; height: 22px;">
                                                <option value=""></option>
                                                <option value="按月结算">按月结算</option>
                                                <option value="按季结算">按季结算</option>
                                                <option value="按年结算">按年结算</option>
                                                <option value="一次结清">一次结清</option>
                                            </select><span style="color: red">*</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">已结金额（元）</td>
                                        <td class="auto-style2">
                                            <input id="AlreadySettledMoney" name="AlreadySettledMoney" runat="server" readonly="readonly" value="0" /></td>
                                        <td class="auto-style1">未结金额（元）</td>
                                        <td class="auto-style2">
                                            <input id="WaivLastMonty" name="WaivLastMonty" readonly="readonly" runat="server" value="0" /></td>
                                    </tr>
                                    <tr id="recommend6">
                                        <td class="TdTitle">是否老带新业务</td>
                                        <td class="TdContent">
                                            <input id="IsCustRecommend" name="IsCustRecommend" type="checkbox" runat="server" style="width: 18px; height: 18px;" /></td>
                                        <td class="TdTitle">介绍/被介绍</td>
                                        <td class="TdContent">
                                            <select id="introduceSel" name="introduceSel" onchange="showintroduceSel()" runat="server">
                                                <option value="" selected="selected"></option>
                                                <option value="介绍">介绍</option>
                                                <option value="被介绍">被介绍</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr id="recommend1" class="hiHide">
                                        <td class="TdTitle">介绍人</td>
                                        <td class="TdContent">
                                            <input id="RecommenderName" name="RecommenderName" readonly="readonly" placeholder="输入或双击选择" autocomplete="off"
                                                runat="server" type="text" style="width: 63%; height: 22px;" />
                                            <input type="hidden" runat="server" id="Recommender" name="Recommender" />
                                        </td>
                                        <td class="TdTitle">可选房屋</td>
                                        <td>
                                            <select id="SelRRoomID" name="SelRRoomID" runat="server" style="width: 63%; height: 22px;"></select>
                                        </td>
                                    </tr>

                                    <tr id="recommend2" class="hiHide">
                                        <td class="TdTitle">被介绍人</td>
                                        <td class="TdContent">
                                            <input id="BeRecommender" name="BeRecommender" runat="server" type="text" style="width: 63%; height: 22px;" readonly="readonly" placeholder="输入或双击选择" autocomplete="off" />
                                        </td>
                                        <td class="TdTitle">被介绍人地址</td>
                                        <td class="TdContent">
                                            <input id="BeRecommenderAddr" name="BeRecommenderAddr" runat="server" type="text" style="width: 63%; height: 22px;" /></td>
                                    </tr>
                                    <tr id="recommend3" class="hiHide">
                                        <td class="TdTitle">介绍人地址</td>
                                        <td class="TdContent">
                                            <input id="RecommenderAddr" name="RecommenderAddr" runat="server" type="text" style="width: 63%; height: 22px;" /></td>
                                        <td class="TdTitle">介绍人所在项目</td>
                                        <td class="TdContent">
                                            <input id="RecommenderCommName" name="RecommenderCommName" readonly="readonly" runat="server" type="text" style="width: 63%; height: 22px;" />
                                            <input id="RecommenderComm" name="RecommenderComm" type="hidden" runat="server" />
                                        </td>
                                    </tr>
                                    <tr id="recommend4" class="hiHide">
                                        <td class="TdTitle">被介绍人所在项目</td>
                                        <td class="TdContent">
                                            <input type="text" id="BeRecommenderCommName" name="BeRecommenderCommName" readonly="readonly"
                                                runat="server" style="width: 63%; height: 22px;" />
                                            <input type="hidden" id="BeRecommenderComm" name="BeRecommenderComm" runat="server" style="width: 63%; height: 22px;" />
                                        </td>
                                        <td class="TdTitle">被介绍人所在区域</td>
                                        <td class="TdContent">
                                            <input type="text" id="BeRecommenderOrganName" name="BeRecommenderOrganName" readonly="readonly"
                                                runat="server" style="width: 63%; height: 22px;" />
                                            <input type="hidden" id="BeRecommenderOrgan" name="BeRecommenderOrgan" runat="server" /></td>
                                    </tr>
                                    <tr id="recommend5">
                                        <td class="TdTitle">介绍人所在区域</td>
                                        <td class="TdContent">
                                            <input id="RecommenderOrganName" name="RecommenderOrganName" readonly="readonly" runat="server" type="text" style="width: 63%; height: 22px;" />
                                            <input id="RecommenderOrgan" name="ReCommenderOrgan" type="hidden" runat="server" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="auto-style1">房产结算开始时间</td>
                                        <td class="auto-style2">
                                            <input id="WaivAgreementBeginDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', minDate: $('#nowMonth').val() })" style="width: 63%;" name="WaivAgreementBeginDate" runat="server" />
                                        </td>
                                        <td class="auto-style1">房产结算结束时间</td>
                                        <td class="auto-style2">
                                            <input id="WaivAgreementEndDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', minDate: $('#nowMonth').val() })" value="2099-12-31" style="width: 63%;" name="WaivAgreementEndDate" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">协议结算总金额</td>
                                        <td class="auto-style2">
                                            <input id="WaivAgreementMoney" name="WaivAgreementMoney" runat="server" />
                                        </td>
                                        <td class="auto-style1">是否可转移</td>
                                        <td class="auto-style2">
                                            <input id="IsCanTransfer" name="IsCanTransfer" type="checkbox" runat="server" style="width: 18px; height: 18px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">协议备注</td>
                                        <td class="TdContent">
                                            <input id="ProtocolNote" style="width: 63%; height: 22px;" name="ProtocolNote" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="WaiverReceivableDetails" src="WaiverReceivableDetails.aspx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#btnSelCust').hide();
                $('#btnSelRoom').hide();
                //$('#btnSelCost').hide();
                $('#btnSelWaivCost').hide();

                InitTableHeight();

                if ($('#hiOPType').val() == "Insert") {
                    $('#dTitle').html("未收取的费用");
                    LoadFeesList();
                }
                else {
                    $('#dTitle').html("每月减免费用详细");
                    LoadList();
                }

            });

            function InitTableHeight() {
                var h = $(window).height() - 300;
                $("#TableContainer").css("height", h + "px");
            }

            var columnfees = [[
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

                { field: 'ParkName', title: '车位编号', width: 80, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'IsBankName', title: '托收状态', width: '50', align: 'center', sortable: true },
                { field: 'IsFreezeName', title: '冻结状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPropertyName', title: '垫付状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '预交状态', width: '50', align: 'center', sortable: true }
            ]];

            var column = [[
                { field: 'CustName', title: '客户名称', width: 170, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'CostSNum', title: '费用序号', width: 150, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
                { field: 'CreYear', title: '减免费用年份', width: 180, align: 'left', sortable: true },
                { field: 'CreMonth', title: '减免费用月份', width: 100, align: 'left', sortable: true },
                { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
                { field: 'WaivRates', title: '减免比例', width: 100, align: 'left', sortable: true },
                { field: 'OldWaivAmount', title: '未减免金额', width: 100, align: 'left', sortable: true },
                { field: 'OffsetAmount', title: '已减免金额', width: 100, align: 'left', sortable: true }

            ]];


            function LoadFeesList() {
                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var HandID = $('#HandID').val();
                var CostID = $('#CostID').val();
                var FromIndex = $("#FromIndex").val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Fees&Command=feessearch&CustID=' + CustID + '&RoomID=' + RoomID + '&HandID=' + HandID + '&CostID=' + CostID + '&FromIndex=' + FromIndex,
                    method: "Get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnfees,
                    remoteSort: false,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    height: "98%",
                    border: false,
                    sortOrder: "asc"
                });

            }

            //获取减免冲抵记录
            function LoadList() {
                var FromIndex = $("#FromIndex").val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WaiversFees&Command=getoffsetwaivlist&WaivID=' + $("#WaivID").val() + '&RoomID=' + $("#RoomID").val() + '&FromIndex=' + FromIndex,
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    remoteSort: false,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    height: "98%",
                    border: false,
                    sortOrder: "asc"
                });
            }


            $("#btnIsUseOffset").click(function () {
                var FromIndex = $("#FromIndex").val();
                HDialog.Open('600', '200', "../ChargesNew/WaiversFeeIsUseOffset.aspx?WaivID=" + $("#WaivID").val() + '&FromIndex=' + FromIndex, '设置是否参与冲抵', false, function callback(_Data) {
                    if (_Data == 'true') {
                        HDialog.Info("修改成功！");
                    }
                });
            });

            $("#CreYear1").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            $("#CreYear2").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            $("#CreMonth1").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            $("#CreMonth2").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            function ShowPeriodFees() {
                var CustID = $("#CustID").val();
                var RoomID = $("#RoomID").val();
                var CostID = $("#CostID").val();

                var day = new Date($("#CreYear2").combobox('getValue'), $("#CreMonth2").combobox('getValue'), 0);
                var FeesStateDate = $("#CreYear1").combobox('getValue') + '-' + $("#CreMonth1").combobox('getValue') + '-01 00:00:00';
                var FeesEndDate = $("#CreYear2").combobox('getValue') + '-' + $("#CreMonth2").combobox('getValue') + '-' + day.getDate() + ' 23:59:59';
                $("#FeesStateDate").val(FeesStateDate);
                $("#FeesEndDate").val(FeesEndDate);

                if (CustID != "" && RoomID != "" && CostID != "") {
                    LoadPeriodFees();
                } else {
                    $('#PeriodFees').attr("style", "height: 300px;display:none");
                }
            }

            var frozenColumns = [[
                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 }
            ]]
            var column1 = [[
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 70 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
                { field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 170 },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 100 },
                {
                    field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'StartDegree', title: '起度', align: 'left', sortable: true, width: 70 },
                { field: 'EndDegree', title: '止度', align: 'left', sortable: true, width: 70 },
                { field: 'CalcAmount', title: '数量1', align: 'left', sortable: true, width: 70 },
                { field: 'CalcAmount2', title: '数量2', align: 'left', sortable: true, width: 70 },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'WaivAmount', title: '减免冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'RefundAmount', title: '退款金额', align: 'left', sortable: true, width: 100 },
                { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, width: 100 },
                { field: 'IsPrecName', title: '是否预收', align: 'left', sortable: true, width: 100 },
                { field: 'FeesMemo', title: '备注', align: 'left', sortable: true, width: 100 }
            ]];
            function LoadPeriodFees() {
                $("#PeriodFees").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "Post",
                    nowrap: false,
                    title: '期间计费信息',
                    pageSize: [10],
                    pageList: [10, 20, 30, 50],
                    columns: column1,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Fees", "FeesPeriodList", "PeriodFees", param);
                    },
                    onLoadSuccess: function (data) {
                        $(".datagrid-wrap").each(function (i) {
                            $(this).attr("class", "datagrid-wrap");
                        });
                        if (data.total > 0) {
                            $('#PeriodFees').datagrid('reloadFooter', [
                                {
                                    test: 'footer',
                                    CustName: "<span style='color:red'>累计合计</span>",
                                    BuildArea: "<span style='color:red'>" + data.rows[0].totalBuildArea + "</span>",
                                    CalcAmount: "<span style='color:red'>" + data.rows[0].totalCalcAmount + "</span>",
                                    CalcAmount2: "<span style='color:red'>" + data.rows[0].totalCalcAmount2 + "</span>",
                                    DueAmount: "<span style='color:red'>" + data.rows[0].totalDueAmount + "</span>",
                                    PaidAmount: "<span style='color:red'>" + data.rows[0].totalPaidAmount + "</span>",
                                    PrecAmount: "<span style='color:red'>" + data.rows[0].totalPrecAmount + "</span>",
                                    WaivAmount: "<span style='color:red'>" + data.rows[0].totalWaivAmount + "</span>",
                                    RefundAmount: "<span style='color:red'>" + data.rows[0].totalRefundAmount + "</span>",
                                    DebtsAmount: "<span style='color:red'>" + data.rows[0].totalDebtsAmount + "</span>"
                                }
                            ]);
                        }
                    }
                });
                $('#PeriodFees').attr("style", "height: 300px;");
            }

            function InitTableHeight() {
                var h = $(window).height() - 38;
                $(".Frm").css({ "height": h + "px" });
                $('#WaiversFeeSettlement').attr("src", "WaiversFeeSettlement.aspx?OpType=" + $('#hiOPType').val() + "&WaivID=" + $('#WaivID').val() + "&WaivAgreement=" + $('#WaivAgreement').val());
                if ($('#hiOPType').val() == 'Insert') {
                    $('#WaiversSettlement1').hide();
                    $('#WaiverReceivableDetails1').hide();
                }

                if ($('#hiOPType').val() == 'Edit') {
                    var type = $("#ddlWaiversCategory option:selected");
                    if (type.text() == "房产代付") {
                        $('#WaiverReceivableDetails1').show();
                    }
                    else {
                        $('#WaiverReceivableDetails1').hide();
                    }
                }

                if ($('#hiOPType').val() == 'SeeDetail') {
                    //$('#WaiverReceivableDetails1').hide();
                }
            }

            $("#btnReturn").click(function () {
                HDialog.Close();
            });

            InitTableHeight();
            function btnFileUp_Onclick() {
                if ($('#btnFile').val() == "") {
                    HDialog.Info("请选择要上传的本地文件!");
                    $('#btnFile').focus();
                    return false;
                }
                $('#hiTab').val('1');
                return true;
            }

            //$(function () {
            //    ////同步协议开始时间                    
            //    //$("#WaivAgreementBeginDate").val($("input[name='CreYear1']").val() + "-" + $("input[name='CreMonth1']").val() + "-01");
            //    ////协议结束时间
            //    //$("#WaivAgreementEndDate").val($("input[name='CreYear2']").val() + "-" + $("input[name='CreMonth2']").val() + "-01");
            //    ////协议签订时间
            //    //$("#WaivAgreementDate").val($("input[name='CreYear1']").val() + "-" + $("input[name='CreMonth1']").val() + "-01");
            //    $('#btnSelCust').hide();
            //    $('#btnSelRoom').hide();
            //    $('#btnSelCost').hide();
            //    $('#btnSelWaivCost').hide();
            //    InitTableHeight();
            //    //LoadList();
            //});

            var column = [[
                { field: 'CustName', title: '客户名称', width: 170, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'CostSNum', title: '费用序号', width: 150, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
                { field: 'CreYear', title: '减免费用年份', width: 180, align: 'left', sortable: true },
                { field: 'CreMonth', title: '减免费用月份', width: 100, align: 'left', sortable: true },
                { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
                { field: 'WaivRates', title: '减免比例', width: 100, align: 'left', sortable: true },
                { field: 'OldWaivAmount', title: '未减免金额', width: 100, align: 'left', sortable: true },
                { field: 'OffsetAmount', title: '已减免金额', width: 100, align: 'left', sortable: true }
            ]];

            ////获取减免冲抵记录
            //function LoadList() {
            //    $("#TableContainer").datagrid({
            //        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WaiversFees&Command=getoffsetwaivlist&WaivID=' + $("#WaivID").val() + '&RoomID=' + $("#RoomID").val(),
            //        method: "get",
            //        title: '',
            //        nowrap: false,
            //        pageSize: top.ListPageSize,
            //        pageList: top.ListPageList,
            //        columns: column,
            //        remoteSort: false,
            //        fitColumns: true,
            //        rownumbers: true,
            //        singleSelect: true,
            //        pagination: true,
            //        width: "100%",
            //        height: "98%",
            //        border: false,
            //        sortOrder: "asc"
            //    });
            //}

            function SelCust() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }
                var FromIndex = $("#FromIndex").val();
                if (FromIndex == "") {
                    FromIndex = 0;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');
                var conent = "../DialogNew/CustDlg.aspx?CommID=" + FromIndex;
                HDialog.Open('800', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#hiCustName').val(data.CustName);
                    //ClearStan();
                    $('#RecommenderName').val(data.CustName);
                    $('#Recommender').val(data.CustID);
                    $('#RecommenderOrgan').val(data.OrganCode);
                    $('#RecommenderOrganName').val(data.OrganName);
                    $('#RecommenderComm').val(data.CommID);
                    $('#RecommenderCommName').val(data.CommName);
                    document.getElementById('btnSelCust').click();
                    ShowPeriodFees();
                });
            }

            function SelRoom() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }
                var FromIndex = $("#FromIndex").val();
                if (FromIndex == "") {
                    FromIndex = 0;
                }
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');
                var conent = "../DialogNew/RoomDlg.aspx?CommID=" + FromIndex;
                var w = 800;
                var h = 400;
                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                    $('#hiCustName').val(data.CustName);
                    $('#hiRoomSign').val(data.RoomSign);
                    //ClearStan();
                    $('#ReCommenderAddr').val(data.RoomName);
                    document.getElementById('btnSelRoom').click();
                    ShowPeriodFees();
                });
            }

            function SelCost() {
                var varReturn;
                var vIsAudit = $('#IsAudit').val();
                if ($('#hiOPType').val() != 'Insert' && (vIsAudit == "1" || vIsAudit == "2")) {
                    return;
                }

                var conent = "../dialogNew/MultiCorpCommCostDlg.aspx";
                var FromIndex = $("#FromIndex").val();

                if (FromIndex != "") {
                    conent = "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + FromIndex;
                }
                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                        if (varObjects[1] != "") {
                            var tmpCostNames = varObjects[1].split(",");
                            $('#CostName').searchbox("setValue", tmpCostNames[1]);
                            $('#hiCostName').val(tmpCostNames[1]);
                        }
                        if (varObjects[0] != "") {
                            var tmpCostIDs = varObjects[0].split(",");
                            $('#CostID').val(tmpCostIDs[0]);
                            $('#btnSelCost').click();
                        }

                        ShowPeriodFees();
                    }
                });
                return false;
            }

            function SelWaivCost() {
                if ($('#CostID').val() == "0") {
                    $('#CostID').val() = "";
                }
                if ($('#CostID').val() == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    //$('#btnSelCost').focus();
                    return false;
                }
                var varCostID = $('#CostID').val();
                var conent = "../DialogNew/CostWaivDlg.aspx?CostID=" + varCostID + "&Ram=" + Math.random();
                var FromIndex = $("#FromIndex").val();

                if (FromIndex != "") {
                    conent = "../DialogNew/CostWaivDlg.aspx?CommID=" + FromIndex + "&CostID=" + varCostID + "&Ram=" + Math.random();
                }

                HDialog.Open('650', '400', conent, '费用项目', false, function callback(_Data) {
                    if (_Data != "") {
                        var data = JSON.parse(_Data);
                        $('#WaivCostName').searchbox("setValue", data.CostName);
                        $('#WaivCostID').val(data.CostID);
                        $('#hiWaivCostName').val(data.CostName);
                    }
                });
            }

            $('#btnClear').click(function (e) {
                $('#WaivCostName').searchbox("setValue", "");
                $('#WaivCostID').val("");
                $('#hiWaivCostName').val("");
                $('#CostName').searchbox("setValue", "");
                $('#CostID').val("");
                $('#hiCostName').val("");
                $('#RoomSign').searchbox("setValue", "");
                $('#CustName').searchbox("setValue", "");
                $('#CustID').val("");
                $('#RoomID').val("");
                $('#hiCustName').val("");
                $('#hiRoomSign').val("");
                $('#WaivAmount').val("");
                $('#RecommenderName').val("");
                $('#Recommender').val("");
                $('#RecommenderOrgan').val("");
                $('#RecommenderOrganName').val("");
                $('#RecommenderComm').val("");
                $('#RecommenderCommName').val("");
                $('#IsUseOffset').is(":checked") = false;
                $('#IsCustRecommend').is(':checked') = false;
                $('#ReCommenderAddr').val("");
                hideRecommend();
            });

            function Close() {
                window.parent.Close();
            }

            $(".tabs-container li").click(function () {
                switch ($(this).attr("name")) {
                    case "WaiversFeeBase":
                        $('#hiTab').val("1");
                        InitTabPage();
                        break;
                    case "WaiversFeeAgreement":
                        $('#hiTab').val("3");
                        InitTabPage();
                        break;
                    case "WaiverReceivableDetails1":
                        $('#hiTab').val("4");
                        InitTabPage();
                        break;
                }
            });

            function CheckData() {

                if (getObject('ddlWaiversCategory').value == "") {
                    HDialog.Info("请选择减免业务类型,此项不能为空!");
                    return false;
                }
                if ($('#CustID').val() == "0") {
                    $('#CustID').val('');
                }
                if ($('#CostID').val() == "0") {
                    $('#CostID').val('') = "";
                }
                if ($('#CustID').val() == "") {
                    HDialog.Info("请选择客户,此项不能为空!");
                    return false;
                }
                if ($('#CostID').val() == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    return false;
                }
                var tmpCostIDs = $('#CostIDs').val().split(",");
                var varWaivType = $('#hiWaivType').val();
                if (tmpCostIDs.length > 1 && varWaivType != "2") {
                    HDialog.Info("多个费用项目,请选择减免方式为按总额减免!");
                    $('#WaivType').focus();
                    return false;
                }
                if ($('#SelWaivReason').val() == "") {
                    HDialog.Info("请输入减免原因,此项不能为空!");
                    $('#SelWaivReason').focus();
                    return false;
                }

                var varSysCostSign = $('#SysCostSign').val();
                if ($('#hiOPType').val() == "Edit") {
                    if (varSysCostSign != "") {
                        if (varSysCostSign.substr(0, 1) == "S") {
                            if ($('#MeterSign').val() == "") {
                                HDialog.Info("请选择表计,此项不能为空!");
                                //$('#btnSelCost').focus();
                                return false;
                            }
                        }
                    }
                }

                var objRegNum = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
                if ((!objRegNum.test($('#WaivMonthAmount').val())) && (varWaivType == "1")) {
                    HDialog.Info("请输入正确的单月减免金额!");
                    $('#WaivMonthAmount').focus();
                    return false;
                }

                if ((!objRegNum.test($('#WaivAmount').val())) && (varWaivType == "2")) {
                    HDialog.Info("请输入正确的减免总金额!");
                    $('#WaivMonthAmount').focus();
                    return false;
                }

                if (($('#WaivRates').val() == "") && (varWaivType == "3")) {
                    HDialog.Info("请输入减免比例!");
                    $('#WaivRates').focus();
                    return false;
                }

                if (getObject('ddlWaiversCategory').value == '应收调整' || getObject('ddlWaiversCategory').value == "") {

                }
                else {
                    if (getObject('ddlWaiversCategory').value == '房产代付') {
                        if ($('#WaivAgreementDate').val() == "") {
                            HDialog.Info("请选择协议签订时间!");
                            return false;
                        }
                        if ($('#PaidUnit').val() == "") {
                            HDialog.Info("请选择代付单位!");
                            return false;
                        }
                        if ($('#WaivContent').val() == "") {
                            HDialog.Info("请填写协议内容!");
                            return false;
                        }
                        if (!objRegNum.test($('#WaivAgreementMoney').val())) {
                            HDialog.Info("请输入正确的减免总金额!");
                            $('#WaivAgreementMoney').focus();
                            return false;
                        }
                        if ($('#SettlementCycle').val() == "") {
                            HDialog.Info("请选择结算周期,此项不能为空!");
                            $('#SettlementCycle').focus();
                            return false;
                        }
                        if ($('#WaivAgreementBeginDate').val() == "") {
                            HDialog.Info("请选择房产结算开始时间,此项不能为空!");
                            $('#WaivAgreementBeginDate').focus();
                            return false;
                        }
                        if ($('#WaivAgreementEndDate').val() == "") {
                            HDialog.Info("请选择房产结算结束时间,此项不能为空!");
                            $('#WaivAgreementEndDate').focus();
                            return false;
                        }
                    }
                }

                if (getObject('WaivMemo').value != "") {
                    if (getObject('WaivMemo').value.indexOf(",") > -1) {
                        HDialog.Info("备注不能包含半角','，请改为全角'，'!");
                        return false;
                    }
                }

                return true;
            }

            function onchangeSelWaivReason() {
                //getObject("WaivReason").value = getObject("SelWaivReason").value;
            }

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;
                if (strPrintParms != "") {
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            $('#IsCustRecommend').on('click', function (e) {
                showintroduceSel();
            });

            function showintroduceSel() {
                var sell = $("#introduceSel").val();
                if ($('#IsCustRecommend').is(':checked')) {
                    if (sell != "") {
                        showRecommend();
                    }
                }
                else {
                    hideRecommend();
                }
                if (sell == "被介绍") {

                    $('#recommend4').addClass('hiHide');
                    $('#recommend2').addClass('hiHide');
                }
                if (sell == "介绍") {
                    $('#recommend1').addClass('hiHide');
                    $('#recommend3').addClass('hiHide');
                    $('#recommend5').addClass('hiHide');
                }
            }

            function showRecommend() {
                $('#recommend1').removeClass('hiHide');
                $('#recommend2').removeClass('hiHide');
                $('#recommend3').removeClass('hiHide');
                $('#recommend4').removeClass('hiHide');
                $('#recommend5').removeClass('hiHide');
            }
            function hideRecommend() {
                $('#recommend1').addClass('hiHide');
                $('#recommend2').addClass('hiHide');
                $('#recommend3').addClass('hiHide');
                $('#recommend4').addClass('hiHide');
                $('#recommend5').addClass('hiHide');
            }

            function InitTabPage() {
                var hiTab = $('#hiTab').val();
                $('#tab-1').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");
                $('#tab-4').attr("class", "tab-pane");

                $('#WaiversFeeBase').attr("refsel", "0");
                $('#WaiversFeeAgreement').attr("refsel", "0");
                $('#WaiverReceivableDetails1').attr("refsel", "0");

                $('#WaiversFeeBase').attr("class", "");
                $('#WaiversFeeAgreement').attr("class", "");
                $('#WaiverReceivableDetails1').attr("class", "");

                if (hiTab == "1" || hiTab == "") {
                    $('#tab-1').attr("class", "tab-pane active");
                    $('#WaiversFeeBase').attr("refsel", "1");
                    $('#WaiversFeeBase').attr("class", "active");
                }
                else if (hiTab == "3") {
                    $('#tab-3').attr("class", "tab-pane active");
                    $('#WaiversFeeAgreement').attr("refsel", "1");
                    $('#WaiversFeeAgreement').attr("class", "active");
                    $('#WaiversFeeAgreement').show();
                    //if ($("#WaivAgreementBeginDate").val() == "") {
                    //    //同步协议开始时间                    
                    //    $("#WaivAgreementBeginDate").val($("input[name='CreYear1']").val() + "-" + $("input[name='CreMonth1']").val() + "-01");
                    //    //协议结束时间
                    //    $("#WaivAgreementEndDate").val($("input[name='CreYear2']").val() + "-" + $("input[name='CreMonth2']").val() + "-01");
                    //    //协议签订时间
                    //    $("#WaivAgreementDate").val($("input[name='CreYear1']").val() + "-" + $("input[name='CreMonth1']").val() + "-01");
                    //}

                    $('#WaivAgreementMoney').val($('#WaivAmount').val());

                    showintroduceSel();
                    var obj = $("#ddlWaiversCategory option:selected");
                    var ss = obj.text();
                    var sss = "物业代付";
                    if (sss == ss) {
                        $('#recommend6').addClass('hiHide');
                    }

                }
                else if (hiTab == "4") {
                    var FromIndex = $("#FromIndex").val();
                    if (FromIndex == "") {
                        FromIndex = 0;
                    }
                    $("#WaiverReceivableDetails").attr("src", "WaiverReceivableDetails.aspx?OpType=" + $('#hiOPType').val() + "&WaivID=" + $('#WaivID').val() + "&WaivAgreement=" + $('#WaivAgreement').val() + "&IsTransfer=" + $("#hiIsTransfer").val() + '&FromIndex=' + FromIndex);
                    $('#tab-4').attr("class", "tab-pane active");
                    $('#WaiversFeeAgreement').attr("refsel", "1");
                    $('#WaiverReceivableDetails1').attr("class", "active");
                }
            }

            $('#RecommenderName').dblclick(function (e) {
                var conent = "../DialogNew/CustSuperDlg.aspx";
                HDialog.Open('1000', '600', conent, '介绍人选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RecommenderName').val(data.CustName);
                    $('#Recommender').val(data.CustID);
                    $('#RecommenderOrgan').val(data.OrganCode);
                    $('#RecommenderOrganName').val(data.OrganName);
                    $('#RecommenderComm').val(data.CommID);
                    $('#RecommenderCommName').val(data.CommName);

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#Recommender").val()),
                        function Init() {
                        },
                        function callback(RoomSignData) {
                            varObjects = JSON.parse(RoomSignData);
                            if (varObjects.length > 0) {
                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {
                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";
                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;
                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });
                                }

                                $("#SelRRoomID").find("option").remove();
                                for (var i = 0; i < RoomData.length; i++) {
                                    $("#SelRRoomID").append("<option value='" + RoomData[i].RoomID + "'>" + RoomData[i].RoomText + "</option>");
                                }
                                $("#SelRRoomID").selected = 1;
                                var obj = $("#SelRRoomID option:selected");
                                $("#RecommenderAddr").val(obj.text())
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            })

            $('#BeRecommender').dblclick(function (e) {
                var conent = "../DialogNew/CustSuperDlg.aspx";
                HDialog.Open('1000', '600', conent, '介绍人选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#BeRecommenderName').val(data.CustName);
                    $('#BeRecommender').val(data.CustID);
                    $('#BeRecommenderOrgan').val(data.OrganCode);
                    $('#BeRecommenderOrganName').val(data.OrganName);
                    $('#BeRecommenderComm').val(data.CommID);
                    $('#BeRecommenderCommName').val(data.CommName);
                })
            })

            //代付单位
            function SelConstUnitName() {
                HDialog.Open(900, 500, '../DialogNew/SelConstUnitName.aspx', "选择代付房产公司名称", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#PaidUnit").val(arrRet.BasicsID);
                    $("#PaidUnitName").val(arrRet.ConstUnitName);
                });
            }

            function InitTab() {

                var obj = $("#ddlWaiversCategory option:selected");
                var ss = obj.text();
                var sss = "应收调帐";
                if (ss == sss || obj.text() == "") {
                    $('#WaiversFeeAgreement').hide();
                }
            }

            InitTab();
            InitTabPage();
            $(document).ready(
                $("#SelRRoomID").change(function () {
                    var obj = $("#SelRRoomID option:selected");
                    $("#RecommenderAddr").val(obj.text())
                }));
            $(document).ready(
                $("#ddlWaiversCategory").change(function () {
                    var obj = $("#ddlWaiversCategory option:selected");
                    var ss = obj.text();
                    var sss = "应收调帐";
                    if (ss == sss || obj.text() == "") {
                        $('#WaiversFeeAgreement').hide();
                    }
                    else {
                        $('#WaiversFeeAgreement').show();
                    }
                })
            );
        </script>
    </form>

</body>
</html>
