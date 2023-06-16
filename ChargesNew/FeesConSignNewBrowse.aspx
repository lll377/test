<%@ Page Language="c#" CodeBehind="FeesConSignNewBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesConSignNewBrowse" %>

<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script type="text/javascript">

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
        function checkFormAll(chk) {
            val = document.FeesConSignBrowse.SelReturn.value
            form = document.getElementById("FeesConSignBrowse");
            var chkval;
            for (var i = 0; i < form.elements.length; i++) {
                chkval = "," + form.elements[i].value;
                //ѡ��
                if (form.elements[i].type == "checkbox") {
                    form.elements[i].checked = chk.checked

                    //��ֵ
                    if (form.elements[i].value != "on") {
                        if (form.elements[i].checked) {
                            if (val.indexOf(chkval) < 0) {
                                val = val + chkval
                            }
                        }
                        else {
                            val = val.replace(chkval, "")

                        }
                    }
                }
            }
            document.FeesConSignBrowse.SelReturn.value = val

            //alert(document.FeesConSignCreManage.SelReturn.value)
        }

        function checkFormOne(chk) {
            var val = document.FeesConSignBrowse.SelReturn.value
            var chkval = "," + chk.value;
            if (chk.checked) {
                if (val.indexOf(chkval) < 0) {
                    val = val + chkval;
                }

            }
            else {
                val = val.replace(chkval, "")

            }
            document.FeesConSignBrowse.SelReturn.value = val

            //alert(document.FeesConSignCreManage.SelReturn.value)
        }
        function setcheckForm() {
            val = document.FeesConSignBrowse.SelReturn.value;
            form = document.getElementById("FeesConSignBrowse");
            var chkval = "";

            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].type == "checkbox") {
                    chkval = "," + form.elements[i].value
                    if (form.elements[i].value != "on") {
                        if (val.indexOf(chkval) < 0) {
                            form.elements[i].checked = false
                        }
                        else {
                            form.elements[i].checked = true
                        }
                    }
                }
            }

        }
    </script>
