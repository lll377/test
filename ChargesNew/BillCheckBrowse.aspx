<%@ Page Language="c#" CodeBehind="BillCheckBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BillCheckBrowse" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>BillCheckBrowse</title>
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
        //BillCheckBrowse.BillTypeID.value="";
        BillCheckBrowse.CommID.value = "";
        BillCheckBrowse.CommName.value = "";
        BillCheckBrowse.hiCommName.value = "";

        BillCheckBrowse.BeginNum.value = "";
        BillCheckBrowse.EndNum.value = "";
        BillCheckBrowse.ReceiveUserName.value = "";

        BillCheckBrowse.BillsSign.value = "";
    }
    function checkFormAll(chk) {
        var val = document.BillCheckBrowse.SelReturn.value;
        var form = document.getElementById("BillCheckBrowse");
        var chkval = "";
        for (var i = 0; i < form.elements.length; i++) {

            //��ֵ
            if (form.elements[i].type == "checkbox") {
                if (form.elements[i].value != "on") {
                    chkval = "," + form.elements[i].value

                    if (chk.checked) {
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }
                    }
                    else {
                        val = val.replace(chkval, "")
                    }

                    form.elements[i].checked = chk.checked

                }
            }
        }

        document.BillCheckBrowse.SelReturn.value = val
    }

    function checkFormOne(chk) {
        var val = document.BillCheckBrowse.SelReturn.value;
        var chkval = "";
        chkval = "," + chk.value
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        document.BillCheckBrowse.SelReturn.value = val

        //alert(document.BillCheckBrowse.SelReturn.value)
    }
    function setcheckForm() {
        var val = document.BillCheckBrowse.SelReturn.value;
        var form = document.getElementById("BillCheckBrowse");
        var chkval = "";

        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox") {
                chkval = "," + form.elements[i].value

                if (form.elements[i].value != "on") {
                    if (val.indexOf(chkval) < 0) {
                        form.elements[i].checked = false

                    }
                    else {
                        form.elements[i].checked = true

                    }
                }
            }
        }
        //alert(document.BillCheckBrowse.SelReturn.value)
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
<body onload="Win_OnLoad();">
    <form id="BillCheckBrowse" method="post" runat="server">
        <input id="PageIndex" size="1" type="hidden" name="PageIndex" runat="server">
        <input id="SelReturn" size="1" type="hidden" name="SelReturn" runat="server">
        <input type="hidden" id="RepDetail" name="RepDetail" runat="server" />
        <input type="hidden" id="RdoValue" name="RdoValue" runat="server" />
        <input id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px; padding: 10px;">
            <table id="Table1" class="DialogTable">
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch" colspan="7">
                        <input type="radio" id="IsUsedAll" name="IsUsed" value="IsUsedAll" />ȫ��
                        <input type="radio" id="IsUsedYesAll" name="IsUsed" value="IsUsedYesAll" />����ɺ���
                        <input type="radio" id="IsUsedYesHalf" name="IsUsed" value="IsUsedYesHalf" />�Ѳ��ֺ���
                        <input type="radio" id="IsUsedNo" name="IsUsed" checked value="IsUsedNo" />δ����
                      <%--  <asp:RadioButton ID="IsUsedAll" runat="server" GroupName="IsUsed" Text="ȫ��" ></asp:RadioButton>
                        <asp:RadioButton ID="IsUsedYesAll" runat="server" GroupName="IsUsed" Text="����ɺ���" ></asp:RadioButton>
                        <asp:RadioButton ID="IsUsedYesHalf" runat="server" Text="�Ѳ��ֺ���" GroupName="IsUsed" ></asp:RadioButton>
                        <asp:RadioButton ID="IsUsedNo" runat="server" GroupName="IsUsed" Text="δ����" Checked="True" ></asp:RadioButton>--%>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">ʹ��С��</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 83%;" id="CommName" data-options="editable:false" searcher="SelComm" name="CommName" runat="server">
                        <input id="CommID" type="hidden" name="CommID" runat="server">
                        <input id="hiCommName" size="1" type="hidden" name="hiCommName" runat="server">
                    </td>
                    <td class="TdTitle">������</td>
                    <td class="TdContent">
                        <input id="ReceiveUserName" name="ReceiveUserName" runat="server"></td>
                    <td class="TdTitle">Ʊ������</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BillKind" Width="82%" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle">Ʊ�����</td>
                    <td class="TdContentSearch">
                        <select id="BillTypeID" name="BillTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">�Ƿ�����</td>
                    <td class="TdContentSearch">
                        <select id="IsUseOver" name="IsUseOver" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">Ʊ�ݺ�</td>
                    <td class="TdContent">
                        <input id="BillsSign" name="BillsSign" placeholder="����������Ʊ�ݺ�" runat="server"></td>
                    <td class="TdTitle">�� ��</td>
                    <td class="TdContent">
                        <input id="BeginNum" onkeypress="CheckInterger();" name="BeginNum" runat="server"></td>
                    <td class="TdTitle">ֹ ��</td>
                    <td class="TdContent">
                        <input id="EndNum" onkeypress="CheckInterger();" name="EndNum" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <input class="button" style="display: none;" id="btnUpdate" type="button" value="ˢ��Ʊ������"
                            name="btnUpdate" runat="server">&nbsp;&nbsp;
                        <input id="btnFilter" class="button" value="�� ѯ" type="button" onclick="LoadList()" name="btnFilter" runat="server">
                        <input id="btnoCheck" style="display: none;" class="button" onclick="OnCheck();" value="�� ��" type="button" name="btnoCheck">
                        <input id="btnSearch" style="display: none;" class="button" onclick="ClaSearch();" value="�����ѯ" type="button" name="btnSearch">
                        <input id="btnClear" class="button" onclick="javascript: CancelParm();" value="�� ��" type="button" name="btnClear">
                        <input id="btnCheck" style="display: none;" class="button" value="����ȷ��" onclick="javascript: if (CheckData() == false) return false;"
                            type="button" name="btnCheck" runat="server">
                        <input id="btnCancel" style="display: none;" class="button" value="��������" onclick="javascript: if (CheckData() == false) return false;"
                            type="button" name="btnCancel" runat="server">
                        <input id="btnClean" class="button" value="����Ʊ��" type="button" name="btnClean" runat="server">
                        <input id="Btn_Excel" style="display: none;" class="button" value="Excel���" type="button" name="Btn_Excel" runat="server">
                        <input id="btnPrint" style="display: none;" class="button" value="��ӡ" type="button" name="btnPrint" runat="server">
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc; border-top: 1px #95B8E7 solid" id="TableContainer">
        </div>
        <%--            <tr>
                <td valign="top" width="100%">
                    <asp:DataGrid ID="DGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
                        Height="100%">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="BillID"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BillTypeName" HeaderText="Ʊ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BeginNum" HeaderText="���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EndNum" HeaderText="ֹ��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ShareCount" HeaderText="����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BeginSign" HeaderText="�����Ʊ"></asp:BoundColumn>
                            <asp:BoundColumn DataField="EndSign" HeaderText="ֹ����Ʊ"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CommName" HeaderText="ʹ��С��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ReceiveUserName" HeaderText="������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="LimitUserName" HeaderText="ʹ����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="SumAmount" HeaderText="���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="HasUsedCount" HeaderText="������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="HasNotUsedCount" HeaderText="δ����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CheckUserName" HeaderText="������"></asp:BoundColumn>
                            <asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='����'&gt;"
                                HeaderText="[����]" CommandName="Check">
                                <HeaderStyle Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonColumn>
                            <asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='�����ѯ'&gt;"
                                HeaderText="[�����ѯ]" CommandName="Search">
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonColumn>
                            <asp:TemplateColumn>
                                <HeaderTemplate>
                                    <input id="Checkbox1" onclick=" checkFormAll(this)" type="checkbox" value="on" name="Checkbox1"
                                        runat="server">ȫѡ
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input id="ck" onclick="checkFormOne(this)" type="checkbox" value='<%# DataBinder.Eval(Container.DataItem,"BillID") + "\t" + DataBinder.Eval(Container.DataItem,"HasNotUsedCount") + "\t" + DataBinder.Eval(Container.DataItem,"CheckUserCode") %>' name="ck" runat="server">
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>--%>
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
             text: 'ˢ��Ʊ������',
             iconCls: 'icon-add',
             handler: function () {
                 $("#btnUpdate").click();
             }
         }, '-',
         {
             text: 'ɸѡ',
             iconCls: 'icon-search',
             handler: function () {
                 $('#SearchDlg').parent().appendTo($("form:first"))
                 $('#SearchDlg').dialog('open');
             }
         }, '-',
         //{
         //    text: '����',
         //    iconCls: 'icon-edit',
         //    handler: function () {
         //        OnCheck();
         //    }
         //}, '-',
         //{
         //    text: '�����ѯ',
         //    iconCls: 'icon-search',
         //    handler: function () {
         //        ClaSearch();
         //    }
         //}, '-',
         {
             id: 'btnCheck1',
             text: '��������',
             iconCls: 'icon-edit',
             handler: function () {
                 $("#btnCheck").click();
             }
         }, '-',
           {
               id: 'btnCancel1',
               text: '��������',
               iconCls: 'icon-edit',
               handler: function () {

                   $("#btnCancel").click();
               }
           }, '-',
            {
                text: 'Excel���',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = "../ChargesNew/BillCheckCreExcel.aspx";
                }
            }, '-',
            {
                text: '��ӡ',
                iconCls: 'icon-print',
                handler: function () {
                    $("#btnPrint").click();
                }
            }
    ];

    var Column = [[
           { field: 'ck', checkbox: true },
           {
               field: 'BillTypeName', title: 'Ʊ�����', width: 140, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = "<a href='javascript:void(0);' onclick='OnCheck(" + row.BillID + "," + row.BeginNum + "," + row.EndNum + "," + row.CommID+")'>" + row.BillTypeName + "</a>";
                   return str;
               }
           },
           { field: 'BeginNum', title: '���', width: 100, align: 'left', sortable: true },
           { field: 'EndNum', title: 'ֹ��', width: 100, align: 'left', sortable: true },
           { field: 'ShareCount', title: '����', width: 100, align: 'left', sortable: true },
           { field: 'BeginSign', title: '�����Ʊ', width: 100, align: 'left', sortable: true },
           { field: 'EndSign', title: 'ֹ����Ʊ', width: 100, align: 'left', sortable: true },
           { field: 'CommName', title: 'ʹ��С��', width: 100, align: 'left', sortable: true },
           { field: 'ReceiveUserName', title: '������', width: 100, align: 'left', sortable: true },
           { field: 'LimitUserName', title: 'ʹ����', width: 100, align: 'left', sortable: true },
           { field: 'SumAmount', title: '���', width: 100, align: 'left', sortable: true },
           { field: 'HasUsedCount', title: '������', width: 100, align: 'left', sortable: true },
           { field: 'HasNotUsedCount', title: 'δ����', width: 100, align: 'left', sortable: true },
           { field: 'CheckUserName', title: '������', width: 100, align: 'left', sortable: true },
           {
               field: 'Ʊ����ϸ', title: 'Ʊ����ϸ', width: 100, align: 'left', sortable: true,
               formatter: function (value, row, index) {
                   var str = "<a href='javascript:void(0);' onclick='ClaSearch(" + row.BillID + "," + row.BeginNum + "," + row.EndNum + ")'>Ʊ������</a>";
                   return str;
               }
           }
    ]]

    //����
    function OnCheck(strBillID, strBeginNum, strEndNum, strCommID)
    {
        HDialog.Open(w, h, '../ChargesNew/BillCheckManage.aspx?CommID=' + strCommID+'&BillID=' + strBillID + '&BeginNum=' +
              strBeginNum + '&EndNum=' + strEndNum, ' ��Ʊ����', false,
           function callback(_Data) {
               if (_Data == "true") {
                   LoadList();
               }
           });
    }
    //�����ѯ
    function ClaSearch(strBillID, strBeginNum, strEndNum)
    {
       
        HDialog.Open(1024, 650, '../ChargesNew/BillCheckAllManage.aspx?BillID=' + strBillID + '&BeginNum=' +
               strBeginNum + '&EndNum=' + strEndNum, ' ��Ʊ��ϸ', false,
           function callback(_Data) {
               if (_Data == "true") {
                   LoadList();
               }
           });
    }

    //����ȷ��
    function CheckData() {
        var row = $("#TableContainer").datagrid("getChecked");
        if (row == null || row.length <= 0) {
            HDialog.Info('��ѡ��Ʊ�ݣ�');
            return false;
        } else {
            var strReturn = "";
            $.each(row, function (key, val) {
                strReturn += row[key]["BillID"] + "��" + row[key]["HasNotUsedCount"] + "��" + row[key]["CheckUserCode"] + ",";
            });
            strReturn = strReturn.substr(0, strReturn.length - 1);
            BillCheckBrowse.SelReturn.value = strReturn;
            return true;
        }

    }

    function LoadList() {
        var val = $('input:radio[name="IsUsed"]:checked').val();

        $("#RdoValue").val(val);
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
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
                param = $.JQForm.GetParam("FeesReceipts", "SearchBillData2", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                CheckState();
                $("#SearchDlg").dialog("close");
            }
        });

    }

    function CheckState() {

        //���ƺ��� ����״̬
        var chkVal = $("input[name='IsUsed']:checked").val();
        if (chkVal == "IsUsedYesAll" || chkVal == "IsUsedYesHalf") {
            $('#btnCheck1').addClass("l-btn-disabled l-btn-plain-disabled");
            $('#btnCancel1').removeClass("l-btn-disabled l-btn-plain-disabled");
           
        }
        else {
            if (chkVal == "IsUsedNo") {
                $('#btnCheck1').removeClass("l-btn-disabled l-btn-plain-disabled");
                $('#btnCancel1').addClass("l-btn-disabled l-btn-plain-disabled");
             
            }
            else {
                $('#btnCheck1').addClass("l-btn-disabled l-btn-plain-disabled");
                $('#btnCancel1').addClass("l-btn-disabled l-btn-plain-disabled");
             
            }
        }
    }

    //ѡ��С��
    function SelComm() {
        var varReturn;

        var w = 800;
        var h = 600;

        HDialog.Open(w, h, "../dialogNew/CommDlg.aspx", 'С��ѡ��', false, function callback(_Data) {

            if (_Data != "") {//**��÷��� ˢ��
                var data = JSON.parse(_Data);

                $('#CommName').searchbox("setValue", data.text);
                $('#CommID').val(data.attributes.InPopedom);
                $('#hiCommName').val(data.text);

                return true;
            }
        });

        return false;
    }

    function ViewDetail(title, OpType, BillKind) {

        HDialog.Open(800, 330, '../ChargesNew/BillDataManage.aspx?BillKind=' + BillKind + '&OpType=' + OpType, title, false,
            function callback(_Data) {
                if (_Data == "true") {
                    HDialog.Info('����ɹ�');
                    LoadList();
                }
            });
    }

    function CancelParm() {
        $('#CommName').searchbox("setValue", "");
        $('#CommID').val("");
        $('#hiCommName').val("");
        $("#BeginNum").val("");
        $("#EndNum").val("");

        $("#ReceiveUserName").val("");
        $('#BillKind').val("");
        $('#BillTypeID').val("");

        $("#BillsSign").val("");

    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", '83%');
    });
</script>
