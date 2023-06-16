<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentNewCorpStatistics.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentNewCorpStatistics" %>

<!DOCTYPE html>

<html>
<head>
    <title>公司报事汇总统计</title>
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
            height: 250px;
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
         <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="hiIsSQLData" name="hiIsSQLData" value="-1" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
            size="1" name="hiCommNames" runat="server"><input id="Hidden1" style="width: 8px; height: 22px" type="hidden"
                size="1" name="CommIDs" runat="server">
        <input id="HChargeMode" style="width: 8px; height: 22px" type="hidden"
            size="1" name="HChargeMode" runat="server">
        <input type="hidden" id="TypeCode" name="TypeCode" />
        <input type="hidden" id="TypeID" name="TypeID" />
        <input type="hidden" id="CorpTypeID" name="CorpTypeID" />
        <input type="hidden" id="HiIFCode" name="HiIFCode" value=" " />
        <input type="hidden" id="HiIFName" name="HiIFName" value=" " />
        <input type="hidden" id="HiObject" name="HiObject" value=" " />

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
                <tr>
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
                </tr>
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
                <tr >
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
                <tr style="display:none">
                    <td class="TdTitle">处理时间从
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
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>

    </form>
</body>
</html>

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
            field: 'OrganName', width: 100, title: '区域', align: 'left', formatter: function (value, row, index) {
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
        { field: 'text', width: 150, title: '报事类别', align: 'left', hidden: true }
    ]]

    var column = [[
        { colspan: 1, title: '报事受理' },
        { colspan: 6, title: '报事分派' },
        { colspan: 4, title: '报事处理' },
        { colspan: 4, title: '报事关闭' },
        { colspan: 4, title: '报事回访' },
        { colspan: 3, title: '客户评价' },
        { colspan: 9, title: '客户满意度' }
    ],
    [
        {
            field: '报事发生量', title: '报事发生量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.报事发生量 != undefined && row.报事发生量 != '') {
                    return row.报事发生量;
                }
            }
        },

        {
            field: '分派量', title: '分派量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.分派量 != undefined && row.分派量 != '') {
                    return row.分派量;
                }
            }
        },
        {
            field: '分派率', title: '分派率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.分派率 != undefined && row.分派率 != '') {
                    return row.分派率;
                }
            }
        },
        {
            field: '分派及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.分派及时率 != undefined && row.分派及时率 != '') {
                    return row.分派及时率;
                }
            }
        },
        {
            field: '分派逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.分派逾期率 != undefined && row.分派逾期率 != '') {
                    return row.分派逾期率;
                }
            }
        }
,
        {
            field: '抢单量', title: '抢单量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.抢单量 != undefined && row.抢单量 != '') {
                    return row.抢单量;
                }
            }
        }
