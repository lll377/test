<%@ Page Language="c#" CodeBehind="NewBankSurrManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.NewBankSurrManage" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>BankSurrManage</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script type="text/javascript">
		<!--

    function CheckData() {


        return true;
    }

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    $(function () {

        if (GetQueryString("ivrShowType") == "1") {
            $('body').pagewalkthrough({
                name: 'introduction3',
                steps: [
                    {
                        wrapper: '#btnDeal',
                        popup: {
                            content: '�ϴ������ļ�������ȷ�ϴ��ۡ���ť��',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function () {
                            HDialog.Close("1");
                        }
                    }
                ]
                ,
                buttons: {
                    jpwNext: {
                        i18n: "��һ�� &rarr;"
                    },
                    jpwFinish: {
                        i18n: "����ָ�� &#10004;",
                    },
                    jpwPrevious: {
                        i18n: "&larr; ��һ��"
                    },
                    jpwClose: {
                        i18n: "�ر�",
                    }
                }
            })

            $('body').pagewalkthrough('show');
        }

    });

    //-->
    </script>
    <style>
        .tabs-container .panel-body {
            padding: 0px;
        }

        /*table tr {
            border: 1px double #F6F6F6;
        }*/
    </style>

    <script type="text/javascript">

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body style="overflow-y: auto" onload="Win_OnLoad()">
    <form id="BankSurrManage" method="post" runat="server">
        <input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server"><input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
                runat="server">
        <input id="SurrID" style="width: 24px; height: 22px" type="hidden" size="1" name="SurrID"
            runat="server">
        <input id="SurrState" style="width: 24px; height: 22px" type="hidden" size="1" name="SurrState"
            runat="server">
        <input id="BackFileName" style="width: 24px; height: 22px" type="hidden" size="1" name="BackFileName"
            runat="server">
        <input id="BankID" style="width: 24px; height: 22px" type="hidden" size="1" name="BankID"
            runat="server"><input id="WriteDir" style="width: 24px; height: 22px" type="hidden" size="1" name="WriteDir"
                runat="server"><input id="BackPerRowFormat" style="width: 24px; height: 22px" type="hidden" size="1" name="BackPerRowFormat"
                    runat="server"><input id="hiFileType" style="width: 24px; height: 22px" type="hidden" size="1" name="hiFileType"
                        runat="server"><input id="hiFirstName" style="width: 24px; height: 22px" type="hidden" size="1" name="hiFirstName"
                            runat="server">

        <input id="IsUpLoad" style="width: 24px; height: 22px" type="hidden" size="1" name="IsUpLoad"
            runat="server">

        <input id="print" type="button" name="print" runat="server" onserverclick="print_ServerClick" />

        <input id="printAll" type="button" name="printAll" runat="server" />

        <input id="printSel" type="button" name="printSel" runat="server" onserverclick="printSel_ServerClick" />
        <input id="RowData" type="hidden" name="RowData" runat="server" />
        <input id="AllReceData" name="AllReceData" type="hidden" runat="server" />
        <input style="width: 24px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms"
            runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="Divreport" name="Divreport" style="width: 100%;" class="easyui-layout" title="�б�ѡ�">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="custinfo" id="custpage" refpage="" refsel="1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="true" style="font: bolder 16px large">������Ϣ</a>
                    </li>
                    <li class="" name="roominfo" id="roompage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false" style="font: bolder 16px large">��ϸ��Ϣ</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane" active>
                        <div class="panel-body">
                            <div class="Frm">
                                <div class="SearchContainer" style="background-color: #FFFFFF;" id="TableContainer1">
                                    <br />
                                    <table class="DialogTable" style="line-height: 25px; background-color: #FFFFFF; text-align: left; font-family: ΢���ź�;">

                                        <tr>
                                            <td class="TdTitle">���ش����ļ�</td>
                                            <td class="TdContent">
                                                <input class="button" id="btnDown" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="������ϸ�ļ�" name="btnDown" runat="server">&nbsp;&nbsp;<input class="button" id="btnDown2" onclick="javascript: if (CheckData() == false) return false;"
                                                        type="button" value="���ۻ����ļ�" name="btnDown2" runat="server"></td>
                                            <td class="TdTitle">���ش��ۼ�¼</td>
                                            <td class="TdContent">
                                                <input class="button" id="BtnBankSurr"
                                                    type="button" value="���ۼ�¼" name="BtnBankSurr" runat="server" style="display: none;">

                                                <input class="button" id="BtnBankSurr1"
                                                    type="button" value="���ۼ�¼" name="BtnBankSurr1" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">��ʼʱ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BeginDate" runat="server"></asp:Label></td>
                                            <td class="TdTitle">���ʱ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="ChargeDate" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">Ӧ��������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllCounts1" runat="server"></asp:Label></td>
                                            <td class="TdTitle">Ӧ������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllAmount1" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�Ѵ�������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllCounts2" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�Ѵ�����</td>
                                            <td class="TdContent">
                                                <asp:Label ID="AllAmount2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">������������</td>
                                            <td class="TdContent">
                                                <asp:Label ID="BankName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">�� �� ��</td>
                                            <td class="TdContent">
                                                <asp:Label ID="HandlingCharge" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">�տʽ</td>
                                            <td class="TdContent">
                                                <select id="ChargeMode" name="ChargeMode" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle">�վ���ʽ</td>
                                            <td class="TdContent">
                                                <select id="UseRepID" name="UseRepID" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">״̬</td>
                                            <td class="TdContent">
                                                <asp:Label ID="SurrStateName" runat="server"></asp:Label></td>
                                            <td class="TdTitle">����Ա</td>
                                            <td class="TdContent">
                                                <asp:Label ID="UserName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">
                                                <asp:Label ID="LabelFile" runat="server">�ϴ������ļ�</asp:Label></td>
                                            <td class="TdContent" colspan="3">
                                                <input id="btnFile" style="width: 400px; height: 22px" type="file" size="56" name="btnFile"
                                                    runat="server"><div style="height: 8px;"></div>
                                                <input class="button" id="btnUpLoad" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="��ʼ�ϴ�" name="btnUpLoad" runat="server">&nbsp;&nbsp;<input class="button" id="btnDeal" onclick="DealData();"
                                                        type="button" value="ȷ�ϴ���" name="btnDeal" runat="server">&nbsp;&nbsp;<input class="button" id="btnContinue" onclick="javascript: if (CheckData() == false) return false;"
                                                            type="button" value="��������" name="btnContinue" runat="server">&nbsp;&nbsp;<input class="button" id="btnOk" onclick="javascript: if (CheckData() == false) return false;"
                                                                type="button" value="��ɴ���" name="btnOk" runat="server"><div style="height: 8px;"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">
                                                <asp:Label ID="LabelResults" runat="server">������Ϣ</asp:Label></td>
                                            <td class="TdContent" colspan="3">
                                                <textarea id="TextResults" style="width: 100%" name="TextResults" rows="6" runat="server"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_Footer" align="center" colspan="4">
                                                <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="����" name="btnSave" runat="server">&nbsp;&nbsp;<input class="button" id="btnSet" type="button" value="��������Ʊ��"
                                                        name="btnSet" runat="server">&nbsp;&nbsp;<input id="Btn_Excel" class="button" value="�������(����)"
                                                            type="button" name="Btn_Excel" runat="server">&nbsp;&nbsp;<input id="Btn_Excel2" class="button" value="�������(��ϸ)"
                                                                type="button" name="Btn_Excel2" runat="server">&nbsp;&nbsp;<input id="Btn_Excel3" class="button" value="�������(��ϸ)"
                                                                    type="button" name="Btn_Excel3" runat="server">&nbsp;&nbsp;<input class="button" id="btnReturn" type="button" value="�ر�" name="btnReturn"
                                                                        runat="server"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer">
                                    1111111111
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 150px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">�Ƿ�ɹ�
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsSucc" name="IsSucc" runat="server"></select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>
                    </td>
                </tr>
            </table>
        </div>



        <script type="text/javascript">

            //��ȡurl�еĲ���
            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //����һ������Ŀ�������������ʽ����
                var r = window.location.search.substr(1).match(reg); //ƥ��Ŀ�����
                if (r != null) return decodeURI(r[2]); return null; //���ز���ֵ
            }
            $(function () {
                if (getUrlParam('BankName') == "�������ߴ���" || getUrlParam('BankName') == "ͨ������֧��" || getUrlParam('BankName') == "����ͨ����֧��") {
                    $("#btnUpLoad").attr("style", "display:none");
                    $("#btnDeal").attr("style", "display:none");
                    $("#btnContinue").attr("style", "display:none");
                    $("#btnOk").attr("style", "display:none");
                    $("#BtnBankSurr").attr("style", "display:none");
                    $("#btnSave").attr("style", "display:none");
                    $("#Btn_Excel3").attr("style", "display:none");
                }
            });

            $('#BtnBankSurr1').click(function () {
                //alert();
                $('#BtnBankSurr').click();
            });

            function InitTableHeight() {
                var h = $(window).height() - 38;

                $('#tab-1').attr("class", "tab-pane active");
                $(".Frm").css({ "height": h + "px" });

                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            $(".tabs-container li").click(function () {

                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");


                $('#custinfo').attr("refsel", "0");
                $('#roominfo').attr("refsel", "0");


                $('#custinfo').attr("class", "");
                $('#roominfo').attr("class", "");



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

                        LoadList();
                        break;

                }

            });



            function Init() {
                $('#btnSet').hide();
                $('#Btn_Excel2').hide();
                $('#Btn_Excel').hide();

                $('#print').hide();
                $('#printSel').hide();
                $('#printAll').hide();

            }

            Init();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'SNum', title: '���', width: 140, align: 'left', sortable: true },
                { field: 'DealCode', title: '��������Ϣ', width: 100, align: 'left', sortable: true },
                {
                    field: 'CustName', title: '�ͻ�����', width: 140, align: 'left', sortable: true, sortable: true,
                    formatter: function (value, row, index) {


                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.IID + "','" + row.SurrID + "','" + row.CustID + "','" + row.RoomID + "');\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '���ݱ��', width: 140, align: 'left', sortable: true },
                { field: 'RoomName', title: '��������', width: 140, align: 'left', sortable: true },
                { field: 'ParkName', title: '��λ���', width: 180, align: 'left', sortable: true },
                { field: 'BankAccount', title: '�����˺�', width: 140, align: 'left', sortable: true },
                { field: 'PaymentTime', title: '����·�', width: 100, align: 'left', sortable: true },
                { field: 'ActAllDueAmount', title: '���ս��С��', width: 100, align: 'left', sortable: true },
                { field: 'ActPaidAmount', title: '�Ѵ��ս��', width: 100, align: 'left', sortable: true },
                { field: 'IsSuccName', title: '�Ƿ�ɹ�', width: 100, align: 'left', sortable: true },
                { field: 'ErrMsg', title: '���з�����Ϣ', width: 200, align: 'left', sortable: true },
                { field: 'BillsSign', title: '�վݺ���', width: 100, align: 'left', sortable: true }



            ]];



            function ViewDetail(strIID, strSurrID, strCustID, strRoomID) {

                var conent = '../ChargesNew/BankRecordDetailBrowse.aspx?IID=' + strIID + '&SurrID=' + strSurrID + '&CustID=' + strCustID + '&RoomID=' + strRoomID;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, '����Ʊ�ݺ���', true, function callback(_Data) {
                    LoadList();
                });

            }

            var toolbar = [

                {
                    text: 'ɸѡ',
                    iconCls: 'icon-search',
                    handler: function () {

                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '��������Ʊ��',
                    iconCls: 'icon-save',
                    handler: function () {
                        //$('#btnSet').click();


                        var width = $(window).width();
                        var height = $(window).height();;
                        var conent = "../ChargesNew/BankSurrSetManage.aspx?OPType=Edit&SurrID=" + $('#SurrID').val();

                        HDialog.Open(width, height, conent, '��������Ʊ��', false, function callback(_Data) {
                            LoadList();
                        });


                    }
                }
                , '-',
                {
                    text: '��ӡԤ��',
                    iconCls: 'icon-print',
                    handler: function () {

                        var row = $('#TableContainer').datagrid('getChecked');

                        if (row == "" || row == undefined) { HDialog.Info('��ѡ��ҪԤ����Ʊ��!'); }
                        else {
                            if (row.ReceID == '') {
                                HDialog.Info('��ѡ����̳ɹ�������!');
                            }
                            else {
                                $('RowData').val(JSON.stringify(row));
                                document.getElementById('RowData').value = JSON.stringify(row);
                                $('#printSel').click();
                            }
                        }
                    }
                }, '-',
                {
                    text: '��ӡƱ��',
                    iconCls: 'icon-print',
                    handler: function () {

                        var row = $('#TableContainer').datagrid('getChecked');
                        if (row == "") {
                            HDialog.Info('��ѡ��Ҫ��ӡ��Ʊ��!');
                        }
                        else {

                            $('RowData').val(JSON.stringify(row));
                            document.getElementById('RowData').value = JSON.stringify(row);

                            $('#print').click();

                            //if (row.ReceID == '') {
                            //    HDialog.Info('��ѡ����̳ɹ�������!');
                            //}
                            //else {
                            //    $('RowData').val(JSON.stringify(row));
                            //    document.getElementById('RowData').value = JSON.stringify(row);

                            //    $('#btnPrint').click();
                            //}
                        }
                    }
                }, '-',
                {
                    text: '������ӡ',
                    iconCls: 'icon-print',
                    handler: function () {

                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('��ѡ��Ҫ��ӡ��Ʊ��!');
                        }
                        else {

                            var SelData = JSON.stringify(rows);
                            $('#AllReceData').val(SelData);

                            $('#printAll').click();
                        }
                    }
                }, '-',

                {
                    text: '���ջ������',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        $('#Btn_Excel').click();

                    }
                }
                , '-',
                {
                    text: '������ϸ���',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        $('#Btn_Excel2').click();
                    }
                }, '-',
                {
                    text: '������ϸ���',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        $('#Btn_Excel3').click();
                    }
                }, '-',
                {
                    text: '<font color=red >*�粻����Ʊ�ţ�Ĭ��ϵͳ�տ���ˮ�ţ�</br>��������Ʊ�ţ������¼�������û�������������Ʊ�š�������ʼƱ�š�</font>',
                }
            ];

            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    //title: '������ϸ',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CustBank", "BankRecordBatchList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            for (var i = 0; i < data.rows.length; i++) {
                                if (data.rows[i].ReceID == '' || data.rows[i].IsSucc == '' || data.rows[i].IsSucc == '0') {
                                    $("input[type='checkbox']")[i + 1].disabled = true;
                                }

                            }
                        }
                    },
                    onCheckAll: function (rows) {

                        $("input[type='checkbox']").each(function (index, el) {
                            var Data = JSON.stringify(rows[index]);
                            if (el.disabled) {
                                $(el).removeAttr("checked");
                            }
                        });

                        //var rows = $('#TableContainer').datagrid("getChecked");
                        //$.each(rows, function (index, item) {
                        //    var Data = JSON.stringify(item);
                        //    var ss = document.getElementById("AllReceData").value;
                        //    if (ss.indexOf(Data) < 0) {

                        //            if (Data.ReceID != '' &&  Data.IsSucc == '1') {
                        //            document.getElementById("AllReceData").value = document.getElementById("AllReceData").value + "," + Data;
                        //        }
                        //    }
                        //});
                        //if (document.getElementById("AllReceData").value.substr(0, 1) == ",")
                        //    document.getElementById("AllReceData").value = document.getElementById("AllReceData").value.substr(1, document.getElementById("AllReceData").value.length - 1);

                    },
                    onUncheckAll: function (rows) {
                        //var ss = document.getElementById("AllReceData").value;

                        //$.each(rows, function (index, item) {
                        //    var Data = JSON.stringify(item);

                        //    if (ss.indexOf(Data) > -1) {
                        //        ss = ss.replace(Data, "");
                        //    }
                        //    document.getElementById("AllReceData").value = ss;
                        //});
                        //if (document.getElementById("AllReceData").value.substr(0, 1) == ",")
                        //    document.getElementById("AllReceData").value = document.getElementById("AllReceData").value.substr(1, document.getElementById("AllReceData").value.length - 1);



                    }
                });
                $('#SearchDlg').dialog('close');
            }
            //LoadList();
            $('#btnReturn').click(function () {

                HDialog.Close(1);
            });

            var ProgressInterval;

            function DealData() {
                if ($("#IsUpLoad").val() == "" || $("#IsUpLoad").val() == "0") {
                    HDialog.Info("�����ϴ��ļ�!");
                    return;
                }

                //��������
                StartTask();
                //չʾ����
                ShowProgress();
                //��ȡִ���������
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }


            function StartTask() {
                //����һ������
                $.tool.DataPostNoLoading('BankSurr', 'StartTask', $('#BankSurrManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //չʾ����
            ShowProgress();
            //��ȡִ���������
            ProgressInterval = setInterval("TakeProgress()", 1000);


            //��ȡ����
            function TakeProgress() {
                $.tool.DataPostNoLoading('BankSurr', 'TakeProgress', $('#BankSurrManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);

                        if (_Data == '[]') {
                            LoadList();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                LoadList();
                                CloseProgress();

                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //��ʾ����
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //�رս���
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //���ý���
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
        </script>

    </form>
</body>
</html>
