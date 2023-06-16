<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractInfo.aspx.cs" Inherits="M_Main.InformationManage.ContractInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: 20%;">合同甲方
                    </td>
                    <td>
                        <input id="PartyA" style="width: 90%;" size="17" name="PartyA" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;">合同乙方
                    </td>
                    <td>
                        <input id="PartyB" style="width: 90%;" size="17" name="PartyB" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script>
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        $("#TableContainer").css("height", h + "px");
        LoadList();
    })

    var toolbar = "";
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    var types = getUrlParam("types");
    if (types == "1") {
        toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ViewDetail("新增基础信息", 'insert', "");
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择删除项！');
                        return;
                    }
                    DeleteHouseHold(row.ContractID);
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
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = '../InformationManage/ContractInfoToExcel.aspx';
                }
            }];
    }
    else {
        toolbar = [
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
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.location.href = '../InformationManage/ContractInfoToExcel.aspx';
                }
            }];
    }

    var column = [[
        //{ field: 'ck', checkbox: true },
        {
            field: 'PropertyArea', title: '物业区域', sortable: true, formatter: function (value, row, index) {
                var Params = "ContractID=" + row.ContractID;
                var str = row.PartyA;
                if (types == "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + value + "</a>";
                }
                return str;
            }
        },
        { field: 'AreaNumber', title: '物业区域编号', sortable: true },
        { field: 'PropertyProject', title: '物业项目', sortable: true },
        { field: 'ProjectNumber', title: '物业项目编号', sortable: true },
        { field: 'Province', title: '省级行政区', width: 100, align: 'left', sortable: false },
        { field: 'City', title: '地级行政区域', width: 100, align: 'left', sortable: false },
        { field: 'County', title: '县级行政区', width: 100, align: 'left', sortable: false },
        { field: 'Township', title: '乡级行政区域', width: 100, align: 'left', sortable: false },
        { field: 'PropertyName', title: '项目营业执照的物业公司全称', width: 170, align: 'left', sortable: false },
        { field: 'PropertyFormat', title: '物业业态', sortable: true },
        { field: 'TotalHouses', title: '总户数', sortable: true },
        { field: 'ConventionalCharges', title: '常规物业收费模式', width: 110, align: 'left', sortable: false },
        { field: 'ConventionalService', title: '常规物业服务模式', width: 110, align: 'left', sortable: false },

        { field: 'ContractName', title: '合同名称', width: 110, align: 'left', sortable: false },
        { field: 'ContractState', title: '合同状态', width: 110, align: 'left', sortable: false },
        {
            field: 'PartyA', title: '合同甲方', width: 120, align: 'left', sortable: true
        },
        { field: 'ContractID', title: 'ContractID', width: 50, align: 'left', sortable: true, hidden: true },
        { field: 'PartyB', title: '合同乙方', width: 100, align: 'left', sortable: true },
        { field: 'ContractDate', title: '合同签订日期', width: 100, align: 'left', sortable: true },
        { field: 'ContractCommDate', title: '合同生效日期', width: 100, align: 'left', sortable: true },
        {
            field: 'ContractEndDate', title: '合同结束日期', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                value = formatDate(value, "yyyy-MM-dd");
                if (row.ContractEndDateCheck == "True") { value = "无固定期限" }
                return value;
            }
        },
        { field: 'ManageScope', title: '合同管理范围', width: 80, align: 'left', sortable: true },
        { field: 'TotalManageArea', title: '合同管理面积', width: 100, align: 'left', sortable: true },
        { field: 'ContractAmount', title: '合同金额', width: 100, align: 'left', sortable: true },

        { field: 'DevelopmentSubject', title: '项目开发主体', sortable: true },
        { field: 'DeveloperEquitySubordination', title: '开发商股权从属', sortable: true },
        { field: 'ShareholdingRatioOfRelatedParties', title: '关连方持股比例', sortable: true },

        { field: 'CoverageArea', title: '占地面积', width: 100, align: 'left', sortable: true },
        { field: 'ConstructionArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
        { field: 'ChargesArea', title: '收费面积', width: 100, align: 'left', sortable: true },

        { field: 'HighRiseArea', title: '高层面积', width: 100, align: 'left', sortable: true },
        { field: 'TinyHighRiseArea', title: '小高层面积', width: 100, align: 'left', sortable: true },
        { field: 'MultiLayerArea', title: '多层面积', width: 100, align: 'left', sortable: true },
        { field: 'TownHouseArea', title: '双拼/联排别墅面积', width: 100, align: 'left', sortable: true },
        { field: 'FamilyVillasArea', title: '独栋别墅面积', width: 100, align: 'left', sortable: true },
        { field: 'OfficeArea', title: '办公面积', width: 100, align: 'left', sortable: true },
        { field: 'BusinessArea', title: '商业面积', width: 100, align: 'left', sortable: true },
        { field: 'KindergartenArea', title: '幼儿园面积', width: 100, align: 'left', sortable: true },
        { field: 'ClubArea', title: '会所面积', width: 100, align: 'left', sortable: true },
        { field: 'ManageRoomArea', title: '管理用房面积', width: 100, align: 'left', sortable: true },
        { field: 'LadderHouseArea', title: '步梯洋房面积', width: 100, align: 'left', sortable: true },
        { field: 'ElevatorVillaArea', title: '电梯洋房面积', width: 100, align: 'left', sortable: true },
        { field: 'ThreeSpellVillaArea', title: '三拼别墅面积', width: 100, align: 'left', sortable: true },
        { field: 'FourSpellVillaArea', title: '四拼别墅面积', width: 100, align: 'left', sortable: true },
        { field: 'ApartmentArea', title: '公寓面积', width: 100, align: 'left', sortable: true },
        { field: 'GardenArea', title: '花园面积', width: 100, align: 'left', sortable: true },
        { field: 'BasementArea', title: '地下室面积', width: 100, align: 'left', sortable: true },
        { field: 'ShopsArea', title: '商铺面积', width: 100, align: 'left', sortable: true },
        { field: 'OfficeBuildeArea', title: '办公楼/写字楼面积', width: 100, align: 'left', sortable: true },
        { field: 'SchoolArea', title: '学校面积', width: 100, align: 'left', sortable: true },
        { field: 'UndergroundParkeArea', title: '地下车位面积', width: 100, align: 'left', sortable: true },
        { field: 'OpenParkeArea', title: '露天车位面积', width: 100, align: 'left', sortable: true },
        { field: 'OtherArea', title: '其他面积', width: 100, align: 'left', sortable: true },

        { field: 'HighRiseCharges', title: '高层收费标准', width: 100, align: 'left', sortable: true },
        { field: 'TinyHighRiseCharges', title: '小高层收费标准', width: 100, align: 'left', sortable: true },
        { field: 'MultiLayerCharges', title: '多层收费标准', width: 100, align: 'left', sortable: true },
        { field: 'TownHouseCharges', title: '双拼/联排别墅收费标准', width: 100, align: 'left', sortable: true },
        { field: 'FamilyVillasCharges', title: '独栋别墅收费标准', width: 100, align: 'left', sortable: true },
        { field: 'OfficeCharges', title: '办公收费标准', width: 100, align: 'left', sortable: true },
        { field: 'BusinessCharges', title: '商业收费标准', width: 100, align: 'left', sortable: true },
        { field: 'KindergartenCharges', title: '幼儿园收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ClubCharges', title: '会所面积收费标准', width: 100, align: 'left', sortable: true },
        { field: 'StepVillaCharges', title: '步梯洋房收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ElevatorVillaCharges', title: '电梯洋房收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ThreeSpellVillaCharges', title: '三拼别墅收费标准', width: 100, align: 'left', sortable: true },
        { field: 'FourSpellVillaCharges', title: '四拼别墅收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ApartmentCharges', title: '公寓收费标准', width: 100, align: 'left', sortable: true },
        { field: 'GardenCharges', title: '花园收费标准', width: 100, align: 'left', sortable: true },
        { field: 'BasementCharges', title: '地下室收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ShopsCharges', title: '商铺收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ClubCharges', title: '会所收费标准', width: 100, align: 'left', sortable: true },
        { field: 'OfficeBuildeCharges', title: '办公楼/写字楼收费标准', width: 100, align: 'left', sortable: true },
        { field: 'SchoolCharges', title: '学校收费标准', width: 100, align: 'left', sortable: true },
        { field: 'ManageRoomCharges', title: '管理用房面积收费标准', width: 100, align: 'left', sortable: true },
        { field: 'OtherCharges', title: '其他面积收费标准', width: 100, align: 'left', sortable: true },
        
        { field: 'OpenParkeTotalCount', title: '露天车位数量', width: 100, align: 'left', sortable: true },
        { field: 'UndergroundParkeTotalCount', title: '地下车位数量', width: 100, align: 'left', sortable: true },
        { field: 'OpenParkeCharges', title: '露天车位收费标准', width: 100, align: 'left', sortable: true },
        { field: 'UndergroundParkeCharges', title: '地下车位收费标准', width: 100, align: 'left', sortable: true },

        { field: 'LiquidateDamage', title: '物业服务费违约金收费标准', width: 100, align: 'left', sortable: true },
        {
            field: 'UpdateDate', title: '合同变更日期', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                return formatDate(value, "yyyy-MM-dd");
            }
        },
    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            toolbar: toolbar,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("ContractInfo", "GetList", "TableContainer", param);
            },
            onLoadSuccess: function (data) {
                var types = parent.document.getElementById("types").value;
                if (types == "1") {
                    CheckAuthority('040101', function callback(_Data) {
                        if (_Data == 'false') {
                            $('#TableContainer').datagrid("removeToolbarItem", "删除")//根据下标删除
                        }
                    });
                }
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //显示详细
    function ViewDetail(title, OpType, Params) {
        HDialog.Open(1024, h + 60, '../InformationManage/ContractInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data == "1") {
                LoadList();
            }
        });
    }

    //删除
    function DeleteHouseHold(ContractID) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('ContractInfo', 'deletes', 'ContractID=' + ContractID,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                        }
                        else { HDialog.Info('删除失败'); }
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }
</script>
