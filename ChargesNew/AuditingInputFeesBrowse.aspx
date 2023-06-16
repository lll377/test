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
        if (confirm('请确认是否清除历史？') == false) {
            return false;
        }
        else {
            return true;
        }
    }

    //查询对话框
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

                //**重构数据(数据结构为JSON)					
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
        <input class="button" style="display: none;" id="btnFilter" type="button" value="查询" name="btnFilter" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">费用时间</td>
                    <td class="TdContentSearch">
                        <input id="StartBCreDate" class="easyui-datebox" style="width: 83%;" data-options="editable:false" name="StartBCreDate" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EndBCreDate" class="easyui-datebox" style="width: 83%;" data-options="editable:false" name="EndBCreDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContentSearch">
                        <select id="IsAuditing" name="IsAuditing" runat="server" style="width: 83%;">
                            <option selected></option>
                            <option value="0">未审核</option>
                            <option value="1">已通过</option>
                            <option value="2">未通过</option>
                            <option value="3">审核中</option>
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
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();" runat="server">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
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
        { field: 'BCreUserName', title: '导入人', width: 100, align: 'left', sortable: true },
        {
            field: 'BCreDate', title: '导入时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"CheckRecord(" + row.AuditID + ",'" + row.FeesRoleCodes+"');\">" + row.BCreDate + "</a>";
                return str;
            }
        },
        {
            field: 'dFeesStartDate', title: '费用开始时间', width: 150, align: 'left', sortable: true
        },
        {
            field: 'dFeesEndDate', title: '费用结束时间', width: 150, align: 'left', sortable: true
        },
        { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
        //{ field: 'AuditUserName', title: '审核人', width: 150, align: 'left', sortable: true },
        //{ field: 'AuditDate', title: '审核时间', width: 150, align: 'left', sortable: true },
        //{
        //    field: 'IsAuditing', title: '审核状态', width: 130, align: 'left', sortable: true,
        //    formatter: function (value, row, index) {
        //        var values = "";
        //        var IsAudit = row.IsAuditing;

        //        if (IsAudit == 1) {
        //            values = "<font color='red'>已通过</font>";
        //        }
        //        else if (IsAudit == 2) {
        //            values = "<font color='Blue'>未通过</font>";
        //        }
        //        else {
        //            values = "<font color='Green'>未审核</font>";
        //        }
        //        return values;
        //    }
        //}
      //  { field: 'IsAuditingName', title: '是否通过', width: 100, align: 'left', sortable: true },
        //{ field: 'FeesRoleNames', title: '未审岗位', width: 100, align: 'left', sortable: true },
        { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
          {
            field: 'IsAuditing', title: '审核状态', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var values = "";
                var IsAudit = row.IsAuditing;

                if (IsAudit == 1) {
                    values = "<font color='Green'>已通过</font>";
                }
                else if (IsAudit == 2) {
                    values = "<font color='red'>未通过</font>";
                }
                else {
                    values = "<font color='Blue'>未审核</font>";
                }
                return values;
            }
        }
    ]];

    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }
    ];


    //审核
    function CheckRecord(auditid, FeesRoleCodes) {
       
        HDialog.Open(w, h, '../ChargesNew/AuditingInputFeesDetailBrowse.aspx?AuditID=' + auditid + "&StartBCreDate="
            + $('#StartBCreDate').val() + "&EndBCreDate=" + $('#EndBCreDate').val() + "&FeesRoleCodes=" + FeesRoleCodes,
            '费用审核明细', false, function callback(_Data) {
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

    //清空查询条件
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

