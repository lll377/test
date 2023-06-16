<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiFeesCorpCommissResourceStatist.aspx.cs" Inherits="M_Main.CorpCostStatistNew.MultiFeesCorpCommissResourceStatist" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <%--<script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>--%>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>

<body>
    <form id="frmForm">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 500px; height: 150px;">
            <table style="width: 100%;" class="DialogTable">
                <tbody>
                    <tr>
                        <td class="TdTitle">管理项目</td>
                        <td class="TdContentSearch" colspan="3">
                            <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="width: 80%;" data-options="editable:false" name="CommNames" runat="server" />
                            <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCommNames" runat="server" />
                            <input id="CommIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CommIDs" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">统计</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function SelCommInfo() {
        if ($('#CommID').val() != '' && $('#IsCorp').val() == '') {
            return;
        }
        else {
            var w = $(window).width() * 0.7;
            HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommIDs").val(arrRet.id);
                $("#CommNames").searchbox("setText", arrRet.name);
            });
        }
    }

    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }

    InitTableHeight();

    var toolbar = [
        {
            text: '统计',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-',
        {
            text: '导出Excel',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = 'MultiFeesCorpCommissResourceStatistCre.aspx';
            }
        }
    ];

    var frozenColumns = [[
        { field: '分公司名称', title: '区域名称', width: 150, align: 'left', sortable: true },
        { field: '项目名称', title: '项目名称', width: 150, align: 'left', sortable: true },
    ]];

    var column = [[
        { field: 'OrganCode', title: 'OrganCode', width: 150, align: 'left', sortable: true, hidden: true },
        { field: 'CommID', title: 'CommID', width: 150, align: 'left', sortable: true, hidden: true },
        { field: '楼宇数量', title: '楼宇数量', width: 150, align: 'left', sortable: true },
        { field: '建筑面积', title: '建筑面积', width: 150, align: 'left', sortable: true },
        { field: '套内面积', title: '套内面积', width: 150, align: 'left', sortable: true },
        { field: '公摊面积', title: '公摊面积', width: 150, align: 'left', sortable: true },
        { field: '花园面积', title: '花园面积', width: 150, align: 'left', sortable: true },
        { field: '房屋数量', title: '房屋数量', width: 150, align: 'left', sortable: true },
        { field: '客户数量', title: '客户数量', width: 150, align: 'left', sortable: true },
        {
            field: '工业套数', title: '工业套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','工业','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '工业面积', title: '工业面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','工业','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '公寓套数', title: '公寓套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','公寓','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '公寓面积', title: '公寓面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','公寓','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '商铺套数', title: '商铺套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','商铺','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '商铺面积', title: '商铺面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','商铺','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '写字楼套数', title: '写字楼套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','写字楼','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '写字楼面积', title: '写字楼面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','写字楼','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '住宅套数', title: '住宅套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','住宅','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '住宅面积', title: '住宅面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('统计明细','住宅','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '入住套数', title: '入住套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','2','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '入住面积', title: '入住面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','2','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置0套数', title: '地产空置(0%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','3','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置0面积', title: '地产空置(0%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','3','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置10套数', title: '地产空置(10%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','4','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置10面积', title: '地产空置(10%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','4','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置15套数', title: '地产空置(15%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','5','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置15面积', title: '地产空置(15%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','5','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置50套数', title: '地产空置(50%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','6','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置50面积', title: '地产空置(50%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','6','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置100套数', title: '地产空置(100%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','8','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '地产空置100面积', title: '地产空置(100%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','8','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '业主空置100套数', title: '业主空置(100%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','9','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '业主空置100面积', title: '业主空置(100%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','9','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '装修空置50套数', title: '装修空置(50%)套数', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','10','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        },
        {
            field: '装修空置50面积', title: '装修空置(50%)面积', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value != undefined) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail1('统计明细','10','" + row.CommID + "','" + row.OrganCode + "');\">" + value + "</a>";
                    return str;
                }
            }
        }

    ]];

    function SetEasyUiColumn(_Data) {
        var col = "";
        var obj = "";
        if (_Data.rows.length > 0) {
            obj = _Data.rows[0];
            var i = 0;

            for (var attr in obj) {
                if (attr != "分公司名称" && attr != "项目名称") {
                    col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr.replace('百分之', '%').replace('（', '(').replace('）', ')') + "\', align: \'left\',fixed:true, sortable: true,width:150}";
                }
            }
            col = col.substr(1, col.length);
            col = "[[" + col + "]]";

            NewCol = eval(col);
        }
    }

    function ViewDetail(title, PropertyUses, CommID, OrganCode) {
        HDialog.Open('1000', '700', '../CorpCostStatistNew/MultiFeesCorpCommissResourceStatistMX.aspx?PropertyUses=' + PropertyUses + '&CommID=' + CommID + '&OrganCode=' + OrganCode, title, false,
            function callback(_Data) {
                LoadList();
            }
        );
    }

    function ViewDetail1(title, RoomState, CommID, OrganCode) {
        HDialog.Open('1300', '700', '../CorpCostStatistNew/MultiFeesCorpCommissResourceStatistMX.aspx?RoomState=' + RoomState + '&CommID=' + CommID + '&OrganCode=' + OrganCode, title, false,
            function callback(_Data) {
                LoadList();
            }
        );
    }

    function LoadData() {
        $('#hiIsSQLData').val('1');
        $('#SearchDlg').dialog('close');
        LoadList(1);
    }

    function LoadList(page) {
        $.tool.DataPost('FeesStatic', 'CorpCommissResourceStatist', "page=" + "1" + "&rows=" + "1000" + "&" + $('#frmForm').serialize(),
            function Init() {

            },
            function callback(_Data) {
                var Data = eval("(" + _Data + ")"); //转换为json对象
                //SetEasyUiColumn(Data);
                
                $("#TableContainer").datagrid({
                    data: Data,
                    method: "post",
                    pageSize: [100],
                    pageList: [100, 150, 300],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    nowrap: false,
                    toolbar: toolbar,
                    rownumbers: true,
                    width: "100%",
                    border: false,
                    sortOrder: "asc",
                });
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    }

    $('#hiIsSQLData').val('-1');

    LoadList(1);
</script>
