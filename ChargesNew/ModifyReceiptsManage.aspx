<%@ Page Language="c#" CodeBehind="ModifyReceiptsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.ModifyReceiptsManage" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>ModifyReceiptsManage</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        var nDate;
        $(function () {
            LoadList();
            LoadPrecList();
            nDate = $('#nYear1').val() + '-' + $('#nMonth1').val() + '-' + $('#nDay1').val() + ' ' + $('#nHour1').val() + ':' + $('#nMinute1').val() + ":00";
            nDate = new Date(nDate.replace("-", "/").replace("-", "/"));

            var varChargeMode = $('#ChargeMode').find("option:selected").text();
            var ob = JSON.parse($("#NOChangeType").val());
            for (var i = 0; i < ob.length; i++) {
                if (varChargeMode == ob[i].DictionaryName) {

                    $('#ChargeMode').attr('disabled', 'disabled');
                    break;
                }
            }

        });

        function CheckIsOverAcount() {
            if (CheckData()) {
                $('#CheckDates').val($('#hiBillsDate').val());
                $.tool.DataPostChk('ModifyReceiptsManage', 'WriteOff', 'CheckIsWriteOff', $('#ModifyReceiptsManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "True") {
                            HDialog.Info("�ѹ��ˣ������޸�!!!");
                            return false;
                        } else {
                            $.tool.DataPostChk('ModifyReceiptsManage', 'WriteOff', 'GetDateByCommIDAndIsType', $('#ModifyReceiptsManage').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var overAccountDate = _Data.split(',');
                                    var setDate = $('#nYear1').val() + '-' + $('#nMonth1').val() + '-' + $('#nDay1').val() + ' ' + $('#nHour1').val() + ':' + $('#nMinute1').val() + ":00";
                                    setDate = new Date(setDate.replace("-", "/").replace("-", "/"));
                                    var overAccountEndDate = new Date(overAccountDate[1].replace("-", "/").replace("-", "/"));
                                    if (nDate < overAccountEndDate) {
                                        HDialog.Info("�ѽ��ˣ������޸ģ�����");
                                        return;
                                    }
                                    if (setDate < overAccountEndDate) {
                                        HDialog.Info("������Ʊ���տ�ʱ���޸ĵ��ѽ���ʱ���!!!<br/>" + overAccountDate[0] + " - " + overAccountDate[1]);
                                    }
                                    else {
                                        $('#ChargeMode').removeAttr('disabled');
                                        $('#btnSave').click();
                                    }
                                }, function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }

        function CheckData() {
            if ($('#ChargeMode').find("option:selected").text() == "") {
                if ($('#hiChargeModes').val() == "") {
                    HDialog.Info("��ѡ���տʽ,�����Ϊ��!");
                    return false;
                }
            }
            return true;
        }

        function CheckChargeMode() {

            var varChargeMode = $('#ChargeMode').find("option:selected").text();

            var ob = JSON.parse($("#NOChangeType").val());
            for (var i = 0; i < ob.length; i++) {
                if (varChargeMode == ob[i].DictionaryName) {

                    ModifyReceiptsManage.ChargeModes.value = "";
                    ModifyReceiptsManage.hiChargeModes.value = "";
                    ModifyReceiptsManage.ChargeModeAmount.value = "";

                    ModifyReceiptsManage.ChargeMode.value = "";
                    HDialog.Info("��ѡ�������տʽ!");
                    return;
                }
            }

            //if (varChargeMode == "��˻�APP") {
            //    ModifyReceiptsManage.ChargeModes.value = "";
            //    ModifyReceiptsManage.hiChargeModes.value = "";
            //    ModifyReceiptsManage.ChargeModeAmount.value = "";

            //    ModifyReceiptsManage.ChargeMode.value = "";
            //    HDialog.Info("��ѡ�������տʽ!");
            //    return;
            //}

            if (varChargeMode == "�����տʽ") {


                var strRenderType = getObject("RenderType").value;

                if (strRenderType == "1") {
                    btnSelChargeMode_OnClick();
                }
                else {
                    ModifyReceiptsManage.ChargeModes.value = "";
                    ModifyReceiptsManage.hiChargeModes.value = "";
                    ModifyReceiptsManage.ChargeModeAmount.value = "";

                    ModifyReceiptsManage.ChargeMode.value = "";
                    HDialog.Info("��ѡ�������տʽ!");
                }
            }
            else {
                if (varChargeMode != "") {
                    ModifyReceiptsManage.ChargeModes.value = "";
                    ModifyReceiptsManage.hiChargeModes.value = "";
                    ModifyReceiptsManage.ChargeModeAmount.value = "";
                }
            }

        }

        function btnSelChargeMode_OnClick() {
            getObject("ChargeMode").value = "�����տʽ";

            var iTotalAmount = 0;
            var varTotalSumAmount = getObject("TotalSumAmount").value
            if (varTotalSumAmount != "") {
                iTotalAmount = parseFloat(varTotalSumAmount);
            }


            HDialog.Open(600, 480, '../dialogNew/ChargeModeDlg.aspx?TotalAmount=' + iTotalAmount + '&Rdm=' + Math.random(), 'ѡ������տʽ', false, function callback(_Data) {
                if (_Data != "") {
                    var varReturn = _Data;
                    var varObjects = varReturn.split("\t");
                    $('#ChargeModes').val(varObjects[0]);
                    $('#hiChargeModes').val(varObjects[1]);
                    $('#ChargeModeAmount').val(varObjects[2]);
                }
                else { getObject("ChargeMode").value = ""; }
            });

            return false;
        }


        //-->
    </script>
</head>
<body style="overflow-y: auto">
    <form id="ModifyReceiptsManage" runat="server" method="post">
        <input type="hidden" name="CheckDates" id="CheckDates" runat="server" />
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server" />
        <input id="hiUseRepID" type="hidden" size="1" name="hiUseRepID" runat="server" />
        <input id="hiBillsDate" type="hidden" size="1" name="hiBillsDate" runat="server" />
        <input id="IsRefer" type="hidden" size="1" name="IsRefer" runat="server" />
        <input id="IsAudit" type="hidden" size="1" name="IsAudit" runat="server" />
        <input id="IsDelete" type="hidden" size="1" name="IsDelete" runat="server" />
        <input id="hiChargeMode" type="hidden" size="1" name="hiChargeMode" runat="server" />
        <input id="TotalSumAmount" type="hidden" size="1" name="TotalSumAmount" runat="server" />
        <input id="RenderType" type="hidden" size="1" name="RenderType" runat="server" />
        <input id="hiChargeModes" type="hidden" size="1" name="hiChargeModes" runat="server" />
        <input id="hiOldChargeModes" type="hidden" size="1" name="hiOldChargeModes" runat="server" />
        <input id="ChargeModeAmount" type="hidden" size="1" name="ChargeModeAmount" runat="server" />
        <input id="ModifyType" size="1" type="hidden" name="ModifyType" runat="server" />
        <input id="NOChangeType" size="1" type="hidden" name="NOChangeType" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle" colspan="4" style="background: #e6e6e6"><span style="font-size: 16px">�վ���Ϣ</span></td>
            </tr>
            <tr>
                <td class="TdTitle">�ͻ�����</td>
                <td class="TdContent">
                    <asp:Label ID="CustName" runat="server"></asp:Label></td>
                <td class="TdTitle">���ݱ��</td>
                <td class="TdContent">
                    <asp:Label ID="RoomSign" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�վݺ���</td>
                <td class="TdContent">
                    <asp:Label ID="BillsSign" runat="server"></asp:Label></td>
                <td class="TdTitle">�շ�����</td>
                <td class="TdContent">
                    <%--  <select id="nYear1" name="nYear1" runat="server">
                        <option selected></option>
                    </select>��<select id="nMonth1" name="nMonth1" runat="server">
                        <option selected></option>
                    </select>��<select id="nDay1" name="nDay1" runat="server">
                        <option selected></option>
                    </select>��<select id="nHour1" name="nHour1" runat="server">
                        <option selected></option>
                    </select>ʱ<select id="nMinute1" name="nMinute1" runat="server">
                        <option selected></option>
                    </select>��</td>--%>
                    <input name="FessCheckDate" type="text" id="FessCheckDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" value="" runat="server" onfocus="WdatePicker({maxDate: '%y-%M-%d %H:%m:%s',dateFmt: 'yyyy-MM-dd HH:mm:ss' })" />
            </tr>
            <tr>
                <td class="TdTitle">�շѺϼ�</td>
                <td class="TdContent">
                    <asp:Label ID="PaidAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">���ν���</td>
                <td class="TdContent">
                    <asp:Label ID="PerSurplus" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">��ת���</td>
                <td class="TdContent">
                    <asp:Label ID="SurplusAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">�տ���</td>
                <td class="TdContent">
                    <asp:Label ID="UserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�վ���ʽ</td>
                <td class="TdContent">
                    <select id="UseRepID" name="UseRepID" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">���ñ�ע</td>
                <td class="TdContent">
                    <div style="overflow: auto; width: 400px; height: 60px;">
                        <asp:Label ID="ReceMemo" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�տʽ</td>
                <td class="TdContent">
                    <select id="ChargeMode" onchange="CheckChargeMode();" name="ChargeMode" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">��ӡ����</td>
                <td class="TdContent">
                    <asp:Label ID="PrintTimes" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td class="TdTitle">�����տʽ</td>
                <td class="TdContent" colspan="3">
                    <input class="Control_ItemInput" id="ChargeModes" style="width: 98%" readonly name="ChargeModes"
                        runat="server"></td>
            </tr>
            
            <tr>
                <td class="TdTitle">��������</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankNameSel" runat="server"/>
                        
                    </td>
                    <td class="TdTitle">�����˺�</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankAccountSel" runat="server"/>
                    </td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnCheckIsOverAcount" onclick="CheckIsOverAcount()" type="button" value="����" name="btnCheckIsOverAcount" runat="server" />
                    <input id="btnSave" style="display: none;" type="button" value="����" name="btnSave" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="����" name="btnFilter"
                        runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
        </table>
        <div id="TableFeesContainer" name="TableFeesContainer" class="easyui-datagrid" style="height: 200px"></div>
        <div id="TablePrecFeesContainer" name="TablePrecFeesContainer" class="easyui-datagrid">333333333333333333333</div>
        <script type="text/javascript">


            function InitFunction() {
                var h = $(window).height();

                h = h - 270;
                $("#TablePrecFeesContainer").css("height", h + 'px');
            }
            InitFunction();

            $("#FessCheckDate").focusout(function () {
                var mydate = new Date();
                mydate.toLocaleString();
                if ($("#FessCheckDate").val() > mydate.toLocaleString()) {
                    $("#FessCheckDate").val(mydate.toLocaleString());
                    HDialog.Info("�շ�ʱ�䲻�ܴ��ڵ�ǰʱ�䣡");
                }
            });

            var Feescolumn = [[

                { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                {
                    field: 'ChargeDate', title: '�տ�ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ChargeDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '��������', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '��ʼʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '����ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ChargeAmount', title: '�տ���', width: 100, align: 'left', sortable: true },
                { field: 'LateFeeAmount', title: '��ͬΥԼ��', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '�տ���', width: 100, align: 'left', sortable: true },
                { field: 'ReceMemo', title: '��ע', width: 100, align: 'left', sortable: true },

            ]];

            var PrecFeescolumn = [[

                { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                {
                    field: 'PrecDate', title: '�տ�ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.PrecDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '��������', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '��ʼʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '����ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'PrecAmount', title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: 'Ԥ��������', width: 100, align: 'left', sortable: true },
                { field: 'PrecMemo', title: '��ע', width: 100, align: 'left', sortable: true },

            ]];

            function LoadList() {


                $("#TableFeesContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesReceipts&Command=FeesDetail&ReceID=' + $('#ReceID').val(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Feescolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: true,
                    title: '����ȡ�ķ���',
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });

            }

            function LoadPrecList() {


                $("#TablePrecFeesContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesReceipts&Command=PreCostsDetail&ReceID=' + $('#ReceID').val(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: PrecFeescolumn,
                    fitColumns: true,
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
                    title: '����ȡ��Ԥ�շ���',
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });

            }

            $('#btnReturn').click(function () {
                HDialog.Close();
            });
            function SelBankSel() {
                var conent = "../DialogNew/SelBankInfoSet.aspx";
                HDialog.Open('1000', '600', conent, '��������ѡ��', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#BankNameSel').searchbox("setValue", data.BankName);
                    $('#BankAccountSel').searchbox("setValue", data.BankAccount);

                });
            }

        </script>
    </form>
</body>
</html>
