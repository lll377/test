<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPublicMeterNewResultManage.aspx.cs" Inherits="M_Main.HouseNew.NewPublicMeterNewResultManage" %>


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
            width: 20%;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 80%;
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
            var MeterName = '';

            if (treeNode.MeterType != '0' )
            { MeterName = treeNode.BuildTreeName; }
            $('#bjmc').html('表计名称:' + MeterName);

            var MeterID = treeNode.URLDate;
            MeterID = MeterID.replace('MeterID=','');
            $('#MeterID').val(MeterID);
           
            //document.getElementById('getRoomListDate').click();
            //var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            //treeObj.selectNode(treeNode);
            LoadList();
            
        }

        var zNodes =<%= publicmListNodes %>
         
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
       <input id="MeterID" name="MeterID" runat="server" type="hidden" />
        <div class="Container" >
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
        <div id="tbb">
			       <span id="bjmc" name="bjmc">表计名称：</span>
			    <a href="#" id="ins" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick=" JavaScript:InsertMeter(); ">新增</a>
			    <a href="#" id="del" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick=" JavaScript:DeleteMeter(); ">删除</a>
		       
	        </div>
        <div id="ContainerRight" class="ContainerRight">
            
            <div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
            	
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            	
						
			
							

            function InitFunction() {
                var h = $(window).height()-5;
                var w = $(window).width() - $('#ContainerLeft').width()-2;
                var h1 = h - 38;
                $("#treeDemo").css("height", h1 + "px");
               
                $("#TableContainer").css("height", h + "px");
                $("#ContainerRight").css("width", w + "px");
             


             

            }
            InitFunction();

           
            var column = [[

                
                {
                    field: 'ListDate', title: '抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                       
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改公区抄表','edit','" + row.RestID + "','" + row.MeterID + "','" + formatDate(row.ListDate, "yyyy-MM-dd") + "');\">" + formatDate(row.ListDate, "yyyy-MM-dd") + "</a>";
                        return str;
                       
                    }
                },
                { field: 'StartDegree', title: '起数', width: 50, align: 'left', sortable: true },
                { field: 'EndDegree', title: '止数', width: 50, align: 'left', sortable: true },
                { field: 'Ratio', title: '变比', width: 50, align: 'left', sortable: true },
                { field: 'Dosage', title: '用量', width: 50, align: 'left', sortable: true },
                { field: 'OldDosage', title: '旧表用量', width: 100, align: 'left', sortable: true },
                { field: 'ExtraDosage', title: '损耗', width: 50, align: 'left', sortable: true },
                { field: 'TotalDosage', title: '合计用量', width: 100, align: 'left', sortable: true },
                { field: 'Price', title: '单价', width: 50, align: 'left', sortable: true },
                { field: 'Amount', title: '金额', width: 100, align: 'left', sortable: true },
                { field: 'AdjustAmount', title: '调整金额', width: 100, align: 'left', sortable: true },
                { field: 'MeterHint', title: '异常提示', width: 200, align: 'left', sortable: true },
                { field: 'IsAuditName', title: '是否冻结', width: 100, align: 'left', sortable: true },
                { field: 'MeterSource', title: '抄表来源', width: 100, align: 'left', sortable: true },
                { field: 'MeterPerson', title: '抄表人', width: 100, align: 'left', sortable: true },
                { field: 'InputDate', title: '录入时间', width: 100, align: 'left', sortable: true }

            ]];

         
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
                    toolbar: '#tbb',
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "PublicMeterResultList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }
            

            LoadList();

            function DelRecord(Id,ListDate) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Meter', 'PublicMeterResultDelete', 'MeterID=' + Id + '&ListDate=' + ListDate,
                                function Init() {
                                },
                                function callback(_Data) {

                                    var Data = _Data;
                                    if (Data == "true") {
                                        HDialog.Info('删除成功');
                                    }
                                    else { HDialog.Info('删除失败'); }
                                    LoadList();


                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                    }
                });
            }
            
            function ViewDetail(title, OpType, RestID,MeterID,ListDate) {
        

                var w = 600;
                var h = 320;
                HDialog.Open(w, h, '../HouseNew/PublicResultInsManage.aspx?RestID=' + RestID + '&OpType=' + OpType + '&MeterID=' + MeterID+'&ListDate='+ListDate, title, false, function callback(_Data) {
                    LoadList();
                });



            }
            function InsertMeter()
            {
                var w = 600;
                var h = 320;

                HDialog.Open(w, h, '../HouseNew/PublicResultInsManage.aspx?OPType=Insert&MeterID=' +$('#MeterID').val(), '新增公区抄表', false, function callback(_Data) {
                    LoadList();
                });

            }
            function UpdateMeter()
            {
                //var w = $(window).width();
                //var h = $(window).height();
                //var strListDate = $('#ListDate').val();

                //HDialog.Open(w, h, '../HouseNew/ResultEdtManage.aspx?OPType=Edit&RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val() + "&ListDate=" + strListDate, '修改抄表', false, function callback(_Data) {
                //    if (_Data == "1") {
                //        document.getElementById('getRoomListDate').click();
                //        LoadData(1);
                //    }
                //});
            }
            function DeleteMeter()
            {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row.MeterID > 1) {
                    DelRecord(row.MeterID, row.ListDate);
                }
                else
                { HDialog.Info('请选择');}

             
            }
           
        </script>
    </form>
</body>
</html>
