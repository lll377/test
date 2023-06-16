<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="CustomerContainer.aspx.cs" Inherits="M_Main.HouseNew.CustomerContainer" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Customer</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
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

    <script language="javascript">

        function btnClear_OnClick() {

            CustomerIntegratedSeach.CustName.value = "";
            CustomerIntegratedSeach.OldCustName.value = "";
            CustomerIntegratedSeach.RoomSign.value = "";
            CustomerIntegratedSeach.PaperCode.value = "";
            CustomerIntegratedSeach.FixedTel.value = "";
            CustomerIntegratedSeach.MobilePhone.value = "";
            CustomerIntegratedSeach.CustTypeID.value = "";

        }

        function CheckData() {
            if (CustomerIntegratedSeach.CommID.value == "") {
                alert("请选择管理项目,此项不能为空!");
                CustomerIntegratedSeach.btnSelComm.focus();
                return false;
            }
        }
        //选择小区
        function btnSelComm_OnClick() {
            varReturn = showModalDlg("../dialog/CommTreeDlg.aspx" + "?Ram=" + Math.random(), "", 600, 450);

            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                CustomerIntegratedSeach.CommID.value = varObjects[0];
                CustomerIntegratedSeach.CommName.value = varObjects[1];
                CustomerIntegratedSeach.hiCommName.value = varObjects[1];
            }
        }


        //查询对话框
        function btnFilterMore_OnClick() {
            var TableSign = getObject("TableSign").value;
            if (TableSign != "" && TableSign != null) {
                var strTemplateCode = TableSign;
                var strSearchData = escape(getObject("hiSearchData").value);
                varReturn = showModalDlg("../dialog/SearchDlg.aspx?TemplateCode=" + strTemplateCode + "&SearchData=" + strSearchData, "", 420, 400);

                //alert(varReturn);

                if (varReturn != "") {
                    var Search = eval('(' + varReturn + ')');
                    getObject("hiSearchSql").value = Search.SqlData.Sql;

                    //**重构数据(数据结构为JSON)					
                    var SearchData = Search.SqlData.Data;
                    //alert(Search.SqlData.Sql);
                    var val = "";
                    for (var i = 0; i < SearchData.length; i++) {
                        if (val != "") {
                            val = val + ",{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                        else {
                            val = "{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                        }
                    }
                    getObject("hiSearchData").value = "{Data:[" + val + "]}";
                }
            }
        }

    </script>
</head>
<body>
    <form id="FrmForm" method="post" runat="server">
        <input class="button" id="btnDel" type="button" value="删除" style="display: none;" name="btnDel" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="SType" size="1" type="hidden" name="SType" runat="server">
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="CustID" type="hidden" size="1" name="hiCustID" runat="server">
        <input id="CommID" size="1" type="hidden" name="CommID" runat="server">
        <input id="hiCommName" size="1" type="hidden" name="hiCommName" runat="server">
        <input id="intrest" size="1" type="hidden" name="intrest" runat="server">

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 950px; height: 270px; padding: 10px;">
            <table style="width: 100%; padding-top: 5px; line-height: 25px;">

                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContent" colspan="7">  
                        <input id="CommName" onclick="SelComm();" style="width: 96%" name="CommName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类型</td>
                    <td>
                        <select id="LiveType" name="LiveType" runat="server">
                            <option selected>全部</option>
                            <option value="1">业主</option>
                            <option value="2">租户</option>
                            <option value="3">临时</option>
                        </select>
                    </td>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent">
                        <input id="CustName" name="CustName" runat="server"></td>
                    <td class="TdTitle">曾用名</td>
                    <td class="TdContent">
                        <input id="OldCustName" name="OldCustName" runat="server"></td>
                </tr>
                <tr>
                    <%-- <td class="TdTitle">成员名称</td>
                    <td class="TdContent">
                        <input id="MemberName" name="MemberName" runat="server"></td>--%>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSign" name="RoomSign" runat="server"></td>
                    <td class="TdTitle">证件号码</td>
                    <td class="TdContent">
                        <input id="PaperCode" maxlength="50" name="PaperCode" runat="server"></td>
                    <td class="TdTitle">固定电话</td>
                    <td class="TdContent">
                        <input id="FixedTel" maxlength="50" name="FixedTel" runat="server"></td>
                    <td class="TdTitle">移动电话</td>
                    <td class="TdContent">
                        <input id="MobilePhone" maxlength="50" name="MobilePhone" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">职业</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="DrJob" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle">工作单位</td>
                    <td class="TdContent">
                        <input type="text" id="WorkUnit" name="WorkUnit" runat="server" />
                    </td>
                    <td class="TdTitle">是否历史</td>
                    <td>
                        <select id="IsDelete" name="IsDelete" runat="server">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">兴趣爱好</td>
                    <td class="TdContentSearch" colspan="7">
                        <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="8"></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="8">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadSearch();">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>

                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        var w = $(window).width();
        var h = $(window).height();


        var column = [[
            { field: 'OrganName', title: '区域名称', width: 130, align: 'left', sortable: true },
            { field: 'CommName', title: '项目名称', width: 130, align: 'left', sortable: true },
            { field: 'LiveTypeName', title: '客户类型', width: 100, align: 'left', sortable: true },
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'left', sortable: true },
            {
                field: 'CustName', title: '客户名称', width: 250, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.CustID + "');\">" + row.CustName + "</a>";
                    return str;
                }
            },
            { field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left', sortable: true },
            { field: 'PaperCode', title: '证件号码', width: 190, align: 'left', sortable: true },
            { field: 'FixedTel', title: '固定电话', width: 110, align: 'left', sortable: true },
            { field: 'MobilePhone', title: '移动电话', width: 110, align: 'left', sortable: true },
            { field: 'FaxTel', title: '传真电话', width: 100, align: 'left', sortable: true },
            { field: 'PostCode', title: '邮政编码', width: 100, align: 'left', sortable: true },
            { field: 'Address', title: '联系地址', width: 140, align: 'left', sortable: true },
            { field: 'Recipient', title: '收件人', width: 100, align: 'left', sortable: true },
            //{ field: 'MGradeSign', title: '信用等级', width: 120, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
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
                    window.location.href = "../HouseNew/CustomerIntegratedSeachCreExcel.aspx";
                }
            }, '-',
            {
                text: '更名历史',
                iconCls: 'icon-filter',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择查看项！');
                        return;
                    }
                    ChangeName('更名历史', row.CustID);
                }
            }
        ];

        function LoadSearch() {
            if ($("#CommID").val() == "") {
                HDialog.Info("请选择项目！");
                return;
            }
            LoadList();
        }


        function LoadList() {
            var intrest = "";
            $("input:checkbox:checked").each(function () {
                if ($(this).next().text() != '') {
                    intrest += $(this).next().text() + ","
                }
            })
            if (intrest.indexOf(',') > 0) {
                intrest = intrest.substr(0, intrest.length - 1);
            }
            $("#intrest").val(intrest);
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                title: '',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                remoteSort: false,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                pagination: true,
                width: "100%",
                border: false,
                toolbar: toolbar,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Customer", "searchcustomercontain", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //清空查询条件
        function CancelParm() {
            $('#CommName').val('');
            $('#CommID').val('');
            $('#CustName').val('');
            $('#CustTypeID').val('');
            $("#LiveType").val('');
            $('#CustID').val('');
            $('#RoomSign').val("");
            $('#PaperCode').val("");
            $('#MemberName').val("");
            $('#OldCustName').val("");
            $('#FixedTel').val("");
            $('#MobilePhone').val("");
            $('#WorkUnit').val("");
            $('#DrJob').val('');
            $("#IsDelete").val('');
            $("input[type='checkbox']").attr("checked", false);
        }
        //筛选客户
        function SelCust() {

            $('#CustName').searchbox("setValue", '');
            $('#CustID').val('');

            var conent = "../DialogNew/CustDlg.aspx";

            HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                var data = JSON.parse(_Data);
                $('#CustName').searchbox("setValue", data.CustName);

                $('#CustID').val(data.CustID);


            });
        }
        //客户详情
        function ViewDetail(CustID) {
            HDialog.Open(w, h, '../HouseNew/CustomerDetail.aspx?Back=CustomerContainer&CustID=' + CustID + '&SType=details',
                '客户信息', false, function callback(_Data) {
                    if (_Data == "true") {
                        LoadList();
                    }
                });
        }

        //更名历史
        function ChangeName(title, custid) {
            HDialog.Open(w, h, '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + custid + '&back=1', title, false, function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                }
            });
        }

        //选择小区
        function SelComm() {
            var w = $(window).width() * 0.7;
            HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommID").val(arrRet.id);
                $("#CommName").val(arrRet.name);
              
                ////客户类别
                //$.tool.DataPost('Customer', 'getCustmerType', 'CommID=' + CommID.value,
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        $('#CustTypeID').html(_Data);
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //    });

            })
        }

        $("select").each(function () {

            var key = $(this).attr("id");

            if (key != undefined) {
                $(this).css("width", '82%');
            }
        });

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();
        LoadList();
       


</script>
</body>
</html>


