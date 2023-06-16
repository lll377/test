<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingSelBrowse.aspx.cs" Inherits="M_Main.CarparkNew.ParkingSelBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ParkingBrowse</title>
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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />

</head>
<body>
    <form id="FrmForm">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3 style="font-family: 'Microsoft YaHei'">这里是车位使用办理-应收输入操作介绍<br />
                    点击下一步继续教程</h3>
            </div>
        </div>

        <input type="hidden" id="SelAll" name="SelAll" runat="server" />
        <input type="hidden" id="SelParkID" name="SelParkID" value="" runat="server" />
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 100px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、办理固定车位，选择闲置车位进行办理；办理非固定车位，点击“新增”；
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、状态：绿色—闲置；黑色—正常；橙色—三天到期；红色—已经到期
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 350px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">车位类别</td>
                    <td class="TdContentSearch">
                        <select id="ParkCategory" name="ParkCategory" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" runat="server">
                            <option selected></option>
                            <option value="全部">全部</option>
                            <option value="0">固定车位</option>
                            <option value="1">非固定车位</option>
                        </select>
                    </td>
                    <td class="TdTitle">车位类型</td>
                    <td class="TdContentSearch">
                        <select id="ParkType" name="ParkType" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" style="width: 83%;" type="text" id="CarparkName" searcher="SelCarparkName" name="CarparkName" maxlength="50" />
                        <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                    </td>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <input type="text" id="ParkName" style="width: 81%;" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">产权性质</td>
                    <td class="TdContentSearch">
                        <select id="PropertyRight" name="PropertyRight" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">使用状态</td>
                    <td class="TdContentSearch">
                        <select id="PropertyUses" name="PropertyUses" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="产权人自用">产权人自用</option>
                            <option value="产权人出租">产权人出租</option>
                        </select>
                    </td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContent">
                        <input type="text" style="width: 37%;" id="StanAmount1" name="StanAmount1" />到
                        <input type="text" style="width: 37%;" id="StanAmount2" name="StanAmount2" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" style="width: 83%;" id="CustName" maxlength="50" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" style="width: 83%;" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">车牌号码</td>
                    <td class="TdContent">
                        <input type="text" id="CarSign" style="width: 81%;" runat="server" />
                    </td>
                    <td class="TdTitle">停车卡号</td>
                    <td class="TdContent">
                        <input type="text" id="ParkingCarSign" style="width: 81%;" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">办理时间</td>
                    <td class="DialogTdDateContent">
                        <input id="HandStartDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="HandStartDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="HandEndDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="HandEndDate" runat="server" />
                    </td>
                    <td class="TdTitle">办理状态</td>
                    <td class="TdContentSearch">
                        <select id="drUse" name="drUse" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option></option>
                            <option value="未办理">未办理</option>
                            <option value="已办理">已办理</option>
                        </select>
                    </td>
                    <td class="TdTitle">当前状态</td>
                    <td class="TdContentSearch">
                        <select id="SelUseState" name="SelUseState" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="闲置">闲置</option>
                            <option value="正常">正常</option>
                            <option value="即将到期">即将到期</option>
                            <option value="已经到期">已经到期</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">开始时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="ParkStartDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="ParkStartDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="ParkStartEndDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="ParkStartEndDate" runat="server" />
                    </td>
                    <td class="TdTitle">结束时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="ParkEndDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="ParkEndDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="ParkEndEndDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="ParkEndEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="line-height: 12px;">是否签订物业服务协议</td>
                    <td class="TdContentSearch">
                        <select id="IsPropertyService" name="IsPropertyService" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">备&nbsp;&nbsp;&nbsp;注</td>
                    <td class="TdContent">
                        <input type="text" id="ParkMemo" style="width: 81%;" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">说明</td>
                    <td colspan="7" style="height: 12px">
                        <span style="color: red">1、自有产权模式一(抵扣)：权属房产产权车位出租收入抵空置车位物业费。<br />
                            2、自有产权模式二(常规)：权属房产产权车位出租收入归房产，物业公司收取空置车位物业费。</span>

                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">

    function GetShow() {
        $('body').pagewalkthrough({
            name: 'introduction',
            steps: [
                {
                    popup: {
                        content: '#walkthrough-1',
                        type: 'modal'
                    }
                }, {
                    wrapper: '.HrefStyle',
                    popup: {
                        content: '点击要操作的车位的“车位编号”',
                        type: 'tooltip',
                        position: 'bottom'
                    },
                    onLeave: function () {
                        HDialog.Open(w, h, '../CarparkNew/ParkingLendBrowse.aspx?&ivrShowType=1', '车位办理', false, function callback(_Data) {
                            $('body').pagewalkthrough('close');
                            if (_Data == "true") {
                                LoadList();
                            }
                        });
                        //GetShowLendRecord();
                    }
                }
            ],
            buttons: {
                jpwNext: {
                    i18n: "下一步 &rarr;"
                },
                jpwFinish: {
                    i18n: "下一步 &rarr;"
                },
                jpwPrevious: {
                    i18n: "&larr; 上一步"
                },
                jpwClose: {
                    i18n: "关闭",
                }
            }
        });

        // Show the tour
        $('body').pagewalkthrough('show');
    };

    //办理
    function GetShowLendRecord() {
        var rows = $('#TableContainer').datagrid('getRows');
        var firstRow;
        if (rows != null && rows.length > 0) {
            firstRow = rows[0];
        }
        var strparam = "";
        if (firstRow.UseState == "闲置" && firstRow.HandID == "") {
            strparam = "OPType=Insert&ParkID=" + firstRow.ParkID + "&ParkCategory=" + firstRow.ParkCategory;
        } else {
            strparam = "OPType=Edit&HandID=" + firstRow.HandID + "&ParkID=" + firstRow.ParkID + "&ParkCategory=" + firstRow.ParkCategory;
        }
        //LendRecord('OPType=Edit&HandID=10001300000619&ParkID=10001300000616&ParkCategory=1&VIRShowType=1');

        LendRecord(strparam);
    }

    function GetStepOneChild() {
        $('body').pagewalkthrough('close');
    }

    var w = $(window).width();
    var h = $(window).height();



    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        { field: 'CarparkName', title: '车位区域', width: 120, align: 'left', sortable: true },
        { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'left', sortable: true },
        { field: 'ParkType', title: '车位类型', width: 130, align: 'left', sortable: true },
        {
            field: 'ParkName', title: '车位编号', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var strparam = "";
                if (row.UseState == "闲置" && row.HandID == "") {
                    strparam = "OPType=Insert&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory;
                } else {
                    strparam = "OPType=Edit&HandID=" + row.HandID + "&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory + "&DUserState=" + row.UseState;
                }
                var str = "";
                str = "<a  href=javascript:void(); class=\"HrefStyle\" onclick=\"LendRecord('" + strparam + "');\">" + row.ParkName + "</a>";

                return str;
            }
        },
        { field: 'StanAmount', title: '收费标准', width: 100, align: 'left', sortable: true },
        { field: 'UseState', title: '当前状态', width: 100, align: 'left', sortable: true },
        {
            field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                str = "<a href=javascript:void(); class=\"HrefStyle\" onclick=\"CustDetail(" + row.NCustID + ");\">" + row.CustName + "</a>";
                return str;
            }
        },
        { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
        { field: 'ParkingCarSign', title: '停车卡号', width: 100, align: 'left', sortable: true },
        { field: 'CarSign', title: '车牌号码', width: 100, align: 'left', sortable: true },
        {
            field: 'ParkStartDate', title: '开始时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ParkEndDate', title: '结束时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'lbParkEndDate', title: '已缴费时间至', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.lbParkEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true },
        {
            field: '车位退租', title: '车位退租', width: 90, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.UseState == "闲置" && row.UseName == "未办理") {

                } else {
                    str = "<a href=javascript:void(); class=\"HrefStyle\" onclick=\"DelRecord(" + row.ParkID + "," + row.HandID + ");\">退租</a>";
                }
                return str;
            }
        }
        //,
        //{
        //    field: '办理固定车位', title: '办理固定车位', width: 100, align: 'left', sortable: true,
        //    formatter: function (value, row, index) {
        //        var strparam = "";
        //        if (row.UseState == "闲置" && row.HandID == "") {
        //            strparam = "OPType=Insert&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory;
        //        } else {
        //            strparam = "OPType=Edit&HandID=" + row.HandID + "&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory;
        //        }
        //        var str = "";
        //        str = "<a href=javascript:void(); class=\"HrefStyle\" onclick=\"LendRecord('" + strparam + "');\">办理</a>";

        //        return str;
        //    }
        //},

    ]];

    var toolbar = [
        //{
        //    text: '办理固定车位',
        //    iconCls: 'icon-edit',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info('请选择办理项！');
        //            return;
        //        }
        //        var strparam = "";
        //        if (row.UseState == "闲置" && row.HandID == "") {
        //            strparam = "OPType=Insert&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory;
        //        } else {
        //            strparam = "OPType=Edit&HandID=" + row.HandID + "&ParkID=" + row.ParkID + "&ParkCategory=" + row.ParkCategory;
        //        }
        //        LendRecord(strparam);
        //    }
        //}, '-',
        {
            text: '新增非固定车位',
            id: 'insertCarpark',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("办理非固定车位信息", 'insert', "", $('#CarparkID').val());
            }
        }, '-',
        {
            text: '导入办理信息',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                ViewReport("车位办理导入");
            }
        }, '-',
        //{
        //    text: '车位退租',
        //    iconCls: 'icon-cancel',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info('请选择退租项！');
        //            return;
        //        }
        //        if (row.UseState == "闲置" && row.UseName=="未办理"){
        //            HDialog.Info('该车位未办理不能退租！');
        //            return;
        //        }
        //        DelRecord(row.ParkID, row.HandID);
        //    }
        //}, '-',
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-',

        {
            text: '备注',
            iconCls: 'icon-help',
            handler: function () {
                TiShi();
            }
        }
    ];

    function TiShi() {
        $('#tishi').parent().appendTo($("form:first"))
        $('#tishi').dialog('open');
    }

    //清空查询条件
    function CancelParm() {
        $('#ParkCategory').combobox('clear');
        $('#ParkType').combobox('clear');
        $('#CarparkName').searchbox("setValue", '');
        $("#CarparkID").val("");
        $('#drUse').combobox('clear');
        $('#SelUseState').combobox('clear');
        $("#StanAmount").val("");
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $("#RoomSign").searchbox("setValue", '');
        $("#ParkName").val("");
    }

    //客户详情
    function CustDetail(CustID) {
        var h1 = h - 45;
        HDialog.Open(w, h1, '../HouseNew/CustomerDetail.aspx?Back=CustomerContainer&CustID=' + CustID + '&SType=details',
            '客户信息', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }


    function LoadList() {
        var ParkType = $("#ParkType").combobox('getText');
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Parking&Command=searchparkingsel&' + $("#FrmForm").serialize() + '&strParkType=' + ParkType,
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            sortOrder: "asc",
            rowStyler: function (index, row) {
                var IsStateyes = "";
                var IsUsesyes = "";
                var IsParkEndDate = "";
                var IsParkStartDate = "";

                if (row.UseState != undefined && row.UseState != "") {
                    IsStateyes = row.UseState;
                }
                if (row.PropertyUses != undefined && row.PropertyUses != "") {
                    IsUsesyes = row.PropertyUses;
                }
                if (row.ParkStartDate != undefined && row.ParkStartDate != "") {
                    IsParkStartDate = row.ParkStartDate;
                }
                if (row.ParkEndDate != undefined && row.ParkEndDate != "") {
                    IsParkEndDate = row.ParkEndDate;
                }
                if (IsStateyes != "") {
                    if (IsStateyes == "闲置") {
                        return 'color:ForestGreen;';
                    }
                }
                var dt = new Date().toLocaleDateString();
                var date = CurentTime();
                if (IsParkEndDate != "") {
                    if (IsUsesyes != "产权人自用") {
                        if (new Date(IsParkEndDate.replace("-", "/").replace("-", "/")) <= new Date(dt.replace("-", "/").replace("-", "/"))) {
                            return 'color:Red;';
                        }
                        if (new Date(IsParkEndDate.replace("-", "/").replace("-", "/")) <= new Date(date.replace("-", "/").replace("-", "/"))
                            && new Date(IsParkEndDate.replace("-", "/").replace("-", "/")) > new Date(dt.replace("-", "/").replace("-", "/"))) {
                            return 'color:Orange;';
                        }
                    }
                }
                if (IsParkEndDate == "" && IsParkStartDate != "") {
                    if (IsUsesyes != "产权人自用") {
                        if (new Date(IsParkStartDate.replace("-", "/").replace("-", "/")) <= new Date(dt.replace("-", "/").replace("-", "/"))) {
                            return 'color:#FF0000;';
                        }
                        if (new Date(IsParkStartDate.replace("-", "/").replace("-", "/")) <= new Date(date.replace("-", "/").replace("-", "/"))
                            && new Date(IsParkStartDate.replace("-", "/").replace("-", "/")) > new Date(dt.replace("-", "/").replace("-", "/"))) {
                            return 'color:Orange;';
                        }
                    }
                }
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //获取当前日期后三天时间
    function CurentTime() {
        var now = new Date();
        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate() + 3;            //日

        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分

        var clock = year + "-";

        if (month < 10)
            clock += "0";

        clock += month + "-";

        if (day < 10)
            clock += "0";

        clock += day + " ";

        if (hh < 10)
            clock += "0";

        clock += hh + ":";
        if (mm < 10) clock += '0';
        clock += mm;
        return (clock);
    }

    //取消
    function DelRecord(strParkID, strHandID) {
        HDialog.Open(w, h, '../CarparkNew/ParkingCancelManage.aspx?ParkID=' + strParkID + '&HandID=' + strHandID, '退租办理', false, function callback(_Data) {
            LoadList();
        });
    }

    //办理
    function LendRecord(param) {
        HDialog.Open(w, h, '../CarparkNew/ParkingLendBrowse.aspx?' + param, '车位办理', false, function callback(_Data) {
            //$('body').pagewalkthrough('close');
            //if (_Data == "true") {
            //    LoadList();
            //}
            LoadList();
        });
    }
    function SelCarparkName() {
        $('#CarparkName').searchbox("setValue", '');
        $('#CarparkID').val('');

        var conent = "../DialogNew/CarparkDlg.aspx";

        HDialog.Open('600', '400', conent, '车位区域', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CarparkName').searchbox("setValue", data.CarparkName);
            $('#CarparkID').val(data.CarparkID);

        });

    }

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(历史)";
                            }

                            var RoomID = varObjects[i].RoomID;
                            var RoomSign = varObjects[i].RoomSign;
                            var Buildarea = varObjects[i].BuildArea;

                            var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                        }
                        $('#SelectRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID').val(data[i].RoomID);
                                            break;
                                        }
                                    }
                                }

                            }


                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        });
    }

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }
    //编辑
    function ViewDetail(title, OpType, ParkID, CarparkID) {

        HDialog.Open(w, h, '../CarparkNew/ParkCategoryManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType, title, false, function callback(_Data)
        {
            LoadList();
        });
    }

    //导入
    function ViewReport(title) {
        HDialog.Open(w, h, '../CarparkNew/ParkLendExcelBrowse.aspx', title, true, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
    $("select").each(function () {
        $(this).css("width", '83%');
    });
</script>

