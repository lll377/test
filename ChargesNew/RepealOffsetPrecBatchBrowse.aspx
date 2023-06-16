<%@ Page Language="c#" CodeBehind="RepealOffsetPrecBatchBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.RepealOffsetPrecBatchBrowse" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RepealOffsetPrecBatchBrowse</title>
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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
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
        RepealOffsetPrecBatchBrowse.CustID.value = "";

        RepealOffsetPrecBatchBrowse.CustName.value = "";
        RepealOffsetPrecBatchBrowse.hiCustName.value = "";


        RepealOffsetPrecBatchBrowse.RoomID.value = "";
        RepealOffsetPrecBatchBrowse.RoomSign.value = "";
        RepealOffsetPrecBatchBrowse.hiRoomSign.value = "";

    }
    function CheckData() {
        if (RepealOffsetPrecBatchBrowse.CustID.value == "0") {
            RepealOffsetPrecBatchBrowse.CustID.value = "";
        }
        if (RepealOffsetPrecBatchBrowse.CostID.value == "0") {
            RepealOffsetPrecBatchBrowse.CostID.value = "";
        }
        if (RepealOffsetPrecBatchBrowse.CustID.value == "") {
            alert("��ѡ��ͻ�,�����Ϊ��!");
            RepealOffsetPrecBatchBrowse.btnSelCust.focus();
            return false;
        }
        if (RepealOffsetPrecBatchBrowse.CostID.value == "") {
            alert("��ѡ�������Ŀ,�����Ϊ��!");
            RepealOffsetPrecBatchBrowse.btnSelCost.focus();
            return false;
        }


        return true;
    }

    function checkFormAll(chk) {
        val = document.RepealOffsetPrecBatchBrowse.SelReturn.value
        form = document.getElementById("RepealOffsetPrecBatchBrowse");
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
        document.RepealOffsetPrecBatchBrowse.SelReturn.value = val

        //alert(document.RepealOffsetPrecBatchBrowse.SelReturn.value)
    }

    function checkFormOne(chk) {
        var val = document.RepealOffsetPrecBatchBrowse.SelReturn.value
        var chkval = "," + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        document.RepealOffsetPrecBatchBrowse.SelReturn.value = val

        //alert(document.RepealOffsetPrecBatchBrowse.SelReturn.value)
    }
    function setcheckForm() {
        val = document.RepealOffsetPrecBatchBrowse.SelReturn.value;
        form = document.getElementById("RepealOffsetPrecBatchBrowse");
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

    function btnDel_onclick() {
        var strSelReturn = getObject("SelReturn").value;

        window.showModalDialog("../dialog/OffsetPreDetailBatchDelDlg.aspx?SelReturn=" + strSelReturn + "", "window", "dialogWidth=400px;dialogHeight=220px;status:no;help:no;resizable:no;scroll:no");

        return true;
    }

    //-->
    </script>
    <script language="javascript">
		<!--
    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    //-->
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="RepealOffsetPrecBatchBrowse" method="post" runat="server">
        <input id="CheckDates" type="hidden" size="1" name="CheckDates" runat="server">
        <input id="ReceID" type="hidden" size="1" name="ReceID" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="SelReturn" type="hidden" size="1" name="SelReturn" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <input id="hiSearchData" type="hidden" size="1" name="hiSearchData" runat="server">
        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql" runat="server">

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 120px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">������ڴ�</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" style="width: 164px;" id="EditBeginDate" data-options="editable:false" name="EditBeginDate" runat="server" />
                    </td>
                    <td class="TdTitle">��</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" style="width: 164px;" id="EditEndDate" data-options="editable:false" name="EditEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var frozenColumns = [[
        { field: 'ck', checkbox: true },
        {
            field: 'IID', title: '����״̬', width: 70, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                 var values = "";
                var IsRefund = row.IsRefund;
                if (IsRefund == "1") {
                    values = "<font color='Blue'>���˿�</font>";
                }

                var IsFeesPay = row.IsFeesPay;
                if (IsFeesPay == "1") {
                    values = "<font color='Blue'>�ѽ���</font>";
                }
                return values;
            }
        },
        { field: 'CustName', title: '�ͻ�����', width: 180, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 180, align: 'left', sortable: true }

    ]];
    var column = [[
        { field: 'ParkName', title: '��λ���', width: 180, align: 'left', sortable: true },
        {
            field: 'PreDate', title: 'Ԥ���������', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PreDate, "yyyy-MM-dd HH:mm:ss");
                return str;
            }
        },
        { field: 'CostName', title: '��������', width: 170, align: 'left', sortable: true },
        {
            field: 'FeesDueDate', title: 'Ӧ������', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DebtsAmount', title: 'Ӧ��ֽ��', width: 130, align: 'left', sortable: true },
        { field: 'FeesID', title: '����ID', width: 130, align: 'left', sortable: true, hidden: true },
        { field: 'CostNames', title: '��ַ�����Ŀ', width: 170, align: 'left', sortable: true },
        { field: 'OldPrecAmount', title: 'ԭԤ�����', width: 100, align: 'left', sortable: true },
        { field: 'OffsetAmount', title: '��ֽ��', width: 100, align: 'left', sortable: true },
        { field: 'OffsetLateFeeAmount', title: '��ֺ�ͬΥԼ��', width: 100, align: 'left', sortable: true },
        { field: 'NewPrecAmount', title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
        { field: 'TakeWiseName', title: '����ʽ', width: 100, align: 'left', sortable: true },
        { field: 'BillsSign', title: '�վݺ�', width: 100, align: 'left', sortable: true },
        {
            field: 'IsWriteOff', title: '�Ƿ����', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var strIsWriteOff = "";
                if (value == "True") {
                    strIsWriteOff = "��";
                } else {
                    strIsWriteOff = "��";
                }
                return strIsWriteOff;
            }
        }

    ]];

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
            text: '����',
            iconCls: 'icon-cancel',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getChecked');
                if (rows == null || rows == '') {
                    HDialog.Info('��ѡ�����');
                    return;
                }
                CheckIsOverAcount(rows);
            }
        }, '-',
        {
            text: '����',
            iconCls: 'icon-undo',
            handler: function () {
                var rows = $("#TableContainer").datagrid("getChecked");
                if (rows == null || rows == '') {
                    HDialog.Info('��ѡ������');
                    return;
                }
                IsWriteOff(rows);
            }
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            frozenColumns: frozenColumns,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: false,
            pagination: true,
            width: "100%",
            border: false,
            freezeRow: 1,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchrepealoffsetprecbatch", "TableContainer", param);
            },
            onLoadSuccess: function (data) {

                if (data.rows.length > 0) {
                    for (var i = 0; i < data.rows.length; i++) {
                        if (data.rows[i].IsRefund == "1" || data.rows[i].IsFeesPay == "1") {
                            $("input[type='checkbox']")[i + 1].disabled = true;
                        }                       
                    }
                }

            },
            onCheckAll: function (rows)
            {                
                if (rows.length > 0) {
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].IsRefund == "1" || rows[i].IsFeesPay == "1") {
                            $("input[type='checkbox']")[i + 1].checked = false;
                        }
                    }
                }
                
            }

        });
        $("#SearchDlg").dialog("close");
    }

    //����
    function CheckIsOverAcount(rows) {
        var CheckDates = "";
        var FeeIDs = "";
        var IsCheckDates = false;
        $.each(rows, function (key, val) {
            CheckDates += rows[key]["PreDate"] + ",";
            FeeIDs += rows[key]["FeesID"] + ",";
            if (!rows[key]["PreDate"]) {
                IsCheckDates = true;
                HDialog.Info("���ݴ���ҵ��ʼʱ����󣡣���");
                return false;
            }
        });
        if (IsCheckDates) {
            return;
        } else {
            CheckDates = CheckDates.substr(0, CheckDates.length - 1);
        }
        $('#CheckDates').val(CheckDates);

        //$.tool.DataGet('PrecReceFee', 'CheckRepealOffsetPrec', '&FeesID=' + FeeIDs,
        //    function Init() {
        //    },
        //    function callback(_checkdata) {
        //        if (_checkdata.length > 0) {
        //            HDialog.Info(_checkdata);
        //            return;
        //        }



        //�ж��Ƿ��ѽ��� 2017-11-8 14:59:30
        $.tool.DataPostChk('RepealOffsetPrecBatchBrowse', 'WriteOff', 'CheckIsWriteOff', $('#RepealOffsetPrecBatchBrowse').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "True") {
                    HDialog.Info("�����ѽ��˵����ݣ����ܳ���������");
                    return;
                } else {
                    DelFees(rows);
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });

        //});


    }

    //����
    function IsWriteOff(rows) {
        var check = true;
        var CheckDates = "";
        var OffsetPreDetailIIDs = "";
        var FeeIDs_off = "";
        $.each(rows, function (key, val) {
            if (rows[key]["WriteOffIsAudit"]) {
                if (rows[key]["WriteOffIsAudit"] == 1) {
                    check = false;
                    HDialog.Info("�����ѳ���������!!!");
                    return false;
                }
                if (rows[key]["WriteOffIsAudit"] == 0) {
                    check = false;
                    HDialog.Info("�������ύ������!!!");
                    return false;
                }
            }
            if (!rows[key]["PreDate"]) {
                check = false;
                HDialog.Info("���ݴ���ҵ��ʼʱ���������ϵ����Ա������");
                return false;
            }
            CheckDates += rows[key]["PreDate"] + ",";
            OffsetPreDetailIIDs += rows[key]["IID"] + ",";
            FeeIDs_off += rows[key]["FeesID"] + ",";
        });
        if (!check) {
            return;
        }
        CheckDates = CheckDates.substr(0, CheckDates.length - 1);
        OffsetPreDetailIIDs = OffsetPreDetailIIDs.substr(0, OffsetPreDetailIIDs.length - 1);
        $('#CheckDates').val(CheckDates);


        //$.tool.DataGet('PrecReceFee', 'CheckRepealOffsetPrec', '&FeesID='+FeeIDs_off,
        //    function Init() {
        //    },
        //    function callback(_checkdata) {
        //        if (_checkdata.length > 0) {
        //            HDialog.Info(_checkdata);
        //            return;
        //        }

        //�ж��Ƿ��ѽ��� 2017-11-8 14:59:30
        $.tool.DataPostChk('RepealOffsetPrecBatchBrowse', 'WriteOff', 'CheckIsWriteOff', $('#RepealOffsetPrecBatchBrowse').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "True") {
                    WriteOff(OffsetPreDetailIIDs);
                } else {
                    HDialog.Info("����δ���˵����ݣ����ܳ���������");
                    return;
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });


        //});

    }

    function WriteOff(OffsetPreDetailIIDs) {
        HDialog.Open('600', '270', '../WriteOffManage/WriteoffPreCostsOffset.aspx?OffsetPreDetailIIDs=' + OffsetPreDetailIIDs, "����Ԥ�����", false, function callback(_Data) {
            if (_Data == "True") {
                LoadList();
            }
        });
    }

    //ɾ������
    function DelFees(rows) {
        var IID = "";
        $.each(rows, function (key, val) {
            IID += rows[key]["IID"] + ",";
        });
        IID = IID.substr(0, IID.length - 1);

        sessionStorage.clear();
        sessionStorage.setItem("OffsetPreDetail_IID", IID);

        $.messager.confirm('ȷ��', '�Ƿ�ɾ������', function (r) {
            if (r) {
                var conent = "../DialogNew/OffsetPreDetailDelDlg.aspx";
                HDialog.Open('450', '230', conent, '����ɾ��ԭ��', false, function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info('�����ɹ�������');
                        LoadList();
                    }

                })

            }
        });
    }

    //��ղ�ѯ����
    function CancelParm() {

    }



</script>
