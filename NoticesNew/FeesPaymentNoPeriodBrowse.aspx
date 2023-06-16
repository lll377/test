<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPaymentNoPeriodBrowse.aspx.cs" Inherits="M_Main.NoticesNew.FeesPaymentNoPeriodBrowse" %>


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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="AuditType" name="AuditType" type="hidden" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px;">

            <table class="DialogTable">
                 <tr>
                     <td class="TdTitle">管理项目</td>
                     <td class="TdContentSearch" ><input class="easyui-searchbox" id="CommName" maxlength="50" name="CommName" searcher="SelComm" data-options="editable:false" runat="server" /><INPUT id="CommID" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="CommID"
										runat="server"><INPUT id="hiCommName" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="hiCommName"
										runat="server"></td>
                       <td class="TdTitle">截至时间</td>
                      <td class="TdContentSearch"><input id="CutEndDate" class="Wdate"
                            onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="CutEndDate"
                            runat="server"></td>
                 </tr>
                

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

          
            function SelComm() {
               
                $('#CommName').searchbox("setValue", '');
                $('#CommID').val('');
              

                var conent = "../DialogNew/CommDlg.aspx";
                var w = 800;
                var h = 600;

                HDialog.Open(w, h, conent, '项目选择', false, function callback(_Data) {
                  

                    var data = JSON.parse(_Data);

                    $('#CommName').searchbox("setValue", data.text);
                    $('#CommID').val(data.attributes.InPopedom);
                  
                });

            }


            var column = [[
                     { field: 'CommName', title: '管理项目', width: 90, align: 'left', sortable: true },
                     {
                         field: 'BeginDate', title: '开始时间', width: 170, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.CommID + "','" + row.BeginDate + "','" + row.EndDate + "');\">" + formatDate(row.BeginDate, "yyyy-MM-dd HH:mm:ss") + "</a>";
                            return str;
                        }
                    },
                    {
                        field: 'EndDate', title: '结束时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.EndDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'PayAmount', title: '总金额', width: 100, align: 'left', sortable: true }
                   

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
                     
                        param = $.JQForm.GetParam("FeesPayment", "FeesPaySearchNoPeriodList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();


            function ViewDetail(strCommID, strBeginDate, strEndDate) {

                var w = $(window).width();
                var h = $(window).height();

                var title = '未交款按收款人明细';
                

                HDialog.Open(w, h, '../NoticesNew/FeesPaymentNoPeriodManage.aspx?CommID=' + strCommID + '&BeginDate=' + strBeginDate + '&EndDate=' + strEndDate, title, false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>

