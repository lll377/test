<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditingInputPreCostsBrowse.aspx.cs" Inherits="M_Main.ChargesNew.AuditingInputPreCostsBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>AuditingInputPreCostsBrowse</title>
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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script language="javascript">
		<!--

    function GetShow() {
        $('body').pagewalkthrough({
            name: 'introduction',
            steps: [
                {
                    popup: {
                        content: '#walkthrough-1',
                        type: 'modal'
                    }
                }, {
                    wrapper: '#ivrSearch',
                    popup: {
                        content: '筛选相应记录的“导入时间”',
                        type: 'tooltip',
                        position: 'right'
                    },
                    onLeave: function () {
                        HDialog.Open(w, h, '../ChargesNew/AuditingInputPreCostsDetailBrowse.aspx?ivrShowType=1&StartBCreDate='
                            + $('#StartBCreDate').val() + "&EndBCreDate=" + $('#EndBCreDate').val(),
                            '费用审核明细', false, function callback(_Data) {
                                LoadList();
                            });
                    }
                }
            ]
            ,
            buttons: {
                jpwNext: {
                    i18n: "下一步 &rarr;"
                },
                jpwFinish: {
                    i18n: "下一步 &rarr;"
                },
                jpwPrevious: {
                    i18n: "&larr; 上一步"
                },
                jpwClose: {
                    i18n: "关闭",
                }
            }
        });

        $('body').pagewalkthrough('show');
    };

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
    <form id="AuditingInputPreCostsBrowse" method="post" runat="server">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3 style="font-family: 'Microsoft YaHei'">这里是审核管理-预交导入审核操作介绍<br />
                    点击下一步继续教程</h3>
            </div>
        </div>

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
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"CheckRecord(" + row.AuditID + ");\">" + row.BCreDate + "</a>";
                return str;
            }
        },
        {
            field: 'dPrecDate', title: '预交时间', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.dPrecDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
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
            id: 'ivrSearch',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }
        //, '-',
        //{
        //    text: '审核',
        //    iconCls: 'icon-edit',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info('请选择审核项！');
        //            return;
        //        }
        //        var param = "AuditID=" + row.AuditID + "&StartBCreDate=" + row.StartBCreDate + "&EndBCreDate=" + row.EndBCreDate;
        //        CheckRecord(param);
        //    }
        //}
    ];


    //审核
    function CheckRecord(auditid) {
        HDialog.Open(w, h, '../ChargesNew/AuditingInputPreCostsDetailBrowse.aspx?AuditID=' + auditid + "&StartBCreDate="
            + $('#StartBCreDate').val() + "&EndBCreDate=" + $('#EndBCreDate').val(),
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
                param = $.JQForm.GetParam("AuditManage", "AuditingInputPreCostsList", "TableContainer", param);
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


    function ViewDetail(title, OpType, ParkID, CarparkID) {

        HDialog.Open('620', '350', '../CarparkNew/ParkingManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType, title, false, function callback(_Data) {
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

