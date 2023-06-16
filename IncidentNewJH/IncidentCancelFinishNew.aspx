<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentCancelFinishNew.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentCancelFinishNew" %>

<!DOCTYPE html>

<html>
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
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

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
        <input type="hidden" id="RoomID" name="RoomID" runat="server"/>
        <input type="hidden" id="CustID" name="CustID" runat="server">
        <input type="hidden" id="IncidentMan" name="IncidentMan" runat="server"/>
        <input type="hidden" id="TypeID" name="TypeID" runat="server"/>
        <input type="hidden" id="TaskEqId"  name="TaskEqId" runat="server" />

         <input id="CommIDs" name="CommIDs" type="hidden" runat="server"/>
         <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server"/>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 440px; padding: 10px;">
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
                            <option value="0" selected="selected">有效</option>
                            <option value="1">废弃</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事编号</td>
                    <td class="TdContent">
                        <input id="IncidentNum" name="IncidentNum" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">派工单号</td>
                    <td class="TdContent">
                        <input id="CoordinateNum" name="CoordinateNum" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="ClassID" name="ClassID" runat="server"  style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事方式</td>
                    <td class="TdContent">
                        <select id="InfoSource" name="InfoSource" style="width: 140px;" runat="server">
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
                    <td class="TdTitle">报事来源</td>
                    <td class="TdContent">
                        <select id="IncidentSource" name="IncidentSource" class="easyui-combobox" style="width: 140px;" data-options="editable:false, panelHeight:'auto'"
                            runat="server">
                            <option value=""></option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server" class="easyui-combobox" data-options="editable:false" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">管家</td>
                    <td class="TdContent">
                        <input id="Text1" type="text"  style="width: 140px;" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼  宇</td>
                    <td class="TdContent">
                        <select ID="BuildSNum" runat="server" class="easyui-combobox"
                            data-options=" multiple: true "  style="width: 140px;" name="BuildSNum"></select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" data-options="editable:false"
                            style="width: 140px;" searcher="SelRoomSign" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="CustName" name="CustName" data-options="editable:false"
                            style="width: 140px;" searcher="SelCust" runat="server" />
                    </td>
                    <td class="TdTitle">报事电话</td>
                    <td class="TdContent">
                         <input type="text" id="Phone" name="Phone" style="width: 140px;" runat="server" />
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
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="RegionalPlace" style="width: 140px;" runat="server" AutoPostBack="True" data-options="required:true"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">报事责任</td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" style="width: 140px;" runat="server">
                             <option value=""></option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName" runat="server" />

                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否收费
                    </td>
                    <td class="TdContent">
                        <select id="DueAmount" name="DueAmount" class="easyui-combobox" style="width: 140px;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否设备
                    </td>
                    <td class="TdContent">
                        <select id="EqId" name="EqId" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">设备空间
                    </td>
                    <td class="TdContentSearch">
                         <input type="text" id="MacRoName" name="MacRoName"  onclick ="SelSpace();" style="width: 140px;" runat="server" />
                       <%-- <input type="text" class="easyui-combobox"
                            data-options=" multiple: true "  id="MacRoName"  name="MacRoName" style="width: 140px;" searcher="SelSpace" runat="server" />--%>
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="IncidentDate1" name="IncidentDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="IncidentDate2" name="IncidentDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveStatrDate" name="ReserveStatrDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveEndDate" name="ReserveEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">派工时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="DispStartDate" name="DispStartDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="DispEndDate" name="DispEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">完成时间从
                    </td>
                    <td class="TdContentSearch">
                         <input type="text" class="Wdate" id="MainEndDate1" name="MainEndDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="MainEndDate2" name="MainEndDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">退回时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="CloseGoBackStartTime" name="RemindersStartDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="CloseGoBackEndTime" name="CloseGoBackEndTime" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="AdmiMan" name="AdmiMan" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">分派人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DispMan" name="DispMan" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">完成人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="FinishUser" name="FinishUser" style="width: 140px;" runat="server" />
                    </td>
                    <td class="TdTitle">退回人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="CloseGoBackUser" name="CloseGoBackUser" style="width: 140px;" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>

            </table>
        </div>
    </form>


    <script type="text/javascript">

                $(function () {
                    $("#TableContainer").css("height", $(window).height() + "px");

                    var opType = $("#hiIncidentType").val();
                    //alert(opType);
                    if (opType == "XM") {
                        $("#IsShow").hide();
                    }
                    else {
                        $("#IsShow").show();
                        }

                    LoadList();
                })


                var toolbar = [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                            $("#TypeName").val("");
                            $("#ClassID").val("");
                        }
                    }, '-',
                    {
                        text: 'Excel导出',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {                            
                            location.href = "../IncidentNewJH/IncidentCancelFinishNewCreateExcel.aspx";
                        }
                    }

                ];

        var frozenColumns = [[
                    { field: 'OrganName', title: '区域名称', width: 160, align: 'left', sortable: true },
                    { field: 'CommName', title: '项目名称', width: 160, align: 'left', sortable: true },
                    {
                        field: 'IncidentNum', title: '报事编号', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail(" + index + ");\">" + row.IncidentNum + "</a>";
                            return str;
                        }
                    },
                    
                ]]

        var column = [[
                    { field: 'IncidentContent', title: '报事内容', width: 300, align: 'left', sortable: true },
                    { field: 'Duty', title: '报事责任', width: 100, align: 'left', sortable: true },
                    { field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true },
                    {field: 'FineTypeName', title: '原因细类', width: 100, align: 'left', sortable: true },
                    { field: 'QXWCCount', title: '取消完成次数', width: 200, align: 'left', sortable: true },
                    { field: 'MainEndDate', title: '初次完成时间', width: 200, align: 'left', sortable: true },
                    { field: 'DealSituation', title: '初次完成情况', width: 200, align: 'left', sortable: true }

                    //{ field: 'FinishUser', title: '完成人', width: 80, align: 'left', sortable: true },
                    //{ field: 'LastFinishTime', title: '上次完成时间', width: 200, align: 'left', sortable: true },
                    //{ field: 'LastFinishUser', title: '上次完成人', width: 100, align: 'left', sortable: true },
                    //{ field: 'CloseGoBackTime', title: '退回时间', width: 200, align: 'left', sortable: true },
                    //{ field: 'CloseGoBackUser', title: '退回人', width: 100, align: 'left', sortable: true },
                    //{ field: 'CloseGoBackReasons', title: '退回原因', width: 200, align: 'left', sortable: true },
                    //{ field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true },
                    //{ field: 'FineTypeName', title: '原因细类', width: 100, align: 'left', sortable: true },
                    //{ field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
                    //{ field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
                    //{ field: 'RoomSign', title: '房屋编号', width: 80, align: 'left', sortable: true },
                    //{ field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                    //{ field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
                    //{ field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
                    //{ field: 'DealMan', title: '责任人', width: 100, align: 'left', sortable: true },
                    //{ field: 'IncidentDate', title: '受理时间', width: 160, align: 'left', sortable: true },
                    //{ field: 'AdmiMan', title: '受理人', width: 80, align: 'left', sortable: true },
                    //{ field: 'ReserveDate', title: '预约处理时间', width: 160, align: 'left', sortable: true },
                    //{ field: 'DispDate', title: '分派时间', width: 160, align: 'left', sortable: true },
                    //{ field: 'DispMan', title: '分派人', width: 80, align: 'left', sortable: true }
                ]]


                function LoadList() {
                    $("#TableContainer").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column,
                        frozenColumns: frozenColumns,
                        fitColumns: false,
                        singleSelect: true,
                        remoteSort: false,
                        pagination: true,
                        border: false,
                        width: "100%",
                        toolbar: toolbar,
                        sortOrder: "asc",
                        rownumbers: true,
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentCancelFinishNew", "TableContainer", param);
                        },
                        onLoadSuccess: function (data) {
                            $("#SearchDlg").dialog("close");
                        }
                    });
                }

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
                    //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', true, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#TypeID").val(arrRet.id);
                        $("#TypeName").searchbox("setValue", arrRet.text);
                    });
                }

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



    </script>

</body>
</html>
