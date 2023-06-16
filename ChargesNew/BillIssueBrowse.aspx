<%@ Page Language="c#" CodeBehind="BillIssueBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BillIssueBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>BillIssueBrowse</title>
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
        BillIssueBrowse.BeginNum.value = "";
        BillIssueBrowse.EndNum.value = "";

        BillIssueBrowse.BeginIssueDate.value = "";
        BillIssueBrowse.EndIssueDate.value = "";

        BillIssueBrowse.BillsSign.value = "";
        BillIssueBrowse.ReceiveUserName.value = "";

    }
    //-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>

    <form id="BillIssueBrowse" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="PageSize" type="hidden" size="1" name="PageSize" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input type="hidden" id="RdoValue" name="RdoValue" runat="server" />
        <input class="button_six" style="display: none;" id="btnUpdate" type="button" value="刷新票据数量"
            name="btnUpdate" runat="server">
        <div style="width: 100%; background-color: #cccccc; border-top: 1px #95B8E7 solid" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 280px; padding: 10px;">
            <table id="Table1" class="DialogTable" style="line-height: 23px">
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch">
                        <asp:RadioButton ID="IsUsedAll" runat="server" Text="全部" GroupName="IsUsed" Checked="True"></asp:RadioButton><asp:RadioButton ID="IsUsedYesAll" runat="server" Text="已完成核销" GroupName="IsUsed" ></asp:RadioButton>
                        <asp:RadioButton ID="IsUsedYesHalf" runat="server" GroupName="IsUsed" Text="已部分核销"></asp:RadioButton><asp:RadioButton ID="IsUsedNo" runat="server" Text="未核销" GroupName="IsUsed"></asp:RadioButton></td>
                    <td class="TdTitle">领用人</td>
                    <td class="TdContent">
                        <input id="ReceiveUserName" name="ReceiveUserName" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">票据种类</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BillKind" Width="82%" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                    <td class="TdTitle">票据类别</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BillTypeID" Width="82%" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle">票据号</td>
                    <td class="TdContent">
                        <input id="BillsSign" placeholder="请输入完整票据号" maxlength="50" name="BillsSign"
                            runat="server"></td>
                    <td class="TdTitle">收据号</td>
                    <td class="TdContent">
                        <input id="OldBillsSign" placeholder="请输入完整收据号" name="OldBillsSign" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">起号</td>
                    <td class="TdContent">
                        <input onkeypress="CheckInterger();" id="BeginNum" maxlength="50"
                            name="BeginNum" runat="server"></td>
                    <td class="TdTitle">止号</td>
                    <td class="TdContent">
                        <input onkeypress="CheckInterger();" id="EndNum" maxlength="50"
                            name="EndNum" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">领用时间从</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" data-options="editable:false" style="width: 82%;" id="BeginIssueDate"
                            name="BeginIssueDate" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="easyui-datebox" data-options="editable:false" style="width: 82%;" id="EndIssueDate"
                            name="EndIssueDate" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="save" onclick="LoadList();" type="button" value="查询" name="save"
                            runat="server">
                        <input class="button" id="btnFilter" style="display: none;" type="button" value="查询" name="btnFilter"
                            runat="server">&nbsp;
                        <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();"
                            type="button" value="清空" name="btnClear">
                        <%-- <input class="button" id="btnReturn" style="height: 22px" type="button" value="返回" name="btnReturn"
                                runat="server">--%>
                        <%-- <input class="button_four" id="btnAdd" style="height: 22px" type="button" value="使用登记"
                                name="btnAdd" runat="server">--%>
                        <%--<input class="button_four" id="btnBatch" style="height: 22px" type="button" value="批量作废"
                                    name="btnBatch" runat="server">--%>

                    </td>
                </tr>
            </table>
            <%--      <tr>
                <td valign="top" width="100%">
                    <asp:DataGrid ID="DGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
                        Height="100%">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="BillID"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BillTypeName" HeaderText="票据类别"></asp:BoundColumn>
                            <asp:BoundColumn DataField="IssueDate" HeaderText="领用时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BeginNum" HeaderText="起号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EndNum" HeaderText="止号"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BeginSign" HeaderText="起号样票"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EndSign" HeaderText="止号样票"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ReceiveUserName" HeaderText="领用人"></asp:BoundColumn>
                            <asp:BoundColumn DataField="LimitUserName" HeaderText="使用人"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ShareCount" HeaderText="份数"></asp:BoundColumn>
                            <asp:BoundColumn DataField="SumAmount" HeaderText="金额"></asp:BoundColumn>
                            <asp:BoundColumn DataField="HasUsedCount" HeaderText="已用数"></asp:BoundColumn>
                            <asp:BoundColumn DataField="HasNotUsedCount" HeaderText="未用数"></asp:BoundColumn>
                            <asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='明细'&gt;"
                                HeaderText="[明细查询]" CommandName="Detail">
                                <HeaderStyle Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonColumn>
                            <asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='分类明细'&gt;"
                                HeaderText="[分类查询]" CommandName="Detail2">
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>--%>
        </div>
    </form>
