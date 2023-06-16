<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentDayToNewStatisticsToSubdivide.aspx.cs" Inherits="M_Main.IncidentNew.IncidentDayToNewStatisticsToSubdivide" %>

<!DOCTYPE html>

<html>
<head>
    <title>报事按日汇总统计</title>
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
            height: 200px;
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

        <input id="hiIsSQLData" name="hiIsSQLData" value="-1" type="hidden" />
        <input id="TypeCode" name="TypeCode" value="" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server">
        <input id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server">
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
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();" style="width: 90%;"></textarea>
                    </td>
                </tr>
                <tr>


                    <td class="TdTitle">统计年月
                    </td>
                    <td class="TdContentSearch">
                        <select id="CreYear" style="width: 30%; height: 22px;" name="CreYear" runat="server" class="easyui-combobox">
                            <option selected="selected"></option>
                        </select>年
                        <select id="CreMonth" style="width: 30%; height: 22px;" name="CreMonth" runat="server" class="easyui-combobox">
                            <option selected="selected"></option>
                        </select>月
                    </td>



                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" searcher="SelTypeName"
                            style="width: 144px;" />
                    </td>
                </tr>
                <tr>
                    <td style="display: none;" class="TdTitle">报事类型</td>
                    <td style="display: none;" class="TdContent">
                        <select id="SelClass" name="SelClass" runat="server" style="width: 140px;">
                            <option value=""></option>
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
                    <td class="TdTitle">报事区域</td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 142px;" runat="server">
                            <option value="全部">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否投诉</td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 142px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="4" align="center">
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

            function SelTypeName() {
                //HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsTJ=true&IsClosed=1', '选择报事类别', true, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    if (arrRet != undefined) {
                //        $("#TypeCode").val(arrRet.code);
                //        $("#TypeID").val(arrRet.id);
                //        $("#TypeName").searchbox("setText", arrRet.FullTypeName);
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
                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                });
            }


            $("#CreYear").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            $("#CreMonth").combobox({
                onSelect: function () {
                    ShowPeriodFees();
                }
            });
            function ShowPeriodFees() {

                var CreYear = $("#CreYear").combobox('getValue');
                var CreMonth = $("#CreMonth").combobox('getValue');
                $("#CreYear").val(CreYear);
                $("#CreMonth").val(CreMonth);

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
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {

                            Export('按日汇总统计', $('#TableContainer'));
                        }
                    }
                }
            ];
            var frozenColumns = [[

                {
                    field: 'OrganName', width: 100, title: '区域', align: 'center'
                },
                {
                    field: 'CommName', width: 100, title: '项目', align: 'center'
                }

            ]]

            var column = [
                [
                    { colspan: 3, title: '1日' },
                    { colspan: 3, title: '2日' },
                    { colspan: 3, title: '3日' },
                    { colspan: 3, title: '4日' },
                    { colspan: 3, title: '5日' },
                    { colspan: 3, title: '6日' },
                    { colspan: 3, title: '7日' },
                    { colspan: 3, title: '8日' },
                    { colspan: 3, title: '9日' },
                    { colspan: 3, title: '10日' },
                    { colspan: 3, title: '11日' },
                    { colspan: 3, title: '12日' },
                    { colspan: 3, title: '13日' },
                    { colspan: 3, title: '14日' },
                    { colspan: 3, title: '15日' },
                    { colspan: 3, title: '16日' },
                    { colspan: 3, title: '17日' },
                    { colspan: 3, title: '18日' },
                    { colspan: 3, title: '19日' },
                    { colspan: 3, title: '20日' },
                    { colspan: 3, title: '21日' },
                    { colspan: 3, title: '22日' },
                    { colspan: 3, title: '23日' },
                    { colspan: 3, title: '24日' },
                    { colspan: 3, title: '25日' },
                    { colspan: 3, title: '26日' },
                    { colspan: 3, title: '27日' },
                    { colspan: 3, title: '28日' },
                    { colspan: 3, title: '29日' },
                    { colspan: 3, title: '30日' },
                    { colspan: 3, title: '31日' },
                    { colspan: 3, title: '月度累计' }
                ],
                [

                    { field: '一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '四kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '五sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '六kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '九kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十四', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十五sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十六kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十九kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二四kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二五', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二六', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二九', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: 'MonthCount', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: 'MonthCountsm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: 'MonthCountkp', title: '口派', width: 100, align: 'left', sortable: true }
                ]

            ]




            var Headcolumn = [
                [
                    {
                        field: 'OrganName', rowspan: 2, width: 100, fixed: true, title: '区域', align: 'center'
                    },
                    {
                        field: 'CommName', rowspan: 2, width: 100, fixed: true, title: '项目', align: 'center'
                    },


                    { colspan: 3, title: '1日' },
                    { colspan: 3, title: '2日' },
                    { colspan: 3, title: '3日' },
                    { colspan: 3, title: '4日' },
                    { colspan: 3, title: '5日' },
                    { colspan: 3, title: '6日' },
                    { colspan: 3, title: '7日' },
                    { colspan: 3, title: '8日' },
                    { colspan: 3, title: '9日' },
                    { colspan: 3, title: '10日' },
                    { colspan: 3, title: '11日' },
                    { colspan: 3, title: '12日' },
                    { colspan: 3, title: '13日' },
                    { colspan: 3, title: '14日' },
                    { colspan: 3, title: '15日' },
                    { colspan: 3, title: '16日' },
                    { colspan: 3, title: '17日' },
                    { colspan: 3, title: '18日' },
                    { colspan: 3, title: '19日' },
                    { colspan: 3, title: '20日' },
                    { colspan: 3, title: '21日' },
                    { colspan: 3, title: '22日' },
                    { colspan: 3, title: '23日' },
                    { colspan: 3, title: '24日' },
                    { colspan: 3, title: '25日' },
                    { colspan: 3, title: '26日' },
                    { colspan: 3, title: '27日' },
                    { colspan: 3, title: '28日' },
                    { colspan: 3, title: '29日' },
                    { colspan: 3, title: '30日' },
                    { colspan: 3, title: '31日' },
                    { colspan: 3, title: '月度累计' }

                ], [
                    { field: '一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '四kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '五sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '六kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '九kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十四', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十五sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十六kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '十九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '十九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '十九kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二二zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二二sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二二kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二三zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二三sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二三kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二四zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二四sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二四kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二五zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二五', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二五kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二六zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二六sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二六', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二七zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二七sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二七kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二八zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二八sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二八kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '二九zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '二九sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '二九', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三十zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三十sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三十kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: '三一zj', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: '三一sm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: '三一kp', title: '口派', width: 100, align: 'left', sortable: true },

                    { field: 'MonthCount', title: '总计', width: 100, align: 'left', sortable: true },
                    { field: 'MonthCountsm', title: '书面', width: 100, align: 'left', sortable: true },
                    { field: 'MonthCountkp', title: '口派', width: 100, align: 'left', sortable: true }
                ]
            ];

            var ExcelCol = [
                { field: 'OrganName', width: 100, title: '区域', align: 'center' },
                { field: 'CommName', width: 100, title: '项目', align: 'center' },
                { field: '一zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '一sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '一kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '三zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '三sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '三kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '四zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '四sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '四kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '五zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '五sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '五kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '六zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '六sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '六kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '七zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '七sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '七kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '八zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '八sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '八kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '九zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '九sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '九kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十一zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十一sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十一kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十二zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十二sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十二kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十三zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十三sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十三kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十四zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十四sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十四', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十五zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十五sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十五kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十六zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十六sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十六kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十七zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十七sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十七kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十八zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十八sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十八kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '十九zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '十九sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '十九kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二十zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二十sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二十kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二一zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二一sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二一kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二二zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二二sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二二kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二三zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二三sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二三kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二四zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二四sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二四kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二五zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二五', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二五kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二六zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二六sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二六', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二七zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二七sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二七kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二八zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二八sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二八kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '二九zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '二九sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '二九', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '三十zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '三十sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '三十kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: '三一zj', title: '总计', width: 100, align: 'left', sortable: true },
                { field: '三一sm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: '三一kp', title: '口派', width: 100, align: 'left', sortable: true },

                { field: 'MonthCount', title: '总计', width: 100, align: 'left', sortable: true },
                { field: 'MonthCountsm', title: '书面', width: 100, align: 'left', sortable: true },
                { field: 'MonthCountkp', title: '口派', width: 100, align: 'left', sortable: true }
            ];
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


            function SearchData() {

                if ($("#CreYear").val() == "" || $("#CreYear").val() == "") {
                    HDialog.Info("统计年度不能为空");
                    return;
                }
                if ($("#CreMonth").val() == "" || $("#CreMonth").val() == "") {
                    HDialog.Info("统计月份不能为空");
                    return;
                }

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
                $.tool.DataPostNoLoading('CSCustInfo', 'IncidentDayToNewStatisticsStartTaskToSubdivide', $('#frmForm').serialize(),
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
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    frozenColumns: frozenColumns,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CSCustInfo", "IncidentDayToNewStatisticsLoadDataToSubdivide", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
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
                $.tool.DataPostNoLoading('CSCustInfo', 'IncidentDayToNewStatisticsTakeProgressToSubdivide', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        //alert(Obj);
                        if (_Data == '[]') {

                            LoadData();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                CloseProgress();
                                $('#hiIsSQLData').val('1');
                                LoadData();



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
