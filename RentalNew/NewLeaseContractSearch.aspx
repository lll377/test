<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewLeaseContractSearch.aspx.cs" Inherits="M_Main.RentalNew.NewLeaseContractSearch" %>


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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="CommID" name="CommID" type="hidden" runat="server" />
        <input id="IsCorp" name="IsCorp" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">
            <table style="width: 100%;" class="DialogTable">

                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="width: 80%;" data-options="editable:false"
                            name="CommNames" runat="server" /><input  id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCommNames" runat="server"><input  id="CommIDs" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CommIDs" runat="server"></td>
                </tr>

                <tr>
                    <td class="TdTitle">出租方</td>
                    <td class="TdContent" ><INPUT  id="Leaser"   name="Leaser"
														runat="server"></td>
                    <td class="TdTitle">承租方</td>
                    <td class="TdContent" ><INPUT  id="Renter"  
														 name="Renter" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent" >
                        <input  id="RoomSign"  
                            name="RoomSign" runat="server"></td>
                    <td  class="TdTitle"  >签定时间从</td>
                    <td class="TdContent" ><INPUT  id="SignBeginDate" 
														onclick="WdatePicker()" class="Wdate" style="width:45%"    name="StartDate" runat="server">到<INPUT  id="SignEndDate" 
														onclick="WdatePicker()" class="Wdate" style="width:45%"   name="EndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">租赁年限</td>
                    <td class="TdContent" >
                        <input  id="YearHold"  
                             name="YearHold" runat="server"></td>
                    <td style="width: 195px; z-index: 0" class="TdTitle"  >经营业态</td>
                    <td class="TdContent" >
                        <input  id="DealPromise"  
                             name="DealPromise" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">计租开始时间从</td>
                    <td class="TdContent" >
                        <input  id="BeginLeaseBeginDate"  class="Wdate" style="width:45%"
                            onclick="WdatePicker()"  name="LeaseBeginDate" runat="server">到<INPUT  id="EndLeaseBeginDate" class="Wdate" style="width:45%" 
														onkeypress="CheckDate();" onclick="WdatePicker()"   name="LeaseBeginDate" runat="server"></td>
                    <td class="TdTitle"   >计租结束日期从</td>
                    <td class="TdContent" ><INPUT  id="BeginLeaseEndDate" 
														onclick="WdatePicker()" class="Wdate" style="width:45%"  name="LeaseEndDate" runat="server">到<INPUT  id="EndLeaseEndDate" 
														onclick="WdatePicker()"  class="Wdate" style="width:45%"  name="LeaseEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否到期</td>
                    <td class="TdContent" ><asp:dropdownlist id="DrExpired" runat="server">
														<asp:ListItem></asp:ListItem>
														<asp:ListItem Value="1">已经到期</asp:ListItem>
													</asp:dropdownlist></td>
                    <td class="TdTitle"   >预警时间</td>
                    <td class="TdContent" ><INPUT  id="AdvanceDay" 
														  name="AdvanceDay" value="30" runat="server">天到期</td>
                </tr>
                <tr>
                    <td class="TdTitle">状态</td>
                    <td class="TdContent" ><SELECT id="IsEffect" name="IsEffect" runat="server">
														<OPTION selected></OPTION>
														<OPTION value="0">有效</OPTION>
														<OPTION value="1">失效</OPTION>
													</SELECT></td>
                    <td class="TdTitle">签约状态</td>
                    <td class="TdContent" > 
                        <asp:DropDownList ID="SignStatus" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContent" ><SELECT id="IsAudit" name="IsAudit" runat="server">
														<OPTION selected></OPTION>
														<OPTION value="0">未审核</OPTION>
														<OPTION value="1">已通过</OPTION>
														<OPTION value="2">未通过</OPTION>
														<OPTION value="3">审核中</OPTION>
													</SELECT></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent" ></td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>


        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">



            function SelCommInfo() {
             
                if ($('#CommID').val() != '0' && $('#IsCorp').val() == '') {
                    return;
                }
                else {
                     var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").searchbox("setText", arrRet.name);
                    });
                }
            }




            var column = [[

                    { field: 'OrganName', title: '区域名称', width: 100, align: 'left', sortable: true },
                    { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                    { field: 'ContTypeName', title: '业务类别', width: 100, align: 'left', sortable: true },
                    {
                        field: 'ContSign', title: '合同编号', width: 100, align: 'left', sortable: true,
                        formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('合同详情','" + row.ContID + "');\">" + row.ContSign + "</a>";
                            return str;
                        }
                    },
                    { field: 'LeaseContName', title: '合同名称', width: 100, align: 'left', sortable: true },
                    { field: 'Renter', title: '承租方', width: 100, align: 'left', sortable: true },
                    { field: 'LeaseBeginDate', title: '开始时间', width: 100, align: 'left', sortable: true , formatter: function (value, row, index) {

                            var str = formatDate(row.LeaseBeginDate, "yyyy-MM-dd");
                            return str;
                     }},
                    {
                        field: 'LeaseEndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.LeaseEndDate, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'RoomSigns', title: '房屋编号', width: 140, align: 'left', sortable: true },
                    { field: 'RoomName', title: '房屋名称', width: 140, align: 'left', sortable: true },
                    { field: 'IsAuditingName', title: '是否通过', width: 100, align: 'left', sortable: true },
                    { field: 'LeaseContRoleNames', title: '未审岗位', width: 100, align: 'left', sortable: true },
                    {
                        field: 'ContID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var values = "";
                            var IsAudit = row.IsAuditing;

                            //已审核数
                            var iHasAuditCount = row.HasAuditCount;
                            //需审核总数
                            var iHasCount = row.HasCount;



                            var strTmp = "(" + iHasAuditCount + "/" + iHasCount + ")";

                            if (IsAudit == 1) {
                                values = "<font color='red'>已通过";

                            }
                            else if (IsAudit == 2) {
                                values = "<font color='Blue'>未通过";

                            }
                            else {
                                values = "<font color='Green'>未审核" + strTmp + "";

                            }
                            return values;
                        }
                    }
            ]];

            var w = $(window).width();
            var h = $(window).height();

            //详情
            function ViewDetail(title, strContID) {
                HDialog.Open(w, h, '../RentalNew/LeaseRoomThdManage.aspx?OPType=His&ContID=' + strContID, title, false,
                   function callback(_Data) {

                   });
            }
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


            }
            InitTableHeight();

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
                         text: 'Excel导出',
                         iconCls: 'icon-page_white_excel',
                         handler: function () {
                             window.location.href = '../RentalNew/LeaseContractSearchCreExcel.aspx';
                         }
                     }
            ];


            function getQueryStr(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }
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
                        param = $.JQForm.GetParam("RoomRental", "LeaseContractList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
            }


             



            $(function () {
                var sy = getQueryStr("sy");
                if (sy == '1') {
                    $("#BeginLeaseEndDate").val(getCurrentMonthFirst());
                    $("#EndLeaseEndDate").val(getCurrentMonthLast());
                }
                LoadList();
            })
            function getCurrentMonthFirst() {
                var date = new Date();
                date.setDate(1);
                var month = parseInt(date.getMonth() + 1);
                var day = date.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            function getCurrentMonthLast() {
                var date = new Date();
                var currentMonth = date.getMonth();
                var nextMonth = ++currentMonth;
                var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
                var oneDay = 1000 * 60 * 60 * 24;
                var lastTime = new Date(nextMonthFirstDay - oneDay);
                var month = parseInt(lastTime.getMonth() + 1);
                var day = lastTime.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }


        </script>
    </form>
</body>
</html>
