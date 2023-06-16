<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageRead.aspx.cs" Inherits="M_Main.SysNew.MessageRead" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_Fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
     <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>

</head>
	<body style="padding-right:20px;padding-top:5px;">
    <form id="frmForm" runat="server">
      <input id="MessageCode" type="hidden" name="MessageCode" runat="server"/>
      <input id="SendMan"  type="hidden" name="SendMan" runat="server"/>
      <input id="hiOPType"  type="hidden" name="hiOPType" runat="server"/>
			<table class="DialogTable">
                <tr >
                    <td   class="DialogTdTitle">消息标题</td>
					<td  class="DialogTdContent_2Col" colspan="3">
                        <span id="MsgTitle" runat="server"></span>
					</td>
				</tr>
				<tr >
                    <td   class="DialogTdTitle">消息时间</td>
					<td  class="DialogTdContent_2Col" colspan="3">
                        <span id="SendTime" runat="server"></span>
					</td>
				</tr>
                <tr >   
					<td class="DialogTdTitle">发送人</td>
                    <td class="DialogTdContent_2Col" colspan="3">
                        <span id="SendManName" runat="server"></span>&nbsp;&nbsp;(<span id="Reply" style="cursor:pointer;color:red;font-weight:bold;">回复</span>)
                    </td>
				</tr>
                <tr >   
					<td class="DialogTdTitle">接收人</td>
                    <td class="DialogTdContent_2Col" colspan="3">
                        <span id="UserName" runat="server"></span>
                    </td>                  
				</tr>
                <tr >   
                    <td class="DialogTdContent_2Col" colspan="4" style="padding-left:30px;padding-right:30px;">
                        <hr />
                        <span id="Content" runat="server"></span>
                    </td>                  
				</tr>	
			</table>
        <script type="text/javascript">

            $("#Reply").click(function () {
                var ReplyTitle = '[回复]' + $("#MsgTitle").html();
                HDialog.Open('800', '600', '../SysNew/MessageSend.aspx?OpType=add&ReplyCode=' + $("#SendMan").val() + '&ReplyName=' + $("#SendManName").html() + '&ReplyTitle=' + ReplyTitle, '在线短信', true, function callback(_Data) {
                    if (_Data != '') {
                    }
                });
            });

        </script>
		</form>
	</body>
</HTML>
