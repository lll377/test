<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAuditingPreBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewAuditingPreBrowse" %>


<!DOCTYPE html>
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
    <script type="text/javascript"  src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
			}
		//-->
		</script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <INPUT id="AuditType" size="1" type="hidden"
							name="AuditType" runat="server">
        <INPUT id="PrintParms"  type="hidden" size="1"
														name="PrintParms" runat="server">
        <input id="print" name="print" type="button" runat="server" onserverclick="print_ServerClick"/>
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">

              	<TR>
					<TD class="TdTitle">冲抵时间从</TD>
					<TD class="TdContent" ><INPUT class="Wdate" id="StartPreDate" 
							onclick="WdatePicker()"  name="StartPreDate" runat="server"></TD>
					<TD class="TdTitle" >到</TD>
					<TD class="TdContent" ><INPUT class="Wdate" id="EndPreDate" 
							onclick="WdatePicker()"  name="EndPreDate" runat="server"></TD>
				</TR>
				<TR>
					<TD class="TdTitle">冲抵类别</TD>
					<TD class="TdContent"><SELECT name="AuditTypeName" runat="server" id="AuditTypeName">
							<OPTION selected></OPTION>
							<OPTION value="批量冲抵">批量冲抵</OPTION>
							<OPTION value="单户冲抵">单户冲抵</OPTION>
						</SELECT></TD>
					<TD class="TdTitle">冲抵范围</TD>
					<TD class="TdContent"><INPUT class="Control_ItemInput" id="PreRange"  name="PreRange" runat="server"></TD>
				</TR>
				<TR>
					<TD class="TdTitle">费用名称</TD>
					<TD class="TdContent" ><INPUT class="Control_ItemInput" id="CostName" name="CostName" runat="server"></TD>
					<TD class="TdTitle" >审核状态</TD>
					<TD class="TdContent" ><SELECT id="IsAuditing" name="IsAuditing" runat="server">
							<OPTION selected></OPTION>
							<OPTION value="0">未审核</OPTION>
							<OPTION value="1">已通过</OPTION>
							<OPTION value="2">未通过</OPTION>
						</SELECT></TD>
				</TR>
               

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>
            <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#print').hide();
            }
            InitFunction();


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
                var com = getQueryVariable("FromIndex");
                if (com != "") {
                    $("#FromIndex").val(com);
                }
            }
            InitFrom();


            var column = [[

            { field: 'AuditTypeName', title: '冲抵类别', width: 100, align: 'left', sortable: true },
            { field: 'PreUserName', title: '冲抵人', width: 100, align: 'left', sortable: true },
            {
                field: 'PreDate', title: '冲抵时间', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"viewDetail('冲抵审核'," + row.AuditID + "," + row.IsAuditing + ",'" + row.FeesRoleCodes + "');\">" + row.PreDate + "</a>";
                    return str; 
                }
            },
            { field: 'PreRange', title: '冲抵范围', width: 150, align: 'left', sortable: true },
            { field: 'CreYear', title: '冲抵年度', width: 100, align: 'left', sortable: true },
            { field: 'CreMonth', title: '冲抵月份', width: 100, align: 'left', sortable: true },
            { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'FeesRoleNamesNew', title: '审核流程', width: 260, align: 'left', sortable: true },
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

            function viewDetail(title,auditid,strIsAuditing,FeesRoleCodes)
            {	
                var conent = '../ChargesNew/NewAuditingPreDetailBrowse.aspx?FromIndex=' + $("#FromIndex").val() + '&FeesRoleCodes='+FeesRoleCodes+'&AuditID=' + auditid + '&IsAuditing='+strIsAuditing+'&StartPreDate=' + $('#StartPreDate').val() + '&EndPreDate=' + $('#EndPreDate').val();
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, title, true, function callback(_Data) {
                    LoadList();
                });
            }
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '清除历史',
                    iconCls: 'icon-clear',
                    handler: function () {

                        HDialog.Prompt('确认清除三月前审核信息', function () {
                            $.tool.DataPostChk('frmForm', 'AuditManage', 'AuditingPreDelHis', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var r = _Data.split('|');

                                    HDialog.Info(r[1]);
                                   
                                    if (r[0] == "true") {
                                        LoadList();
                                    }

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });

                        });

                    }
                }
                //, '-',
                //   {
                //       text: '打印',
                //       iconCls: 'icon-print',
                //       handler: function () {
                        
                //           $('#print').click();
                //       }
                //   }
                 
            ];



            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
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
                        param = $.JQForm.GetParam("AuditManage", "AuditingPreList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                      
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