,
        {
            field: '抢单率', title: '抢单率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.抢单率 != undefined && row.抢单率 != '') {
                    return row.抢单率;
                }
            }
        },


        {
            field: '完成量', title: '完成量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.完成量 != undefined && row.完成量 != '') {
                    return row.完成量;
                }
            }
        },
        {
            field: '完成率', title: '完成率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.完成率 != undefined && row.完成率 != '') {
                    return row.完成率;
                }
            }
        },
        {
            field: '完成及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.完成及时率 != undefined && row.完成及时率 != '') {
                    return row.完成及时率;
                }
            }
        },
        {
            field: '完成逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.完成逾期率 != undefined && row.完成逾期率 != '') {
                    return row.完成逾期率;
                }
            }
        },


       
        {
            field: '关闭量', title: '关闭量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.关闭量 != undefined && row.关闭量 != '') {
                    return row.关闭量;
                }
            }
        },
        {
            field: '关闭率', title: '关闭率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.关闭率 != undefined && row.关闭率 != '') {
                    return row.关闭率;
                }
            }
        },
        {
            field: '正常关闭率', title: '正常关闭率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.正常关闭率 != undefined && row.正常关闭率 != '') {
                    return row.正常关闭率;
                }
            }
        },
        {
            field: '非正常关闭率', title: '非正常关闭率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.非正常关闭率 != undefined && row.非正常关闭率 != '') {
                    return row.非正常关闭率;
                }
            }
        },


        {
            field: '回访量', title: '回访量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.回访量 != undefined && row.回访量 != '') {
                    return row.回访量;
                }
            }
        },
        {
            field: '回访率', title: '回访率%(按发生量)', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                if (row.回访率 != undefined && row.回访率 != '') {
                    return row.回访率;
                }
            }
        },
        {
            field: '不成功回访率', title: '不成功回访率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.不成功回访率 != undefined && row.不成功回访率 != '') {
                    return row.不成功回访率;
                }
            }
        },
        {
            field: '成功回访率', title: '成功回访率%(含无效回访)', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.成功回访率 != undefined && row.成功回访率 != '') {
                    return row.成功回访率;
                }
            }
        },

        {
            field: '成功回访量', title: '成功回访量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.成功回访量 != undefined && row.成功回访量 != '') {
                    return row.成功回访量;
                }
            }
        },
        {
            field: '有效评价率', title: '有效评价率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.有效评价率 != undefined && row.有效评价率 != '') {
                    return row.有效评价率;
                }
            }
        },
        {
            field: '无效评价率', title: '无效评价率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.无效评价率 != undefined && row.无效评价率 != '') {
                    return row.无效评价率;
                }
            }
        },
         {
             field: '有效评价量', title: '有效评价量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                 if (row.有效评价量 != undefined && row.有效评价量 != '') {
                     return row.有效评价量;
                 }
             }
         },

        {
            field: '非常满意', title: '非常满意', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.非常满意 != undefined && row.非常满意 != '') {
                    return row.非常满意;
                }
            }
        },
        {
            field: '满意', title: '满意%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.满意 != undefined && row.满意 != '') {
                    return row.满意;
                }
            }
        },
        {
            field: '一般', title: '一般%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.一般 != undefined && row.一般 != '') {
                    return row.一般;
                }
            }
        },
        {
            field: '不满意', title: '不满意%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.不满意 != undefined && row.不满意 != '') {
                    return row.不满意;
                }
            }
        },
        {
            field: '非常不满意', title: '非常不满意%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                if (row.非常不满意 != undefined && row.非常不满意 != '') {
                    return row.非常不满意;
                }
            }
        },
        {
            field: '非常满意满意', title: '非常满意+满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                if (row.非常满意满意 != undefined && row.非常满意满意 != '') {
                    return row.非常满意满意;
                }
            }
        },
        {
            field: '一般不满意非常不满意', title: '一般+不满意+非常不满意%', fixed: true, align: 'left', sortable: true, width: 200, formatter: function (value, row, index) {
                if (row.一般不满意非常不满意 != undefined && row.一般不满意非常不满意 != '') {
                    return row.一般不满意非常不满意;
                //    return 100 - row.attributes.非常满意 - row.attributes.满意 - row.attributes.一般 -
                //        row.attributes.不满意 - row.attributes.非常不满意;
                }
            }
        }

    ]
    ];

    var Headcolumn = [
        [
            {
                field: 'OrganName', rowspan: 2, width: 100, fixed: true, title: '区域', align: 'left'
            },
            {
                field: 'CommName', rowspan: 2, width: 100, fixed: true, title: '项目', align: 'left'
            },
            { colspan: 1, title: '报事受理' },
            { colspan: 6, title: '报事分派' },
            { colspan: 4, title: '报事处理' },
            { colspan: 4, title: '报事关闭' },
            { colspan: 4, title: '报事回访' },
            { colspan: 3, title: '客户评价' },
            { colspan: 8, title: '客户满意度' }
        ], [

            {
                field: '报事发生量', title: '报事发生量', fixed: true, align: 'left', sortable: true, width: 120
            },
            {
                field: '分派量', title: '分派量', fixed: true, align: 'left', sortable: true, width: 120
            },
            {
                field: '分派率', title: '分派率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '分派及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '分派逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '抢单量', title: '抢单量', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '抢单率', title: '抢单率%', fixed: true, align: 'left', sortable: true, width: 120,
            },

            {
                field: '完成量', title: '完成量', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '完成率', title: '完成率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '完成及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '完成逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120,
            },
          
            {
                field: '关闭量', title: '关闭量', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '关闭率', title: '关闭率%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '正常关闭率', title: '正常关闭率%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '非正常关闭率', title: '非正常关闭率%', fixed: true, align: 'left', sortable: true, width: 120,
            },


            {
                field: '回访量', title: '回访量', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '回访率', title: '回访率%(按发生量)', fixed: true, align: 'left', sortable: true, width: 100,
            },
            
            {
                field: '不成功回访率', title: '不成功回访率%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '成功回访率', title: '成功回访率%(含无效回访)', fixed: true, align: 'left', sortable: true, width: 120,
            },
            {
                field: '成功回访量', title: '成功回访量', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '有效评价率', title: '有效评价率%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '无效评价率', title: '无效评价率%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '有效评价量', title: '有效评价量', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '非常满意', title: '非常满意%', fixed: true, align: 'left', sortable: true, width: 140
            },
            {
                field: '满意', title: '满意%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '一般', title: '一般%', fixed: true, align: 'left', sortable: true, width: 100,
            },
            {
                field: '不满意', title: '不满意%', fixed: true, align: 'left', sortable: true,width: 100,
            },
            {
                field: '非常不满意', title: '非常不满意%', fixed: true, align: 'left', sortable: true, width: 140,
            },
            {
                field: '非常满意满意', title: '非常满意+满意%', fixed: true, align: 'left', sortable: true, width: 140,
            },
            {
                field: '一般不满意非常不满意', title: '一般+不满意+非常不满意%', fixed: true, align: 'left', sortable: true, width: 140,
            }
        ]
    ];

    var ExcelCol = [
        { field: 'OrganName', width: 100, title: '区域', align: 'left' },
        { field: 'CommName', width: 100, title: '项目', align: 'left' },
        { field: '报事发生量', title: '报事发生量', fixed: true, align: 'left', sortable: true, width: 120 },
        { field: '分派量', title: '分派量', fixed: true, align: 'left', sortable: true, width: 120 },
        { field: '分派率', title: '分派率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '分派及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '分派逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120, },
 	{ field: '抢单量', title: '抢单量', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '抢单率', title: '抢单率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '完成量', title: '完成量', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '完成率', title: '完成率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '完成及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '完成逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '关闭量', title: '关闭量', fixed: true, align: 'left', sortable: true, width: 100, },
        { field: '关闭率', title: '关闭率%', fixed: true, align: 'left', sortable: true, width: 100, },
        { field: '正常关闭率', title: '正常关闭率%', fixed: true, align: 'left', sortable: true, width: 100, },
        { field: '非正常关闭率', title: '非正常关闭率%', fixed: true, align: 'left', sortable: true, width: 120, },
        { field: '回访量', title: '回访量', fixed: true, align: 'left', sortable: true, width: 100, },
        { field: '回访率', title: '回访率%(按发生量)', fixed: true, align: 'left', sortable: true, width: 120, },
        {
            field: '不成功回访率', title: '不成功回访率%', fixed: true, align: 'left', sortable: true, width: 120,
        },
        {
            field: '成功回访率', title: '成功回访率%(含无效回访)', fixed: true, align: 'left', sortable: true, width: 120,
        },
        

        {
            field: '成功回访量', title: '成功回访量', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '有效评价率', title: '有效评价率%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '无效评价率', title: '无效评价率%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '有效评价量', title: '有效评价量', fixed: true, align: 'left', sortable: true, width: 100,
        },
        {
            field: '非常满意', title: '非常满意%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '满意', title: '满意%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '一般', title: '一般%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '不满意', title: '不满意%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '非常不满意', title: '非常不满意%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '非常满意满意', title: '非常满意+满意%', fixed: true, align: 'left', sortable: true, width: 140,
        },
        {
            field: '一般不满意非常不满意', title: '不满意回访率%(一般+不满意+非常不满意)', fixed: true, align: 'left', sortable: true, width: 140,
        }
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

                    Export('公司报事统计表', $('#TableContainer'));
                }
            }
        }
    ];


    function SelTypeName() {
        HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', true, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            if (arrRet != undefined) {
                $("#TypeCode").val(arrRet.code);
                $("#TypeID").val(arrRet.id);
                $("#CorpTypeID").val(arrRet.id);
                $("#TypeName").searchbox("setText", arrRet.FullTypeName);
            }
            else {
                $("#TypeCode").val();
                $("#TypeID").val();
                $("#CorpTypeID").val();
                $("#TypeName").searchbox('clear');
            }
        });
    }

    var ProgressInterval;

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
        $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CorpIncidentStaticStartTask', $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                
                LoadData();
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    //加载数据
    function LoadData() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Static&Command=CorpIncidentStaticLoadData&hiIsSQLData=' + $('#hiIsSQLData').val(),
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
        document.body.removeChild(f);
    }

    //初始化加载数据
    LoadData();

    TakeProgress();
    //展示进度
    ShowProgress();
    //获取执行情况进度
    ProgressInterval = setInterval("TakeProgress()", 1000);

    //获取进度
    function TakeProgress() {
        $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CorpIncidentStaticTakeProgress', $('#frmForm').serialize(),
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
