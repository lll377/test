<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCommunitySuggestionsBrowse.aspx.cs" Inherits="M_Main.ComInfoNew.NewCommunitySuggestionsBrowse" %>

<!DOCTYPE HTML  >
<html>
<head>
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
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>


    <script type="text/javascript">

        //获取客户名称列表

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAccept.CustID.value = varObjects[0];
                IncidentAccept.CustName.value = varObjects[1];
                IncidentAccept.hiCustName.value = varObjects[1];

                IncidentAccept.RoomSign.value = "";
                IncidentAccept.RoomID.value = "";
                IncidentAccept.hiRoomSign.value = "";

                return true;
            }

            return false;
        }

        //获取房屋编号列表

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAccept.RoomID.value = varObjects[0];
                IncidentAccept.RoomSign.value = varObjects[2];
                IncidentAccept.hiRoomSign.value = varObjects[2];

                IncidentAccept.CustID.value = varObjects[1];
                IncidentAccept.CustName.value = varObjects[3];
                IncidentAccept.hiCustName.value = varObjects[3];
                //alert(varReturn);

                return true;
            }

            return false;
        }
    </script>
</head>
<body>
    <form id="frmFrom" method="post" runat="server">
        <input id="hiSuggestionsType" type="hidden" name="hiSuggestionsType" runat="server" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 900px; height: 180px; padding: 5px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" style="width: 142px;" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" style="width: 142px;" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">建议时间
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="StartDate" name="StartDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" id="EndDate" name="EndDate" style="width: 140px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">建议类别</td>
                    <td class="TdContent">
                        <asp:DropDownList ID="SuggestionsType" runat="server"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">回复状态</td>
                    <td class="TdContent">
                        <select id="ReplyStats" name="ReplyStats" style="width: 142px;" runat="server">
                            <option value=""></option>
                            <option value="已回复">已回复</option>
                            <option value="未回复">未回复</option>
                        </select>
                    </td>
                    <td class="TdTitle">客户评价
                    </td>
                    <td class="TdContent">
                        <select id="CustEvaluation" name="CustEvaluation" style="width: 142px;" runat="server">
                            <option value=""></option>
                            <option value="一般">一般</option>
                            <option value="满意">满意</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 50px;">
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchClose"
                            onclick="LoadList()">确定筛选</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'"
                                id="A1" onclick="Clear()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <%--数据列表--%>
        <div style="width: 100%;" id="TableContainer">
        </div>


    </form>
</body>
</html>

<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();

    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    //清空
    function Clear() {
        $('#CustName').searchbox("setValue", '');
        $("#CustID").val("");
        $("#RoomID").val("");
        $('#RoomSign').searchbox("setValue", '');
        $("#StartDate").val("");
        $("#EndDate").val("");
        $("#SuggestionsType").val("");
        $("#ReplyStats").val("");
        $("#CustEvaluation").val("");
    }

    //删除
    function btnDel_OnClick() {
        //获取删除ID
        var row = $("#TableContainer").datagrid("getSelected");
        if (row == null) {
            $.messager.alert("提示", "请选择删除数据");
            return;
        }
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet("CommunitySuggestions", "DelCommunitySuggestionsList", "Id=" + row["SuggestionsID"],
                    function Init() { },
                    function callback(_Data) {
                        if (_Data == "false") {
                            $.messager.alert('错误', '无此权限', 'error');
                        }
                        else {
                            LoadList();
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

    //设置数据列名
    var column = [[
        { field: 'CustName', title: '客户名称', width: 25, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 40, align: 'left', sortable: true },
        { field: 'SuggestionsType', title: '建议类别', width: 15, align: 'left', sortable: true },
        //{ field: 'SuggestionsTitle', title: '建议标题', width: 35, align: 'left', sortable: true },
        { field: 'CustEvaluation', title: '客户评价', width: 35, align: 'left', sortable: true },
        { field: 'ReplyPeople', title: '回复人', width: 15, align: 'left', sortable: true },
        { field: 'ReplyStats', title: '回复状态', width: 15, align: 'left', sortable: true },
        { field: 'IssueDate', title: '提交时间', width: 20, align: 'center', sortable: true }
    ]];

    var toolbar = [
        //{
        //    text: '新增',
        //    iconCls: 'icon-add',
        //    handler: function () {
        //        ViewDetail("新增社区建议", 'insert', "");
        //    }
        //}, '-',
        //   {
        //       text: '删除',
        //       iconCls: 'icon-cancel',
        //       handler: function () {
        //           var rows = $('#TableContainer').datagrid('getSelected');
        //           if (rows == null) {
        //               HDialog.Info('请选择删除项!');
        //               return;
        //           }
        //           else {
        //               DelRecord(rows.SuggestionsID);
        //           }
        //       }
        //   }, '-',  //新增，删除屏蔽，修改改成回复 2020-6-2（长城方案）
        {
            text: '回复',
            iconCls: 'icon-edit',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getSelected');
                if (rows == null) {
                    HDialog.Info('请选择修改项!');
                    return;
                }
                else {
                    ViewDetail("回复", 'edit', rows.SuggestionsID);
                }
            }
        }, '-',
        {
            text: '筛选',
            iconCls: 'icon-filter',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }
    ];

    function DelRecord(Id) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('CommunitySuggestions', 'delCommunitySuggestions', 'SuggestionsID=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "false") {
                            HDialog.Info('删除错误');
                        }
                        else {
                            LoadList();
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }


    function ViewDetail(title, OpType, SuggestionsID) {
        HDialog.Open('820', '600', '../ComInfoNew/NewCommunitySuggestionsManage.aspx?OpType=' + OpType + '&SuggestionsID=' + SuggestionsID,
            title, false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
    }

    //填充数据
    function LoadList() {
        $("#hiSuggestionsType").val($("#SuggestionsType").find("option:selected").text());

        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CommunitySuggestions&Command=getCommunitySuggestionsList&' + $("#frmFrom").serialize(),
            method: "get",
            title: '',
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            border: false,
            sortOrder: "asc"
        });
        $('#SearchDlg').dialog('close');
    }


    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(800, 600, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);
        });

    }

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');


        var conent = "../DialogNew/RoomDlg.aspx";
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });
    }
</script>
