<%@ Page Language="c#" CodeBehind="CustTempBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustTempBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustTempBrowse</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script language="javascript">
        function btnClear_OnClick() {
            CustTempBrowse.CustName.value = "";
        }
        function IsDel_OnClick() {
            if (confirm('��ȷ���Ƿ�ɾ���ü�¼') == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <script language="javascript">
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
    </script>
    <script language="javascript">
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body>
    <form id="FrmForm" runat="server" method="post">
        <input class="button" id="btnDel" type="button" value="ɾ��" style="display: none;" name="btnDel" runat="server">
        <input type="hidden" id="hiCustName" name="hiCustName" runat="server" />
        <input type="hidden" id="hiCustID" name="hiCustID" value="" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 170px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                <tr>
                    <td class="TdTitle">�ͻ�����</td>
                    <td class="TdContent">
                        <input id="CustName" maxlength="50" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">֤������</td>
                    <td class="TdContent">
                        <input id="PaperCode" maxlength="50" name="PaperCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">��ʷ�ͻ�����</td>
                    <td class="TdContent">
                        <input id="OldCustName" maxlength="50" name="OldCustName" runat="server" />
                    </td>
                    <td class="TdTitle">��Ӧ�����</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="SupplierType" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>



<script type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        {
            field: 'CustName', title: '��ʱ�ͻ�����', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                //if (row.IsLock == 1) {
                //    str = "<a class=\"HrefStyle\" style='color:red'  href='#' onclick=\"ViewDetail('�޸���ʱ�ͻ�','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "(������)</a>";
                //} else {
                //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸���ʱ�ͻ�','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>";
                //}
                str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('�޸���ʱ�ͻ�','edit'," + row.CustID + ",'" + row.IsLock + "');\">" + row.CustName + "</a>";
                return str;
            }
        },
        //{ field: 'CustTypeName', title: '���', width: 120, align: 'left', sortable: true },
        { field: 'PaperCode', title: '֤������', width: 120, align: 'left', sortable: true },
        { field: 'FixedTel', title: '�̶��绰', width: 120, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '�ƶ��绰', width: 120, align: 'left', sortable: true },
        //{ field: 'MGradeSign', title: '���õȼ�', width: 150, align: 'left', sortable: true },
        { field: 'SupplierTypeName', title: '��Ӧ�����', width: 100, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '�Ƿ�����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "��";
                if (value == 1) {
                    str = "��";
                }
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '����',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("������ʱ�ͻ�", 'Insert', '', '');
            }
        }, '-',
        {
            text: 'ɾ��',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ��ɾ���');
                    return;
                }
                $("#hiCustID").val(row.CustID);
                $("#hiCustName").val(row.CustName);
                document.getElementById('btnDel').click();
            }
        }, '-',
        {
            text: 'ɸѡ',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchtempcustomer&' + $("#FrmForm").serialize(),
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
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
        });
        $("#SearchDlg").dialog("close");
    }

    //��ղ�ѯ����
    function CancelParm() {

        $('#CustName').val("");
        $('#RoomSign').val("");
        $('#PaperCode').val("");

    }

    function ViewDetail(title, OpType, CustID, IsLock) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../HouseNew/CustTempManage.aspx?CustID=' + CustID + '&OpType=' + OpType + "&IsLock=" + IsLock, title, true, function callback(_Data) {
            if (_Data != "false" && _Data != "") {
                LoadList();
            }
        });
    }


    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", document.body.clientWidth * 0.15 * 0.74);
    });
</script>
