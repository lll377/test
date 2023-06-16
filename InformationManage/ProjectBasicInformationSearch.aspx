<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectBasicInformationSearch.aspx.cs" Inherits="M_Main.InformationManage.ProjectBasicInformationSearch" %>

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
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
         #SearchDlg {
            padding: 10px;
            width: 800px;
            height: auto;
        }

        .SearchTable {
            width: 800px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 12%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 25%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 91%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="planform" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea name="CommName" id="CommName" class="easyui-validatebox" onclick="SelComm()" readonly="" style="width:99%"></textarea>
                        <input name="CommID" type="hidden" id="CommID" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">业务板块</td>
                    <td class="TdContentSearch">
                        <select id="BusPlate" runat="server" name="BusPlate" class="easyui-combobox" style="width:98%;"  data-options="required:true,editable:false,width:100,panelHeight:90">
                            <option value="">全部</option>
                            <option value="住宅">住宅</option>
                            <option value="商办">商办</option>
                            <option value="公服">公服</option>
                        </select>
                    </td>
                    <td class="TdTitle">项目业态</td>
                    <td class="TdContentSearch">
                        <input runat="server" name="StateName" type="text" id="StateName" searcher="SelFormat" style="width:98%;"  class="easyui-searchbox" data-options="required:true,editable:false" />

                    </td>
                    <td class="TdTitle">项目归属</td>
                    <td class="TdContentSearch">
                        <select id="CommBelong" runat="server" name="CommBelong" class="easyui-combobox" style="width:98%;"  data-options="required:true,editable:false,width:100,panelHeight:60">
                            <option value="" selected="selected">全部</option>
                            <option value="集团项目">集团项目</option>
                            <option value="第三方项目">第三方项目</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">获取方式</td>
                    <td class="TdContentSearch">
                        <select id="CommFrom" runat="server" name="CommFrom" class="easyui-combobox" style="width:98%;"  data-options="required:true,editable:false,width:100,panelHeight:60">
                            <option value="" selected="selected">全部</option>
                            <option value="非外拓项目">非外拓项目</option>
                            <option value="外拓项目">外拓项目</option>
                        </select>
                    </td>
                    <td class="TdTitle"><span>开发主体</span></td>
                    <td class="TdContentSearch">
                        <input id="DevSubject" runat="server" name="DevSubject" class="easyui-textbox" style="width:98%;"  data-options="required:false,tipPosition:'bottom',multiline:false,width:100" />

                    </td>
                    <td class="TdTitle"><span>服务模式</span></td>
                    <td class="TdContentSearch">
                        <select id="ServiceModel" runat="server" name="ServiceModel" class="easyui-combobox" style="width:98%;"  data-options="required:true,editable:false,width:100,panelHeight:100">
                            <option value="" selected="selected">全部</option>
                            <option value="全委">全委</option>
                            <option value="半委">半委</option>
                            <option value="顾问">顾问</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"><span>收费模式</span></td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" runat="server" name="ChargeMode" class="easyui-combobox" style="width:98%;"  data-options="required:true,editable:false,width:100,panelHeight:100">
                            <option value="" selected="selected">全部</option>
                            <option value="包干制">包干制</option>
                            <option value="酬金制">酬金制</option>
                        </select>
                    </td>
                    <td class="TdTitle">
                        <span>是否退出</span>
                    </td>
                    <td class="TdContentSearch">
                        <select id="IsSignOut" runat="server" name="IsSignOut" class="easyui-combobox" style="width:98%;"  data-options="required:false,editable:false,width:100,panelHeight:80,onChange:function(newValue,oldValue){ SignOutChange(newValue, oldValue)}">
                            <option value="" selected="selected">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">退出时间从</td>
                    <td class="TdContentSearch">
                        <input id="SignOutTimeBegin" runat="server" name="SignOutTimeBegin" class="easyui-datebox" style="width:98%;"  data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="SignOutTimeEnd" runat="server" name="SignOutTimeEnd" class="easyui-datebox" style="width:98%;"  data-options="required:false,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear()">清空</a>
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
        $("#TableContainer").css("height", h * 0.942 + "px");
        LoadList();
    })
    //选择项目
    function SelComm() {
        var w = $(window).width() * 0.7;
        HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
            if (_Data != "") {
                var arrRet = JSON.parse(_Data);
                $("#CommID").val(arrRet.id);
                $("#CommName").val(arrRet.name);
            }
        });
    }

    function SelFormat() {
        HDialog.OpenWin("600", "400", '../InformationManage/ProjectStateSelectType.aspx?Ismultiple=0&WithParent=0', "选择项目业态", false, function callback(_Data) {
            if (_Data != "") {
                var data = $.parseJSON(_Data);
                console.log(data);
                if (data.length > 1) {
                    var m = data[1].text + "-" + data[0].text;
                    $('#StateName').searchbox('setValue', m);
                    //第一个对象是 第二级类别  第二个对象是 第一级类别 但是包含子节点
                }
            }
        });

    }

    var toolbar = "";
    toolbar = [
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }
        , '-',
        {
            text: 'Excel导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = '../InformationManage/ProjectBasicInformationSearchToExcel.aspx';
            }
        }
    ];

    var column = [[
        { field: 'BelongArea', rowspan: 2, title: '所属片区', width: 120, align: 'center', sortable: true },
        { title: '平台公司', colspan: 2 },
        { title: '归属公司', colspan: 2 },
        { title: '项目名称', colspan: 4 },
        { field: 'CommCode', title: '项目编码（非系统编码）', rowspan: 2, sortable: true },
        { field: 'NCSystemNumber', title: '地理位置', colspan: 7, sortable: true },
        { field: 'BusPlate', title: '业务板块', rowspan: 2, sortable: true },
        { title: '物业业态', colspan: 2 },
        { field: 'StateNames', title: '项目含有业态', rowspan: 2, sortable: true },
        { field: 'CommFrom', title: '获取方式', rowspan: 2, sortable: true },
        { field: 'BusPlate', title: '项目类型', rowspan: 2, sortable: true },
        { field: 'DevTime', title: '开发时间', rowspan: 2, sortable: true },
        { field: 'DevSubject', title: '开发主体', rowspan: 2, sortable: true },
        { field: 'ServiceModel', title: '服务模式', rowspan: 2, sortable: true },
        { field: 'ChargeMode', title: '收费模式', rowspan: 2, sortable: true },
        { field: 'TakeOverTime', title: '接管时间', rowspan: 2, sortable: true },
        { field: 'DeliverTime', title: '首次集中交付日期', rowspan: 2, sortable: true },
        {
            field: 'IsValueAdd', title: '是否提供增值服务事项', rowspan: 2, sortable: true, formatter: function (value, row, index) {
                if (value == "" || value == "0") {
                    return '否';
                } else if (value == "1") {
                    return '是';
                }
            }
        },
        { field: 'ValueAddContent', title: '提供的增值服务事项', rowspan: 2, sortable: true },
        { field: '二手房交易均价', title: '二手房交易均价', rowspan: 2, sortable: true },
        { field: 'ManageStage', title: '项目管理阶段', rowspan: 2, sortable: true },
        { field: 'IsSignOut', title: '是否退场', rowspan: 2, sortable: true, formatter: function (value, row, index) {
                if (value == "" || value == "0") {
                    return '否';
                } else if (value == "1") {
                    return '是';
                }
            } },
        { field: 'SignOutTime', title: '退场时间', rowspan: 2, sortable: true },
        { title: '收楼时间', colspan: 2 },
        { title: '业委会信息', colspan: 2 }
    ],
    [
        { field: 'OrganName', title: '平台公司简称', width: 100, align: 'center', sortable: true },
        { field: 'OrganCode', title: '区域编码', width: 100, align: 'center', sortable: true },

        { field: 'BelongSignCompanyName', title: '签约公司名称', width: 100, align: 'center', sortable: true },
        { field: 'BelongManageCompanyName', title: '管理公司名称', width: 100, align: 'center', sortable: true },

        { field: 'CommName', title: '物业项目名称', width: 100, align: 'center', sortable: true },
        { field: 'CommSortName', title: '项目简称', width: 80, align: 'center', sortable: true },
        { field: 'CommSellName', title: '推广（销售）名称', width: 100, align: 'center', sortable: true },
        { field: 'CommBuildName', title: '报建名称', width: 100, align: 'center', sortable: true },

        { field: 'Province', title: '所在省份', width: 100, align: 'center', sortable: true },
        { field: 'City', title: '所在城市', width: 100, align: 'center', sortable: true },
        { field: 'County', title: '县(区)', width: 100, align: 'center', sortable: true },
        { field: '城市级别', title: '城市级别', width: 100, align: 'center', sortable: true },
        { field: 'RegionDistribName', title: '区域分布', width: 100, align: 'center', sortable: true },
        { field: 'CommAddress', title: '具体地址', width: 100, align: 'center', sortable: true },
        { field: 'PostalCode', title: '邮政编码', width: 100, align: 'center', sortable: true },

        { field: '一级', title: '一级', width: 100, align: 'center', sortable: true },
        { field: '二级', title: '二级', width: 100, align: 'center', sortable: true },

        { field: 'ExpectHandTime', title: '预计收楼交楼日期', width: 100, align: 'center', sortable: true },
        { field: 'TakeOverTime', title: '首次交楼日期', width: 100, align: 'center', sortable: true },

        { field: 'IsSetCommittee', title: '是否成立', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                if (value == "" || value == "0") {
                    return '否';
                } else if (value == "1") {
                    return '是';
                }
            } },
        { field: 'CommitteeTime', title: '成立时间', width: 100, align: 'center', sortable: true }
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
                param = $.JQForm.GetParam("ProjectBasicInformation", "ProjectBasicInformationList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

</script>
