<%@ Page Language="c#" CodeBehind="AuditingInputFeesDetailBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.AuditingInputFeesDetailBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>AuditingInputFeesDetailBrowse</title>
   <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script language="javascript">
		<!--
    //��ѯ�Ի���
    function btnFilterMore_OnClick() {
        var TableSign = getObject("TableSign").value;
        if (TableSign != "" && TableSign != null) {
            var strTemplateCode = TableSign;
            var strSearchData = escape(getObject("hiSearchData").value);
            varReturn = showModalDlg("../dialog/SearchDlg.aspx?TemplateCode=" + strTemplateCode + "&SearchData=" + strSearchData, "", 420, 400);

            //alert(varReturn);

            if (varReturn != "") {
                var Search = eval('(' + varReturn + ')');
                getObject("hiSearchSql").value = Search.SqlData.Sql;

                //**�ع�����(���ݽṹΪJSON)					
                var SearchData = Search.SqlData.Data;
                //alert(Search.SqlData.Sql);
                var val = "";
                for (var i = 0; i < SearchData.length; i++) {
                    if (val != "") {
                        val = val + ",{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                    }
                    else {
                        val = "{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                    }
                }
                getObject("hiSearchData").value = "{Data:[" + val + "]}";
            }

            //alert(getObject("hiSearchData").value);
        }
    }
    //-->
    </script>
    <script language="javascript">
		<!--
    function btnClear_OnClick() {
        AuditingBCreDetailBrowse.CustID.value = "";

        AuditingBCreDetailBrowse.CustName.value = "";
        AuditingBCreDetailBrowse.hiCustName.value = "";


        AuditingBCreDetailBrowse.RoomID.value = "";
        AuditingBCreDetailBrowse.RoomSign.value = "";
        AuditingBCreDetailBrowse.hiRoomSign.value = "";


        AuditingBCreDetailBrowse.CostID.value = "";
        AuditingBCreDetailBrowse.CostName.value = "";
        AuditingBCreDetailBrowse.hiCostName.value = "";

        AuditingBCreDetailBrowse.AssumeCustID.value = "";
        AuditingBCreDetailBrowse.AssumeCustName.value = "";
        AuditingBCreDetailBrowse.hiAssumeCustName.value = "";

    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            AuditingBCreDetailBrowse.RoomID.value = varObjects[0];
            AuditingBCreDetailBrowse.RoomSign.value = varObjects[2];
            AuditingBCreDetailBrowse.hiRoomSign.value = varObjects[2];

            AuditingBCreDetailBrowse.CustID.value = varObjects[1];
            AuditingBCreDetailBrowse.CustName.value = varObjects[3];
            AuditingBCreDetailBrowse.hiCustName.value = AuditingBCreDetailBrowse.CustName.value;
            //alert(varReturn);

            return true;
        }

        return false;
    }

    function btnSelCust_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            AuditingBCreDetailBrowse.CustID.value = varObjects[0];
            AuditingBCreDetailBrowse.CustName.value = varObjects[1];
            AuditingBCreDetailBrowse.hiCustName.value = varObjects[1];

            AuditingBCreDetailBrowse.RoomID.value = "";
            AuditingBCreDetailBrowse.RoomSign.value = "";
            AuditingBCreDetailBrowse.hiRoomSign.value = "";

            return true;
        }

        return false;
    }
    function SelRoomID_OnChange() {
        AuditingBCreDetailBrowse.RoomID.value = AuditingBCreDetailBrowse.SelRoomID.options[AuditingBCreDetailBrowse.SelRoomID.selectedIndex].value;
        AuditingBCreDetailBrowse.RoomSign.value = AuditingBCreDetailBrowse.SelRoomID.options[AuditingBCreDetailBrowse.SelRoomID.selectedIndex].text;
        AuditingBCreDetailBrowse.hiRoomSign.value = AuditingBCreDetailBrowse.RoomSign.value;

    }

    function btnSelCost_OnClick() {
        //var tmpCostGeneType = FeesSporadicBrowse.CostGeneType.value; ?CostGeneType="+tmpCostGeneType
        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            AuditingBCreDetailBrowse.CostID.value = varObjects[0];
            AuditingBCreDetailBrowse.CostName.value = varObjects[2];
            AuditingBCreDetailBrowse.hiCostName.value = varObjects[2];

            return true;
        }

        return false;
    }

    function btnSelAssumeCust_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            AuditingBCreDetailBrowse.AssumeCustID.value = varObjects[0];
            AuditingBCreDetailBrowse.AssumeCustName.value = varObjects[1];
            AuditingBCreDetailBrowse.hiAssumeCustName.value = varObjects[1];

            return true;
        }

        return false;
    }

    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
        }


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
            var ly = getQueryVariable("FromIndex");
            if (ly == "t") {
                $("#FromIndex").val("t");
            }
        }
        InitFrom();
    //-->
    </script>
