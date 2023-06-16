<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicMeterDlg.aspx.cs" Inherits="M_Main.DialogNew.PublicMeterDlg" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>


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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>


    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            width: 25%;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 85%;
            overflow: auto;
        }
    </style>

    <script type="text/javascript">
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey: "BuildTreeCode",
                    pIdKey: "PrentBuildTreeCode"
                },
                key: {
                    name: "BuildTreeName"
                }
            },
            callback: {
                beforeClick: beforeClick,
                onClick: onClick
            },
            view: {
                fontCss: getFont,
                nameIsHTML: false
            }
        };
        function getFont(treeId, node) {
            return node.font ? node.font : {};
        }

        function beforeClick(treeId, treeNode, clickFlag) {
        }
        function onClick(event, treeId, treeNode, clickFlag) {
            // parent.$("#ReceFeesBrowse").attr("src", "ReceFeesBrowse.aspx?CommID=" + treeNode.CommID + "&RoomID=" + treeNode.RoomID);
            //$('#RoomID').val(treeNode.RoomID);
            var MeterType = '';

            if (treeNode.MeterType != '0') { MeterType = treeNode.MeterType; }


            $('#MeterType').val(MeterType);

            //document.getElementById('getRoomListDate').click();
            //var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            //treeObj.selectNode(treeNode);
            LoadList();

        }

        var zNodes =<%= publicmListNodes1 %>

            $(document).ready(function () {
                var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                treeObj.expandAll(true);
			  <%--  var treeNode = treeObj.getNodeByParam("BuildTreeCode", "<%= publicmListNodes %>", null);
			    treeObj.expandNode(treeNode, true, false, true);--%>
                //treeObj.selectNode(treeNode);
            });

    </script>

</head>
<body>
    <form id="FrmForm" runat="server">
        <input id="MeterType" name="MeterType" runat="server" type="hidden" />
        <input id="IsParticShare" name="IsParticShare" runat="server" type="hidden" />
        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td valign="top">
                            <div id="treeDemo" class="ztree" runat="server">
                            </div>

                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="ContainerRight" class="ContainerRight">

            <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
                style="width: 400px; height: 100px;">
                <table style="width: 100%;">
                    <tr>
                        <td class="TdTitle">表计名称
                        </td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" id="MeterName" name="MeterName"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        </td>
                    </tr>
                </table>
            </div>

            <div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>

        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">






            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() - $('#ContainerLeft').width() - 2;

                $("#treeDemo").css("height", h + "px");

                $("#TableContainer").css("height", h + "px");
                $("#ContainerRight").css("width", w + "px");





            }
            InitFunction();



            var column = [[



                { field: 'MeterSign', title: '表计编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                { field: 'PoolTypeName', title: '分摊方式', width: 100, align: 'left', sortable: true }


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

            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    toolbar: toolbar,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "PublicMeter", "TableContainer", param);
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }


            LoadList();



        </script>
    </form>
</body>
</html>
