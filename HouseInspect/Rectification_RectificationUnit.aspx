<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rectification_RectificationUnit.aspx.cs" Inherits="M_Main.HouseInspect.Rectification_RectificationUnit" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>按整改单位查看</title>
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
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 140px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                  <%--  <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="CommName" style="width: 95%; border: 1px solid #cccccc;" name="CommName" runat="server" onclick="SelComm();" />
                        <input id="CommID" name="CommID" type="hidden" runat="server" />
                    </td>--%>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                        </select>
                    </td>
                      <td class="TdTitle">整改单位
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="UnitName" name="UnitName" runat="server" onclick="SelRectificationUnit();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="UnitId" name="UnitId" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                  
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

         <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                <ul id="treeOrgan" class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,lines:true"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div style="width: 100%;" id="TableContainer">
        </div>
            </div>
        </div>
       
         <input id="HiCommID" type="hidden" name="HiCommID" runat="server" />

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
                $("#layout").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
            }
            InitTableHeight();

            //选择项目
            function SelComm() {
                HDialog.Open(410, 360, '../HouseInspect/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //选择整改单位
            function SelRectificationUnit() {
                HDialog.Open(410, 360, '../HouseInspect/SelResponsibleUnit.aspx?Type=1', "选择整改单位", false, function callback(_Data) {
                    var UnitId = "";
                    var UnitName = "";
                    var arrRet = _Data.split("|");
                    var arrRet1;
                    console.log(arrRet);
                    for (var i = 1; i < arrRet.length; i++) {
                        arrRet1 = arrRet[i].split(",");
                        if (arrRet != "") {
                            UnitId += arrRet1[1] + ",";
                            UnitName += arrRet1[2] + ",";
                        }
                    }
                    UnitId = UnitId.substring(0, UnitId.length - 1);
                    UnitName = UnitName.substring(0, UnitName.length - 1);
                    $("#UnitId").val(UnitId);
                    $("#UnitName").val(UnitName);
                });
            };

            var column = [[
                { field: 'CommId', title: 'CommId', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: false },
                { field: 'Batch', title: '查验批次', width: 80, align: 'left', sortable: false, hidden: true },
                { field: 'BatchName', title: '查验批次', width: 80, align: 'left', sortable: false },
                { field: 'RectificationUnitId', title: '整改单位id', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'UnitName', title: '整改单位', width: 120, align: 'left', sortable: false },
                {
                    field: 'UnqualifiedHouseNum', title: '问题房屋数量', width: 120, align: 'center', halign :'left', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"Rectification_HousesInfo('" + row.CommId + "','" + row.Batch + "','" + row.RectificationUnitId + "','Unqualified')\">" + row.UnqualifiedHouseNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'CheckedHouseNum', title: '验收房屋数量', width: 120, align: 'center', halign :'left', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"Rectification_HousesInfo('" + row.CommId + "','" + row.Batch + "','" + row.RectificationUnitId + "','Checked')\">" + row.CheckedHouseNum + "</a>";
                        return str;
                    }
                }
            ]];

            //查看整改详情
            function Rectification_HousesInfo(CommID, Batch, RectificationUnit, CheckType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '570', '../HouseInspect/Rectification_HousesInfo.aspx?CommID=' + CommID + "&Batch=" + Batch + "&RectificationUnit=" + RectificationUnit + '&CheckType=' + CheckType, '整改房屋详情', false, function callback(_Data) {
                });
            }

            //导出
            function ExcelPrint() {
                var url = '../HouseInspect/Excel.aspx?ExcelName=按整改单位查看' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&HiCommID=" + $("#HiCommID").val();
                str += "&Batch=" + $("#Batch").val();
                str += "&UnitId=" + $("#UnitId").val();
                return encodeURI(str);
            }

            var toolbar = [

                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }

                }, "-",
                {
                    text: 'Excel导出',
                    iconCls: 'icon-save',
                    handler: function () {
                        if ($("#HiCommID").val().length <= 0) {
                            HDialog.Info('请选择左边项目！');
                            return false;
                        }
                        ExcelPrint();
                    }

                },
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
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
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsHouseInspect", "Rectification_RectificationUnit", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
         <script>
             function LoadOrganTree() {
                 $("#treeOrgan").tree({
                     url: '/HM/M_Main/HC/DataPostControl.aspx',
                     method: "post",
                     treeField: 'text',
                     idField: 'id',
                     lines: true,
                     border: false,
                     loadMsg: '加载中,请稍侯...',
                     onLoadSuccess: function (node, data) {
                         //LoadList();
                         //默认选中第一个节点
                         if (data.length > 0) {
                             var commid = GetQueryString('CommID');
                             var node = $('#treeOrgan').tree('find', data[0].id);
                             var firstnode = null;
                             if (commid == '' && commid == '0') {
                                 firstnode = SelectFirsLeafNode(node);
                             }
                             else {
                                 var str = JSON.stringify(data);
                                 str = str.substr(0, str.indexOf(commid));
                                 str = str.substr(str.lastIndexOf("OrganCode") + 12, 30);
                                 str = str.substr(0, str.indexOf('\"'));
                                 firstnode = $('#treeOrgan').tree('find', str);

                             }
                             if (firstnode) {
                                 $('#treeOrgan').tree('select', firstnode.target);
                             } else {
                                 //LoadList();
                             }
                         }
                     },
                     onBeforeSelect: function (node) {
                         if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                             return false;
                         }
                     },
                     onBeforeLoad: function (row, param) {
                         localStorage.removeItem('CpCommId');
                         param.Method = "DataPost";
                         //param.Class = "CsHouseInspect";
                         param.Class = "CpComPatrols";
                         param.Command = "DepMenuList";
                         //控制用户权限
                         param.SelRoleCode = $("#LoginRoleCode").val();

                     },
                     onSelect: function (row) {
                         $("#HiCommID").val(row.attributes.CommID);
                         LoadList();
                     }
                 });
             }


             //递归 获取第一个子节点
             function SelectFirsLeafNode(FirstNode) {
                 var ItemFirstNode = null;
                 function dd(node) {
                     if (!$('#treeOrgan').tree("isLeaf", node.target)) {
                         var Children = $('#treeOrgan').tree("getChildren", node.target);
                         dd(Children[0]);
                     } else {
                         ItemFirstNode = node;
                     }
                 }
                 var i = 9999;
                 while (1 < i) {
                     if (ItemFirstNode == null) {
                         dd(FirstNode);
                     } else {
                         break;
                     }
                     i = i - 1;
                 }
                 return ItemFirstNode;
             }

             $(".tabs-container li").click(function () {
                 var refpage = $(this).attr("refpage");
                 var refsel = $(this).attr("refsel");
                 if (refsel == 0) {
                     var SelecteTreeNode = $('#treeOrgan').tree("getSelected");
                     if (SelecteTreeNode != null) {
                         localStorage.setItem("CpCommId", SelecteTreeNode.attributes.CommID);
                         $("#" + refpage).attr("src", refpage + ".aspx?CommID=" + SelecteTreeNode.attributes.CommID);
                         $(this).attr("refsel", "1");
                     }
                 }
             });
             LoadOrganTree();
         </script>
    </form>
</body>
</html>