</head>
<body>
    <form id="frmForm" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="AuditID" type="hidden" size="1" name="AuditID" runat="server">
        <input id="IsAuditing" type="hidden" size="1" name="IsAuditing" runat="server">
        <input id="CreYear" type="hidden" size="1" name="CreYear" runat="server">
        <input id="CreMonth" type="hidden" size="1" name="CreMonth" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input id="hiSearchData" type="hidden" size="1" name="hiSearchData" runat="server">
        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql" runat="server">
        <input id="TableSign" type="hidden" size="1" name="TableSign" runat="server">
        <input id="TotalDays" name="TotalDays" type="hidden" runat="server" />
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <input id="FeesRoleCodes" type="hidden" name="FeesRoleCodes" runat="server">
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:ExcuteOnServer(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">ɸѡ</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="AuditingFee(1);" class="l-btn l-btn-small l-btn-plain" group="" id="shtg" name="shtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" id="sshtg" name="sshtg">���ͨ��</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="AuditingFee(2);" class="l-btn l-btn-small l-btn-plain" group="" id="shbtg" name="shbtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">��˲�ͨ��</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="ToExcel();" class="l-btn l-btn-small l-btn-plain" group="" id="excel" name="excel"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">Excel���</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><span id="lbAudit" style="color: red"></span></td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable" style="line-height: 25px;">

                <tr>
                    <td class="TdTitle">�ͻ�����</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server">
                        <input class="button_sel" style="display: none;" id="btnSelCust" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelCust" runat="server">
                        <input id="CustID" type="hidden" name="CustID" runat="server">
                        <input id="hiCustName" type="hidden" name="hiCustName" runat="server">
                    </td>
                    <td class="TdTitle">������Ŀ</td>
                    <td class="TdContentSearch">
                        <input id="CostName" name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server">
                        <input class="button_sel" id="btnSelCost" style="display: none;" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            type="button" value="" name="btnSelCost" runat="server">
                        <input id="hiCostName" type="hidden" size="1" name="hiCostName" runat="server">
                        <input id="CostID" type="hidden" size="1" name="CostID" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server">
                        <input class="button_sel" style="display: none;" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelRoom" runat="server">
                        <input id="RoomID" type="hidden" name="RoomID" runat="server">
                        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server"></td>
                    <td class="TdTitle">¥ ��</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>
                </tr>
                <tr class="SchTable" style="display: none;">
                    <td align="center" colspan="4">
                        <input class="button" id="btnFilter" type="button" value="��ѯ" name="btnFilter" runat="server">
                        <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                            type="button" value="���" name="btnClear">

                        <input class="button_Four" id="btnOk" type="button" value="���ͨ��" name="btnOk" runat="server">
                        <input class="button_Four" id="btnNo" type="button" value="��˲�ͨ��"
                            name="btnNo" runat="server">&nbsp;&nbsp;
                    <input class="button_Four" id="btnExcel" type="button" value="Excel���" name="btnExcel" runat="server">
                        <input class="button_four" id="btnPrint" type="button" value="��    ӡ"
                            name="btnPrint" runat="server">
                        <input class="button_four" id="btnReturn" type="button" value="��������"
                            name="btnFilter" runat="server">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    $(function () {
        LoadList();

    })

    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
        $('#lbAudit').html("���״̬:δ���");

        //if ($('#TotalDays').val() != "0") {


        //    $('#shtg').css("cursor", "default");

        //    $('#shtg').attr('href', '#');     //�޸�<a>�� href����ֵΪ #  ����״̬��������ʾ���ӵ�ַ  

        //    $('#shtg').click(function (event) {
        //        HDialog.Info("�ѳ�ʱ��");

        //    });


        //    $('#sshtg').html("�ѳ�ʱ��");
        //}
        if ($('#IsAuditing').val() != "0") {

            $('#shtg').css("cursor", "default");

            $('#shtg').attr('href', '#');     //�޸�<a>�� href����ֵΪ #  ����״̬��������ʾ���ӵ�ַ  

            $('#shtg').click(function (event) {
                HDialog.Info("���������");

            });



            $('#shbtg').css("cursor", "default");

            $('#shbtg').attr('href', '#');     //�޸�<a>�� href����ֵΪ #  ����״̬��������ʾ���ӵ�ַ  

            $('#shbtg').click(function (event) {
                HDialog.Info("���������");


            });

            //$('#shtg').attr("disabled", "disabled");
            //$('#shbtg').attr("disabled", "disabled");
            if ($('#IsAuditing').val() == "1")
            { $('#lbAudit').html("���״̬:��ͨ��"); }
            if ($('#IsAuditing').val() == "2")
            { $('#lbAudit').html("���״̬:δͨ��"); }

        }

    }

    InitFunction();

    function SelCost() {


        //var vCommID = $('#CommID').val();
        //var tmpCostGeneType = $('#CostGeneType').val();
        var conent = "../dialogNew/CorpCommCostDlg.aspx" + "?Ram=" + Math.random();



        HDialog.Open('700', '400', conent, '�շ���Ŀѡ��', false, function callback(_Data) {


            if (_Data != "") {//**��÷��� ˢ��


                var data = JSON.parse(_Data);
                $('#CostName').searchbox("setValue", data.CostName);
                $('#CostID').val(data.CostID);
                $('#hiCostName').val(data.CostName);

            }
        });

    }



    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = 800;
        var h = 400;

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '�ͻ�ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#hiCustName').val(data.CustName);
        });
    }

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";


        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, conent, '����ѡ��', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

            //$('#BuildArea').val(data.BuildArea);
            //$('#CalcArea').val(data.BuildArea);
        });

    }

    var column = [[
        { field: 'test', title: 'test', align: 'left', sortable: true, width: 120, fixed: true, hidden: true },
        { field: '�ͻ����', title: '�ͻ����', align: 'left', sortable: true, width: 120, fixed: true },
        { field: '�ͻ�����', title: '�ͻ�����', align: 'left', sortable: true, width: 180, fixed: true },
        { field: '¥������', title: '¥������', align: 'left', sortable: true, width: 100, fixed: true },
        { field: '���ݱ��', title: '���ݱ��', align: 'left', sortable: true, width: 140, fixed: true },
        {
            field: '��������', title: '��������', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.��������, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'Ӧ������', title: 'Ӧ������', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.Ӧ������, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: '���ÿ�ʼ����', title: '���ÿ�ʼ����', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.���ÿ�ʼ����, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: '���ý�������', title: '���ý�������', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.���ý�������, "yyyy-MM-dd");
                return str;
            }
        },
        { field: '�������', title: '�������', align: 'left', sortable: true, width: 100, fixed: true },
        { field: '��������', title: '��������', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'Ӧ�ս��', title: 'Ӧ�ս��', align: 'left', sortable: true, width: 80, fixed: true },
        { field: '��λ���', title: '��λ���', align: 'left', sortable: true, width: 100, fixed: true },
        { field: '��ע', title: '��ע', align: 'left', sortable: true, width: 100, fixed: true },
        { field: '����״̬', title: '����״̬', align: 'left', sortable: true, width: 120, fixed: true },
        { field: '�ͻ����', title: '�ͻ����', align: 'left', sortable: true, width: 140, fixed: true }

    ]];

    function viewDetail(title, iid) {
        var conent = '../ChargesNew/NewAuditingBCreDetailManage.aspx?IID=' + iid;
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, conent, title, true, function callback(_Data) {

        });
    }

    function ExcuteOnServer() {
        $('#SearchDlg').parent().appendTo($("form:first"))
        $('#SearchDlg').dialog('open');
    }
    function AuditingFee(IsAuditing) {

        var Title = "ȷ�����ͨ��Ӧ�շ���";
        if (IsAuditing == "2") {
            Title = "ȷ����˲�ͨ��Ӧ�շ���";
        }
        HDialog.Prompt(Title, function () {
            $.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingInputFee', $('#frmForm').serialize() + "&iIsAuditing=" + IsAuditing,
               function Init() {
               },
               function callback(_Data) {
                   var r = _Data.split('|');

                   if (r[0] == "true") {
                       if (IsAuditing == "1")
                       { $('#lbAudit').html("���״̬:��ͨ��"); }
                       if (IsAuditing == "2")
                       { $('#lbAudit').html("���״̬:δͨ��"); }
                   }

                   $('#IsAuditing').val(IsAuditing)
               },
               function completeCallback() {
               },
               function errorCallback() {
               });

        })

    }
    function ToExcel() {
        window.location.href = '../ChargesNew/AuditingInputFeesDetailCreExcel.aspx';
    }

    function LoadList() {


        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: '#divtt',
            view: myview,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            showFooter: true,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("AuditManage", "AuditingInputFeesDetaiList", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.test == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; // return inline style
                }

            },
            onLoadSuccess: function (data) {
                $.tool.DataPostNoLoading('AuditManage', "AuditingInputFeesDetaiListSum", $('#frmForm').serialize(),
                       function Init() {
                           //����ҳ��
                           $('#TableContainer').datagrid('reloadFooter', [
                                       {
                                           test: 'footer',
                                           �������: "<span style='color:red'>�ۼƺϼ�</span>",
                                           Ӧ�ս��: "<span style='color:red'>0</span>"
                                       }
                           ]);
                       },
                       function callback(_Data) {

                           //����ҳ��
                           $('#TableContainer').datagrid('reloadFooter', [
                                       {
                                           test: 'footer',
                                           �������: "<span style='color:red'>�ۼƺϼ�</span>",
                                           Ӧ�ս��: "<span style='color:red'>" + _Data + "</span>"
                                       }
                           ]);
                       });
            }
        });
        $("#SearchDlg").dialog("close");
    }


    //��дDataGrid,֧�ָ���ҳ����ʽ
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

    $("#BtnReturn").click(function () {
        close("false");
    });


    function close(callparm) {
        HDialog.Close(callparm);
    }

</script>

