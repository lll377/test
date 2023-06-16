<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelContractledgerManagement.aspx.cs" Inherits="M_Main.PersonnelManage.PersonnelContractManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.excheck-3.5.js"></script>
    <script language="javascript" src="../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        #from, #to {
            border-top: none;
            font-size: 14px;
            line-height: 24px;
            border: 1px #D5D5D5 solid;
            width: 150px;
            height: 270px;
            text-align: center;
        }


        .Title {
            width: 100%;
            background-color: #E0ECFF;
            border-bottom: 1px solid #95B8E7;
            font-size: 12px;
            font-family: 'Microsoft YaHei';
            background-color: #E7F0FF;
            font-weight: bold;
            padding: 6px 0px;
        }

        #LeftPanel {
            width: 260px;
            background-color: #ffffff;
            border: 1px solid #95B8E7;
            margin-right: 1px;
            margin-left: 1px;
            float: left;
            overflow: scroll;
        }

        #RilghPanel {
            width: 100%;
            float: left;
            overflow: scroll;
            margin: 0px;
            padding: 0px;
        }

        body {
            overflow: hidden;
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server" clientidmode="Static">
        <div>
            <div id="LeftPanel">
                <ul class="ztree" id="treeDemo">
                </ul>
            </div>
            <div id="RilghPanel" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 560px; height: 250px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>

                    <td class="TdTitle">公司主体</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="CompanyPrincipalField" name="CompanyPrincipalField" /></td>
                    <td class="TdTitle">姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="PersonName" name="PersonName" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">人事所属机构
                    </td>
                    <td class="TdContent">
                        <input id="PDepName" name="PDepName" class="easyui-searchbox" searcher="SelDepartment"
                            style="width: 138px" />
                        <input type="hidden" class="easyui-validatebox" id="DepCode" name="DepCode" />
                    </td>
                    <td class="TdTitle">合同类型
                    </td>
                    <td class="TdContent">
                        <select id="TypeName" name="TypeName" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="员工劳动合同">员工劳动合同</option>
                            <option value="员工其它合同">员工其它合同</option>
                        </select>
                    </td>

                </tr>

                <tr>
                    <td class="TdTitle">合同结束开始时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" format="date" id="htEndStartDate" name="htStartDate"
                            style="width: 90%" onclick="WdatePicker()" />
                    </td>
                    <td class="TdTitle">合同结束结束时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" format="date" id="htEndEndDate" name="htEndDate"
                            style="width: 90%" onclick="WdatePicker()" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同期限
                    </td>
                    <td class="TdContent">
                        <select id="Years" name="Years" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="1">1年</option>
                            <option value="2">2年</option>
                            <option value="3">3年</option>
                            <option value="4">4年</option>
                            <option value="5">5年</option>
                            <option value="6">6年</option>
                            <option value="7">7年</option>
                            <option value="8">8年</option>
                            <option value="9">9年</option>
                            <option value="99">长期</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">人员状态
                    </td>
                    <td class="TdContent" colspan="7" style="width: 90%; height: 30px;">
                        <input type="checkbox" id="Chk1" name="Chk1" value="true" style="border: none; width: 15px;" checked="checked" />&nbsp;已建档&nbsp;
                        <%--<input type="checkbox" id="Chk2" name="checkbox1" value="已应聘未入职" style="border: none; width: 15px;" />&nbsp;已应聘未入职&nbsp;--%>
                        <input type="checkbox" id="Chk3" name="Chk3" value="true" style="border: none; width: 15px;" checked="checked" />&nbsp;已入职未转正&nbsp;
                        <input type="checkbox" id="Chk4" name="Chk4" value="true" style="border: none; width: 15px;" checked="checked" />&nbsp;已转正未离职&nbsp;
                        <input type="checkbox" id="Chk5" name="Chk5" value="true" style="border: none; width: 15px;" />&nbsp;已离职&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="loadlist" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabsDlg" class="easyui-dialog" title="合同信息" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1090px; height: 470px;">
            <div style="width: 100%; height: 100%; height: auto; background-color: #cccccc; margin: 0px; padding: 0px;" id="TableContainer_Htlist"></div>
        </div>
        <input type="hidden" id="SortDepCode" name="SortDepCode" />
        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="IsApproved" name="IsApproved" value="1" runat="server" />
        <input type="hidden" id="hidshow" name="hidshow" value="0" runat="server" />
        <script language="javascript"  type="text/javascript">



            //加载部门树
            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "DepCode",
                        pIdKey: "PrentDepCode",
                    },
                    key: {
                        name: "DepName"
                    }
                }, callback: {
                    onClick: ZtreeClick
                },
                view: {
                    fontCss: getFont,
                    nameIsHTML: true
                }
            };
            function getFont(treeId, node) {
                return node.font ? node.font : {};
            }

            var n =<%= zNodes %>;

            var newN = [];
            for (var i = 0; i < n.length; i++) {
                var strData = "";
                if (i == 0)
                    newN[i] = { DepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"], SortDepCode: n[i]["DepCode"], DepCodeTure: n[i]["DepCode"], open: 'true' };
                else
                    newN[i] = { DepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"], SortDepCode: n[i]["DepCode"], DepCodeTure: n[i]["DepCode"], open: 'false' };
            }
            treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
            //树点击事件
            function ZtreeClick(event, treeId, treeNode) {
                $("#SortDepCode").val(treeNode.DepCode);
                LoadList();
            }

            function InitTableHeight() {
                var h = $(window).height() - 28;
                $("#LeftPanel").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
                $("#RightPanel").css("height", h + "px");

                var w = $(window).width();
                var w1 = $("#LeftPanel").width();
                w = w - w1 - 15;
                $("#RilghPanel").css("width", w);
            }
            InitTableHeight();

            function SelDepartment() {
                HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("~");
                        var varDepObj = "";
                        var depName = "";
                        var depCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varDepObj = varObjects[i].split('\t');
                            depName += varDepObj[2] + ",";
                            depCode += varDepObj[0] + ",";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        $("#PDepName").searchbox("setValue", depName);
                        document.all.PDepName.value = depName;
                        $("#DepCode").val(depCode);
                    }
                });
            }

            function GetParam() {
                var str = '';
                str += '&Name=' + $('#Name').val().trim();
                str += '&PDepName=' + $('#PDepName').val().trim();

                var strTypeName = $("input:hidden[name='TypeName']");
                var TypeName = '';
                $.each(strTypeName, function (index, item) {
                    TypeName += ',' + item.value;
                });
                if (TypeName.length > 0);
                {
                    str += '&TypeName=' + TypeName.substr(1, TypeName.length - 1)
                }

                var strYears = $("input:hidden[name='Years']");
                var Years = '';
                $.each(strYears, function (index, item) {
                    Years += ',' + item.value;
                });
                if (Years.length > 0);
                {
                    str += '&Years=' + Years.substr(1, Years.length - 1)
                }

                var strStateName = $("input:hidden[name='StateName']");
                var StateName = '';
                $.each(strStateName, function (index, item) {
                    StateName += ',' + item.value;
                });
                if (StateName.length > 0);
                {
                    str += '&StateName=' + StateName.substr(1, StateName.length - 1)
                }

                str += '&Memo=' + $('#Memo').val().trim();
                str += '&DepCode=' + $("#DepCode").val();
                $('#Name').val("")
                $('#Memo').val("");
                return encodeURI(str);

            }

            var Toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
                //, '-',
                //{
                //    text: '导出Excel',
                //    iconCls: 'icon-page_white_excel',
                //    handler: function () {
                //        window.open("rshtoutput.aspx?random=" + Math.random() + GetParam());
                //    }
                //}
            ];

            var frozenColumns = [[
                { field: 'ContractID', title: 'ContractID', width: 50, align: 'left', sortable: true, hidden: true, fixed: true },
                { field: 'CompanyPrincipalField', title: '公司主体', width: 80, align: 'left', sortable: true, fixed: true },
                {
                    field: 'PersonName', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href=\"rsda_xx.aspx?OpType=edit&show=1&Id=" + row.PersonID + "&HiPageIndex=1&HiPageSize=20\">" + row.PersonName + "</a>";
                        return str;
                    }
                },
                { field: 'ParantDepName', title: '人事所属机构', width: 150, align: 'left', sortable: true },
                { field: 'DepName', title: '部门', width: 120, align: 'left', sortable: true },
                { field: 'RoleName', title: '岗位', width: 100, align: 'left', sortable: true }
            ]];
            //列表
            var Column = [[
                { field: 'TypeName', title: '合同类别', width: 100, align: 'left', sortable: true }
                ,
                {
                    field: 'Name', title: '合同说明', width: 260, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.TypeName + "-" + row.FlowSortName + "-" + row.ContractName;
                        return str;
                    }
                }
                ,
                {
                    field: 'ContractCount', title: '签订合同次数', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href=\"javascript:void(0);\" onclick=\"LoadHtList(\'" + row.PersonID + "\')\">" + row.ContractCount + "</a>";
                        return str;
                    }
                }
                ,
                {
                    field: 'Years', title: '合同期限', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.Years;
                        if (str == "99") {
                            str = "长期"
                        }
                        else if (str == "100") {
                            str = "长期"  //3、	无固定劳动合同显示为长期
                        }
                        else {
                            str = str + "年"
                        }
                        return str;
                    }
                },
                {
                    field: 'htStartDate', title: '开始时间', width: 100, align: 'left', sortable: true, editor: { type: 'datebox' }
                    //, formatter: function (value, row, index) {
                    //    if (value != "") {
                    //        value = formatDate(value);
                    //        if (value == "2099/12/1") {
                    //            value = '无固定期限';
                    //        }
                    //    }
                    //    return value;
                    //}
                },
                {
                    field: 'htEndDate', title: '结束时间', width: 100, align: 'left', sortable: true, editor: { type: 'datebox' }
                    //, formatter: function (value, row, index) {
                    //    if (value != "") {
                    //        value = formatDate(value);
                    //        if (value == "2099/12/1") {
                    //            value = '无固定期限';
                    //        }
                    //    }
                    //    return value;
                    //}
                },
                { field: 'CheckState', title: '合同状态', width: 100, align: 'left', sortable: true },
                {
                    field: 'Enclosure11', title: '附件1', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        if (row.Enclosure1 == "1") {
                            return "√";
                        }
                    }
                },
                {
                    field: 'Enclosure22', title: '附件2', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        if (row.Enclosure2 == "1") {
                            return "√";
                        }
                    }
                },
                {
                    field: 'Enclosure33', title: '附件3', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        if (row.Enclosure3 == "1") {
                            return "√";
                        }
                    }
                },
                {
                    field: 'Enclosure44', title: '附件4', width: 60, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        if (row.Enclosure4 == "1") {
                            return "√";
                        }
                    }
                }
            ]];

            function IsRemindClick(Id) {
                $.tool.DataGet('CSPerson', 'GetContractUpdateIsRemind', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                        } else {
                            $.messager.alert("错误", "无此权限", "error");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function getQueryStr(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }
            function LoadList() {
                var sy = getQueryStr("sy");
                if (sy == '1') {
                    $("#htEndStartDate").val(getCurrentMonthFirst());
                    $("#htEndEndDate").val(getCurrentMonthLast());
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=GetPersonnelContractledgerManagement&' + $("#frmForm").serialize() + '&htEndStartDate=' + $("#htEndStartDate").val() + '&htEndEndDate=' + $("#htEndEndDate").val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    remoteSort: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: Column,
                    fitColumns: false,
                    frozenColumns: frozenColumns,
                    title: "合同台账",
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: Toolbar,
                    sortOrder: "asc"
                });
                $('#SearchDlg').dialog('close');
            }
            function getCurrentMonthFirst() {
                var date = new Date();
                date.setDate(1);
                var month = parseInt(date.getMonth() + 1);
                var day = date.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }
            function getCurrentMonthLast() {
                var date = new Date();
                var currentMonth = date.getMonth();
                var nextMonth = ++currentMonth;
                var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
                var oneDay = 1000 * 60 * 60 * 24;
                var lastTime = new Date(nextMonthFirstDay - oneDay);
                var month = parseInt(lastTime.getMonth() + 1);
                var day = lastTime.getDate();
                if (month < 10) {
                    month = '0' + month
                }
                if (day < 10) {
                    day = '0' + day
                }
                return date.getFullYear() + '-' + month + '-' + day;
            }

            $(function () {
                LoadList();
            })


            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('BussFlowControl', 'Del', 'ClassName=PmChange&Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    LoadYdList();
                                }
                                else {
                                    $.messager.alert('错误', '无此权限', 'error');
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            //列表
            var HtColumn = [[
                { field: 'TypeName', title: '合同类别', width: 100, align: 'left', sortable: true },
                { field: 'ContractNo', title: '合同编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'Name', title: '合同说明', width: 260, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.TypeName + "-" + row.FlowSortName + "-" + row.Name;
                        return str;
                    }
                },
                {
                    field: 'Years', title: '合同期限', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.Years;
                        if (str == "99") {
                            str = "长期"
                        }
                        else if (str == "100") {
                            str = "无固定期限"
                        }
                        else {
                            str = str + "年"
                        }
                        return str;
                    }
                },
                {
                    field: 'StartDate', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value);
                            if (value == "2099/12/1") {
                                value = '无固定期限';
                            }
                        }
                        return value;
                    }
                },
                {
                    field: 'EndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value);
                            if (value == "2099/12/1") {
                                value = '无固定期限';
                            }
                        }
                        return value;
                    }
                },
                {
                    field: 'EndDate1', title: '合同状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        // var enddate = new Date(row.EndDate.ToCustomizeDate().replace("-", "/g"));
                        var enddate = new Date(row.EndDate);
                        var now = new Date();
                        var str = "有效";
                        if (now > enddate)
                            str = "无效";
                        return str;
                    }
                },
                {
                    field: 'RegDate', title: '发起时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value);
                        }
                        return value;
                    }
                },
                {
                    field: 'PId', title: '办理天数', width: 100, align: 'center', sortable: true, hidden: 'true', formatter: function (value, row, index) {
                        var now = new Date();
                        var startdate = new Date(row.RegDate);
                        var date = now.getTime() - startdate.getTime();
                        var str = Math.floor(date / (24 * 3600 * 1000));
                        return str;
                    }
                },
                { field: 'CheckState', title: '审核状态', width: 100, align: 'left', sortable: true },
                {
                    field: 'CheckId', title: '详情', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (row.CheckId != '')
                            str = "<a style=\"color:blue;\" target='_blank' href=\"../OAWorkFlow/OAWorkDetail.aspx?Id=" + row.CheckId + "&Pid=" + row.Pid + "\"><img src='../images/icons/Edit.gif' alt='详情'></a>";
                        return str;
                    }
                }
            ]];

            //加载数据
            function LoadHtList(Pid) {
                $('#tabsDlg').parent().appendTo($("form:first"))
                $('#tabsDlg').dialog('open');
                $("#TableContainer_Htlist").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=BussFlowControl&ClassName=PmContract&Command=Select&Pid=' + Pid + '&IsApproved=1',
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: HtColumn,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    height: "100%",
                    toolbar: [],
                    sortOrder: "asc"
                });
            }

        </script>
    </form>
</body>
</html>
