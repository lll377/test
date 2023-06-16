<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentSatisfactionStatistics.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentSatisfactionStatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
        <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/export.js" type="text/javascript"></script>
    <style>
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 300px;
        }

        .SearchTable {
            margin: 0px auto;
            width: 600px;
            text-align: center;
            border-spacing: 10px;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #Companies {
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
    <form id="IncidentSeach">
         <input id="HidTypeCode" name="HidTypeCode" value=""  type="hidden" />
          <input id="TypeID" name="TypeID" value=""  type="hidden" />
        <input id="hidTypeName" name="hidTypeName" value=""  type="hidden" />
        <input id="CommIDs" name="CommIDs" value="" runat="server" type="hidden" />
              <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
         <div class="datagrid-mask"  style="height: 100%; width: 100%;"></div>
    <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px;border:1px solid #cccccc;z-index:999999;'>
        <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border:1px solid #cccccc;margin-top: 10px;'></div>
        <div id='DivMsg' style='width: 200px; text-align: center;margin-top:5px;'></div>
    </div>
      <input  id="TypeCode" name="TypeCode" type="hidden" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"">
            <table class="SearchTable" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName"
                            style="width: 144px;" searcher="SelTypeName" runat="server" />

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
                    <td class="TdTitle">受理时间从
                    </td>
                       <td class="TdContentSearch">
                        <input type="text" id="IncidentBeginDate" name="IncidentBeginDate"   class="Wdate" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="IncidentEndDate" name="IncidentEndDate"  runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr style="display:none">
                    <td class="TdTitle">完结时间从
                    </td>
                 

                    <td class="TdContentSearch">
                        <input type="text" id="MainStartEndDate" name="MainStartEndDate" style="width: 160px;"  class="Wdate" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="MainEndEndDate" name="MainEndEndDate" style="width: 160px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="ReserveBeginDate" name="ReserveBeginDate"  runat="server"
                             onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="ReserveEndDate" name="ReserveEndDate"  runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer" class="easyui-datagrid"> 
   </div>
    </form>


    <script type="text/javascript" >

        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitFunction();

        var frozenColumns = [[
            {
                field: 'Region', width: 100, title: '区域', align: 'left', formatter: function (value, row, index) {
                    if (row.Region != undefined && row.Region != '') {
                        return row.Region;
                    }
                }
            },
            {
                field: 'TypeName', width: 100, title: '项目', align: 'left', formatter: function (value, row, index) {
                    if (row.TypeName != undefined && row.TypeName != '') {
                        return row.TypeName;
                    }
                }
            }
        ]]

        var column;
        column = [[
            { colspan: 1, title: '报事量（书面）' },
            { colspan: 7, title: '回访（书面）' },
            { colspan: 12, title: '满意度（书面）' }
        ],
        [
            {
                field: '书面报事数量', title: '书面报事数量', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },

            {
                field: '回访量', title: '回访量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '回访率', title: '回访率%', fixed: true, align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                    if (row.回访率 != undefined && row.回访率 != '') {
                        return row.回访率;
                    }
                }
            },
            {
                field: '成功回访量', title: '成功回访量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '成功回访率', title: '成功回访率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.成功回访率 != undefined && row.成功回访率 != '') {
                        return row.成功回访率;
                    }
                }
            },
            {
                field: '有效评价量', title: '有效评价量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
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
                field: '退回量', title: '退回量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '总满意量', title: '总满意量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '总满意度', title: '总满意度%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.总满意度 != undefined && row.总满意度 != '') {
                        return row.总满意度;
                    }
                }
            },
            {
                field: '非常满意量', title: '非常满意量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '非常满意率', title: '非常满意率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.非常满意率 != undefined && row.非常满意率 != '') {
                        return row.非常满意率;
                    }
                }
            },
            {
                field: '满意量', title: '满意量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '满意率', title: '满意率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.满意率 != undefined && row.满意率 != '') {
                        return row.满意率;
                    }
                }
            },
            {
                field: '一般量', title: '一般量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '一般率', title: '一般率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.一般率 != undefined && row.一般率 != '') {
                        return row.一般率;
                    }
                }
            },
            {
                field: '不满意量', title: '不满意量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '不满意率', title: '不满意率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.不满意率 != undefined && row.不满意率 != '') {
                        return row.不满意率;
                    }
                }
            },
            {
                field: '非常不满意量', title: '非常不满意量', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    return convertToNumber(value);
                }
            },
            {
                field: '非常不满意率', title: '非常不满意率%', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                    if (row.非常不满意率 != undefined && row.非常不满意率 != '') {
                        return row.非常不满意率;
                    }
                }
            }
        ]];


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
                    window.location.href = "../IncidentNewJH/IncidentSatisfactionStatisticsCreExcel.aspx";
                }
            }
        ];

        $('#SearchDlg').parent().appendTo($("form:first"));


        function convertToNumber(data) {
            var value = 0;
            if (data != null && data != undefined && data != "") {
                value = parseInt(data);
            }
            return value;
        }

        function convertToPercent(data) {
            var value = 0;
            if (data != null && data != undefined && data != "") {
                if (data.indexOf("%") > -1) {
                    data = data.replace("%", "");
                    return parseInt(data) + "%";
                }
                else {
                    value = data * 100;
                }
            }
            return parseInt(value) + "%";
        }


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
            //HDialog.Open('650', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsClosed=1', '选择报事类别', false, function callback(_Data) {
            //    var arrRet = JSON.parse(_Data);
            //    $("#TypeCode").val(arrRet.code);
            //    $("#TypeID").val(arrRet.id);
            //    $("#TypeName").searchbox("setValue", arrRet.text);
            //});

            var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
            HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#TypeCode").val(arrRet.code);
                $("#TypeID").val(arrRet.id);
                $("#TypeName").searchbox("setValue", arrRet.text);
            });
        }


        var ProgressInterval;
        function Search() {
            if ($("#ChargeStartDate").val() == "" || $("#ChargeStartDate").val() == "") {
                HDialog.Info("日期不能为空");
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

        function LoadData() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: 200,
                pageList: [200],
                columns: column,
                frozenColumns: frozenColumns,
                //fitColumns: true,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("IncidentAcceptNew_Static", "IncidentSatisfactionLoadData", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                    $("#SearchDlg").dialog("close");
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        function StartTask() {
            //启动一个任务
            $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'IncidentSatisfactionStartTask', $('#IncidentSeach').serialize(),
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


        $('#hiIsSQLData').val('1');
        //初始化加载数据
        LoadData();
        TakeProgress();

        //获取进度
        function TakeProgress() {
            $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'IncidentSatisfactionTakeProgress', $('#IncidentSeach').serialize(),
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

</body>
</html>
