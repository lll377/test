<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentRemindSeach.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentRemindSeach" %>

<!DOCTYPE html>

<html >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
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
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="isBigCorpTypeID" name="isBigCorpTypeID" value="1" />
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        
        <input id="CommIDs" name="CommIDs" type="hidden" runat="server"/>
        <input id="hiIncidentType" name="hiIncidentType" type="hidden" runat="server"/>

        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server"/>

        <div id="TableContainer">
        </div>

       <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1090px; height: 450px; padding: 10px;">
           <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr id="IsShow">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>

              <tr>
              <%--    <td class="TdTitle">查询范围
                    </td>
                    <td class="TdContentSearch">
                        <select id="IsDelete" name="IsDelete" class="easyui-combobox" style="width: 140px;" data-options="editable:false, panelHeight:'auto'" runat="server">
                            <option value=""></option>
                            <option value="全部">全部</option>
                            <option value="0">有效</option>
                            <option value="1">作废</option>
                        </select>
                    </td>--%>
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
                        <select id="DrClass" name="DrClass" runat="server" style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">责任人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 140px;" runat="server" />
                    </td>
              </tr>
               <tr>
                   <td class="TdTitle">报事方式
                    </td>
                    <td class="TdContent">
                       <select id="InfoSource" name="InfoSource" style="width: 140px;" runat="server">
                        </select>
                    </td>
                   <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContent">
                        <select id="IncidentSource" name="IncidentSource"  style="width: 140px;"   runat="server">
                            <option value="">全部</option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                   <td class="TdTitle">组团区域
                    </td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server"   style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                   <td class="TdTitle">管  家
                   </td>
                   <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" style="width: 140px;" runat="server" />
                    </td>
               </tr>
               <tr>
                   <td class="TdTitle">楼  宇
                    </td>
                    <td class="TdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server"   style="width: 140px;">
                            <option value=""></option>
                        </select>
                    </td>
                   <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" data-options="editable:false" 
                            style="width: 140px;" searcher="SelRoomSign" runat="server" />
                        <input type="hidden" id="RoomID" runat="server" />
                    </td>
                   <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName"
                            style="width: 140px;" searcher="SelCust" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" />
                    </td>
                   <td class="TdTitle">报事电话
                    </td>
                    <td class="TdContent">
                        <input type="text" id="Phone" name="Phone" style="width: 137px;" runat="server" />
                    </td>
               </tr>
               <tr>
                   <td class="TdTitle">报事位置</td>
                    <td class="TdContentSearch">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                   <td class="TdTitle">公区名称</td>
                   <td class="TdContent">
                        <input type="text" id="RegionalPlace" name="RegionalPlace" style="width: 140px;" runat="server" />
                    </td>
                   <td class="TdTitle">报事责任</td>
                    <td class="TdContentSearch">
                        <select id="Duty" name="Duty" style="width: 140px;" runat="server">
                            <option value="">全部</option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                   <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="BigTypeName" name="BigTypeName" data-options="editable:false"
                            style="width: 140px;" searcher="SelTypeName" runat="server" />
                        <input id="TypeID" type="hidden" name="TypeID" />
                    </td>
               </tr>
               <tr>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width:140px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                   <td class="TdTitle">是否收费
                    </td>
                    <td class="TdContent">
                         <select id="DueAmount" name="DueAmount" style="width: 140px;" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                   <td class="TdTitle">是否设备
                    </td>
                    <td class="TdContent" style="width:66px;">
                        <select id="EqId" name="EqId" style="width:140px;" runat="server">
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
                   <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text"  class="Wdate"   id="IncidentDate1" style="width: 140px;" name="IncidentDate1" 
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"  format="date" runat="server" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" id="IncidentDate2" style="width: 140px;" name="IncidentDate2" 
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"  format="date" runat="server" />
                    </td>
                   <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate1" name="ReserveDate1" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="ReserveDate2" name="ReserveDate2" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"  format="date" />
                    </td>
               </tr>
                 <tr>
                   <td class="TdTitle">分派时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate"  id="DispStartDate" name="DispStartDate" style="width: 140px;"  
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date"  runat="server" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text"  class="Wdate"   id="DispEndDate" name="DispEndDate"  style="width: 140px;" 
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" runat="server" />
                    </td>
                   <td class="TdTitle">催办时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="RemindersStartDate" name="RemindersStartDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="RemindersEndDate" name="RemindersEndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"  format="date" />
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
                  <%--  <td class="TdTitle">责任人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DealMan" name="DealMan" style="width: 140px;" runat="server" />
                    </td>--%>
                     <td class="TdTitle"> 
                    </td>
                    <td class="TdContent">
                      
                    </td>

               </tr>

               <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClear();">清 空</a>
                    </td>
                </tr>

           </table>
      </div>
    </form>

    <script type="text/javascript" >

        $(function () {
            $("#TableContainer").css("height", $(window).height() + "px");

            var opType = $("#hiIncidentType").val();
               // alert(opType);
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
                    $("#BigTypeName").val("");
                    $("#DrClass").val("");
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //window.open("../Incident/IncidentSeachCreExcel.aspx");
                    window.location.href = "../IncidentNewJH/IncidentReminderSearchToExcel.aspx";
                    //document.getElementById("btnExcelExport").click();
                }
            }
        ];


        var frozenColumns = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'left', sortable: true },
            { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
            { field: 'IncidentNum', title: '报事编号', width: 160, align: 'left', sortable: true }

        ]]

        var column = [[
            { field: 'CoordinateNum', title: '派工单号', width: 140, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 80, align: 'left', sortable: true },
            { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
            { field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
            { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
            { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
            { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },
            { field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true },
            { field: 'IncidentDate', title: '受理时间', width: 160, align: 'left', sortable: true },
            { field: 'AdmiMan', title: '受理人', width: 100, align: 'left', sortable: true },
            { field: 'ReserveDate', title: '预约处理时间', width: 160, align: 'left', sortable: true },
            { field: 'DispDate', title: '分派时间', width: 160, align: 'left', sortable: true },
            { field: 'DispMan', title: '分派人', width: 100, align: 'left', sortable: true },
            { field: 'DealMan', title: '责任人', width: 100, align: 'left', sortable: true },
            { field: 'UserName', title: '催办人', width: 100, align: 'left', sortable: true },
            { field: 'RemindersDate', title: '催办时间', width: 160, align: 'left', sortable: true }

        ]];

        function LoadList() {
            var InfoSource = $("#InfoSource").find("option:selected").text();
            $("#hiInfoSource").val(InfoSource);

            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: top.ListPageSize,
                columns: column,
                frozenColumns: frozenColumns,
                fitColumns: false,
                pageList: top.ListPageList,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                rownumbers: true,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("IncidentAcceptNew_Search", "IncidentReminderList", "TableContainer", param);
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
                    debugger;
                    //var strO = $("#SpaceId").val();
                    //var strL = $("#MacRoName").val();
                    $("#SpaceId").val(varObjects.SpaceId);
                    $("#MacRoName").searchbox("setValue", varObjects.MacRoName);
                }
            });
        }


        function btnClear() {
            $("#IncidentNum").val("");
            $("#CoordinateNum").val("");
            $("#DrClass").val("");
            $("#DealMan").val("");
            $("#InfoSource").val("");
            $("#IncidentSource").val("");
            $("#RegionSNum").val("");
            $("#UserName").val("");
            $("#BuildSNum").val("");
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
            $("#IsTousu").val("");
            $("#DueAmount").val("");
            $("#EqId").val("");
            $("#MacRoName").searchbox("setValue", "");
            $("#SpaceId").val("");
            $("#IncidentDate1").val("");
            $("#IncidentDate2").val("");
            $("#ReserveDate1").val("");
            $("#ReserveDate2").val("");
            $("#DispStartDate").val("");
            $("#DispEndDate").val("");
            $("#RemindersStartDate").val("");
            $("#RemindersEndDate").val("");
            $("#AdmiMan").val("");
            $("#DispMan").val("");


            $("#hiInfoSource").val("");

            //$("#InfoSource").combobox('setText', '');
            //$("#RegionSNum").combobox('setText', '');
            $("#hiRegionSNum").val("");
            //$("#BuildSNum").combobox('setText', '');
            $("#hiBuildSNum").val("");
            $("#IsBeoverdue").val("");
            $("#IsBeoverdueHour").val("");

        }



        </script>
</body>
</html>
