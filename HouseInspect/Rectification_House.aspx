<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rectification_House.aspx.cs" Inherits="M_Main.HouseInspect.Rectification_House" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>按房屋/公区查看</title>
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
            style="width: 600px; height: 170px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                   <%-- <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;" id="CommName" name="CommName" runat="server" onclick="SelComm();" />
                        <input id="CommID" name="CommID" type="hidden" runat="server" />
                    </td>--%>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                        </select>
                    </td>
                      <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="HouseName" name="HouseName" runat="server" onclick="RoomSeach();" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="HouseId" name="HouseId" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                </tr>
                <tr>
                  
                    <td class="TdTitle">是否完成</td>
                    <td class="TdContent">
                        <select id="IsComplete" name="IsComplete" class="easyui-validatebox" style="width: 95%; border: 1px solid #cccccc;">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
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


        <input id="Type" name="Type" value="" type="hidden" />
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
            //选择房屋
            function RoomSeach() {
                HDialog.Open('650', '600', '../HouseInspect/RoomDlg.aspx?Type=0', '选择房屋', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        //|901室,17627800000001|902室,17627800000002|903室,17627800000003
                        LoadRoleCol(_Data);
                    };
                })
            };

            function LoadRoleCol(obj) {

                var strs = new Array();
                strs = obj.split('|');
                var code = "";
                var name = "";
                var all = "";

                for (var i = 0; i < strs.length; i++) {
                    all = strs[i].trim().split(',');
                    name = name + all[0] + ",";
                    code = code + all[1] + ",";
                }
                code = code.substring(0, code.length - 1);
                name = name.substring(0, name.length - 1);
                $("#RoomSign").val(name);
                $("#RoomID").val(code);
            };


            var column = [[
                { field: 'CommId', title: 'CommId', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: false },
                { field: 'Batch', title: '查验批次', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'BatchName', title: '查验批次', width: 80, align: 'left', sortable: false },
                { field: 'HouseId', title: '房屋id', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'HouseCode', title: '房屋/公区编码', width: 80, align: 'left', sortable: false },
                {
                    field: 'IsComplete', title: '是否完成', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var result = "否";
                        if (row.IsComplete == "1") {
                            result = "是";
                        }
                        return result;
                    }
                },
                { field: 'CompletePid', title: '完成人id', width: 40, align: 'left', sortable: false, hidden: true },
                { field: 'CompletePName', title: '完成人', width: 70, align: 'left', sortable: false },
                { field: 'CompleteDate', title: '完成时间', width: 100, align: 'left', sortable: false },
                {
                    field: 'TaskNum', title: '全部标准数量', width: 120, align: 'center', halign: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.CommId + "','" + row.HouseId + "','" + row.Batch + "','" + row.RoleCode + "','" + row.Profession + "','All')\">" + row.TaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'QualifiedTaskNum', title: '合格标准数量', width: 120, align: 'center', halign: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.CommId + "','" + row.HouseId + "','" + row.Batch + "','" + row.RoleCode + "','" + row.Profession + "','Qualified')\">" + row.QualifiedTaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'ProblemTaskNum', title: '问题标准数量', width: 120, align: 'center', halign: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.CommId + "','" + row.HouseId + "','" + row.Batch + "','" + row.RoleCode + "','" + row.Profession + "','Problem')\">" + row.ProblemTaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'RejectionNum', title: '甩项标准数量', width: 120, align: 'center', halign: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.CommId + "','" + row.HouseId + "','" + row.Batch + "','" + row.RoleCode + "','" + row.Profession + "','Rejection')\">" + row.RejectionNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'CheckTaskNum', title: '验收标准数量', width: 120, align: 'center', halign: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.CommId + "','" + row.HouseId + "','" + row.Batch + "','" + row.RoleCode + "','" + row.Profession + "','Check')\">" + row.CheckTaskNum + "</a>";
                        return str;
                    }
                }
            ]];

            //查看项目详情
            function TaskDetail(CommID, HouseId, Batch, RoleCode, Profession, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '570', '../HouseInspect/TaskStandardList.aspx?CommID=' + CommID + '&HouseId=' + HouseId + "&Batch=" + Batch +
                    '&OpType=' + OpType + '&RoleCode=' + RoleCode + '&Profession=' + Profession + '&HiCommID=' + CommID, '标准详情', false, function callback(_Data) {
                });
            }
            //导出
            function ExcelPrint() {
                var url = '../HouseInspect/Excel.aspx?ExcelName=按房屋编号查看' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&HiCommID=" + $("#HiCommID").val();
                str += "&Batch=" + $("#Batch").val();
                str += "&HouseId=" + $("#HouseId").val();
                str += "&IsComplete=" + $("#IsComplete").val();
                str += "&Type=" + $("#Type").val();
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
                        param = $.JQForm.GetParam("CsHouseInspect", "Rectification_House", "TableContainer", param);
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
