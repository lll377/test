<%@ Page Language="c#" CodeBehind="AuditingInputFeesBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.AuditingInputFeesBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>AuditingInputFeesBrowse</title>
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
        AuditingBCreBrowse.StartBCreDate.value = "";
        AuditingBCreBrowse.EndBCreDate.value = "";

        AuditingBCreBrowse.AuditTypeName.value = "";
        AuditingBCreBrowse.BCreRange.value = "";
        AuditingBCreBrowse.CostName.value = "";
        AuditingBCreBrowse.IsAuditing.value = "";
    }
    function btnClearHis_OnClick() {
        if (confirm('��ȷ���Ƿ������ʷ��') == false) {
            return false;
        }
        else {
            return true;
        }
    }

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
<body>
    <form id="AuditingBCreBrowse" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input class="button" style="display: none;" id="btnFilter" type="button" value="��ѯ" name="btnFilter" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">����ʱ��</td>
                    <td class="TdContentSearch">
                        <input id="StartBCreDate" class="easyui-datebox" style="width: 83%;" data-options="editable:false" name="StartBCreDate" runat="server"></td>
                    <td class="TdTitle">��</td>
                    <td class="TdContentSearch">
                        <input id="EndBCreDate" class="easyui-datebox" style="width: 83%;" data-options="editable:false" name="EndBCreDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">���״̬</td>
                    <td class="TdContentSearch">
                        <select id="IsAuditing" name="IsAuditing" runat="server" style="width: 83%;">
                            <option selected></option>
                            <option value="0">δ���</option>
                            <option value="1">��ͨ��</option>
                            <option value="2">δͨ��</option>
                            <option value="3">�����</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();" runat="server">ȷ��ɸѡ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        { field: 'BCreUserName', title: '������', width: 100, align: 'left', sortable: true },
        {
            field: 'BCreDate', title: '����ʱ��', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"CheckRecord(" + row.AuditID + ",'" + row.FeesRoleCodes+"');\">" + row.BCreDate + "</a>";
                return str;
            }
        },
        {
            field: 'dFeesStartDate', title: '���ÿ�ʼʱ��', width: 150, align: 'left', sortable: true
        },
        {
            field: 'dFeesEndDate', title: '���ý���ʱ��', width: 150, align: 'left', sortable: true
        },
        { field: 'CostName', title: '��������', width: 150, align: 'left', sortable: true },
        //{ field: 'AuditUserName', title: '�����', width: 150, align: 'left', sortable: true },
        //{ field: 'AuditDate', title: '���ʱ��', width: 150, align: 'left', sortable: true },
        //{
        //    field: 'IsAuditing', title: '���״̬', width: 130, align: 'left', sortable: true,
        //    formatter: function (value, row, index) {
        //        var values = "";
        //        var IsAudit = row.IsAuditing;

        //        if (IsAudit == 1) {
        //            values = "<font color='red'>��ͨ��</font>";
        //        }
        //        else if (IsAudit == 2) {
        //            values = "<font color='Blue'>δͨ��</font>";
        //        }
        //        else {
        //            values = "<font color='Green'>δ���</font>";
        //        }
        //        return values;
        //    }
        //}
      //  { field: 'IsAuditingName', title: '�Ƿ�ͨ��', width: 100, align: 'left', sortable: true },
        //{ field: 'FeesRoleNames', title: 'δ���λ', width: 100, align: 'left', sortable: true },
        { field: 'FeesRoleNamesMemo', title: '�������', width: 260, align: 'left', sortable: true },
          {
            field: 'IsAuditing', title: '���״̬', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var values = "";
                var IsAudit = row.IsAuditing;

                if (IsAudit == 1) {
                    values = "<font color='Green'>��ͨ��</font>";
                }
                else if (IsAudit == 2) {
                    values = "<font color='red'>δͨ��</font>";
                }
                else {
                    values = "<font color='Blue'>δ���</font>";
                }
                return values;
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
        }
    ];


    //���
    function CheckRecord(auditid, FeesRoleCodes) {
       
        HDialog.Open(w, h, '../ChargesNew/AuditingInputFeesDetailBrowse.aspx?AuditID=' + auditid + "&StartBCreDate="
            + $('#StartBCreDate').val() + "&EndBCreDate=" + $('#EndBCreDate').val() + "&FeesRoleCodes=" + FeesRoleCodes,
            '���������ϸ', false, function callback(_Data) {
                LoadList();
            });
    }

    function LoadList() {

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("AuditManage", "AuditingInputFeesList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //��ղ�ѯ����
    function CancelParm() {
        AuditingBCreBrowse.StartBCreDate.value = "";
        AuditingBCreBrowse.EndBCreDate.value = "";

        AuditingBCreBrowse.IsAuditing.value = "";

    }


    function ViewDetail(title, OpType, ParkID, CarparkID, FeesRoleCodes) {

        HDialog.Open('620', '350', '../CarparkNew/ParkingManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType + "&FeesRoleCodes" + FeesRoleCodes, title, false, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }

    //$("select").each(function () {

    //    var key = $(this).attr("id");
    //    $(this).css("width", '83%');
    //});
</script>

