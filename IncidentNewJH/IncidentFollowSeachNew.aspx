<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFollowSeachNew.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFollowSeachNew" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
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
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server"/>
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        <input id="isBigCorpTypeID" name="isBigCorpTypeID" value="0" type="hidden" runat="server" />
        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />
        <input id="hiOverdueReason" name="hiOverdueReason" type="hidden" runat="server"/>

        <input id="CommIDs" name="CommIDs" type="hidden" runat="server"/>
        <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server"/>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 400px;">

            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                 <tr id="IsShow">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>

                <tr>
                <%--    <td class="TdTitle">查询范围</td>
                    <td class="TdContent">
                        <select id="IsDelete" name="IsDelete" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">有效</option>
                            <option value="1">作废</option>
                        </select>
                    </td>--%>
                     
                    <td class="TdTitle">报事编号</td>
                    <td class="TdContent">
                        <input type="text" id="IncidentNum" name="IncidentNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号</td>
                    <td class="TdContent">
                        <input type="text" id="CoordinateNum" name="CoordinateNum" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事类型</td>
                    <td class="TdContent">
                        <select id="DrClass" name="DrClass" runat="server" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 137px;" runat="server" />
                    </td>
                </tr>
                <tr>
                     <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="InfoSource" name="InfoSource"   style="width: 140px;" runat="server">
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
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" 
                            data-options=" multiple: true "  style="width: 140px;" runat="server">
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
                    <td class="TdContent">
                        <select ID="BuildSNum" runat="server" 
                            data-options=" multiple: true "  style="width: 140px;" name="BuildSNum"></select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" data-options="editable:false" 
                            style="width: 140px;" searcher="SelRoomSign" runat="server" />
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
                        <input type="text" class="easyui-searchbox" id="BigTypeName" name="BigTypeName" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName" runat="server" />
                        <input id="TypeID" type="hidden" name="TypeID" />
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
                        <input type="text" class="easyui-searchbox" id="MacRoName" name="MacRoName" style="width:140px;"  searcher="SelSpace" runat="server" />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">跟进类型</td>
                    <td class="TdContent">
                        <select id="ForwardType"  style="width: 140px;"  runat="server">
                            <option value="">全部</option>
                            <option value="处理中跟进">处理中跟进</option>
                            <option value="已完成跟进">已完成跟进</option>
                       </select>&nbsp;
                    </td>
                    <td class="TdTitle">跟进人</td>
                    <td class="TdContent">
                        <input type="text" id="ForwardUser" name="ForwardUser" style="width: 137px;" runat="server" />
                    </td>
                    <td class="TdTitle">逾期原因</td>
                    <td class="TdContent">
                         <select id="OverdueReason" name="OverdueReason" runat="server"     style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                     <td class="TdTitle">受理人</td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 137px;" runat="server" />
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
                        <input type="text" class="Wdate" id="IncidentDate2" name="IncidentDate" style="width: 140px;" runat="server"
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
                    <td class="TdTitle">跟进时间</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ForwardDateTime1" name="ForwardDateTime1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ForwardDateTime2" name="ForwardDateTime2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                      <td class="TdTitle">分派人</td>
                    <td class="TdContent">
                        <input type="text" id="DispMan" name="DispMan" style="width: 137px;" runat="server" />
                    </td>
                   <%-- <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input type="text" id="IncidentMan" name="IncidentMan" style="width: 137px;" runat="server" />
                    </td>--%>
                     <td class="TdTitle"> </td>
                    <td class="TdContent">
                     
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align:center;padding-top:10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClear();">清 空</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
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
            iconCls: 'icon-save',
            handler: function () {
                window.location.href = "../IncidentNewJH/IncidentFollowSeachNewToExcel.aspx";
            }
        }
    ];

    var frozenColumns = [[
        { field: 'OrganName', title: '区域名称', width: 150, align: 'left', sortable: true },
        { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
        {
            field: 'IncidentNum', title: '报事编号', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail(" + index + ");\">" + row.IncidentNum + "</a>";
                return str;
            }
        },
       
    ]]
    var column = [[
        { field: 'IncidentContent', title: '报事内容', width: 300, align: 'left', sortable: true },
        { field: 'ReserveDate', title: '预约处理时间', width: 200, align: 'left', sortable: true },
        { field: 'MainEndDate', title: '完成时间', width: 200, align: 'left', sortable: true },
        { field: 'CloseTime', title: '关闭时间', width: 200, align: 'left', sortable: true },
        { field: 'DealHours', title: '处理时长(小时)', width: 150, align: 'left', sortable: true },
        { field: 'genJinCount', title: '跟进次数', width: 150, align: 'left', sortable: true }
        //{ field: 'ForwardDateTime', title: '第一次跟进时间', width: 160, align: 'left', sortable: true},
        //{ field: 'ForwardUser', title: '第一次跟进人', width: 100, align: 'left', sortable: true },
        //{ field: 'ForwardReasons', title: '第一次跟进情况', width: 200, align: 'left', sortable: true }
    ]];

    function LoadList() {
        var InfoSource = $("#InfoSource option:selected").text();
        //alert(InfoSource);
        $('#hiInfoSource').val(InfoSource);

        var OverdueReason = $("#OverdueReason option:selected").text();
        $('#hiOverdueReason').val(OverdueReason);


        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            frozenColumns: frozenColumns,
            border: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("IncidentAcceptNew_Search", "SelectForwardListNew", "TableContainer", param);
            },
            onLoadSuccess: function (data) {

            }
        });
        $("#SearchDlg").dialog("close");
    }

    LoadList();

     function SelCommInfo() {
        var w = $(window).width() * 0.7;
        HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            //alert(arrRet.id);
            $("#CommIDs").val(arrRet.id);
            $("#CommNames").val(arrRet.name);
        });
     }


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

    function SelTypeName() {
        var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
        HDialog.Open('650', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=0&Duty=&IsCheck=1&IsEdit=true&IsAll=True', '选择报事类别', false, function callback(_Data) {
        //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            $("#TypeID").val(arrRet.id);
            $("#BigCorpTypeID").val(arrRet.id);
            //alert($("#BigCorpTypeID").val());
            $("#BigTypeName").searchbox("setValue", arrRet.text);
        });
    }

    //设备空间名称
    function SelSpace() {
        var CommID = $("#hiCommID").val();
        HDialog.Open('600', '450', '../DialogNew/RankSpace.aspx?CommId=' + CommID, '选择设备机房', true, function callback(_Data) {
            if (_Data != "") {//**获得返回的参数信息
                var varObjects = JSON.parse(_Data);
                debugger;
                //var strO = $("#SpaceId").val();
                //var strL = $("#MacRoName").val();
                $("#SpaceId").val(varObjects.SpaceId);
                $("#MacRoName").searchbox("setValue", varObjects.MacRoName);
            }
        });
    }


    function Detail(rowIndex) {
        var w = $(window).width();
        var h = $(window).height();
        var rows = $('#TableContainer').datagrid('getRows');
        var row = rows[rowIndex];
        Cache.SetData("IncidentInfos", JSON.stringify(row));
        var content = '../IncidentNewJH/IncidentControlManage.aspx';
        HDialog.Open(w, h, content, '报事查询详细记录', true, function callback(_Data) {
            Cache.SetData("IncidentInfos", '');
        });
    }


    function btnClear() {
        $("#IncidentNum").val("");
        $("#CoordinateNum").val("");
        $("#DrClass").val("");
        $("#IncidentSource").val("");
        $("#hiInfoSource").val("");
        
        //$("#InfoSource").combobox('setText', '');
        //$("#RegionSNum").combobox('setText', '');
        $("#hiRegionSNum").val("");
        
        //$("#BuildSNum").combobox('setText', '');
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
        //$("#MacRoName").val("");
        $("#MacRoName").searchbox("setValue","");
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

        $("#InfoSource").val("");
        $("#RegionSNum").val("");
        $("#BuildSNum").val("");
        $("#UserName").val("");
        $("#ForwardType").val("");
        $("#ForwardUser").val("");
        $("#OverdueReason").val("");
        $("#ForwardDateTime1").val("");
        $("#ForwardDateTime2").val("");

    }


</script>
