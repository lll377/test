<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentRemindersFrame.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentRemindersFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <title></title>
     <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
        <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
        <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
        <script type="text/javascript" src="../jscript/JSClient.js"></script>
        <script type="text/javascript" src="../jscript/Cache.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="IncidentID" style="height: 22px; width: 40px" type="hidden" size="1" name="IncidentID" runat="server"/>
    <div id="TableContainer">
        </div>
   
           <script type="text/javascript" >

               function InitTableHeight() {
                   var h = $(window).height();
                   $("#TableContainer").css("height", h + "px");
               }

               InitTableHeight();
               var column = [[
                  { field: 'UserName', title: '催办人', width: 120, align: 'left', sortable: true },
                  { field: 'RemindersDate', title: '催办时间', width: 120, align: 'left', sortable: true }
                  //{ field: 'InfoContent', title: '催办内容', width: 300, align: 'left', sortable: true },
               ]];
               function LoadList() {
                   $("#TableContainer").datagrid({
                       url: '/HM/M_Main/HC/DataPostControl.aspx',
                       method: "post",
                       nowrap: false,
                       pageSize: top.ListPageSize,
                       pageList: top.ListPageList,
                       columns: column,
                       fitColumns: true,
                       rownumbers: true,
                       singleSelect: true,
                       pagination: true,
                       border: false,
                       width: "100%",
                       sortOrder: "asc",
                       onBeforeLoad: function (param) {
                           param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentReminders", "TableContainer", param);
                       },
                       onLoadSuccess: function (data) { 
                       }
                   });
               }

               LoadList();
           </script>
     </form>
</body>
</html>