</head>
<body onload="Win_OnLoad();">
    <form id="FeesConSignBrowse" method="post" runat="server">
        <input style="width: 32px; height: 22px" id="ReceID" size="1" type="hidden" name="ReceID" runat="server">
        <input style="width: 24px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <input style="width: 24px; height: 22px" id="SelReturn" size="1" type="hidden" name="SelReturn" runat="server">
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <input id="ServerPath" name="ServerPath" runat="server" type="hidden" />

        <div id="tishi" class="easyui-dialog" title="��ע" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red;display:none;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>��ע��</td>
                    <td>1���˹�������ָ���ȴ�ӡƱ�ݡ��������տ���տʽ���տ�ɹ�ȷ�����ղż������롢�տ�ʧ��ȡ�����ղ�Ʊ�����ϡ�
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2���˹����յ���ͷ��ת����������ȷ�Ϻ󷽲���Ч��
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3�������ӡ�������������ɺ�ִδ�ӡ��
                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer"></div>
        <table cellspacing="0" cellpadding="0" width="100%" height="100%">
            <tr>
                <td bgcolor="#ffffff" valign="top">

                    <input style="height: 22px; display: none;" id="btnReport" class="button_four" value="Ʊ������" type="button" name="btnReport" runat="server">
                    <table id="Table2" cellspacing="2" cellpadding="2" width="100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tr>
                                            <td colspan="2" align="right"><font color="red">��ʾ��1���˹����յ���ͷ��ת����������ȷ�Ϻ󷽲���Ч��2�������ӡ�������������ɺ�ִδ�ӡ��һ�Ρ�5ҳ����</font>&nbsp;��ӡҳ��<input id="StartPage" class="easyui-validatebox" value="1"
                                                maxlength="50" size="1" name="InscribeName" runat="server">ҳ��<input id="EndPage" class="easyui-validatebox" value="1" maxlength="50" size="1" name="InscribeName" runat="server">ҳ
                                                <input id="btnPrint" class="button" value="Ʊ�ݴ�ӡ" type="button" name="btnPrint" runat="server"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;" colspan="4">�վݴ�ӡ</td>
                            </tr>
                            <tr>
                                <td valign="top" width="100%">

                                    <div id="ReportTableContainer"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: ΢���ź�;">
                <tr>
                    <td class="TdTitle">�ͻ�����</td>
                    <td class="TdContentSearch">
                        <input id="CustName" class="easyui-searchbox" maxlength="50" data-options="editable:false" searcher="SelCust" name="CustName" runat="server">
                        <input id="btnSelCust" style="display: none;" class="button_sel" onclick="javascript: if (btnSelCust_OnClick() == false) return false;" value=" " type="button" name="btnSelCust" runat="server">
                        <input id="CustID" class="Control_ItemInput" size="1" type="hidden" name="CustID" runat="server">
                        <input id="hiCustName" class="Control_ItemInput" size="1" type="hidden" name="hiCustName" runat="server"></td>
                    <td class="TdTitle">��ѡ����</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" class="easyui-combobox" data-options="editable:false" style="width: 154px;" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" data-options="editable:false" searcher="SelRoomSign" maxlength="50" name="RoomSign" runat="server">
                        <input style="display: none;" id="btnSelRoom" class="button_sel" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;" value=" " type="button" name="btnSelRoom" runat="server">
                        <input style="width: 8px; height: 22px" id="hiRoomSign" class="Control_ItemInput" size="1" type="hidden" name="hiRoomSign" runat="server">
                        <input style="width: 8px; height: 22px" id="RoomID" class="Control_ItemInput" size="1" type="hidden" name="RoomID" runat="server"></td>
                    <td class="TdTitle">�տ���</td>
                    <td class="TdContentSearch">
                        <select id="UserCode" name="UserCode" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">�շ�ʱ���</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datetimebox" id="EditBeginDate" data-options="editable:false" type="text" name="EditBeginDate" runat="server"></td>
                    <td class="TdTitle">��</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datetimebox" id="EditEndDate" data-options="editable:false" type="text" name="EditEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">��ʼƱ��</td>
                    <td class="TdContent">
                        <input id="StartBillsSign" class="easyui-validatebox" maxlength="50" name="StartBillsSign" runat="server"></td>
                    <td class="TdTitle">��ֹƱ��</td>
                    <td class="TdContent">
                        <input id="EndBillsSign" class="easyui-validatebox" maxlength="50" name="EndBillsSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">�վ���ʽ</td>
                    <td class="TdContentSearch">
                        <select id="sUseRepID" name="UseRepID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">��ѯ</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            //function InitReportTableHeight() {
            //    var h = $(window).height() - 478;
            //    $("#ReportTableContainer").css("height", h + "px");
            //}
            //InitReportTableHeight();

            function Search() {
                LoadList();
                ReportLoadList();
            }

            function SelCust() {
                HDialog.Open('650', '430', '../DialogNew/CustDlg.aspx?Ram=' + Math.random(), 'ѡ��ͻ�����', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#CustID").val()),
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
                                        strTmp = "(��ʷ)";
                                    }

                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                                }

                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    panelWidth: 'auto',
                                    onChange: function (n, o) {
                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $("#RoomID").val(data[i].RoomID);
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function SelRoomSign() {

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), 'ѡ���ݱ��', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                });
            }

            var mainToolbar = [
                {
                    text: '��������',
                    iconCls: 'icon-add',
                    handler: function () {
                        var w = $(window).width();
                        var h = $(window).height();
                        HDialog.Open(w, h, '../ChargesNew/FeesConSignCreManage.aspx', '��������', false, function callback(_Data) {
                            if (_Data == "1") {
                                LoadList();
                            }
                        });
                    }
                }, '-',
            {
                text: 'ɸѡ����Ʊ��',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: 'Ʊ�ݴ�ӡ',
                iconCls: 'icon-print',
                handler: function () {
                    // $("#btnReport").click();

                    var rows = $('#TableContainer').datagrid('getChecked');
                    if (rows == "") {
                        HDialog.Info('��ѡ��Ҫ��ӡ��Ʊ��!');
                    }
                    else {

                        $('#AllData').val(JSON.stringify(rows));
                        $.tool.DataPost('FeesConSignNew', 'print', $('#FeesConSignBrowse').serialize(),
                          function Init() {
                          },
                          function callback(_Data) {
                              var d = _Data;
                              if (d.split('|')[0] == 'true') {
                                  var Data = eval("(" + d.split('|')[1] + ")"); //ת��Ϊjson����

                                  if (Data.rows.length > 0) {
                                      obj = Data.rows[0];
                                      if (obj.EtFileName != "" && obj.FileName != "") {

                                          var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + "&PrintId="
                                          showOperatWin(ReportURL);
                                          LoadList();
                                      }
                                  }
                              }
                              else {
                                  HDialog.Info(d.split('|')[1]);
                              }

                          },
                          function completeCallback() {
                          },
                          function errorCallback() {
                          });

                    }

                }
            }, '-',
           {
               text: '��ע',
               iconCls: 'icon-help',
               handler: function () {
                   TiShi();
               }
           }
          ];

            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
                $("#tabtishi").show();
            }
            function ViewRemindersDetail(title, OpType, ID) {
                var h = $(window).height();
                var w = $(window).width();
                HDialog.Open(w, h, '../ChargesNew/FeesConSignManage.aspx?ReceID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                });
            }

            var mainColumn = [[
                { field: '', checkbox: true },
                {
                    field: 'BillsSign', title: 'Ʊ�ݺ���', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewRemindersDetail('�շ���ϸ','edit','" + row.ReceID + "');\">" + value + "</a>";
                        return str;
                    }
                },
                { field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '���ݱ��', width: 200, align: 'left', sortable: true },
                { field: 'ChequeBill', title: '֧/��Ʊ��', width: 200, align: 'left', sortable: true },
                { field: 'BillsDate', title: '�շ�����', width: 200, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '�տʽ', width: 200, align: 'left', sortable: true },
                { field: 'UserName', title: '�տ���', width: 200, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '���', width: 200, align: 'left', sortable: true },
                { field: 'PerSurplus', title: '��ͷ��ת', width: 200, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '��ӡ����', width: 200, align: 'left', sortable: true }
            ]];

            var reportColumn = [[
                { field: 'SerialNum', title: '���', width: 200, align: 'left', sortable: true },
                { field: 'BillsSign', title: 'Ʊ�ݺ���', width: 200, align: 'left', sortable: true },
                { field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '���ݱ��', width: 200, align: 'left', sortable: true },
                { field: 'PrintDate', title: '��������', width: 200, align: 'left', sortable: true }
            ]]

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: mainColumn,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: mainToolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesConSignNew", "search", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                    //,
                    //onCheck: function (rowIndex, rowData) {
                    //    if ($("#SelReturn").val().indexOf(rowData.ReceID) < 0) {
                    //        $("#SelReturn").val($("#SelReturn").val() + rowData.ReceID + ",");
                    //    }
                    //},
                    //onUncheck: function (rowIndex, rowData) {
                    //    if ($('#SelReturn').val().indexOf(rowData.ReceID) > -1) {
                    //        $('#SelReturn').val($('#SelReturn').val().replace(rowData.ReceID + ",", ''));
                    //    }
                    //}
                });

            }

            function ReportLoadList() {
                $("#ReportTableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesConSignNew&Command=SearchReport',
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: reportColumn,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",

                });
            }

            $.parser.parse("#SearchDlg");
            LoadList();

            $("#btnAdd").click(function () {

            })
        </script>
    </form>
</body>
</html>
