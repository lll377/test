<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitFiling.aspx.cs" Inherits="M_Main.HouseInspect.UnitFiling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/workflow.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script type="text/javascript">
        $.fn.combobox.defaults.filter = function (q, row) {
            var opts = $(this).combobox('options');
            return row[opts.textField].indexOf(q) >= 0;
        }
    </script>
    <style type="text/css">
        .datagrid-mask {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            opacity: 0.3;
            filter: alpha(opacity=30);
        }

        .datagrid-mask-msg {
            position: absolute;
            top: 50%;
            margin-top: -20px;
            padding: 10px 5px 10px 30px;
            width: auto;
            height: 16px;
            border-width: 2px;
            border-style: solid;
        }
    </style>
</head>

<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />

       <%-- <div style="width: 100%; height: 100%">
            <div id="divHeight" style="width: 25%; float: left; height: 590px; overflow: auto;">
                <div class="BtnDown" id="Depart" style="width: 100%;">项目</div>
                <div id="divMenuTree">
                    <ul id="treeDemo" class="ztree">
                    </ul>
                </div>
            </div>

            <div style="width: 75%; float: left; height: 100%;">

                <div style="width: 100%; background-color: #cccccc;" id="TableContainerPoint">
                </div>
            </div>
        </div>--%>
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                 <ul id="treeDemo" class="ztree">
                    </ul>
            </div>
              <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                 <div style="width: 100%; background-color: #cccccc;" id="TableContainerPoint">
                </div>
            </div>
            
        </div>


        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">单位类型:</td>
                    <td class="TdContent">

                        <select id="UnitType" name="UnitType"  style="width: 200px; border: 1px solid #cccccc; height: 23px;">
                            <option value="">全部</option>
                            <option value="1">责任单位</option>
                            <option value="2">整改单位</option>
                            <option value="3">责任单位,整改单位</option>
                        </select>

                    </td>
                    <td class="TdTitle">单位名称:</td>
                    <td class="TdContent">
                        <input type="text" id="UnitName" name="UnitName" class="easyui-validatebox" style="width: 200px;height: 20px" />
                    </td>

                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">联系人:</td>
                    <td class="TdContent">
                       <input type="text" id="Contacts" name="Contacts" class="easyui-validatebox" style="width: 196px;height: 20px" />
                    </td>
                    <td class="TdTitle">联系电话:</td>
                    <td class="TdContent">
                        <input type="text" id="ContactNumber" name="ContactNumber" class="easyui-validatebox" style="width: 200px;height: 20px"/>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">所属专业:</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 200px;height: 20px" data-options="required:true">
                      </select>
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClear();">清空</a>--%>
                        </td>
                </tr>
            </table>
        </div>
       
        <input id="hidID" type="hidden" size="2" name="hidID" runat="server" />
        <input id="SelIndex" type="hidden" size="2" name="SelIndex" runat="server" />
        <input id="OrganCode" type="hidden" size="2" name="OrganCode" runat="server" />
        <input id="OrganName" type="hidden" size="2" name="OrganName" runat="server" />
        <input id="PrentOrganCode" type="hidden" name="PrentOrganCode" runat="server" />
        <input id="varReturn" type="hidden" name="varReturn" runat="server" />
        <input id="PointId" type="hidden" name="PointId" runat="server" />
        <input id="PointIdList" type="hidden" name="PointIdList" runat="server" />
        <input id="Object" type="hidden" name="Object" runat="server" />
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="Point" type="hidden" name="Point" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />


        <input type="hidden" id="CommName" name="CommName"/>


        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; margin-left: 50px; margin-top: -70px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <script language="javascript" type="text/javascript">

            function btnClear() {
                $("#PlanName").val("");
                $("#FrequencyTitle").val("");
                $("#RoleName").val("");
                $("#TaskRoleCode").val("");
                $("#LevelId").val("");
            }


            function GW() {
                HDialog.Open('650', '600', '../ComprehensivePatrols/RightFrameCommunityRightManage.aspx?DepCode=&returnValue=', '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        LoadRoleCol(_Data);
                    };
                })
            };
            function LoadRoleCol(obj) {

                var strs = new Array();
                strs = obj.split(',');
                var code = "";
                var name = "";
                var all = "";
                for (var i = 0; i < strs.length; i++) {
                    all = strs[i].trim().split(/\s+/);
                    code = code + all[0] + ",";
                    name = name + all[1] + ",";
                }
                code = code.substring(0, code.length - 1);
                name = name.substring(0, name.length - 1);
                $("#RoleName").val(name);
                $("#TaskRoleCode").val(code);
            };


            function LoadTaskLevel() {
                $.tool.DataPostAsync('CpComPatrols', 'LoadTaskLevelCombobox', "",
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $("#LevelId").html("<option value=\"\"></option>");
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                $("#LevelId").append("<option value=\"" + varObjects[i].LevelId + "\">" + varObjects[i].TaskLevelName + "</option>");
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }
            //加载项目节点
            function getFont(treeId, node) {
                return node.font ? node.font : {};
            }
            function btnOK_onclick(strNodeData) {
                var str = strNodeData.split('|');
                document.getElementById("hidID").value = "";

                document.getElementById("OrganCode").value = str[0];
                document.getElementById("OrganName").value = str[1];
                document.getElementById("CommName").value = str[1];
                document.getElementById("CommId").value = str[2];
                LoadList();
            }
            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "OrganCode",
                        pIdKey: "PrentOrganCode"
                    },
                    key: {
                        name: "OrganName"
                    }
                },
                view: {
                    fontCss: getFont,
                    nameIsHTML: true
                }
            };
            var n =<%= zNodes %>;
            var newN = [];
            for (var i = 0; i < n.length; i++) {
                var strData = "";
                strData = n[i]["OrganCode"] + "|" + n[i]["OrganName"] + "|" + n[i]["InPopedom"];
                newN[i] = { OrganCode: n[i]["OrganCode"], PrentOrganCode: n[i]["PrentOrganCode"], OrganName: n[i]["OrganName"], InPopedom: n[i]["InPopedom"], click: "btnOK_onclick('" + strData + "')", open: 'true' };
            }
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
            $(document).ready(function () {
                var nodes = treeObj.getNodes();
                if (nodes.length > 0) {
                    treeObj.selectNode(nodes[0], true);
                    var strData = nodes[0]["OrganCode"] + "|" + nodes[0]["OrganName"] + "|" + nodes[0]["InPopedom"];
                    btnOK_onclick(strData);
                }
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainerPoint").css("height", h + "px");
                $("#divHeight").css("height", h + "px");
                $("#layout").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                { field: 'CommName', title: '项目名称', width: 20, align: 'left', sortable: true },
                { field: 'Sort', title: '序号', width: 5, align: 'left', sortable: true },
                {
                    field: 'UnitType', title: '单位类型', width: 15, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.UnitType == "1") {
                            str = "[责任单位]";
                        } else if (row.UnitType == "2") {
                            str = "[整改单位]";
                        } else {
                            str = "[责任单位] [整改单位]";
                        }
                        return str;
                    }
                },
                { field: 'UnitName', title: '单位名称(详情链接)', width: 20, align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = "<a sclass=\"HrefStyle\" onclick=\"UnitInfo('" + row.ResponsibleUnitFile + "');\" href=\"#\">" + row.UnitName + "</a>";
                        return str;
                    }
                },
                { field: 'ProfessionName', title: '所属专业', width: 10, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事区域', width: 10, align: 'left', sortable: true },
                { field: 'Contacts', title: '联系人', width: 10, align: 'left', sortable: true },
                {
                    field: 'ContactNumber', title: '联系电话', width: 14, align: 'left', sortable: true
                }
            ]];

            var toolbar = [
                 {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CommId").val() == "" || $("#CommId").val()=="0") {
                            HDialog.Info("请在左侧选择项目");
                            return;
                        }
                        Detail();
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainerPoint").datagrid("getSelected");

                        if (row == null) {
                            HDialog.Info("请先选择一行数据!");
                            return;
                        }
                        DelStandard(row.ResponsibleUnitFile);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
               ];
            var pageRole = "<%=pageRole %>";
           
            function SetProgressObj(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj);
                $('#DivMsg').html('');
            }
            function LoadList() {
                $("#TableContainerPoint").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetUnitFilingList&' + $('#frmFrom').serialize(),
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    singleSelect: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    onClickRow: function (rowIndex, rowData) {
                    }
                });
                $("#SearchDlgSave").dialog("close");
                $("#SearchDlg").dialog("close");
            }

            //新增责任单位
            function Detail() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('770', '450', '../HouseInspect/AddUnitFiling.aspx?CommID=' + $("#CommId").val() , '新增责任单位', false, function callback(_Data) {
                        LoadList();
                });
            }

            //单位详情
            function UnitInfo(ResponsibleUnitFile) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('770', '450', '../HouseInspect/UnitInfo.aspx?ResponsibleUnitFile=' + ResponsibleUnitFile , '单位详情', false, function callback(_Data) {
                       LoadList();
                });
            }


            function DelStandard(id) {

                $.tool.DataGet('CsHouseInspect', 'DeleteUniFiling', 'id=' + id,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


        </script>
    </form>
</body>
</html>


