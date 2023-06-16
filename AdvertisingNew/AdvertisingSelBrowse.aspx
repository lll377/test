<%@ Page Language="c#" CodeBehind="AdvertisingSelBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.AdvertisingNew.AdvertisingSelBrowse" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>AdvertisingSelBrowse</title>
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
    function btnClear_OnClick() {
        AdvertisingSelBrowse.AdvertisingSign.value = "";
    }
    function btnSelAdvertisingRegional_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/AdvertisingRegionalDlg.aspx" + "?Ram=" + Math.random(), "", 650, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            AdvertisingSelBrowse.RegionalID.value = varObjects[0];
            AdvertisingSelBrowse.RegionalName.value = varObjects[1];

            return true;
        }

        return false;
    }
    //-->
    </script>
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
    <form id="AdvertisingSelBrowse" method="post" runat="server">
        <input id="TableSign" type="hidden" size="1" name="TableSign" runat="server">
        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql" runat="server">
        <input id="hiSearchData" type="hidden" size="1" name="hiSearchData" runat="server">
        <input class="button" style="display: none;" id="btnPrint" type="button" value="��ӡ" name="btnPrint" runat="server">
        <input id="PrintParms" style="width: 16px; height: 21px" type="hidden" size="1" name="PrintParms"
            runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 120px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">���λ����</td>
                    <td class="TdContentSearch">
                        <input id="RegionalName" class="easyui-searchbox" searcher="SelRegionalName" name="RegionalName" runat="server">
                        <input id="RegionalID" type="hidden" name="RegionalID" runat="server"></td>
                    <td class="TdTitle">���λ���</td>
                    <td class="TdContent">
                        <input id="AdvertisingSign" name="ParkNameAdvertisingSign" runat="server">
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

    var toolbar = [
        {
            text: '�˶�',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ���˶��');
                    return;
                }
                DelRecord(row.AdvertisingID);
            }
        }, '-',
        {
            text: 'ɸѡ',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-',
        {
            text: '��ʷ��¼',
            iconCls: 'icon-filter',
            handler: function () {
                SearchHistory();
            }
        }, '-',
        {
            text: '��ӡ',
            iconCls: 'icon-print',
            handler: function () {
                $('#btnPrint').click();
            }
        }
    ];

    var Column = [[
        { field: 'RegionalName', title: '���λ����', width: 100, align: 'left', sortable: true },
        {
            field: 'AdvertisingSign', title: '���λ���', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {

                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('���λ����','Select'," + row.AdvertisingID + ");\">" + row.AdvertisingSign + "</a>";
                return str;
            }
        },
        { field: 'AdvertisingName', title: '���λ����', width: 100, align: 'left', sortable: true },
        {
            field: 'UseState', title: '��ǰ״̬', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.UseState == "����") {
                    str = "<font color=ForestGreen>" + row.UseState + "</font>";
                }
                else if (row.UseState == "����")
                {
                    str = "<font color=#A9A9A9>" + row.UseState + "</font>";
                } else {
                    str = "<font color=#FF0000>" + row.UseState + "</font>";
                }
                return str;
            }
        },
        {
            field: 'BeginDate', title: '��ʼʱ��', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'EndDate', title: '����ʱ��', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.EndDate, "yyyy-MM-dd");
                return str;
            }
        }
    ]]


    function SelRegionalName() {
        $('#RegionalName').searchbox("setValue", '');
        $('#RegionalID').val('');

        var conent = "../DialogNew/AdvertisingRegionalDlg.aspx";

        HDialog.Open('600', '400', conent, '���λ����', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RegionalName').searchbox("setValue", data.RegionalName);
            $('#RegionalID').val(data.RegionalID);

        });
    }

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '���ݼ�����,���Ժ�...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: Column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Advertising", "SearchAdvertisingSelBase", "TableContainer", param);
            }
            //,
            //onDblClickRow: function (rowIndex, rowData) {
            //    ViewDetail('���λ����', 'Select', rowData.AdvertisingID);
            //}
        });
        $('#SearchDlg').dialog('close');
    }

    //��ʷ��¼
    function SearchHistory() {
        HDialog.Open(w, h, '../AdvertisingNew/AdvertisingHandHisBrowse.aspx?', '���λ������ʷ', false, function callback(_Data) {

        });
    }

    function ViewDetail(title, OpType, AdvertisingID) {

        HDialog.Open(w, h, '../AdvertisingNew/AdvertisingHandBrowse.aspx?AdvertisingID=' + AdvertisingID + '&OpType=' + OpType,
            title, false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    function DelRecord(AdvertisingID) {
        HDialog.Open(w, h, '../AdvertisingNew/AdvertisingCancelManage.aspx?AdvertisingID=' + AdvertisingID, '�˶�����', false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    function CancelParm() {
        $('#RegionalName').searchbox("setValue", "");
        $('#RegionalID').val("");
        $('#AdvertisingSign').val("");
    }

</script>
