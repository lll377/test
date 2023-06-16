<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpParkSearch.aspx.cs" Inherits="M_Main.CarparkNew.CorpParkSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ParkingBrowse</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        #SearchDlgWhere {
            border: 1px #D5D5D5 solid;
            width: 600px;
            height: 270px;
            margin: 0 auto;
        }

        #from, #to {
            border-top: none;
            font-size: 14px;
            line-height: 24px;
            border: 1px #D5D5D5 solid;
            width: 230px;
            height: 270px;
            text-align: center;
        }

        #saveId {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input id="HiIFCode" type="hidden" name="HiIFCode" runat="server" />
        <input id="HiIFName" type="hidden" name="HiIFName" runat="server" />

        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 400px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="7">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
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
                    
                    <td class="TdTitle">联系电话</td>
                    <td class="TdContent">
                        <input type="text" id="Phone" style="width: 81%;" runat="server" />
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
                    <td class="TdTitle">接管时间从</td>
                    <td class="TdContentSearch">
                        <input id="BeginTakeOverDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="BeginTakeOverDate" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EndTakeOverDate" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="EndTakeOverDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle" >车牌号码</td>
                    <td class="TdContent" colspan="8">
                        <input type="text" id="CarSign" style="width: 95%;" runat="server" />
                    </td>
                </tr>
                <%--<tr>
                    <td class="TdTitle">说明</td>
                    <td colspan="7" style="height: 12px">
                        <span style="color: red">1、自有产权模式一(抵扣)：权属房产产权车位出租收入抵空置车位物业费。<br />
                            2、自有产权模式二(常规)：权属房产产权车位出租收入归房产，物业公司收取空置车位物业费。</span>

                    </td>
                </tr>--%>
                <tr>
                    <td style="text-align: center;" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>

                </tr>

            </table>
        </div>
        <div id="SearchDlgWhere" class="easyui-dialog" title="设置导出列" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 360px; padding: 10px;">
            <table align="center" width="500" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="4">
                        <select name="from" ondblclick="removeItem();" id="from" style="width: 230px;" multiple="true">
                            <option value="OrganName">区域名称</option>
                            <option value="CommName">项目名称</option>
                            <option value="CarparkName">车位区域</option>
                            <option value="ParkType">车位类型</option>
                            <option value="ParkName">车位编号</option>
                            <option value="ContSubDate">合同交付时间</option>
                            <option value="ActualSubDate">实际交付时间</option>
                            <option value="ParkArea">车位面积</option>
                            <option value="ParkingNum">泊车数量</option>
                            <option value="PropertyRight">产权性质</option>
                            <option value="CostName">收费项目</option>
                            <option value="StanName">收费标准</option>
                            <option value="ParkMemo">备注</option>
                            <option value="IsPropertyServiceName">是否签订物业服务协议</option>
                            <option value="NCustName">业主名称</option>
                            <option value="NRoomSign">业主房号</option>
                            <option value="PropertyUses">使用状态</option>
                            <option value="UseState">当前状态</option>
                            <option value="CustName">客户名称</option>
                            <option value="RoomSign">客户房号</option>
                            <option value="Phone">联系电话</option>
                            <option value="ChargeCycleName">计费周期</option>
                            <option value="IsUseName">是否使用</option>
                            <option value="ParkStartDate">计费开始时间</option>
                            <option value="ParkEndDate">计费结束时间</option>
                            <option value="ParkingCarSign">停车卡号</option>
                            <!--<option value="CarSign">车牌号码</option>-->
                            <option value="CarType">车辆类型</option>
                            <option value="FacBrands">车辆品牌</option>
                            <option value="CarColor">颜色</option>
                            <option value="CarEmission">排量</option>
                            <option value="handling">受理人</option>
                            <option value="HandDate">受理时间</option>
                            <option value="IsListingName">是否挂牌</option>
                            <option value="ListingData">挂牌日期</option>
                            <option value="HandDate">办理时间</option>
                            <option value="TakeOverDate">接管时间</option>
                        </select>
                    </td>
                    <td align="center">
                        <input type="button" id="addAll" value=" >> " onclick="addAll1();" style="width: 50px;" /><br />
                        <input type="button" id="addOne" value=" > " onclick="addOne1();" style="width: 50px;" /><br />
                        <input type="button" id="removeOne" value="&lt;" onclick="removeOne1();" style="width: 50px;" /><br />
                        <input type="button" id="removeAll" value="&lt;&lt;" onclick="removeAll1()" style="width: 50px;" /><br />
                    </td>
                    <td colspan="4">
                        <select name="to" id="to" ondblclick="addItem();" style="width: 150px;" multiple="true" runat="server">
                        </select>
                    </td>
                    <td align="center">
                        <input type="button" id="Top" value="置顶" onclick="Top1();" style="width: 50px;" /><br />
                        <input type="button" id="Up" value="上移" onclick="Up1();" style="width: 50px;" /><br />
                        <input type="button" id="Down" value="下移" onclick="Down1();" style="width: 50px;" /><br />
                        <input type="button" id="Buttom" value="置底" onclick="Buttom1();" style="width: 50px;" /><br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="4" id="saveId">
                        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

    function GetParam() {
        var str = '';
        str += "&CarparkName=" + $("#CarparkName").val();
        str += "&ParkType=" + $("#ParkType").combobox('getText');
        str += "&ParkName =" + $("#ParkName").val();
        str += "&StanAmount =" + $("#StanAmount").val();
        str += "&NCustID=" + $("#CustID").val();
        str += "&NRoomID=" + $("#RoomID").val();
        str += "&PropertyRight=" + $("#PropertyRight").combobox('getText');
        str += "&PropertyUses=" + $("#PropertyUses").combobox('getText');
        str += "&UseName=" + $('#drUse').combobox('getText');
        str += "&ParkingCarSign =" + $("#ParkingCarSign").val();
        str += "&CarSign =" + $("#CarSign").val();
        str += "&ParkStartDate =" + $("#ParkStartDate").datebox('getValue');
        str += "&ParkStartEndDate =" + $("#ParkStartEndDate").datebox('getValue');
        str += "&ParkEndDate =" + $("#ParkEndDate").datebox('getValue');
        str += "&ParkEndEndDate =" + $("#ParkEndEndDate").datebox('getValue');
        str += "&HandStartDate =" + $("#HandStartDate").datebox('getValue');
        str += "&HandEndDate =" + $("#HandEndDate").datebox('getValue');
        str += "&IsPropertyService =" + $("#IsPropertyService").combobox('getValue');
        str += "&UseState =" + $("#SelUseState").combobox('getValue');
        str += "&ParkCategory=" + $("#ParkCategory").combobox('getValue');
        str += "&ParkMemo =" + $("#ParkMemo").val();


        return str;//encodeURI(str);
    }

    $(function () {
        InitTableHeight();
        LoadList();
    });

    var h = $(window).height();
    var w = $(window).width();
    function InitTableHeight() {

        $("#TableContainer").css("height", h + "px");
    }

    var column = [[
        { field: 'OrganName',  title: '区域名称', width: 120, align: 'left', sortable: true },
        { field: 'CommName',  title: '项目名称', width: 120, align: 'left', sortable: true },
        { field: 'CarparkName', title: '车位区域', width: 90, align: 'left', sortable: true },
        { field: 'ParkCategoryName', title: '车位类别', width: 90, align: 'left', sortable: true },
        { field: 'ParkType', title: '车位类型', width: 90, align: 'left', sortable: true },
        {
            field: 'ParkName', title: '车位编号', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail(" + row.ParkID + ");\">" + row.ParkName + "</a>";
                return str;
            }
        },
        {
            field: 'ContSubDate', title: '合同交付时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ActualSubDate', title: '实际交付时间', width: 110, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ContSubDate, "yyyy-MM-dd");
                return str;
            }
        },
          {
              field: 'TakeOverDate', title: '接管时间', width: 100, align: 'left', sortable: true,
              formatter: function (value, row, index) {
                  var str = formatDate(row.TakeOverDate, "yyyy-MM-dd");
                  return str;
              }
          },
        { field: 'StanAmount', title: '收费标准', width: 90, align: 'left', sortable: true },
        { field: 'UseState', title: '当前状态', width: 90, align: 'left', sortable: true },
        { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 110, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomPropertyRights', title: '房屋产权性质', width: 100, align: 'left', sortable: true },
        { field: 'RoomPropertyUses', title: '房屋使用性质', width: 100, align: 'left', sortable: true },
        { field: 'ParkingCarSign', title: '停车卡号', width: 90, align: 'left', sortable: true },
        { field: 'CarSign', title: '车牌号码', width: 90, align: 'left', sortable: true },
        { field: 'CarEmission', title: '排量', width: 90, align: 'left', sortable: true },
        { field: 'PropertyUses', title: '使用状态', width: 90, align: 'left', sortable: true },
        { field: 'PropertyRight', title: '车位产权性质', width: 90, align: 'left', sortable: true },
        {
            field: 'HandDate', title: '办理时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.HandDate, "yyyy-MM-dd");

                return str;
            }
        },
        {
            field: 'ParkStartDate', title: '开始时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {

                var str = formatDate(row.ParkStartDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ParkEndDate', title: '结束时间', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ParkEndDate, "yyyy-MM-dd");

                return str;
            }
        },
        { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true }


    ]];

    var toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                //CancelParm();
            }
        }, '-',
        {
            text: '导出设置',
            iconCls: 'icon-edit',
            handler: function () {
                $('#SearchDlgWhere').parent().appendTo($("form:first"))
                $('#SearchDlgWhere').dialog('open');
            }
        }, '-',
        {
            text: '导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                var fcode = $("#HiIFCode").val();
                var ftext = $("#HiIFName").val();
                //window.location.href = "../CarparkNew/ParkingSelSearchCreExcel.aspx?random=" + Math.random() + "&HiIFCode=" + fcode + "&HiIFName=" + ftext + GetParam();
                //zmh 2017-04-10 修改为新的导出excel方法
                
                window.open("../CarparkNew/CorpParkSearchCre.aspx?random=" + Math.random() + "&HiIFCode=" + fcode + "&HiIFName=" + ftext);
            }
        }, '-',
        {
            text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp;备注：【绿色—闲置；黑色—正常；橙色—三天到期；红色—已经到期】</font>'
        }
    ];

    function ViewDetail(ParkID) {

        //HDialog.Open(w, h, '../CarparkNew/ParkingManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType, title, false,
        //    function callback(_Data) {
        //    if (_Data == "true") {
        //        LoadList();
        //    }
        //});
        HDialog.Open(w, h, '../CarparkNew/ParkingLendSearch.aspx?ParkID=' + ParkID + '&OpType=details',
            '车位查询', false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }


    function Search() {

        if ($("#CommIDs").val() == "") {
            HDialog.Info("请选择项目");
            return false;
        }

        LoadList();
    }

    function LoadList() {
      
        var ParkType = $("#ParkType").combobox('getText');
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
           // url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Parking&Command=searchparkingsel&' + $("#FrmForm").serialize() + '&strParkType=' + ParkType,
            //url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "POST",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            rownumbers: true,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Parking", "searchparkingsel", "TableContainer", param);//IncidentReplySearchNew
            },
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
    //清空查询条件
    function CancelParm() {
        $('#ParkCategory').combobox('clear');
        $('#PropertyRight').combobox('clear');
        $('#drUse').combobox('clear');
        $('#SelUseState').combobox('clear');
        $('#ParkType').combobox('clear');
        $("#ParkName").val("");
        $('#CarparkName').searchbox("setValue", '');
        $("#CarparkID").val("");
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $('#PropertyUses').combobox('clear');
        $('#RoomSign').searchbox("setValue", '');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        $("#RoomID").val("");
        $("#CarSign").val("");
        $("#ParkingCarSign").val("");
        $("#HandStartDate").datebox("setValue", '');
        $("#HandEndDate").datebox("setValue", '');
        $("#StanAmount").val("");
        $("#ParkStartDate").datebox("setValue", '');
        $("#ParkStartEndDate").datebox("setValue", '');
        $("#ParkEndDate").datebox("setValue", '');
        $("#ParkEndEndDate").datebox("setValue", '');
        $("#ParkMemo").val("");
        $("#BeginTakeOverDate").datebox("setValue", '');
        $("#EndTakeOverDate").datebox("setValue", '');
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

        HDialog.Open('800', '400', conent, '客户选择', false, function callback(_Data) {
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

        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }

    function SelCommInfo() {
        //if ($('#hCommID').val() == '') {
            HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommIDs").val(arrRet.id);
                $("#CommNames").val(arrRet.name);
            });
        //}
    }



    //function ViewDetail(title, OpType, ParkID, CarparkID) {
    //    HDialog.Open('620', '350', '../CarparkNew/ParkingManage.aspx?ParkID=' + ParkID + '&CarparkID=' + CarparkID + '&OpType=' + OpType, title, false, function callback(_Data) {
    //        if (_Data == "true") {
    //            LoadList();
    //        }
    //    });
    //}

    $("select").each(function () {

        var key = $(this).attr("id");

        if (key != undefined) {
            $(this).css("width", '83%');
        }
    });


    //以下为设置显示列js方法
    function addOne1() {
        // $("#TableContainer").datagrid("showColumn", $("#from option:selected").val());
        $("#from option:selected").clone().appendTo("#to");
        $("#from option:selected").remove();
    }

    //    //选择全部  
    function addAll1() {
        // var obj = $("#from option").clone().appendTo("#to");
        //for (var i = 0; i < obj.length; i++) {
        //    $("#TableContainer").datagrid("showColumn", obj[i].value);
        //}
        $("#from option").clone().appendTo("#to");
        $("#from option").remove();
    }

    //    //移除一项  
    function removeOne1() {
        // $("#TableContainer").datagrid("hideColumn", $("#to option:selected").val());
        $("#to option:selected").clone().appendTo("#from");
        $("#to option:selected").remove();
    }

    //    //移除全部  
    function removeAll1() {
        // var obj = $("#to option").clone().appendTo("#from");
        //for (var i = 0; i < obj.length; i++) {
        //    $("#TableContainer").datagrid("hideColumn", obj[i].value);
        //}
        $("#to option").clone().appendTo("#from");
        $("#to option").remove();
    }

    //    //移至顶部  
    function Top1() {
        var allOpts = $("#to option");
        var selected = $("#to option:selected");
        if (selected.get(0).index != 0) {
            for (i = 0; i < selected.length; i++) {
                var item = $(selected.get(i));
                var top = $(allOpts.get(0));
                item.insertBefore(top);
            }
        }
    }

    //    //上移一行  
    function Up1() {
        var selected = $("#to option:selected");
        if (selected.get(0).index != 0) {
            selected.each(function () {
                $(this).prev().before($(this));
            });
        }
    }

    //    //下移一行  
    function Down1() {
        var allOpts = $("#to option");
        var selected = $("#to option:selected");
        if (selected.get(selected.length - 1).index != allOpts.length - 1) {
            for (i = selected.length - 1; i >= 0; i--) {
                var item = $(selected.get(i));
                item.insertAfter(item.next());
            }
        }
    }

    //    //移至底部  
    function Buttom1() {
        var allOpts = $("#to option");
        var selected = $("#to option:selected");
        if (selected.get(selected.length - 1).index != allOpts.length - 1) {
            for (i = selected.length - 1; i >= 0; i--) {
                var item = $(selected.get(i));
                var buttom = $(allOpts.get(length - 1));
                item.insertAfter(buttom);
            }
        }
    }

    function removeItem() {
        var sltSrc = document.getElementById('from');
        var sltTarget = document.getElementById('to');
        for (var i = 0; i < sltSrc.options.length; i++) {
            var tempOption = sltSrc.options[i];
            if (tempOption.selected) {
                sltSrc.removeChild(tempOption);
                sltTarget.appendChild(tempOption);
            }
        }
    }

    function addItem() {
        var sltSrc = document.getElementById('from');
        var sltTarget = document.getElementById('to');
        for (var i = 0; i < sltTarget.options.length; i++) {
            var tempOption = sltTarget.options[i];
            if (tempOption.selected) {
                sltTarget.removeChild(tempOption);
                sltSrc.appendChild(tempOption);
            }
        }
    }

    function Save() {
        var strcode = $("#to option").map(function () {
            return $(this).val();
        }).get().join(",");
        var strtext = $("#to option").map(function () {
            return $(this).html();
        }).get().join(",");

        document.getElementById("HiIFCode").value = strcode;
        document.getElementById("HiIFName").value = strtext;
        $('#SearchDlgWhere').dialog('close');
    }

</script>

