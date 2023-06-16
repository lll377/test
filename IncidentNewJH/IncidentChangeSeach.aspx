<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentChangeSeach.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentChangeSeach" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事转换查询</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

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
<body>
    <form id="frmForm" runat="server">
        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />
        <input id="hiRegionSNum" name="hiRegionSNum" type="hidden" runat="server" />
        <input id="hiBuildSNum" name="hiBuildSNum" type="hidden" runat="server" />
                <input type="hidden" id="isBigCorpTypeID" name="isBigCorpTypeID" value="1" />
        <input id="CommIDs" name="CommIDs" type="hidden" runat="server"/>
        <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server"/>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 450px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr id="IsShow">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">查询范围</td>
                    <td class="TdContent">
                        <select id="IsDelete" name="IsDelete" style="width: 140px;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value=""></option>
                            <option value="全部">全部</option>
                            <option value="0" selected="selected">有效</option>
                            <option value="1">废弃</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">派工单号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="DrClass" name="DrClass" runat="server" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContentSearch">
                        <select id="InfoSource" name="InfoSource" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                        </select>
                    </td>
                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource" name="IncidentSource" style="width: 140px;" runat="server">
                            <option value=''></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">

                        <select id="RegionSNum" name="RegionSNum" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家</td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <select id="BuildSNum" runat="server" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" name="BuildSNum">
                        </select>

                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" style="width: 140px;" searcher="SelRoomSign" runat="server" />
                        <input type="hidden" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName"
                            style="width: 140px;" searcher="SelCust" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" />
                    </td>
                    <td class="TdTitle">报事电话</td>
                    <td class="TdContent">
                        <input type="text" id="Phone" name="Phone" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置</td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">公区名称</td>
                    <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox"
                            data-options=" multiple: true " id="BigTypeName" name="BigTypeName"
                            style="width: 140px;" searcher="SelTypeName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否投诉</td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否收费</td>
                    <td class="TdContent">
                        <select id="DueAmount" name="DueAmount" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否设备</td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="MacRoName" name="MacRoName" onclick="SelSpace();" style="width: 140px;" runat="server" />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate1" name="IncidentDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="IncidentDate2" name="IncidentDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">预约处理时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate1" name="ReserveDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate2" name="ReserveDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">转发时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="TransmitDate1" name="TransmitDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="TransmitDate2" name="TransmitDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理人</td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">分派人</td>
                    <td class="TdContent">
                        <input type="text" id="DispMan" name="DispMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">转发人</td>
                    <td class="TdContent">
                        <input type="text" id="TranMan" name="TranMan" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center" style="padding-top:10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a> &nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClearMore();">清 空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
    </form>

</body>
</html>

