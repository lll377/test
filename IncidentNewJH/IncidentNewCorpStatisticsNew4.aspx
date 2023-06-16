<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentNewCorpStatisticsNew4.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentNewCorpStatisticsNew4" %>

<!DOCTYPE html>

<html>
<head>
    <title>公司报事汇总统计2</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>

    <style type="text/css">
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
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input id="CostIDs" name="CostIDs" value="" type="hidden" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" value="" type="hidden" runat="server" />
        <input id="hiIsSQLData" name="hiIsSQLData" value="-1" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
            size="1" name="hiCommNames" runat="server"><input id="Hidden1" style="width: 8px; height: 22px" type="hidden"
                size="1" name="CommIDs" runat="server">
        <input id="HChargeMode" style="width: 8px; height: 22px" type="hidden"
            size="1" name="HChargeMode" runat="server">
        <input id="CorpTypeID" name="CorpTypeID" type="hidden" runat="server" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <%--<tr>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="SelClass" name="SelClass" runat="server" style="width: 154px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContentSearch">
                        <select id="IncidentSource" style="width: 154px;" name="IncidentSource" runat="server">
                            <option value="" selected="selected">全部</option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置
                    </td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事责任
                    </td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" runat="server" style="width: 154px;">
                            <option value="" selected="selected">全部</option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                </tr>--%>
                <tr>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName"
                            style="width: 154px;" searcher="SelTypeName" />
                    </td>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginIncidentDate" name="BeginIncidentDate" style="width: 150px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndIncidentDate" name="EndIncidentDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginReserveDate" name="BeginReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndReserveDate" name="EndReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">处理方式
                    </td>
                    <td class="TdContent">
                        <select id="DealWay" name="DealWay" style="width: 150px;" runat="server">
                            <option value="" selected>全部</option>
                            <option value="ERP">ERP</option>
                            <option value="员工APP">员工APP</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <%--  <tr>
                    <td class="TdTitle"> 完成时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginMainEndDate" name="BeginMainEndDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndMainEndDate" name="EndMainEndDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>--%>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            function SelCommInfo() {
                if ($('#hCommID').val() == '') {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }

            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var frozenColumns = [[

                {
                    field: 'OrganName', width: 300, title: '区域', align: 'left', formatter: function (value, row, index) {
                        if (row.OrganName != undefined && row.OrganName != '') {
                            return row.OrganName;
                        }
                    }
                },
                {
                    field: 'CommName', width: 100, title: '项目', align: 'left', formatter: function (value, row, index) {
                        if (row.CommName != undefined && row.CommName != '') {
                            return row.CommName;
                        }
                    }
                },
                { field: '报事总量', width: 120, title: '报事总量', align: 'left' }
            ]]

            var column = [[
                { colspan: 4, title: '报事责任' },
                { colspan: 4, title: '报事类型' },
                { colspan: 4, title: '报事来源' },
                { colspan: 4, title: '报事位置' },
                { colspan: 12, title: '报事方式' }
            ],
            [
                {
                    field: '物业报事量', title: '物业报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.物业报事量 != undefined && row.物业报事量 != '') {
                            return row.物业报事量;
                        }
                    }
                },
                {
                    field: '物业报事占比', title: '物业报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.物业报事占比 != undefined && row.物业报事占比 != '') {
                            return row.物业报事占比;
                        }
                    }
                },
                {
                    field: '地产报事量', title: '地产报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.地产报事量 != undefined && row.地产报事量 != '') {
                            return row.地产报事量;
                        }
                    }
                },
                {
                    field: '地产报事占比', title: '地产报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.地产报事占比 != undefined && row.地产报事占比 != '') {
                            return row.地产报事占比;
                        }
                    }
                },

                {
                    field: '书面报事量', title: '书面报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.书面报事量 != undefined && row.书面报事量 != '') {
                            return row.书面报事量;
                        }
                    }
                },
                {
                    field: '书面报事占比', title: '书面报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.书面报事占比 != undefined && row.书面报事占比 != '') {
                            return row.书面报事占比;
                        }
                    }
                },
                {
                    field: '口派报事量', title: '口派报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.口派报事量 != undefined && row.口派报事量 != '') {
                            return row.口派报事量;
                        }
                    }
                },
                {
                    field: '口派报事占比', title: '口派报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.口派报事占比 != undefined && row.口派报事占比 != '') {
                            return row.口派报事占比;
                        }
                    }
                },


                {
                    field: '客户报事量', title: '客户报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.客户报事量 != undefined && row.客户报事量 != '') {
                            return row.客户报事量;
                        }
                    }
                },
                {
                    field: '客户报事占比', title: '客户报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.客户报事占比 != undefined && row.客户报事占比 != '') {
                            return row.客户报事占比;
                        }
                    }
                },
                {
                    field: '自查报事量', title: '自查报事量', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.自查报事量 != undefined && row.自查报事量 != '') {
                            return row.自查报事量;
                        }
                    }
                },
                {
                    field: '自查报事占比', title: '自查报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.自查报事占比 != undefined && row.自查报事占比 != '') {
                            return row.自查报事占比;
                        }
                    }
                },

                {
                    field: '户内报事量', title: '户内报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.户内报事量 != undefined && row.户内报事量 != '') {
                            return row.户内报事量;
                        }
                    }
                },
                {
                    field: '户内报事占比', title: '户内报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.户内报事占比 != undefined && row.户内报事占比 != '') {
                            return row.户内报事占比;
                        }
                    }
                },

                {
                    field: '公区报事量', title: '公区报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.公区报事量 != undefined && row.公区报事量 != '') {
                            return row.公区报事量;
                        }
                    }
                },
                {
                    field: '公区报事占比', title: '公区报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.公区报事占比 != undefined && row.公区报事占比 != '') {
                            return row.公区报事占比;
                        }
                    }
                },


                { field: '呼叫中心量', title: '呼叫中心量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '呼叫中心占比', title: '呼叫中心占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '自助语音量', title: '自助语音量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '自助语音占比', title: '自助语音占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '项目受理量', title: '项目受理量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '项目受理占比', title: '项目受理占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '员工APP量', title: '员工APP量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '员工APP占比', title: '员工APP占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '微信量', title: '微信量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '微信占比', title: '微信占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '其他量', title: '其他量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '其他占比', title: '其他占比%', fixed: true, width: 120, align: 'left', sortable: true }

            ]
            ];

            var Headcolumn = [
                [
                    { field: 'OrganName', width: 100, title: '', align: 'left' },
                    { field: 'CommName', width: 100, title: '', align: 'left' },
                    { field: '报事总量', width: 120, title: '', align: 'left' },
                    { colspan: 4, title: '报事责任' },
                    { colspan: 4, title: '报事类型' },
                    { colspan: 4, title: '报事来源' },
                    { colspan: 4, title: '报事位置' },
                    { colspan: 12, title: '报事方式' }
                ], [


                    { field: 'OrganName', width: 100, title: '区域', align: 'left' },
                    { field: 'CommName', width: 100, title: '项目', align: 'left' },
                    { field: '报事总量', width: 120, title: '报事总量', align: 'left' },

                    {
                        field: '物业报事量', title: '物业报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.物业报事量 != undefined && row.物业报事量 != '') {
                                return row.物业报事量;
                            }
                        }
                    },
                    {
                        field: '物业报事占比', title: '物业报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.物业报事占比 != undefined && row.物业报事占比 != '') {
                                return row.物业报事占比;
                            }
                        }
                    },
                    {
                        field: '地产报事量', title: '地产报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.地产报事量 != undefined && row.地产报事量 != '') {
                                return row.地产报事量;
                            }
                        }
                    },
                    {
                        field: '地产报事占比', title: '地产报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.地产报事占比 != undefined && row.地产报事占比 != '') {
                                return row.地产报事占比;
                            }
                        }
                    },

                    {
                        field: '书面报事量', title: '书面报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.书面报事量 != undefined && row.书面报事量 != '') {
                                return row.书面报事量;
                            }
                        }
                    },
                    {
                        field: '书面报事占比', title: '书面报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.书面报事占比 != undefined && row.书面报事占比 != '') {
                                return row.书面报事占比;
                            }
                        }
                    },
                    {
                        field: '口派报事量', title: '口派报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.口派报事量 != undefined && row.口派报事量 != '') {
                                return row.口派报事量;
                            }
                        }
                    },
                    {
                        field: '口派报事占比', title: '口派报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.口派报事占比 != undefined && row.口派报事占比 != '') {
                                return row.口派报事占比;
                            }
                        }
                    },


                    {
                        field: '客户报事量', title: '客户报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.客户报事量 != undefined && row.客户报事量 != '') {
                                return row.客户报事量;
                            }
                        }
                    },
                    {
                        field: '客户报事占比', title: '客户报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (row.客户报事占比 != undefined && row.客户报事占比 != '') {
                                return row.客户报事占比;
                            }
                        }
                    },
                    {
                        field: '自查报事量', title: '自查报事量', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (row.自查报事量 != undefined && row.自查报事量 != '') {
                                return row.自查报事量;
                            }
                        }
                    },
                    {
                        field: '自查报事占比', title: '自查报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (row.自查报事占比 != undefined && row.自查报事占比 != '') {
                                return row.自查报事占比;
                            }
                        }
                    },

                    {
                        field: '户内报事量', title: '户内报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.户内报事量 != undefined && row.户内报事量 != '') {
                                return row.户内报事量;
                            }
                        }
                    },
                    {
                        field: '户内报事占比', title: '户内报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.户内报事占比 != undefined && row.户内报事占比 != '') {
                                return row.户内报事占比;
                            }
                        }
                    },

                    {
                        field: '公区报事量', title: '公区报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.公区报事量 != undefined && row.公区报事量 != '') {
                                return row.公区报事量;
                            }
                        }
                    },
                    {
                        field: '公区报事占比', title: '公区报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.公区报事占比 != undefined && row.公区报事占比 != '') {
                                return row.公区报事占比;
                            }
                        }
                    },


                    { field: '呼叫中心量', title: '呼叫中心量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '呼叫中心占比', title: '呼叫中心占比%', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '自助语音量', title: '自助语音量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '自助语音占比', title: '自助语音占比%', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '项目受理量', title: '项目受理量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '项目受理占比', title: '项目受理占比%', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '员工APP量', title: '员工APP量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '员工APP占比', title: '员工APP占比%', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '微信量', title: '微信量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '微信占比', title: '微信占比%', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '其他量', title: '其他量', fixed: true, width: 120, align: 'left', sortable: true },
                    { field: '其他占比', title: '其他占比%', fixed: true, width: 120, align: 'left', sortable: true }
                ]
            ];

            var ExcelCol = [

                { field: 'OrganName', width: 100, title: '区域', align: 'left' },
                { field: 'CommName', width: 100, title: '项目', align: 'left' },
                { field: '报事总量', width: 120, title: '报事总量', align: 'left' },

                {
                    field: '物业报事量', title: '物业报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.物业报事量 != undefined && row.物业报事量 != '') {
                            return row.物业报事量;
                        }
                    }
                },
                {
                    field: '物业报事占比', title: '物业报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.物业报事占比 != undefined && row.物业报事占比 != '') {
                            return row.物业报事占比;
                        }
                    }
                },
                {
                    field: '地产报事量', title: '地产报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.地产报事量 != undefined && row.地产报事量 != '') {
                            return row.地产报事量;
                        }
                    }
                },
                {
                    field: '地产报事占比', title: '地产报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.地产报事占比 != undefined && row.地产报事占比 != '') {
                            return row.地产报事占比;
                        }
                    }
                },

                {
                    field: '书面报事量', title: '书面报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.书面报事量 != undefined && row.书面报事量 != '') {
                            return row.书面报事量;
                        }
                    }
                },
                {
                    field: '书面报事占比', title: '书面报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.书面报事占比 != undefined && row.书面报事占比 != '') {
                            return row.书面报事占比;
                        }
                    }
                },
                {
                    field: '口派报事量', title: '口派报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.口派报事量 != undefined && row.口派报事量 != '') {
                            return row.口派报事量;
                        }
                    }
                },
                {
                    field: '口派报事占比', title: '口派报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.口派报事占比 != undefined && row.口派报事占比 != '') {
                            return row.口派报事占比;
                        }
                    }
                },


                {
                    field: '客户报事量', title: '客户报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.客户报事量 != undefined && row.客户报事量 != '') {
                            return row.客户报事量;
                        }
                    }
                },
                {
                    field: '客户报事占比', title: '客户报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.客户报事占比 != undefined && row.客户报事占比 != '') {
                            return row.客户报事占比;
                        }
                    }
                },
                {
                    field: '自查报事量', title: '自查报事量', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.自查报事量 != undefined && row.自查报事量 != '') {
                            return row.自查报事量;
                        }
                    }
                },
                {
                    field: '自查报事占比', title: '自查报事占比%', fixed: true, width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.自查报事占比 != undefined && row.自查报事占比 != '') {
                            return row.自查报事占比;
                        }
                    }
                },

                {
                    field: '户内报事量', title: '户内报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.户内报事量 != undefined && row.户内报事量 != '') {
                            return row.户内报事量;
                        }
                    }
                },
                {
                    field: '户内报事占比', title: '户内报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.户内报事占比 != undefined && row.户内报事占比 != '') {
                            return row.户内报事占比;
                        }
                    }
                },

                {
                    field: '公区报事量', title: '公区报事量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.公区报事量 != undefined && row.公区报事量 != '') {
                            return row.公区报事量;
                        }
                    }
                },
                {
                    field: '公区报事占比', title: '公区报事占比%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                        if (row.公区报事占比 != undefined && row.公区报事占比 != '') {
                            return row.公区报事占比;
                        }
                    }
                },


                { field: '呼叫中心量', title: '呼叫中心量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '呼叫中心占比', title: '呼叫中心占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '自助语音量', title: '自助语音量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '自助语音占比', title: '自助语音占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '项目受理量', title: '项目受理量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '项目受理占比', title: '项目受理占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '员工APP量', title: '员工APP量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '员工APP占比', title: '员工APP占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '微信量', title: '微信量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '微信占比', title: '微信占比%', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '其他量', title: '其他量', fixed: true, width: 120, align: 'left', sortable: true },
                { field: '其他占比', title: '其他占比%', fixed: true, width: 120, align: 'left', sortable: true }

            ];


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '' || rowData == undefined || rowData.rows.length == 0) {
                            HDialog.Info('请先生成报表');
                        }
                        else {

                            Export('公司报事分类统计表', $('#TableContainer'));
                        }
                    }
                }
            ];


            function SelTypeName() {
                //HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsClosed=1', '选择报事类别', true, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    if (arrRet != undefined) {
                //        $("#TypeCode").val(arrRet.code);
                //        var TypeID = $("#CorpTypeID").val(arrRet.id);
                //        $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                //        //alert(TypeID);
                //    }
                //    else {
                //        $("#TypeCode").val();
                //        $("#TypeID").val();
                //        $("#TypeName").searchbox('clear');
                //    }
                //});
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeCode").val(arrRet.code);
                    var TypeID = $("#CorpTypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                    //alert(TypeID);
                });
            }

            var ProgressInterval;
            function Search() {
                LoadData();
            }
            function SearchData() {

                if ($("#OrganCode").val() != "01") {
                    if ($("#CommIDs").val() == "") {
                        HDialog.Info("请选择需要统计的小区");
                        return;
                    }
                }
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }
            $('#hiIsSQLData').val('1');
            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CorpStaticNew4StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Static&Command=CorpStaticNew4LoadData&hiIsSQLData=' + $('#hiIsSQLData').val(),
                    method: "get",
                    nowrap: true,
                    pageSize: 150,
                    pageList: [150, 300, 500],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                });

            }


            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                //document.body.removeChild(f);
            }

            //初始化加载数据
            LoadData();
            //展示进度
            ShowProgress();
            //获取执行情况进度
            ProgressInterval = setInterval("TakeProgress()", 1000);
            TakeProgress();
            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CorpStaticNew4TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {

                            LoadData();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                LoadData();

                                CloseProgress();

                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
        </script>
    </form>
</body>
</html>
