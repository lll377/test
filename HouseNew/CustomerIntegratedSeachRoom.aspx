<%@ Page Language="c#" CodeBehind="CustomerIntegratedSeachRoom.aspx.cs" AutoEventWireup="true" Inherits="M_Main.HouseNew.CustomerIntegratedSeachRoom" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustomerIntegratedSeachRoom</title>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script language="javascript">
        function btnClear_OnClick() {

            Form.RoomSign.value = "";
            Form.PropertyStartArea.value = "";
            Form.PropertyEndArea.value = "";
            Form.BuildStartArea.value = "";
            Form.BuildEndArea.value = "";
            Form.InteriorStartArea.value = "";
            Form.InteriorEndArea.value = "";
            Form.CommonStartArea.value = "";
            Form.CommonEndArea.value = "";
            Form.GardenStartArea.value = "";
            Form.GardenEndArea.value = "";
            Form.SubmitStartTime.value = "";
            Form.SubmitEndTime.value = "";
            Form.FittingStartTime.value = "";
            Form.FittingEndTime.value = "";
            Form.StayStartTime.value = "";
            Form.StayEndTime.value = "";
            //MaintCustSearch.MaintType.="";
            //MaintCustSearch.IsHandling.value="";
            //MaintCustSearch.SatisState.value="";
            //MaintCustSearch.IsReply.value="";
            //	Form.Hours.value="";			
        }

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                Form.RoomID.value = varObjects[0];
                Form.RoomSign.value = varObjects[2];
                Form.hiRoomSign.value = varObjects[2];

                //alert(varReturn);

                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                Form.CustID.value = varObjects[0];
                Form.CustName.value = varObjects[1];
                Form.hiCustName.value = varObjects[1];

                Form.RoomSign.value = "";
                Form.RoomID.value = "";
                Form.hiRoomSign.value = "";

                return true;
            }

            return false;
        }

        function SelRoomID_OnChange() {
            Form.RoomID.value = Form.SelRoomID.options[Form.SelRoomID.selectedIndex].value;
            Form.RoomSign.value = Form.SelRoomID.options[Form.SelRoomID.selectedIndex].text;
            Form.hiRoomSign.value = Form.RoomSign.value;

        }

        //查询对话框
        function btnFilterMore_OnClick() {
            var TableSign = getObject("TableSign").value;
            if (TableSign != "" && TableSign != null) {
                var strTemplateCode = TableSign;
                var strSearchData = escape(getObject("hiSearchData").value);
                varReturn = showModalDlg("../dialog/SearchDlg.aspx?TemplateCode=" + strTemplateCode + "&SearchData=" + strSearchData, "", 420, 400);

                //alert(varReturn);

                if (varReturn != "") {
                    var Search = eval('(' + varReturn + ')');
                    getObject("hiSearchSql").value = Search.SqlData.Sql;

                    //**重构数据(数据结构为JSON)					
                    var SearchData = Search.SqlData.Data;
                    //alert(Search.SqlData.Sql);
                    var val = "";
                    for (var i = 0; i < SearchData.length; i++) {
                        if (val != "") {
                            val = val + ",{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                        else {
                            val = "{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                    }
                    getObject("hiSearchData").value = "{Data:[" + val + "]}";
                }

                //alert(getObject("hiSearchData").value);
            }
        }

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body>
    <form id="Form" method="post" runat="server">
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server">
        <input id="CommID" size="1" type="hidden" name="CommID" runat="server">
        <input id="SType" size="1" type="hidden" name="SType" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1050px; height: 360px; padding: 10px;">
            <table class="DialogTable" style="width: 100%; line-height: 25px;">
                <tr>
                    <td class="DialogTdTitle">管理项目</td>
                    <td colspan="7" class="DialogTdContent">
                        <input id="CommName" disabled style="width: 94%"
                            readonly name="CommName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">组团区域</td>
                    <td class="DialogTdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">楼宇名称</td>
                    <td class="DialogTdContent">
                        <select id="BuildSNum" runat="server" name="BuildSNum"></select></td>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td class="DialogTdContent">
                        <input id="RoomSign" typ="text" name="RoomSign" runat="server" /></td>
                    <td class="DialogTdTitle">产权性质</td>
                    <td class="DialogTdContent">
                        <select id="PropertyRights" name="PropertyRights" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">使用性质</td>
                    <td class="DialogTdContent">
                        <select id="PropertyUses" name="PropertyUses" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">使用状态</td>
                    <td class="DialogTdContent">
                        <select id="UsesState" name="UsesState" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">房屋类型</td>
                    <td class="DialogTdContent">
                        <select id="RoomType" name="RoomType" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">交房状态</td>
                    <td class="DialogTdContent">
                        <select id="RoomState" runat="server" name="RoomState"></select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">建筑面积从</td>
                    <td class="DialogTdContent">
                        <input id="BuildStartArea" name="BuildStartArea" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="BuildEndArea" name="BuildEndArea" runat="server" /></td>
                    <td class="DialogTdTitle">套内面积从</td>
                    <td class="DialogTdContent">
                        <input id="InteriorStartArea" name="InteriorStartArea" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="InteriorEndArea" name="InteriorEndArea" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">合同交房时间从</td>
                    <td class="DialogTdContent">
                        <input id="ContSubStartDate" class="Wdate" onclick="WdatePicker()" name="ContSubStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="ContSubEndDate" class="Wdate" onclick="WdatePicker()" name="ContSubEndDate" runat="server" /></td>
                    <td class="DialogTdTitle">物业接管时间从</td>
                    <td class="DialogTdContent">
                        <input id="TakeOverStartDate" class="Wdate" onclick="WdatePicker()" name="TakeOverStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="TakeOverEndDate" class="Wdate" onclick="WdatePicker()" name="TakeOverEndDate" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">集中交房时间从</td>
                    <td class="DialogTdContent">
                        <input id="GetHouseStartDate" class="Wdate" onclick="WdatePicker()" name="GetHouseStartDate" runat="server"></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="GetHouseEndDate" class="Wdate" onclick="WdatePicker()" name="GetHouseEndDate" runat="server"></td>
                    <td class="DialogTdTitle">实际交房时间从</td>
                    <td class="DialogTdContent">
                        <input id="ActualSubStartDate" class="Wdate" onclick="WdatePicker()" name="ActualSubStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="ActualSubEndDate" class="Wdate" onclick="WdatePicker()" name="ActualSubEndDate" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">装修时间从</td>
                    <td class="DialogTdContent">
                        <input id="FittingStartTime" class="Wdate" onclick="WdatePicker()" name="FittingStartTime" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="FittingEndTime" class="Wdate" onclick="WdatePicker()" name="FittingEndTime" runat="server" /></td>
                    <td class="DialogTdTitle">入住时间从</td>
                    <td class="DialogTdContent">
                        <input id="StayStartTime" class="Wdate" onclick="WdatePicker()" name="StayStartTime" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="StayEndTime" class="Wdate" onclick="WdatePicker()" name="StayEndTime" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">缴费开始时间从</td>
                    <td class="DialogTdContent">
                        <input id="StartPayBeginDate" class="Wdate" onclick="WdatePicker()" name="StartPayBeginDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="EndPayBeginDate" class="Wdate" onclick="WdatePicker()" name="EndPayBeginDate" runat="server" /></td>
                    <td class="DialogTdTitle">交付状态</td>
                    <td class="DialogTdContent">
                        <select id="PayState" name="PayState" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">业主名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" name="CustName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">租户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName2" name="CustName" runat="server" />
                    </td>
                    <td class="TdTitle">供应商类别</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="SupplierType" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                    </td>
                    <td class="DialogTdTitle" colspan="4"></td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-top: 10px;" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
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
        var h1 = $(window).height();
        $("#TableContainer").css("height", h1 + "px");
    }

    var column = [[
        { field: 'RegionName', title: '组团区域', width: 110, align: 'left', sortable: true },
        { field: 'BuildName', title: '楼宇名称', width: 110, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
        {
            field: 'PaperNameName1', title: '业主证件类型', width: 220, align: 'left', sortable: true
        },
         {
             field: 'PaperCode1', title: '业主证件号', width: 220, align: 'left', sortable: true
         },
         {
             field: 'PaperNameName2', title: '租户证件名称', width: 220, align: 'left', sortable: true
         },
          {
              field: 'PaperCode2', title: '租户证件号', width: 220, align: 'left', sortable: true
          },
        {
            field: 'CustName1', title: '业主名称', width: 220, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('客户信息','" + row.CustID1 + "');\">" + row.CustName1 + "</a>";
                return str;
            }
        },
        {
            field: 'CustName2', title: '租户名称', width: 220, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('租户信息','" + row.CustID2 + "');\">" + row.CustName2 + "</a>";
                return str;
            }
        },
        { field: 'RoomModel', title: '房屋户型', width: 130, align: 'left', sortable: true },
        { field: 'PropertyRights', title: '产权性质', width: 100, align: 'left', sortable: true },
        { field: 'PropertyUses', title: '使用性质', width: 140, align: 'left', sortable: true },
        //{ field: 'areatypename', title: '面积类型', width: 100, align: 'left', sortable: true },
        { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '套内面积', width: 100, align: 'left', sortable: true },
        { field: 'CommonArea', title: '公摊面积', width: 100, align: 'left', sortable: true },
        //{ field: 'GardenArea', title: '花园面积', width: 120, align: 'left', sortable: true }
        { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
        {
            field: 'ActualSubDate', title: '交房时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FittingTime', title: '装修时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'StayTime', title: '入住时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.StayTime, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'SupplierTypeName', title: '供应商类别', width: 100, align: 'left', sortable: true },
        {
            field: 'PayBeginDate', title: '开始缴费时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                return str;
            }
        }
    ]];

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

               // CheckAuthority('1001', function callback(_Data) {
                   // if (_Data == "true") {
                        window.location.href = "../HouseNew/RoomSeachCreExcel.aspx";
                    //}
                    //else {
                    //    $.messager.alert('错误', '无此权限', 'error');
                    //}
                //});

            }
        }
    ];


    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            //onDblClickRow: function (rowIndex, rowData) {
            //    ViewDetail(rowData.RoomID);
            //},
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("Customer", "searchroomcontain", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }


    //房屋编号
    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        //    $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }
    //客户详情
    function ViewDetail(title, CustID) {
        HDialog.Open(w, h, '../HouseNew/CustomerDetail.aspx?Back=CustomerContainer&CustID=' + CustID + '&SType=details',
            title, false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //筛选客户
    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


        });
    }

    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", '90%');
        }
        $("#PropertyRights").css("width", '75%');
        $("#RoomState").css("width", '75%');
    });



    //清空查询条件
    function CancelParm() {
        $("#RegionSNum").val('');
        $("#BuildSNum").val('');
        $('#RoomSign').val("");
        $('#PropertyRights').val("");
        $('#PropertyUses').val("");
        $('#UsesState').val("");
        $('#RoomType').val("");
        $('#RoomState').val("");
        $('#BuildStartArea').val("");
        $('#BuildEndArea').val("");
        $('#InteriorStartArea').val("");
        $('#InteriorEndArea').val("");
        $('#ContSubStartDate').val("");
        $('#ContSubEndDate').val("");
        $('#TakeOverStartDate').val("");
        $('#TakeOverEndDate').val("");
        $('#GetHouseStartDate').val("");
        $('#GetHouseEndDate').val("");
        $('#ActualSubStartDate').val("");
        $('#ActualSubEndDate').val("");
        $('#FittingStartTime').val("");
        $('#FittingEndTime').val("");
        $('#StayStartTime').val("");
        $('#StayEndTime').val("");
        $('#StartPayBeginDate').val("");
        $('#EndPayBeginDate').val("");
        $('#PayState').val("");
        $('#CustName').val("");
        $('#CustName2').val("");

    }

</script>

