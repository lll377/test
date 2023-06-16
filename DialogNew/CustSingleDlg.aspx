<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustSingleDlg.aspx.cs" Inherits="M_Main.DialogNew.CustSingleDlg" %>

<!DOCTYPE html>
<html>
	<head> 
		<title></title>
        <script type="text/javascript" src="../jscript/DateControl.js"></script>
        <script type="text/javascript" src="../jscript/JSClient.js"></script>
        <script type="text/javascript" src="../jscript/ajax.js"></script>
        <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <link href="../css/button.css" rel="stylesheet" />
        <script src="../jscript/DateFormat.js" type="text/javascript"></script>
        <script src="../jscript/format.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
        <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
       
	</head>
    <body>
        <form id="FrmForm"> 

            <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><input id="CkHis" name="CkHis" type="checkbox" onclick= "CK(this);" />历史客户<input id="IsHis" type="hidden" runat="server" name="IsHis" /></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>  <input id="LiveType" type="hidden" runat="server" name="LiveType" />
                                            <input id="Rb1" name="rb" onclick="RbCK(1)" type="radio" />业主
                                            <input id="Rb2" name="rb"  onclick="RbCK(2)" type="radio" />租户
                                            <input id="Rb3" name="rb"  onclick="RbCK(3)" type="radio" />临时</td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>业主名称<input type="text" class="easyui-validatebox" id="CustName" name="CustName"
                                                runat="server" /></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td id="tempadd">
                        <a id="" class="l-btn l-btn-small l-btn-plain" onclick="AddTemp();" href="javascript:void(0)" group=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text"><font size="3" style="font-weight:bold;color:red;">新增临时客户</font></span><span class="l-btn-icon icon-add"> </span></span></a>
                        <%--<a href="javascript:void(0)"  onclick="AddTemp();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">新增临时客户</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>--%>
                    </td>
                     <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                     <td>
                        <a href="javascript:void(0)"  onclick="LoadList();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                    </td>
                </tr>
            </table>
        </div>

      <div style="width: 100%;" id="TableContainer"></div>
        
            </form>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script  type="text/javascript">
   

        function InitFunction() {
            var h = $(window).height();
            var h1 = $('#divtt').height();
            h = h - h1 - 4;
            $("#Rb1").attr("checked","checked");
            $('#LiveType').val(1);
            $("#TableContainer").css("height", h + "px");
            $('#tempadd').hide();
        }
        InitFunction();

        var column = [[

                
                { field: 'CustName', title: '客户名称', width: 80, align: 'left', sortable: true },
                { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left', sortable: true }
             
        ]];

        var toolbar = [
             {
                 text: '筛选', 
                 iconCls: 'icon-search',
                 handler: function () {
                     $('#SearchDlg').parent().appendTo($("form:first"))
                     $('#SearchDlg').dialog('open');
                 }
             }
        ];
        function AddTemp()
        {
            HDialog.Open('950', '450', '../DialogNew/CustAdd.aspx', '新增临时客户', false, function callback(_Data) {
                if (_Data == '1') {
                    LoadList();
                }
            });

        }
        function CK(obj)
        {
            if (obj.checked) {
                $("#IsHis").val(1);

                $('#tempadd').hide();
            }
            else {
                $("#IsHis").val(0);
            }
        }
        function RbCK(LiveType) {
            $('#LiveType').val(LiveType);
            if (LiveType == 3)
            {
                $('#tempadd').show();
            } else {
                $('#tempadd').hide();
            }
            LoadList();
        }
        function LoadList() {
           
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
                border: false,
                toolbar:'#divtt',
                width: "100%",               
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Choose", "CustomerLiveList", "TableContainer", param);
                },
                onDblClickRow:function(rowIndex, rowData)
                {
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rowData);
                }
            });
            $('#SearchDlg').dialog('close');
        }

     
        LoadList();
        </script>
    </body>
</html>
