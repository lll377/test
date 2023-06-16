<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFeesSeach.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFeesSeach" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/PersonDictionaryCanNull.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style>
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 230px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #CostNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 99%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>

</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1090px; height: 410px; padding: 10px;">
            <input id="TypeID" type="hidden" name="TypeID" runat="server" />
            <input id="CustID" type="hidden" name="CustID" runat="server" />
            <input id="RoomID" type="hidden" name="RoomID" runat="server" />
            <input type="hidden" id="CostID" name="CostID" />
            <input type="hidden" id="isBigCorpTypeID" name="isBigCorpTypeID" value="1" />

            <input type="hidden" id="CommID" name="CommID" runat="server" />
            <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
            <input id="BigCorpTypeCode" name="BigCorpTypeCode" type="hidden" runat="server" />

            <input id="CommIDs" name="CommIDs" value="99999" type="hidden" runat="server" />
            <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server" />

            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr id="IsShow">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">查询范围
                    </td>
                    <td class="TdContentSearch">
                        <select id="IsDelete" name="IsDelete" class="easyui-combobox" style="width: 140px;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value=""></option>
                            <option value="全部">全部</option>
                            <option value="0">有效</option>
                            <option value="1">作废</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="ClassID" name="ClassID" runat="server" class="easyui-combobox" data-options="editable:false, panelHeight:'auto'" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事方式
                    </td>
                    <td class="TdContentSearch">
                        <select id="InfoSource" name="InfoSource" style="width: 142px;" runat="server">
                            <option value=""></option>
                            <option value="项目受理">项目受理</option>
                            <option value="呼叫中心">呼叫中心</option>
                            <option value="员工APP">员工APP</option>
                            <option value="业主APP">业主APP</option>
                            <option value="IVR导航">IVR导航</option>
                            <option value="微信报事">微信报事</option>
                            <option value="其他来源">其他来源</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContent">
                        <select id="IncidentSource" name="IncidentSource" class="easyui-combobox" style="width: 144px;" data-options="editable:false, panelHeight:'auto'"
                            runat="server">
                            <option value="">全部</option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域
                    </td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server" class="easyui-combobox" data-options="editable:false" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家
                    </td>
                    <td class="TdContent">
                        <input id="Text1" name="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇
                    </td>
                    <td class="TdContent">
                        <select id="Select1" name="BuildSNum" runat="server" class="easyui-combobox" data-options="editable:false" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" data-options="editable:false"
                            style="width: 144px;" searcher="SelRoomSign" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="CustName" name="CustName" data-options="editable:false"
                            style="width: 144px;" searcher="SelCust" runat="server" />
                    </td>
                    <td class="TdTitle">报事电话
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="Phone" name="Phone" data-options="editable:false"
                            style="width: 144px;" searcher="SelCust" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置</td>
                    <td class="TdContentSearch">
                        <select id="IncidentPlace" name="IncidentPlace" runat="server">
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="RegionalPlace" runat="server" AutoPostBack="True" data-options="required:true"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContentSearch">
                        <select id="Duty" name="Duty" runat="server">
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" data-options="editable:false"
                            style="width: 144px;" searcher="SelTypeName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent" style="width: 66px;">
                        <select id="IsTousu" name="IsTousu" style="width: 50px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" searcher="SelCost" id="feedItem" name="feedItem" style="width: 144px;" runat="server" />
                    </td>
                    <td class="TdTitle">是否设备
                    </td>
                    <td class="TdContent" style="width: 66px;">
                        <select id="IsEqument" name="IsEqument" style="width: 50px;" runat="server">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间
                    </td>
                    <td class="TdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server" class="easyui-combobox" data-options="editable:false" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate1" name="IncidentDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate2" name="IncidentDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveStatrDate" name="ReserveStatrDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveEndDate" name="ReserveEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">责任人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 140px;" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClearMore();">清 空</a>
                    </td>
                </tr>
            </table>
        </div>



        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                var opType = $("#hiIncidentType").val();
                //alert(opType);
                if (opType == "XM") {
                    $("#IsShow").hide();
                }
                else {
                    $("#IsShow").show();
                }

            }
            InitTableHeight();

            function SelCommInfo() {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    //alert(arrRet.id);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True',
                    //HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeBigDlg.aspx?ClassID=' + $("#DrClass").val() + '&Duty=' + $("#duty").val() + '&IsCheck=1&IsEdit=true',
                    '选择报事类别', false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#TypeID").val(arrRet.id);
                        $("#hiTypeName").val(arrRet.TypeName);
                        $("#TypeName").searchbox("setValue", arrRet.TypeName);
                        $('#TypeCode').val(arrRet.code);
                        $("#BigCorpTypeID").val(arrRet.id);
                        $('#BigCorpTypeCode').val(arrRet.code);
                    });


                //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    $("#TypeID").val(arrRet.id);
                //    $("#hiTypeName").val(arrRet.TypeName);
                //    $("#TypeName").searchbox("setValue", arrRet.TypeName);
                //    $('#TypeCode').val(arrRet.code);
                //    $("#BigCorpTypeID").val(arrRet.id);
                //    $("#BigTypeName").searchbox("setValue", arrRet.text);

                //});
            }


            var toolbar = [

                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#SearchDlg").parent().appendTo($("form:first"))
                        $("#SearchDlg").dialog('open');
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        //$("#SearchDlg").parent().appendTo($("form:first"))
                        //document.getElementById("btnExcelExport").click();
                        location.href = "../IncidentNewJH/IncidentFeesSeachCreExcel.aspx";
                    }
                }
            ]


            var column = [[
                { field: 'OrganName', title: '区域名称', width: 120, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                { field: 'CostName', title: '费用项目', width: 100, align: 'left', sortable: true },
                { field: 'IncidentNum', title: '报事编号', width: 100, align: 'left', sortable: true },
                { field: 'CoordinateNum', title: '派工单号', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
                { field: 'phone', title: '报事电话', width: 200, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 200, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 200, align: 'left', sortable: true },
                { field: 'TypeName', title: '报事类别', width: 200, align: 'left', sortable: true },
                //{ field: 'FineTypeName', title: '原因细类', width: 200, align: 'left', sortable: true },
                { field: 'IncidentDate', title: '受理时间', width: 200, align: 'left', sortable: true },
                { field: 'AdmiMan', title: '受理人', width: 200, align: 'left', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 200, align: 'left', sortable: true },
                { field: 'DealMan', title: '责任人', width: 200, align: 'left', sortable: true },
                { field: 'FeesDueDate', title: '应收日期', width: 200, align: 'left', sortable: true },
                { field: 'DueAmount', title: '应收金额', width: 200, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠费金额', width: 200, align: 'left', sortable: true }

            ]]


            function LoadList() {
                //if ($("#CommIDs").val() == "99999" && $("#hiIncidentType").val() != "XM") {
                //    HDialog.Info("请选择需要统计的小区");
                //    return;
                //}
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    border: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    remoteSort: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentFees", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog('close');
            }

            LoadList();


            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomID').val(data.RoomID);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                HDialog.Open('1100', '530', "../DialogNew/CustDlg.aspx", '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#IncidentMan').val(data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#Phone').val(data.MobilePhone);
                    var roomsign = data.NewRoomSigns;
                    dataobj = roomsign.split(',');
                    if (dataobj.length > 1) {
                        var roomsign1 = dataobj[0].substr(0, dataobj[0].indexOf('['));
                        $('#RoomSign').searchbox("setValue", roomsign1);
                    }
                    else {
                        $('#RoomSign').searchbox("setValue", roomsign.substr(0, roomsign.indexOf('[')));
                    }
                });
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $("#CostID").val(varObjects[0]);
                        $('#feedItem').searchbox("setValue", varObjects[1]);
                    }
                });
            }
            function btnClearMore() {
                $("#IsDelete").combobox('setText', '全部');
                $("#IncidentNum").val("");
                $("#CoordinateNum").val("");
                $("#ClassID").val("");
                $("#InfoSource").val("");
                $("#IncidentSource").combobox('setText', '');
                $("#RegionSNum").combobox('setText', '');
                $("#Select1").combobox('setText', '');
                $("#Text1").val("");
                $('#RoomSign').searchbox("setValue", "");
                $("#RoomID").val("");
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val("");
                $("#Phone").val("");
                $("#IncidentPlace").val("");
                $("#RegionalPlace").val("");
                $("#Duty").val("");
                $("#TypeID").val('');
                $("#hiTypeName").val('');
                $("#TypeName").searchbox("setValue", '');
                $('#TypeCode').val('');
                $("#BigCorpTypeID").val('');
                $('#BigCorpTypeCode').val('');
                $("#IsTousu").val("");
                $("#CostID").val('');
                $('#feedItem').searchbox("setValue", '');
                $("#IsEqument").val('');
                $("#BuildSNum").combobox('setText', '');
                $("#IncidentDate1").val('');
                $("#IncidentDate2").val('');
                $("#ReserveStatrDate").val('');
                $("#ReserveEndDate").val('');
                $("#AdmiMan").val("");
                $("#DealMan").val("");
            }
        </script>

    </form>
</body>
</html>
