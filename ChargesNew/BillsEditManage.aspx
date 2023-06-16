<%@ Page Language="c#" CodeBehind="BillsEditManage.aspx.cs" AutoEventWireup="false"  EnableEventValidation="false" Inherits="M_Main.ChargesNew.BillsEditManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title></title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		<!--
    function CheckData() {
        if (getObject("ckSel1").checked == true) {
            if (BillsEditManage.BillTypeID.value == "") {
                HDialog.Info("��ѡ��Ʊ�����,�����Ϊ��!");
                BillsEditManage.BillTypeID.focus();
                return false;
            }

            if (BillsEditManage.hiBillsSign.value == "") {
                HDialog.Info("��ѡ��Ʊ�ݺ�,�����Ϊ��!");
                BillsEditManage.btnSelBillsSign.focus();
                return false;
            }
        }
        else {
            if (getObject("ckSel2").checked == true) {
                if (BillsEditManage.OtherReceID.value == "0") {
                    BillsEditManage.OtherReceID.value = "";
                }

                if (BillsEditManage.OtherReceID.value == "") {
                    HDialog.Info("��ѡ������Ʊ��,�����Ϊ��!");
                    BillsEditManage.btnSelFeesReceipts.focus();
                    return false;
                }
            }
            else {
                if (BillsEditManage.PrecReceID.value == "0") {
                    BillsEditManage.PrecReceID.value = "";
                }

                if (BillsEditManage.PrecReceID.value == "") {
                    HDialog.Info("��ѡ������Ʊ��,�����Ϊ��!");
                    BillsEditManage.btnSelPreCostsReceipts.focus();
                    return false;
                }
            }
        }
        return true;
    }

    function btnSelFeesReceipts_onClick() {
        var strOldReceID = getObject("ReceID").value;

        var varReturn;
        varReturn = showModalDlg("../dialog/FeesReceiptsDlg.aspx?ReceID=" + strOldReceID + "&Rdm=" + Math.random(), "", 650, 430);

        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");
            BillsEditManage.OtherReceID.value = varObjects[0];
            BillsEditManage.OtherBillsSign.value = varObjects[1];
            BillsEditManage.hiOtherBillsSign.value = varObjects[1];

            BillsEditManage.OtherBillsAmount.value = varObjects[2];


            return true;
        }

        return false;
    }

    function btnSelPreCostsReceipts_onClick() {
        var strOldReceID = getObject("ReceID").value;

        var varReturn;
        varReturn = showModalDlg("../dialog/PreCostsReceiptsDlg.aspx?ReceID=" + strOldReceID + "&Rdm=" + Math.random(), "", 650, 430);

        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");
            BillsEditManage.PrecReceID.value = varObjects[0];
            BillsEditManage.PrecBillsSign.value = varObjects[1];
            BillsEditManage.hiPrecBillsSign.value = varObjects[1];

            BillsEditManage.PrecBillsAmount.value = varObjects[2];


            return true;
        }

        return false;
    }

    function btnSelBillsSign_OnClick() {
        var strBillTypeID = getObject("BillTypeID").value;
        var strBillsSigns;
        var iFixedAmount = 0;

        if ((strBillTypeID == "0") || (strBillTypeID == "")) {
            HDialog.Info("��ѡ��Ʊ�����,�����Ϊ��!");
            BillsEditManage.BillTypeID.focus();
            return false;
        }

        var varReturn;

        varReturn = showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), "", 650, 430);

        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            BillsEditManage.BillsSign.value = varObjects[0];
            BillsEditManage.hiBillsSign.value = varObjects[0];

            return true;
        }

        return false;
    }

    function onclickckSel() {
        if (getObject("ckSel1").checked == true) {
            getObject("TrSel1").style.display = "block";
            getObject("TrSel2").style.display = "none";
            getObject("TrSel3").style.display = "none";
        }
        else {
            if (getObject("ckSel2").checked == true) {
                getObject("TrSel1").style.display = "none";
                getObject("TrSel2").style.display = "block";
                getObject("TrSel3").style.display = "none";
            }
            else {
                getObject("TrSel1").style.display = "none";
                getObject("TrSel2").style.display = "none";
                getObject("TrSel3").style.display = "block";
            }
        }
    }

    //-->
    </script>
    <script  type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow-y:auto;">

    <form id="BillsEditManage" method="post" runat="server">
        <input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
            runat="server" />
        <input id="ReceID" style="width: 24px; height: 22px" type="hidden" size="1" name="ReceID"
            runat="server" />
        <input id="hiOldBillsSign" style="width: 24px; height: 21px" type="hidden" size="1" name="hiOldBillsSign"
            runat="server" /><input id="BillKind" style="width: 24px; height: 21px" type="hidden" size="1" name="BillKind"
                runat="server" /><input id="hiBillsDate" style="width: 24px; height: 21px" type="hidden" size="1" name="hiBillsDate"
                    runat="server" /><input id="OldBillTypeID" style="width: 24px; height: 21px" type="hidden" size="1" name="OldBillTypeID"
                        runat="server" />
        <table class="DialogTable" id="DialogTable">
            <tr>
                <td colspan="4" style="background-color: #e6e6e6" align="center"><span style="font-size: 16px">ԭƱ����Ϣ</span></td>
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
                <td class="TdTitle">Ʊ�ݺ���</td>
                <td class="TdContent">
                    <asp:Label ID="OldBillsSign" runat="server"></asp:Label></td>
                <td class="TdTitle">�շ�����</td>
                <td class="TdContent">
                    <asp:Label ID="BillsDate" runat="server"></asp:Label></td>
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
                <td class="TdTitle">�տʽ</td>
                <td class="TdContent">
                    <asp:Label ID="ChargeMode" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">�տ���</td>
                <td class="TdContent">
                    <asp:Label ID="UserName" runat="server"></asp:Label></td>
                <td class="TdTitle">�վ���ʽ</td>
                <td class="TdContent">
                    <select id="UseRepID" name="UseRepID" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">���ñ�ע</td>
                <td class="TdContent" colspan="3">
                    <asp:Label ID="ReceMemo" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" style="background-color: #e6e6e6" align="center"><span style="font-size: 16px">��Ʊ�ݺ�ѡ��</span></td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContent" colspan="3">
                    <asp:RadioButton ID="ckSel1" runat="server" Checked="True" GroupName="ckSel" Text="δʹ�õĿհ��վ�"></asp:RadioButton><asp:RadioButton ID="ckSel2" runat="server" GroupName="ckSel" Text="��ʹ�õ��տ��վݣ��Ի���"></asp:RadioButton>
                    <asp:RadioButton ID="ckSel3" runat="server" Text="��ʹ�õ�Ԥ���վݣ��Ի���" GroupName="ckSel"></asp:RadioButton></td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td colspan="3">
                    <table style="width: 100%">
                        <tr id="TrSel1" style="display: block">
                            <td width="20%">δ��Ʊ�ݺ�</td>
                            <td width="80%" align="left">Ʊ�����<asp:DropDownList ID="BillTypeID" runat="server" AutoPostBack="True"></asp:DropDownList>Ʊ 
																	�� �ţ�<input id="BillsSign"  searcher="SelBillsSign" data-options="editable:false"
                                                                        name="BillsSign" runat="server"  class="easyui-searchbox"  /><%--<input class="button_sel" id="btnSelBillsSign" onclick="javascript: if (btnSelBillsSign_OnClick() == false) return false;"
                                                                            type="button" value=" " name="btnSelBillsSign" runat="server">--%><input id="hiBillsSigns" type="hidden"
                                                                                size="1" name="hiBillsSigns" runat="server" /><input id="hiBillsSign" type="hidden"
                                                                                    size="1" name="hiBillsSign" runat="server" /></td>
                        </tr>
                        <tr id="TrSel2" style="display: none">
                            <td width="20%">����Ʊ�ݺ�</td>
                            <td width="80%" align="left">
                                <input  id="OtherBillsSign"   searcher="SelFeesReceipts" style="width:150px"
                                    name="OtherBillsSign" class="easyui-searchbox" runat="server" data-options="editable:false" /><%--<input class="button_sel" id="btnSelFeesReceipts" onclick="javascript: if (btnSelFeesReceipts_onClick() == false) return false;"
                                        type="button" value=" " name="btnSelFeesReceipts" runat="server">--%><input class="Control_ItemInput" id="hiOtherBillsSign" 
                                            type="hidden" size="1" name="hiOtherBillsSign" runat="server"><input class="Control_ItemInput" id="OtherReceID"  type="hidden"
                                                size="1" name="OtherReceID" runat="server"/>��<input class="Control_ItemInput" id="OtherBillsAmount" style="width: 150px" readonly maxlength="50"
                                                    name="OtherBillsAmount" runat="server"/></td>
                        </tr>
                        <tr id="TrSel3" style="display: none">
                            <td width="20%">����Ԥ����</td>
                            <td width="80%" align="left">
                                <input id="PrecBillsSign"  searcher="SelPreCostsReceipts"
                                    name="PrecBillsSign" runat="server" class="easyui-searchbox"  data-options="editable:false" style="width:150px" /><%--<input class="button_sel" id="btnSelPreCostsReceipts" onclick="javascript: if (btnSelPreCostsReceipts_onClick() == false) return false;"
                                        type="button" value=" " name="btnSelPreCostsReceipts" runat="server" />--%><input class="Control_ItemInput" id="hiPrecBillsSign"
                                            type="hidden" size="1" name="hiPrecBillsSign" runat="server" /><input class="Control_ItemInput" id="PrecReceID"  type="hidden"
                                                size="1" name="PrecReceID" runat="server" />��<input class="Control_ItemInput" id="PrecBillsAmount" style="width: 150px" readonly maxlength="50"
                                                    name="PrecBillsAmount" runat="server" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="����" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                                            <input class="button" id="btnReturn" type="button" value="����" name="btnFilter"
                                                runat="server"></td>
            </tr>
        </table>
       <div class="SearchContainer" id="FeesDetailTableContainer">
        </div>
        <div class="SearchContainer" id="PreCostsDetailTableContainer">
        </div>

        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                var h1 = $('#DialogTable').height();

                var p = h - h1 - 200;

                $("#FeesDetailTableContainer").css("height", '200px');
                $("#PreCostsDetailTableContainer").css("height", p + "px");

              
                
            }
            InitFunction();


            function SelBillsSign()
            {

           

                var strBillTypeID = getObject("BillTypeID").value;
                var strBillsSigns;
                var iFixedAmount = 0;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    HDialog.Info("��ѡ��Ʊ�����,�����Ϊ��!");
                    BillsEditManage.BillTypeID.focus();
                    return;
                }

                var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, 'Ʊ�ݺ�ѡ��', false, function callback(_Data) {
                    
                    var varObjects = _Data;

                    $('#BillsSign').searchbox("setValue", varObjects);
                 
                    $('#hiBillsSign').val(varObjects);

                });

            }
            function SelFeesReceipts()
            {
                var strOldReceID = getObject("ReceID").value;


                var conent = "../dialogNew/FeesReceiptsDlg.aspx?ReceID=" + strOldReceID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, '�վ�ѡ��', false, function callback(_Data) {

                    var varReturn = _Data;
                   
                    if (varReturn != "") 
                    {
                        var varObjects = varReturn.split("\t");
                 
                        $('#OtherReceID').val(varObjects[0]);
                        $('#OtherBillsSign').searchbox("setValue", varObjects[1]);
                        $('#hiOtherBillsSign').val(varObjects[1]);
                        $('#OtherBillsAmount').val(varObjects[2]);

                    }
                });
            }
            function SelPreCostsReceipts()
            {


                var strOldReceID = getObject("ReceID").value;


                var conent = "../dialogNew/PreCostsReceiptsDlg.aspx?ReceID=" + strOldReceID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, '�վ�ѡ��', false, function callback(_Data) {

                    var varReturn = _Data;
                    if (varReturn != "") {
                        var varObjects = varReturn.split("\t");

                        $('#PrecReceID').val(varObjects[0]);
                        $('#PrecBillsSign').searchbox("setValue", varObjects[1]);
                        $('#hiPrecBillsSign').val(varObjects[1]);
                        $('#PrecBillsAmount').val(varObjects[2]);

                    }

                });
               
            }
            var FeesDetailcolumn = [[
                { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                 { field: 'BillsSign', title: '�վݺ���', width: 100, align: 'left', sortable: true },
                 { field: 'CustName', title: '�ͻ�����', width: 100, align: 'left', sortable: true },
                  { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
                {
                    field: 'ChargeDate', title: '�տ�ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ChargeDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                }, {
                    field: 'FeesDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesDueDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'CostSNum', title: '�������', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },

                { field: 'ChargeAmount', title: '�տ���', width: 100, align: 'left', sortable: true },
                { field: 'LateFeeAmount', title: '��ͬΥԼ��', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '�տ���', width: 100, align: 'left', sortable: true },
                  { field: 'ChargeMode', title: '�տʽ', width: 100, align: 'left', sortable: true },
                { field: 'ReceMemo', title: '��ע', width: 100, align: 'left', sortable: true }
            ]];
            var PreCostsDetailcolumn = [[
             { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
             {
                 field: 'PrecDate', title: '�տ�ʱ��', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                     var str = formatDate(row.PrecDate, "yyyy-MM-dd HH:mm:ss");
                     return str;
                 }
             },
             { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
             { field: 'FeeDueYearMonth', title: '��������', width: 100, align: 'left', sortable: true },
             {
                 field: 'AccountsDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                     var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd HH:mm:ss");
                     return str;
                 }
             },
             {
                 field: 'FeesStateDate', title: '��ʼ����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                     var str = formatDate(row.FeesStateDate, "yyyy-MM-dd HH:mm:ss");
                     return str;
                 }
             },
             {
                 field: 'FeesEndDate', title: '��������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                     var str = formatDate(row.FeesEndDate, "yyyy-MM-dd HH:mm:ss");
                     return str;
                 }
             },
             { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
             { field: 'PrecAmount', title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
             { field: 'UserName', title: 'Ԥ��������', width: 100, align: 'left', sortable: true },
             { field: 'PrecMemo', title: '��ע', width: 100, align: 'left', sortable: true }
            ]];

             function LoadList() {


                $("#FeesDetailTableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    title: '����ȡ�ķ���',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: FeesDetailcolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    border:true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesReceipts", "FeesDetail", "FeesDetailTableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });



                $("#PreCostsDetailTableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    title: '����ȡ��Ԥ�շ���',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: PreCostsDetailcolumn,
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
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesReceipts", "PreCostsDetail", "PreCostsDetailTableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }
            LoadList();

        </script>
        </script>
    </form>
</body>
</html>
