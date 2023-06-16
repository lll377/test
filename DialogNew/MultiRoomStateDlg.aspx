<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiRoomStateDlg.aspx.cs" Inherits="M_Main.DialogNew.MultiRoomStateDlg" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script  src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="FrmForm" runat="server">
        <input id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
        <input type="hidden" id="pdlist" name="pdlist" value="" />
        <input id="PageIndex" style="HEIGHT: 22px; WIDTH: 32px" type="hidden" size="1" name="PageIndex"
							runat="server"/><input id="RoomStates" style="HEIGHT: 22px; WIDTH: 32px" type="hidden" size="1" name="RoomStates"
							runat="server"/>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 100px;">
              <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
            <tr>
                <td width="25%">
                    <select id="StateType" runat="server" name="StateType">
							<option value="0" select>当前</option>
							<option value="1000">当时</option>
                        </select>&nbsp;房屋状态
                </td>
                <td width="75%">
                   <input id="StateName"  size="18" name="StateName" runat="server"
							maxLength="100" />
                     <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">
                        确定筛选</a>
                </td>
               
            </tr>
           
        </table>
        </div>
        <div style="width: 100%;" id="TableContainer">
        </div>

        <input type="hidden" id="CommID" name="CommID" />

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();

                document.getElementById("AllCheck").value = "";
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

            var column = [[

                { field: 'ck', checkbox: true },
                { field: 'SortNum', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'StateName', title: '房屋状态', width: 200, align: 'left', sortable: true },
                { field: 'FeesRate', title: '收费比率', width: 200, align: 'left', sortable: true },
                { field: 'StateMemo', title: '备注', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var value = $('#AllCheck').val();
                        if (value == "") {
                            HDialog.Info('请选择');
                        }
                        else {

                            var roomstates = value.split('|');
                            if (roomstates.length > 0)
                            {
                                var mRoomState = "";	
                                var mStateName = "";
                                
                                for (var i = 0; i < roomstates.length; i++) {
                                    var state = roomstates[i].split(",");
                                   
                                    if (state[0] != "")
                                    {
                                        mRoomState = mRoomState + "," + state[0].toString();
                                        mStateName = mStateName + "," + state[1].toString();
                                    }
                                }
                                mRoomState = mRoomState.substring(1, mRoomState.length);
                                mStateName = mStateName.substring(1, mStateName.length);

                                var strRe = mRoomState + "\t" + mStateName;
                                HDialog.Close(strRe);
                            }

                           
                        }
                    }

                },
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');
                     }

                 }
            ];


            function LoadList(_Data, rows) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=RoomStateComm&' + $("#FrmForm").serialize(),
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onLoadSuccess: function (data) {

                    },
                    onCheck: function (rowIndex, rowData) {

                        var iState = parseInt(rowData.RoomState) + parseInt($('#StateType').val());

                        var dd = $('#AllCheck').val() + "|" + iState + "," + rowData.StateName;
                        $('#AllCheck').val(dd);

                    },
                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#AllCheck').val().split('|');
                        for (var i = 0; i < ss.length; i++) {

                            var iState = parseInt(rowData.RoomState) + parseInt($('#StateType').val());

                            if (ss[i].indexOf(iState) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "|" + ss[i];
                        }
                        $('#AllCheck').val(valu.substr(1, valu.length));

                    },
                    onCheckAll: function (rows) {

                        for (var i = 0; i < rows.length; i++) {


                            var iState = parseInt(rows[i].RoomState) + parseInt($('#StateType').val());

                            var data = "|" + iState + "," + rows[i].StateName;

                            var ss = $('#AllCheck').val();
                            if (ss.indexOf(data) < 0) {
                                var dd = $('#AllCheck').val() + "|" + data;
                                $('#AllCheck').val(dd);
                            }
                        }

                    },
                    onUncheckAll: function (rows) {
                        for (var i = 0; i < rows.length; i++) {

                            var ss = $('#AllCheck').val().split('|');
                            for (var i = 0; i < ss.length; i++) {

                                var iState = parseInt(rows[i].RoomState) + parseInt($('#StateType').val());

                                if (ss[i].indexOf(iState) >= 0) {
                                    ss.splice(i, 1);
                                }
                            }
                            valu = "";
                            for (var i = 0; i < ss.length; i++) {
                                valu += "|" + ss[i];
                            }
                            $('#AllCheck').val(valu.substr(1, valu.length));

                        }

                    }

                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
