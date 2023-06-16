<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewSinglePrecStatementsBrowse.aspx.cs" Inherits="M_Main.ChargesProcessNew.NewSinglePrecStatementsBrowse" %>


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
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script language="javascript">
		<!--
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

         <input type="hidden" id="IsStatic" name="IsStatic" runat="server" />
        <input type="hidden" id="RowData" name="RowData" runat="server" />
        <input type="button" id="print" name="print" runat="server" onserverclick="print_ServerClick" />
        <INPUT id="PrintParms" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="PrintParms"
										runat="server">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="生成条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">
            <table class="DialogTable">
                
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" style="width: 82%;" 
                            name="CustName" runat="server" disabled/><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">房屋编号</td>
                    <td Class="TdContentSearch">
                        <input id="RoomSign" style="width: 82%;" 
                            name="RoomSign" runat="server" disabled /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                </tr>
                
                <TR>
					<TD class="TdTitle" >开始日期</TD>
					<TD class="TdContentSearch" ><INPUT class="Wdate" onkeypress="CheckSmallDate();" id="FeesStateDate" style="width: 82%;" 
							onclick="WdatePicker()"  name="FeesStateDate" runat="server"></TD>
					<TD class="TdTitle">结束日期</TD>
					<TD class="TdContentSearch"><INPUT class="Wdate" onkeypress="CheckSmallDate();" id="FeesEndDate"  style="width: 82%;" 
							onclick="WdatePicker()" name="FeesEndDate" runat="server"></TD>
				</TR>
				<TR>
					<TD class="TdTitle">落款单位</TD>
					<TD class="TdContentSearch" ><INPUT class="Control_ItemInput" id="InscribeName" style="width: 82%;" maxLength="50" name="InscribeName" runat="server"></TD>
					<TD class="TdTitle" >预交类别</TD>
					<TD class="TdContentSearch"><SELECT id="SelType" style="width: 82%;" name="SelType" runat="server">
							<OPTION>全部</OPTION>
							<OPTION selected value="2">预存</OPTION>
						</SELECT></TD>
				</TR>
				<TR>
					<TD class="TdTitle" >联系电话</TD>
					<TD class="TdContent" colspan="3"><TEXTAREA style="width: 92%;"  rows="5" cols="30" id="TelPhone" name="TelPhone"
							runat="server">
						</TEXTAREA></TD>
				</TR>
                <tr>
                    <td align="center" colspan="4">
                          <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Static();">生成</a></td>
                </tr>
            </table>
        </div>

        <div id="PrintDlg" class="easyui-dialog" title="打印" data-options="iconCls:'icon-print',closed: true,modal:true"
            style="width: 300px; height:100px;">
            <table class="DialogTable">
                <tr>
                    <TD  class="TdTitle">设置打印页数</TD>
                    <td colspan="3" Class="TdContentSearch"> 从<INPUT  class="easyui-validatebox" id="StartPage" style="WIDTH: 20%;" maxLength="50" data-options="prompt:'请输入数字',required:true,validType:'positiveint'"
											size="5" value="1" name="StartPage" runat="server"/>页到<INPUT   class="easyui-validatebox" id="EndPage" style="WIDTH: 20%;" maxLength="50" data-options="prompt:'请输入数字',required:true,validType:'positiveint'"
											size="5" value="1" name="EndPage" runat="server"/>页</td>
                </tr>
                  <tr>
                    <td colspan="4" style="text-align:center">
                          <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-print'" onclick="Print();">打印</a>
                    </td>
                </tr>
                </table>
             </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
               
                $('#RowData').hide();
                $('#print').hide();
                $('#printsel').hide();
                $('#IsStatic').val(-1);
            }
            InitFunction();

            function Static()
            {
                $('#IsStatic').val(1);
                 LoadList();
            }
            function Print()
            {
                $('#print').click();
            }

           
            var column = [[

            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            {
                field: 'GenerationDate', title: '生成时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(row.GenerationDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'StartDate', title: '开始时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(row.StartDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'EndDate', title: '结束时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(row.EndDate, "yyyy-MM-dd");
                    return str;
                }
            }
            ]];


            var toolbar = [
                 {
                     text: '生成',
                     iconCls: 'icon-save',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');

                     }
                 } ,'-', {
                      text: '打印',
                      iconCls: 'icon-print',
                      handler: function () {
                          $('#PrintDlg').parent().appendTo($("form:first"))
                          $('#PrintDlg').dialog('open');
                      
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
                        param = $.JQForm.GetParam("ReceiveFeesHis", "PrecStatements", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $("#SearchDlg").dialog("close");

            }

            LoadList();

            $('#btnSave').click(function () {

                LoadList();

            });


        </script>
    </form>
</body>
</html>

