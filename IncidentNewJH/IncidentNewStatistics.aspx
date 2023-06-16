<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentNewStatistics.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentNewStatistics" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
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
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;" scroll="no">
    <form id="frmForm" runat="server">

            <div class="datagrid-mask"  style="height: 100%; width: 100%;"></div>
    <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px;border:1px solid #cccccc;z-index:999999;'>
        <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border:1px solid #cccccc;margin-top: 10px;'></div>
        <div id='DivMsg' style='width: 200px; text-align: center;margin-top:5px;'></div>
    </div>


        <div style="width: 100%; background-color: #cccccc;" class="easyui-datagrid" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 300px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="SelClass" name="SelClass" runat="server" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContentSearch">
                        <select id="IncidentSource" style="width: 144px;" name="IncidentSource" runat="server">
                                <option value="" selected="selected">全部</option>
                                    <option value="客户报事">客户报事</option>
                                    <option value="自查报事">自查报事</option>
                                </select>
                    </td>
                </tr>
                <tr>
                      <td class="TdTitle">报事位置
                        </td>
                         <td class="TdContent"> <select id="IncidentPlace" name="IncidentPlace" style="width: 144px;" runat="server">
                            <option value="">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                        </td>
                             <td class="TdTitle">报事责任
                        </td>
                         <td class="TdContent">   <select id="Duty" name="Duty" runat="server"  style="width: 144px;">
                                <option value="" selected="selected">全部</option>
                                    <option value="物业类">物业类</option>
                                    <option value="地产类">地产类</option>
                                </select>
                        </td>
                    </tr>
                  <tr>
                      <td class="TdTitle">报事类别
                        </td>
                         <td class="TdContentSearch">  <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName"
                            style="width: 144px;" searcher="SelTypeName" />
                        </td>
                             <td class="TdTitle">是否投诉
                        </td>
                         <td class="TdContent"><select id="IsTousu" name="IsTousu" style="width: 144px;" runat="server">
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
                        <input type="text" id="BeginIncidentDate" name="BeginIncidentDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndIncidentDate" name="EndIncidentDate" style="width: 140px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginReserveDate" name="BeginReserveDate" style="width: 140px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndReserveDate" name="EndReserveDate" style="width: 140px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                  <tr style="display:none">
                    <td class="TdTitle">处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginMainEndDate" name="BeginMainEndDate" style="width: 140px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndMainEndDate" name="EndMainEndDate" style="width: 140px;" runat="server" class="Wdate"
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
        <input type="hidden" id="hiIsSQLData" name="hiIsSQLData" value="-1" />
        <input type="hidden" id="TypeCode" name="TypeCode" />
        <input type="hidden" id="TypeID" name="TypeID" />
            <input type="hidden" id="CorpTypeID" name="CorpTypeID" />
        <input type="hidden" id="HiIFCode" name="HiIFCode" value=" " />
        <input type="hidden" id="HiIFName" name="HiIFName" value=" " />
        <input type="hidden" id="HiObject" name="HiObject" value=" " />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
        

            function Search() {
                LoadData();
            }

            function SelTypeName() {
                HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeAllDlg.aspx?IsCheck=1&IsAll=True', '选择报事类别', true, function callback(_Data) {
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

            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-sum',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ////window.open("../Incident/IncidentStatisticsCreExcel.aspx?random=" + Math.random() + GetParam());
                        window.location.href = "../IncidentNewJH/IncidentNewStatisticsCreExcel.aspx";
                        //var rowData = $('#TableContainer').datagrid('getData');
                        //if (rowData == '') {
                        //    HDialog.Info('请先生成报表');
                        //}
                        //else {

                        //    Export('项目报事统计表', $('#TableContainer'));
                        //}
                    }
                }
            ];

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();



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


            var frozenColumns = [[
                  {
                      field: 'text', width: 250, title: '报事类别', align: 'left', formatter: function (value, row, index) {
                          //if (row.attributes.January != undefined && row.attributes.January != '') {
                          //    return row.attributes.January;
                          //}
                          return row.text.replace(/　/g, '');

                      }
                  }
            ]]

            var column = [[
                { colspan: 1, title: '报事受理' },
                { colspan: 8, title: '报事分派' }, 
                { colspan: 5, title: '报事处理' },
                { colspan: 4, title: '报事关闭' },
                { colspan: 4, title: '报事回访' },
                { colspan: 3, title: '客户评价' },
                { colspan: 8, title: '客户满意度' }
            ],
            [
                {
                    field: '报事发生量', title: '报事发生量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.报事发生量 != undefined && row.attributes.报事发生量 != '') {
                            return row.attributes.报事发生量;
                        }
                    }
                },
                {
                    field: '分派量', title: '分派量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.分派量 != undefined && row.attributes.分派量 != '') {
                            return row.attributes.分派量;
                        }
                    }
                },
                {
                    field: '分派率', title: '分派率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.分派率 != undefined && row.attributes.分派率 != '') {
                            return row.attributes.分派率;
                        }
                    }
                },

                
                 {
                     field: '抢单量', title: '抢单量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                         if (row.attributes.抢单量 != undefined && row.attributes.抢单量 != '') {
                             return row.attributes.抢单量;
                         }
                     }
                 },
                  {
                      field: '抢单率', title: '抢单率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                          if (row.attributes.抢单率 != undefined && row.attributes.抢单率 != '') {
                              return row.attributes.抢单率;
                          }
                      }
                  },
                   {
                       field: '派单量', title: '派单量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                           if (row.attributes.派单量 != undefined && row.attributes.派单量 != '') {
                               return row.attributes.派单量;
                           }
                       }
                   },

                       {
                           field: '派单率', title: '派单率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                               if (row.attributes.派单率 != undefined && row.attributes.派单率 != '') {
                                   return row.attributes.派单率;
                               }
                           }
                       }, 

                {
                    field: '分派及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.分派及时率 != undefined && row.attributes.分派及时率 != '') {
                            return row.attributes.分派及时率;
                        }
                    }
                },
                {
                    field: '分派逾期率', title: '逾期率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.分派逾期率 != undefined && row.attributes.分派逾期率 != '') {
                            return row.attributes.分派逾期率;
                        }
                    }
                },

               


                {
                    field: '完成量', title: '完成量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.完成量 != undefined && row.attributes.完成量 != '') {
                            return row.attributes.完成量;
                        }
                    }
                },
                {
                    field: '完成率', title: '完成率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.完成率 != undefined && row.attributes.完成率 != '') {
                            return row.attributes.完成率;
                        }
                    }
                },
                {
                    field: '完成及时率', title: '及时率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.完成及时率 != undefined && row.attributes.完成及时率 != '') {
                            return row.attributes.完成及时率;
                        }
                    }
                },
                {
                    field: '完成逾期率', title: '完成逾期率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.完成逾期率 != undefined && row.attributes.完成逾期率 != '') {
                            return row.attributes.完成逾期率;
                        }
                    }
                },
                {
                    field: '未完成逾期率', title: '未完成逾期率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.未完成逾期率 != undefined && row.attributes.未完成逾期率 != '') {
                            return row.attributes.未完成逾期率;
                        }
                    }
                },


                    {
                        field: '关闭量', title: '关闭量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                            if (row.attributes.关闭量 != undefined && row.attributes.关闭量 != '') {
                                return row.attributes.关闭量;
                            }
                        }
                    },
                {
                    field: '关闭率', title: '关闭率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.关闭率 != undefined && row.attributes.关闭率 != '') {
                            return row.attributes.关闭率;
                        }
                    }
                },
                {
                    field: '正常关闭率', title: '正常关闭率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.正常关闭率 != undefined && row.attributes.正常关闭率 != '') {
                            return row.attributes.正常关闭率;
                        }
                    }
                },
                {
                    field: '非正常关闭率', title: '非正常关闭率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.非正常关闭率 != undefined && row.attributes.非正常关闭率 != '') {
                            return row.attributes.非正常关闭率;
                        }
                    }
                },



                {
                    field: '回访量', title: '回访量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.回访量 != undefined && row.attributes.回访量 != '') {
                            return row.attributes.回访量;
                        }
                    }
                },
                {
                    field: '回访率', title: '回访率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.回访率 != undefined && row.attributes.回访率 != '') {
                            return row.attributes.回访率;
                        }
                    }
                },
                {
                    field: '不成功回访率', title: '不成功回访率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.不成功回访率 != undefined && row.attributes.不成功回访率 != '') {
                            return row.attributes.不成功回访率;
                            //return row.attributes.回访率 - row.attributes.成功回访率;
                        }
                    }
                },
                {
                    field: '成功回访率', title: '成功回访率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.成功回访率 != undefined && row.attributes.成功回访率 != '') {
                            return row.attributes.成功回访率;
                        }
                    }
                },






            {
                field: '成功回访量', title: '成功回访量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                    if (row.attributes.成功回访量 != undefined && row.attributes.成功回访量 != '') {
                        return row.attributes.成功回访量;
                    }
                }
            },
            {
                field: '有效评价率', title: '有效评价率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                    if (row.attributes.有效评价率 != undefined && row.attributes.有效评价率 != '') {
                        return row.attributes.有效评价率;
                    }
                }
            },
            {
                field: '无效评价率', title: '无效评价率%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                    if (row.attributes.无效评价率 != undefined && row.attributes.无效评价率 != '') {
                        return row.attributes.无效评价率;
                }
            }
            },



            {
                field: '有效评价量', title: '有效评价量', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                    if (row.attributes.有效评价量 != undefined && row.attributes.有效评价量 != '') {
                        return row.attributes.有效评价量;
                    }
                }
            }
            

            , {
                field: '非常满意', title: '非常满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                    if (row.attributes.非常满意 != undefined && row.attributes.非常满意 != '') {
                        return row.attributes.非常满意;
                    }
                }
            },
                {
                    field: '满意', title: '满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.满意 != undefined && row.attributes.满意 != '') {
                            return row.attributes.满意;
                        }
                    }
                },
                {
                    field: '一般', title: '一般%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.一般 != undefined && row.attributes.一般 != '') {
                            return row.attributes.一般;
                        }
                    }
                },
                {
                    field: '不满意', title: '不满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.不满意 != undefined && row.attributes.不满意 != '') {
                            return row.attributes.不满意;
                        }
                    }
                },
                  {
                      field: '非常不满意', title: '非常不满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                          if (row.attributes.非常不满意 != undefined && row.attributes.非常不满意 != '') {
                              return row.attributes.非常不满意;
                          }
                      }
                  },
                {
                    field: '非常满意满意', title: '非常满意+满意%', fixed: true, align: 'left', sortable: true, width: 140, formatter: function (value, row, index) {
                        if (row.attributes.非常满意满意 != undefined && row.attributes.非常满意满意 != '') {
                            return row.attributes.非常满意满意;
                        }
                    }
                },
                {
                    field: '一般不满意非常不满意', title: '一般+不满意+非常不满意%', fixed: true, align: 'left', sortable: true, width: 200, formatter: function (value, row, index) {
                        if (row.attributes.一般不满意非常不满意 != undefined && row.attributes.一般不满意非常不满意 != '') {
                            return row.attributes.一般不满意非常不满意;
                            //return 100 - row.attributes.非常满意 - row.attributes.满意 - row.attributes.一般 -
                            //    row.attributes.不满意 - row.attributes.非常不满意;
                        }
                    }
                }

            ]
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

            

            

            var ProgressInterval;
            function Search() {
                StartTask();
            }
            function SearchData() {


               
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CommIncidentStaticStartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $('#hiIsSQLData').val('1');
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Static&Command=CommIncidentStaticLoadData&hiIsSQLData=' + $('#hiIsSQLData').val(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    initialState: "collapsed",
                    onClickRow: function (node) {

                    },
                    onBeforeExpand: function (row, param) {
                        if (row) {
                            $("#TableContainer").treegrid('options').url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentAcceptNew_Static&Command=CommIncidentStaticLoadDataChild&hiIsSQLData=' + $('#hiIsSQLData').val() + '&TreeCode=' + row.id;
                        }
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        $.tool.MergeEasyUiGrid("TableContainer", "Unit");
                    },
                    loadFilter: function (data) {
                        if (data.d) {
                            return data.d;
                        } else {
                            return data;
                        }
                    }
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

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('IncidentAcceptNew_Static', 'CommIncidentStaticTakeProgress', $('#frmForm').serialize(),
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
