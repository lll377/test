<%@ Page Language="c#" CodeBehind="OffsetPreDetailDelDlg.aspx.cs" AutoEventWireup="true" Inherits="M_Main.dialogNew.OffsetPreDetailDelDlg" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>费用删除原因</title>
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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script language="javascript">
			function CheckData()
			{
				
				if(OffsetPreDetailDelDlg.ChangeMemo.value=="")
				{
					alert("删除原因不能为空!");
					OffsetPreDetailDelDlg.ChangeMemo.focus();
					return false;
				}
								
				return true;
			}
		//-->
    </script>
</head>
<body>
    <form id="OffsetPreDetailDelDlg" method="post" runat="server">
       <table class="DialogTable" style="width: 100%">
				<TR>
					    <TD class="TdTitle"><input id="IID" type="hidden" size="1" name="IID"
								    runat="server"/>删除原因</TD>
					    <TD class="TdContent"><TEXTAREA id="ChangeMemo" style="WIDTH: 90%; HEIGHT: 112px;font-size:12px;" name="ChangeMemo" rows="7" wrap="soft"
								    cols="61" data-options="required:true" runat="server"></TEXTAREA></TD>
				 </TR>
				<TR>
					<TD colspan="2" style="text-align:center"><INPUT class="button" id="btnSave" type="button" onserverclick="btnSave_ServerClick" value="保存" name="btnSave" 
							runat="server"/>&nbsp;&nbsp;&nbsp; 
                        <INPUT class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server"/></TD>
				</TR>
			</table>
      
        </form>
</body>
</html>
<script type="text/javascript">
    $('#IID').val(sessionStorage.OffsetPreDetail_IID);

    $('#btnReturn').click(function () {
        HDialog.Close('false');
    });
</script>