<script type="text/javascript">

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
                HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True', '选择报事类别', false, function callback(_Data) {
                  //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
                      var arrRet = JSON.parse(_Data);
                    $("#BigCorpTypeID").val(arrRet.id);
                    $("#BigTypeName").searchbox("setValue", arrRet.text);
                });
            }

            //设备空间名称
            function SelSpace() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../DialogNew/RankSpace.aspx?CommId=' + CommID, '选择设备机房', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var strO = $("#SpaceId").val();
                        var strL = $("#MacRoName").val();
                        $("#SpaceId").val(strO +','+ varObjects.SpaceId);
                        $("#MacRoName").val(strL + "," + varObjects.MacRoName);
                    }
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
                    //$('#Phone').val(data.MobilePhone);
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
            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#TypeName").val("");
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        location.href = "../IncidentNewJH/IncidentTransmitSeachCreateExcel.aspx";
                    }
                }
            ];
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
    var frozenColumns = [[
                { field: 'OrganName', title: '区域名称', width: 120, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                {
                    field: 'IncidentNum', title: '报事编号', width: 160, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail(" + index + ");\">" + row.IncidentNum + "</a>";
                        return str;
                    }
                },
            ]]

            var column = [[
                { field: 'CoordinateNum', title: '派工单号', width: 160, align: 'left', sortable: true },
                { field: 'Duty', title: '报事责任', width: 80, align: 'left', sortable: true },
                 { field: 'CorpTypeName', title: '报事类别', width: 100, align: 'left', sortable: true
                 },
                { field: 'DealMan', title: '责任人', width: 100, align: 'left', sortable: true },
                { field: 'LastDuty', title: '上次报事责任', width: 120, align: 'left', sortable: true },
                { field: 'LastTypeName', title: '上次报事类别', width: 120, align: 'left', sortable: true},
                { field: 'LastDealMan', title: '上次责任人', width: 130, align: 'left', sortable: true },
                { field: 'TransmitDateTime', title: '转发时间', width: 150, align: 'left', sortable: true },
                { field: 'UserName', title: '转发人', width: 150, align: 'left', sortable: true },
                { field: 'TransmitReasons', title: '转发情况', width: 150, align: 'left', sortable: true },

                { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
                { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
                { field: 'IncidentDate', title: '受理时间', width: 150, align: 'left', sortable: true },
                { field: 'AdmiMan', title: '受理人', width: 120, align: 'left', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 150, align: 'left', sortable: true },
                { field: 'DispDate', title: '分派时间', width: 150, align: 'left', sortable: true },
                { field: 'DispMan', title: '分派人', width: 150, align: 'left', sortable: true }


            ]];
            function LoadList() {
                var InfoSource = $("#InfoSource").combobox('getText');
                $('#hiInfoSource').val(InfoSource);

                var RegionSNum = $("#RegionSNum").combobox('getText');
                $("#hiRegionSNum").val(RegionSNum);

                //var BuildSNum = $("#BuildSNum").combobox('getText');
               // $("#hiBuildSNum").val(BuildSNum);
                
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    remoteSort: false,
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    border: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentTransmitSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
            }
            $.parser.parse('#SearchDlg');
            LoadList();

            function Detail(rowIndex) {
                var w = $(window).width();
                var h = $(window).height();
                //$('.easyui-dialog').parent().appendTo($("form:first"));
                var rows = $('#TableContainer').datagrid('getRows');
                var row = rows[rowIndex];
                Cache.SetData("IncidentInfos", JSON.stringify(row));
                var content = '../IncidentNewJH/IncidentControlManage.aspx';
                HDialog.Open(w, h, content, '报事查询详细记录', true, function callback(_Data) {
                    Cache.SetData("IncidentInfos", '');
                });
            }

        function btnClearMore() {
                $("#IsDelete").val("");
                $("#IncidentNum").val("");
                $("#CoordinateNum").val("");
                $("#DrClass").val("");
                $("#IncidentSource").val("");
                $("#hiInfoSource").val("");
                $("#InfoSource").combobox('setText','');
                $("#RegionSNum").combobox('setText','');
                $("#hiRegionSNum").val("");
                $("#BuildSNum").combobox('setText','');
                $("#hiBuildSNum").val("");
                $("#IsTousu").val("");
                $("#DueAmount").val("");
                $('#RoomSign').searchbox("setValue", "");
                $("#RoomID").val("");
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val("");
                $("#Phone").val("");
                $("#IncidentPlace").val("");
                $("#RegionalPlace").val("");
                $("#Duty").val("");
                $("#BigCorpTypeID").val(null);
                $("#BigTypeName").searchbox("setValue", null);
                $("#EqId").val("");
                $("#MacRoName").val("");
                $("#IsBeoverdue").val("");
                $("#IsBeoverdueHour").val("");

                $("#IncidentDate1").val("");
                $("#IncidentDate2").val("");
                $("#ReserveDate1").val("");
                $("#ReserveDate2").val("");
                $("#TransmitDate1").val("");
                $("#TransmitDate2").val("");


                $("#AdmiMan").val("");
                $("#DispMan").val("");
                $("#DealMan").val("");
                $("#TranMan").val("");
                
            }

</script>