</body>
</html>


<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {

        InitTableHeight();
        LoadList();


    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }


    var toolbar = [
         {
             text: '刷新票据数量',
             iconCls: 'icon-add',
             handler: function () {
                 $("#btnUpdate").click();
             }
         }, '-',
         {
             text: '使用登记',
             iconCls: 'icon-edit',
             handler: function () {
                 var BillTypeID = $("#BillTypeID").val();
                 //window.location.href = "BillUseManage.aspx?OPType=Insert&BillTypeID=" + BillTypeID;
                 HDialog.Open(1024, 630, '../ChargesNew/BillUseManage.aspx?OPType=Insert&BillTypeID=' + BillTypeID,
                     ' 票据登记', false,
                    function callback(_Data) {
                        if (_Data == "true") {
                            LoadList();
                        }
                    });
             }
         }, '-',
           {
               text: '批量作废',
               iconCls: 'icon-edit',
               handler: function () {
                   $.tool.DataGet('FeesReceipts', 'IsRoleBillUseCancel',"",
                       function Init() {
                       },
                       function callback(_Data) {
                           if (_Data == "true") {
                               HDialog.Open(1024, 620, '../ChargesNew/BillUseCancelManage.aspx', '票据批量作废', false,
                                   function callback(_Data) {
                                       if (_Data == "true") {
                                           LoadList();
                                       }
                                   });
                           } else {
                               HDialog.Info("无操作权限，请联系管理员！");
                           }
                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                       });
                  
               }
           }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }
    ];

    var Column = [[
           {
               field: 'BillTypeName', title: '票据类别', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = "<a href='javascript:void(0);' class=\"HrefStyle\" onclick='BillSearch(" + row.BillID + "," + row.BeginNum + "," + row.EndNum + ")'>" + row.BillTypeName + "</a>";
                   return str;
               }
           },
           {
               field: 'IssueDate', title: '领用时间', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = formatDate(row.IssueDate, "yyyy-MM-dd");
                   return str;
               }
           },
           { field: 'BeginNum', title: '起号', width: 100, align: 'left', sortable: true },
           { field: 'EndNum', title: '止号', width: 100, align: 'left', sortable: true },
           { field: 'BeginSign', title: '起号样票', width: 100, align: 'left', sortable: true },
           { field: 'EndSign', title: '止号样票', width: 100, align: 'left', sortable: true },
           { field: 'ReceiveUserName', title: '领用人', width: 100, align: 'left', sortable: true },
           { field: 'LimitUserName', title: '使用人', width: 100, align: 'left', sortable: true },
           { field: 'ShareCount', title: '份数', width: 100, align: 'left', sortable: true },
           { field: 'SumAmount', title: '金额', width: 100, align: 'left', sortable: true },
           { field: 'HasUsedCount', title: '已用数', width: 100, align: 'left', sortable: true },
           { field: 'HasNotUsedCount', title: '未用数', width: 100, align: 'left', sortable: true },
           {
               field: '发票明细', title: '发票明细', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = "<a href='javascript:void(0);' class=\"HrefStyle\" onclick='BillDetailsSearch(" + row.BillID + "," + row.BeginNum + "," + row.EndNum + ")'>明细</a>";
                   return str;
               }
           }
    ]]

    function LoadList() {

        var val = $('input:radio[name="IsUsed"]:checked').val();
     
        $("#RdoValue").val(val);
           
        //var Data = $('#RepDetail').val();
        //var obj = JSON.parse(Data);
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            columns: Column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            width: '100%',
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("FeesReceipts", "SearchBillData1", "TableContainer", param);
            }
        });

        $("#SearchDlg").dialog("close");
    }

    //$("#save").click(function () {
    //    var grid = $('#TableContainer');
    //    var options = grid.datagrid('options');
    //    var curr = options.pageNumber;
    //    var psize = options.pageSize;

    //    $("#PageIndex").val(curr);
    //    $("#PageSize").val(psize);

    //    $("#btnFilter").click();
    //})

    //发票明细
    function BillDetailsSearch(strBillID, strBeginNum, strEndNum) {
        var strBillsSign = $("#BillsSign").val();
        HDialog.Open(w, h, '../ChargesNew/BillIssueAllManage.aspx?BillID=' + strBillID + '&BillsSign="' + strBillsSign +
               '"&BeginNum=' + strBeginNum + '&EndNum=' + strEndNum, ' 发票明细', false,
           function callback(_Data) {
               if (_Data == "true") {
                   LoadList();
               }
           });
    }
    //发票查询
    function BillSearch(strBillID, strBeginNum, strEndNum) {
        var strBillsSign = $("#BillsSign").val();
        HDialog.Open(w, h, '../ChargesNew/BillIssueManage.aspx?BillID=' + strBillID + '&BillsSign="' + strBillsSign +
               '"&BeginNum=' + strBeginNum + '&EndNum=' + strEndNum, ' 发票明细', false,
           function callback(_Data) {
               if (_Data == "true") {
                   LoadList();
               }
           });
    }
</script>
