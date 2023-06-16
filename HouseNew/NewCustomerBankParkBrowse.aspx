<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomerBankParkBrowse.aspx.cs" Inherits="M_Main.HouseNew.NewCustomerBankParkBrowse" %>



<!DOCTYPE HTML>
<html>
<head>
    <title>Customer</title>
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
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <style type="text/css">
        .HrefStyle {
            color: darkblue;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="FrmForm" method="post" runat="server">
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px;">
            <table class="DialogTable">

                <tr>
                    <td class="DialogTdTitle">客户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" name="CustName" runat="server">
                    </td>
                    <td class="DialogTdTitle">房屋编号</td>
                    <td class="DialogTdContent">
                        <input id="RoomSign" name="RoomSign" runat="server">
                    </td>
                    <td class="DialogTdTitle">车位编号</td>
                    <td class="DialogTdContent">
                        <input id="ParkName" name="ParkName" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">银行名称</td>
                    <td class="DialogTdContent">
                        <select id="BankName" name="BankName" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="DialogTdTitle">银行帐号</td>
                    <td class="DialogTdContent">
                        <input id="BankAccount" name="BankAccount" runat="server">
                    </td>
                    <td class="DialogTdTitle">银行户名</td>
                    <td class="DialogTdContent">
                        <input id="BankIDs" name="BankIDs" runat="server"></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">登记更改时间从</td>
                    <td class="DialogTdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="SignStart" runat="server" name="SignStart" /></td>
                    <td class="DialogTdTitle">到：</td>
                    <td class="DialogTdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="SignEnd" runat="server" name="SignEnd" /></td>
                    <td class="DialogTdTitle"></td>
                    <td class="DialogTdContent"></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle" colspan="6"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="6">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">确定筛选</a>
                    </td>

                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    var editrows = [];
    var editIndex = undefined;
    function InitTableHeight() {
        var h = $(window).height();

        $("#TableContainer").css("height", h + "px");
    }
    InitTableHeight();

    var BankName = [];
    var BankCode = [];
    var BankPaperName = [];
    var CityValue = [];

    function LoadData() {
        $.tool.DataPost('CustBank', 'GetCommbox', $('#frmForm').serialize(),
            function Init() {

            },
            function callback(_Data) {

                var Data = _Data; //转换为json对象

                var bBankName = Data.split('|')[0];
                var bBankCode = Data.split('|')[1];
                var bBankPaperName = Data.split('|')[2];

                BankName = eval(bBankName);
                BankCode = eval(bBankCode);
                BankPaperName = eval(bBankPaperName);

                column = [[
                    {
                        field: 'BankName', title: '托收类别', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (value == '') {
                                return;
                            }

                            for (var i = 0; i < BankName.length; i++) {
                                if (BankName[i].value == value) {
                                    return BankName[i].text;
                                }
                            }

                        }, editor: { type: 'combobox', options: { data: BankName, valueField: "value", textField: "text" } }
                    },
                    {
                        field: 'BankCode', title: '银行行别', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (value == '') {
                                return;
                            }

                            for (var i = 0; i < BankCode.length; i++) {
                                if (BankCode[i].value == value) {
                                    return BankCode[i].text;
                                }
                            }
                        }, editor: { type: 'combobox', options: { data: BankCode, valueField: "value", textField: "text" } }
                    },
                    {
                        field: 'BankProvince', title: '开户行省份', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                            for (var i = 0; i < province.length; i++) {
                                if (province[i].ProName == value) {
                                    return province[i].ProName;
                                }
                            }
                            return value;
                        }, editor: {
                            type: 'combobox', options: {
                                data: province, valueField: "ProName", textField: "ProName", onSelect: function (record) {
                                    var row = $('#TableContainer').datagrid('getSelected');//获取选择行
                                    var rowIndex = $('#TableContainer').datagrid('getRowIndex', row);//获取行标
                                    var target = $('#TableContainer').datagrid('getEditor', { 'index': rowIndex, 'field': 'BankCity' }).target;
                                    target.combobox('clear'); //清除原来的数据
                                    var dd = JSON.stringify(target.combobox('getData'));
                                    var arr = GetProjValue(record.ProName);
                                    var ds = GetCityValue(arr);
                                    target.combobox('loadData', JSON.parse(ds));
                                }
                            }
                        }
                    },
                    {
                        field: 'BankCity', title: '开户行市', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                            for (var i = 0; i < city.length; i++) {
                                if (city[i].CityName == value) {
                                    return city[i].CityName;
                                }
                            }
                            return value;
                        }, editor: { type: 'combobox', options: { data: CityValue, valueField: "CityName", textField: "CityName" } }
                    },
                    { field: 'BankNo', title: '开户行行号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankInfo', title: '开户行名称', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankIDs', title: '银行户名', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankAccount', title: '银行账号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankAgreement', title: '代收协议编号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    {
                        field: 'BankPaperName', title: '持卡证件名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (value == '') {
                                return;
                            }

                            for (var i = 0; i < BankPaperName.length; i++) {
                                if (BankPaperName[i].value == value) {
                                    return BankPaperName[i].text;
                                }
                            }
                        }, editor: { type: 'combobox', options: { data: BankPaperName, valueField: "value", textField: "text" } }
                    },
                    { field: 'BankPaperCode', title: '持卡人证件号码', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankMobilePhone', title: '持卡人联系电话', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'BankCustCode', title: '银行客户编码', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                    { field: 'SignDate', title: '登记时间', width: 100, align: 'left', sortable: true }
                ]];

                LoadList();

            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    }



    var frozenColumns = [[
        { field: 'CustName', title: '客户名称', width: 168, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
        { field: 'ParkName', title: '车位编号', width: 150, align: 'left', sortable: true },
    ]];

    var column = [[

        { field: 'ParkArea', title: '车位面积', width: 100, align: 'left', sortable: true },
        { field: 'CarSign', title: '车牌号码', width: 100, align: 'left', sortable: true },
        {
            field: 'BankName', title: '托收类别', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                if (value == '') {
                    return;
                }

                for (var i = 0; i < BankName.length; i++) {
                    if (BankName[i].value == value) {
                        return BankName[i].text;
                    }
                }

            }, editor: { type: 'combobox', options: { data: BankName, valueField: "value", textField: "text" } }
        },
        {
            field: 'BankCode', title: '银行行别', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                if (value == '') {
                    return;
                }

                for (var i = 0; i < BankCode.length; i++) {
                    if (BankCode[i].value == value) {
                        return BankCode[i].text;
                    }
                }
            }, editor: { type: 'combobox', options: { data: BankCode, valueField: "value", textField: "text" } }
        },
        {
            field: 'BankProvince', title: '开户行省份', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                for (var i = 0; i < province.length; i++) {
                    if (province[i].ProName == value) {
                        return province[i].ProName;
                    }
                }
                return value;
            }, editor: {
                type: 'combobox', options: {
                    data: province, valueField: "ProName", textField: "ProName", onSelect: function (record) {
                        var row = $('#TableContainer').datagrid('getSelected');//获取选择行
                        var rowIndex = $('#TableContainer').datagrid('getRowIndex', row);//获取行标
                        var target = $('#TableContainer').datagrid('getEditor', { 'index': rowIndex, 'field': 'BankCity' }).target;
                        target.combobox('clear'); //清除原来的数据
                        var dd = JSON.stringify(target.combobox('getData'));
                        var arr = GetProjValue(record.ProName);
                        var ds = GetCityValue(arr);
                        target.combobox('loadData', JSON.parse(ds));
                    }
                }
            }
        },
        {
            field: 'BankCity', title: '开户行市', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                for (var i = 0; i < city.length; i++) {
                    if (city[i].CityName == value) {
                        return city[i].CityName;
                    }
                }
                return value;
            }, editor: { type: 'combobox', options: { data: CityValue, valueField: "CityName", textField: "CityName" } }
        },
        { field: 'BankNo', title: '开户行行号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankInfo', title: '开户行名称', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankIDs', title: '银行户名', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankAccount', title: '银行账号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankAgreement', title: '代收协议编号', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        {
            field: 'BankPaperName', title: '持卡人证件名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                if (value == '') {
                    return;
                }

                for (var i = 0; i < BankPaperName.length; i++) {
                    if (BankPaperName[i].value == value) {
                        return BankPaperName[i].text;
                    }
                }
            }, editor: { type: 'combobox', options: { data: BankPaperName, valueField: "value", textField: "text" } }
        },
        { field: 'BankPaperCode', title: '持卡人证件号码', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankMobilePhone', title: '持卡人联系电话', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
        { field: 'BankCustCode', title: '银行客户编码', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
    ]];


    var toolbar = [
        {
            text: '批量导入',
            iconCls: 'icon-save',
            handler: function () {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../HouseNew/ParkBankExcelInputBrowse.aspx',
                    '批量导入', false, function callback(_Data) {
                        LoadList();
                    });
            }
        }, '-',
        {
            text: '保存',
            iconCls: 'icon-save',
            handler: function () {

                if (editIndex != undefined) {
                    $('#TableContainer').datagrid('endEdit', editIndex);
                    editIndex = undefined;
                }
                $('#TableContainer').datagrid('acceptChanges');

                var rows = $('#TableContainer').datagrid('getData').rows;
                var changerow = [];
                for (var i = 0; i < rows.length; i++) {
                    for (var j = 0; j < editrows.length; j++) {
                        if (i == editrows[j]) {
                            changerow.push(rows[i]);
                        }
                    }
                }
                if (changerow.length > 0) {
                    $('#AllData').val(JSON.stringify(changerow));

                    $.tool.DataPostChk('FrmForm', 'CustBank', 'CustParkBankUpdate', $('#FrmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data.split('|');

                            if (r.length > 0) {
                                if (r[0] == "true") {
                                    LoadData();
                                }
                                if (r[1] != "") {
                                    HDialog.Info(r[1]);
                                }
                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                else {
                    HDialog.Info("无更改数据");
                }



            }
        }, '-',
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
                window.location.href = "../HouseNew/CustomerBankParkCre.aspx";
            }
        }, '-',
        {
            text: '<font color=red>*双击修改银行代扣信息，然后保存。</font>',
        }

    ];


    function LoadList() {

        $('#LiveType').val('1');
        $("input[name='rb']").each(function () {
            //这里是查找name=checkday的选框并遍历  当然你也可以直接用 $("input:radio")
            var bbb = this.checked;
            if (bbb == true) {
                $('#LiveType').val(this.value);
            }
        });

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            frozenColumns: frozenColumns,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onDblClickRow: function (rowIndex, rowData) {
                //if (rowData.IsLockBank == "1") {
                //    HDialog.Info('此记录已锁定，不能修改！！！');
                //    return false;
                //}
                if (editIndex != undefined) {
                    $(this).datagrid('endEdit', editIndex);
                }
                $(this).datagrid('beginEdit', rowIndex);
                var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'BankName' });
                $(ed.target).focus();
                editIndex = rowIndex;
                editAdd(rowIndex);
            },
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("CustBank", "CustomerParkBankList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }
    function editAdd(index) {
        for (var i = 0; i < editrows.length; i++) {
            if (index == editrows[i]) {
                return;
            }
        }
        editrows.push(index);
    }


    LoadData();

    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", document.body.clientWidth * 0.15 * 0.67);
        }
    });

    //获取省级下城市数据
    function GetCityValue(ProID) {
        var i = 0;
        var str = "[";
        $.each(city, function (k, p) {

            if (p.ProID == ProID) {
                if (i == 0) {
                    str = str + "{"
                } else {
                    str = str + ",{"
                }
                str = str + '"CityID": ' + p.CityID + ', "CityName": "' + p.CityName + '","ProID": ' + p.ProID + ', "CitySort": "' + p.CitySort + '"';
                str = str + "}";
                i = i + 1;
            }

        });
        str = str + "]";
        return str;
    }

    //获取省份编号
    function GetProjValue(ProName) {
        var pp = "";
        $.each(province, function (k, p) {
            if (p.ProName == ProName) {
                pp = p.ProID;
            }
        });
        return pp;
    }


    function gg(ProID) {
        var array = new Array();
        //var d1 = [{ "CityID": 110100, "CityName": "市辖区", "ProID": 110000, "CitySort": "345" }];
        var i = 0;
        var str = "[";
        $.each(city, function (k, p) {

            if (p.ProID == ProID) {
                if (i == 0) {
                    str = str + "{"
                } else {
                    str = str + ",{"
                }
                alert(p.CityName);
                str = str + '"CityID": ' + p.CityID + ', "CityName": "' + p.CityName + '"';
                str = str + "}";
                i = i + 1;
            }

        });
        str = str + "]";

        return str;
    }

</script>
