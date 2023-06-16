<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialStat_Purchase.aspx.cs" Inherits="M_Main.Mt.MaterialStat_Purchase" %>

<!DOCTYPE html>

<html>
<head>
    <title>采购价格对比表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 700px; 
            height: 170px; 
        } Proc_Mt_MaterialStat_Purchase
        .SearchTable
        {
            width: 700px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
   <form id="frmForm">
    <input id="WareHouseId" value="" name="WareHouseId" type="hidden"  />
    <input id="MaterialId" name="MaterialId" value=""  type="hidden" />
       <input id="Attribute" name="Attribute" value=""  type="hidden" />
    <div id="TableContainer" style="width:100%;"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table >
            <tr>
                <td class="TdTitle">
                    仓库
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" runat="server"/>
                </td>
                <td class="TdTitle">
                    物资名称
                </td>
                <td class="TdContent">
                    <input id="MaterialName" name="MaterialName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    开始时间
                </td>
                <td class="TdContent">
                    <input id="StartDate" name="StartDate"  onclick="WdatePicker()" runat="server" />
                </td>
                <td class="TdTitle">
                    结束时间
                </td>
                <td class="TdContent">
                    <input id="EndDate" name="EndDate"  onclick="WdatePicker()" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">确定筛选</a>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="ClaerWhere();">清  除</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                SearchData();
            }
        };


        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        
        //清空筛选条件
        function ClaerWhere() {
            $("#WareHouseName").val("");
            $("#MaterialName").val("");           

            $("#WareHouseId").val("");
            $("#MaterialId").val("");           
        }
        var fitColumns = [[
            { field: 'MName', colspan: 2, title: '物资名称/仓库', align: 'left', width: 100, sortable: true }
        ]];
        var column = [];//表头
        var Headcolumn = [];//数据
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var rowData = $('#TableContainer').datagrid('getData');
                    if (rowData == '') {
                        HDialog.Info('请先生成报表');
                    }
                    else {
                        Export('采购价格对比表Excel', $('#TableContainer'));
                    }

                }
            }
        ];

        function Export(strXlsName, exportGrid) {
            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            i.val(ChangeToTable3(exportGrid, column, Headcolumn));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);
        }


        function ReportPrint(Cmd)
        {            
            $.tool.Print(Cmd, "");
        }

        function SearchData()
        {            
            GetTiele();
         
        }
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");                   
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("MaterialStat", "Purchase", "TableContainer", param).rows;                    
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });

        }

        $('#SearchDlg').parent().appendTo($("form:first"));

        //获取表头
        function GetTiele() {
            $.tool.DataPost('MaterialStat', 'GetPurchaseTitle', $("#frmForm").serialize(),
                   function Init() {
                   },
                   function callback(_Data) {
                       var datastr = JSON.parse(_Data);
                       
                       if (datastr != null) {
                           var column1 ="";
                           
                           var columntitle1 = "";
                           var columntitile2 ="";
                           for (var i = 0; i < datastr.length; i++) {
                               if (i==0) {
                                   columntitle1 = columntitle1 + "[{ field: 'MName', rowspan: 2, title: '物资名称/仓库', align: 'left', width: 100, sortable: true },";
                                   columntitle1 = columntitle1 + "{ colspan: 2, align: 'left', title: '" + datastr[i].WHName + "' }";
                               } else {
                                   columntitle1 = columntitle1 + ",{ colspan: 2, align: 'left', title: '" + datastr[i].WHName + "' }";
                               }                                                             
                           }
                           for (var i = 0; i < datastr.length; i++) {
                               if (i == 0) {
                                   column1 = column1 + "[{ field: 'MName',  title: '物资名称/仓库', align: 'left', width: 100, sortable: true },";
                                   column1 = column1 + "{ field: '" + datastr[i].WHName + "_MinP_" + i + "', title: '最低价', fixed: true, align: 'left', sortable: true, width: 100 },";

                                   columntitile2 = columntitile2 + "[{ field: '"+datastr[i].WHName + "_MinP_" + i+"', title: '最低价', fixed: true, align: 'left', sortable: true, width: 100 },";
                               } else {
                                   column1 = column1 + ",{ field: '" + datastr[i].WHName + "_MinP_" + i + "', title: '最低价', fixed: true, align: 'left', sortable: true, width: 100 },";

                                   columntitile2 = columntitile2 + ",{ field: '"+datastr[i].WHName +"_MinP_" + i+"', title: '最低价', fixed: true, align: 'left', sortable: true, width: 100 },";
                               }
                               column1 = column1 + "{ field:'" + datastr[i].WHName + "_MaxP_" + i + "', title: '最高价', fixed: true, align: 'left', sortable: true, width: 100 }";


                               columntitile2 = columntitile2+"{ field:'"+datastr[i].WHName + "_MaxP_"+ i+"', title: '最高价', fixed: true, align: 'left', sortable: true, width: 100 }";
                           }
                           if (columntitile2.length > 0)
                           {
                               column = eval('[' + columntitle1 + '],' + columntitile2 + ']]');
                               Headcolumn = eval(column1 + ']');
                           } 

                           
                           LoadList();
                       }                       
                   },
                   function completeCallback() {
                   },
                   function errorCallback() {
                   });
        }               

        //选择仓库
        $("#WareHouseName").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(300, h, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n='';
                var _Id='';
                for(var i=0;i<Obj.length;i++)
                {
                    _n = _n + Obj[i].text+",";
                    _Id = _Id + Obj[i].attributes.Id+",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#WareHouseName").val(_n);
                $("#WareHouseId").val(_Id);
            });
        });

        //选择物资
        $("#MaterialName").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../Mt/PurchaseDialog/MaterialSelFrame.aspx', '选择物资', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n = '';
                var _Id = '';
                var n = '';
                for (var i = 0; i < Obj.length; i++) {
                    if (i > 0) {
                        n = _n.split(',');
                        for (var j = 0; j < n.length; j++) {
                            if (n[j] != Obj[i].Name) {
                                _n = _n + Obj[i].Name + ",";
                                _Id = _Id + Obj[i].Id + ",";
                            }
                        }
                    } else {
                        _n = _n + Obj[i].Name + ",";
                        _Id = _Id + Obj[i].Id + ",";
                    }
                   
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#MaterialName").val(_n);
                $("#MaterialId").val(_Id);
               
            });
        });

        GetTiele();

    </script>
    </form>
</body>
</html>
