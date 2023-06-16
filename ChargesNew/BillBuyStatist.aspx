<%@ Page Language="c#" CodeBehind="BillBuyStatist.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BillBuyStatist" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>BillBuyStatist</title>
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
        function btnClear_OnClick() {
            BillBuyStatist.BeginNum.value = "";
            BillBuyStatist.EndNum.value = "";
            BillBuyStatist.BillsSign.value = "";

            BillBuyStatist.CommID.value = "";
            BillBuyStatist.CommName.value = "";
            BillBuyStatist.hiCommName.value = "";

            BillBuyStatist.ReceiveUserName.value = "";
        }

        //选择小区
        function btnSelComm_OnClick() {

            varReturn = showModalDlg("../dialog/CommDlg.aspx" + "?Ram=" + Math.random(), "", 600, 450);

            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                BillBuyStatist.CommID.value = varObjects[0];
                BillBuyStatist.CommName.value = varObjects[1];
                BillBuyStatist.hiCommName.value = varObjects[1];
            }
        }

    </script>
</head>
<body>
    <form id="BillBuyStatist" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 650px; height: 250px; padding: 10px;">
            <table id="Table1" class="DialogTable" style="line-height:25px;">
                <tr>
                    <td class="TdTitle">使用小区</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width:165px;" id="CommName" data-options="editable:false" searcher="SelComm" name="CommName" runat="server">
                        <%--<input id="btnSelComm" class="Button_sel" onclick="btnSelComm_OnClick();" type="button"
                            name="btnSelComm" runat="server">--%>
                        <input id="CommID" type="hidden" name="CommID" runat="server">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">票据种类</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BillKind"  Width="165px" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                    <td class="TdTitle">票据类别</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BillTypeID"  Width="165px" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="TdTitle">发放时间</td>
                    <td class="TdContentSearch">
                        <select id="nYear1" name="nYear1" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 60px;">
                            <option selected></option>
                        </select>年<select id="nMonth1" name="nMonth1" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 45px;">
                            <option selected></option>
                        </select>月<select id="nDay1" name="nDay1" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 45px;">
                            <option selected></option>
                        </select>日</td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <select id="nYear2" name="nYear2" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 60px;">
                            <option selected></option>
                        </select>年<select id="nMonth2" name="nMonth2" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 45px;">
                            <option selected></option>
                        </select>月<select id="nDay2" name="nDay2" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: '100'" style="width: 45px;">
                            <option selected></option>
                        </select>日</td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="4"></td>
                </tr>
                <tr>
                    <td class="DialogTdSubmit" colspan="4" align="center">
                        <input id="btnSave" type="button" value="统 计" name="btnSave" class="button">
                        <input id="btnFilter" style="display:none;" type="button" value="统 计" name="btnFilter" runat="server"
                            class="button">&nbsp;
                        <input id="btnClear"  onclick="CancelParm();" type="button"
                                value="清 空" name="btnClear" class="button">
                    </td>
                </tr>
            </table>
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

    //统计票据数据
    $('#btnSave').click(function () {
        document.getElementById("btnFilter").click();
        LoadList();

    });
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
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = "../ChargesNew/BillBuyStatistCreExcel.aspx";
                }
            }
    ];

    var Column = [[
           { field: 'BillKindName', title: '票据种类', width: 130, align: 'left', sortable: true },
           { field: 'BillTypeName', title: '票据类别', width: 130, align: 'left', sortable: true },
           { field: 'BeginAmount', title: '期初余额', width: 130, align: 'left', sortable: true },
           { field: 'CurBuyAmount', title: '本期购入', width: 130, align: 'left', sortable: true },
           { field: 'CurIssueAmount', title: '本期发放', width: 130, align: 'left', sortable: true },
           { field: 'EndAmount', title: '期末余额', width: 130, align: 'left', sortable: true }
    ]]

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: Column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("FeesReceipts", "SearchBillStatist", "TableContainer", param);
            }
        });
        $('#SearchDlg').dialog('close');
    }

    function SelComm() {
        var varReturn;

        var w = 800;
        var h = 600;

        HDialog.Open(w, h, "../dialogNew/CommDlg.aspx", '小区选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新
                var data = JSON.parse(_Data);

                $('#CommName').searchbox("setValue", data.text);
                $('#CommID').val(data.attributes.InPopedom);


                return true;
            }
        });

        return false;
    }


    function CancelParm() {
        $('#CommName').searchbox("setValue", "");
        $('#CommID').val("");
        $("#ReceiveUserName").val("");
        $('#BillKind').combobox('clear');
        $('#BillTypeID').combobox('clear');
        $("#BillsSign").val("");
        $("#BeginNum").val("");
        $("#EndNum").val("");
    }

    //$("select").each(function () {

    //    var key = $(this).attr("id");
    //    $(this).css("width", document.body.clientWidth * 0.25 * 0.57);
    //});
</script>
