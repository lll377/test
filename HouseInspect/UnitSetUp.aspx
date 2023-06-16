<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitSetUp.aspx.cs" Inherits="M_Main.HouseInspect.UnitSetUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>责任单位设置</title>

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

    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>

    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script type="text/javascript" src="../jscript/Cache.js"></script>



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
                <div style="width: 100%; border-color: #cccccc" id="TableContainerPoint">
                </div>
            </div>
        </div>--%>
          <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                 <ul id="treeDemo" class="ztree">
                    </ul>
            </div>
              <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div style="width: 100%; border-color: #cccccc" id="TableContainerPoint">
                </div>
            </div>
            
        </div>


        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1100px; height: 250px; padding: 20px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" class="easyui-combobox" data-options=" multiple: true " runat="server" style="width: 153px; height: 20px">
                            <option value="" selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">楼宇名称</td>
                    <td class="TdContent">
                       <%-- <select id="BuildSNum" runat="server" name="BuildSNum" style="width: 153px; height: 20px" class="easyui-combobox" data-options=" multiple: true ">
                            <option value="" selected></option>
                        </select>--%>
                         <input id="BuildSNum" name="BuildSNum" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',multiple:true" />
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent">
                        <input id="RoomSign" typ="text" name="RoomSign" runat="server" style="width: 150px; height: 20px" onclick="RoomSeach();" />
                        <input type="hidden" id="RoomID" name="RoomID" />
                    </td>
                    <td class="TdTitle">房屋户型</td>
                    <td class="TdContent">
                        <select id="RoomModel" name="RoomModel" class="easyui-combobox" data-options=" multiple: true " runat="server" style="width: 153px; height: 20px" onclick="MoreCheclk()">
                            <option value="" selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">使用性质</td>
                    <td class="TdContent">
                        <select id="PropertyUses" name="PropertyUses" runat="server" style="width: 153px; height: 20px" class="easyui-combobox" data-options=" multiple: true ">
                            <option value="" selected></option>
                        </select>
                    </td>

                    <td class="TdTitle">房屋类型</td>
                    <td class="TdContent">
                        <select id="RoomType" name="RoomType" runat="server" style="width: 153px; height: 20px" class="easyui-combobox" data-options=" multiple: true ">
                            <option value="" selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContent">
                        <select id="RoomState" runat="server" name="RoomState" style="width: 153px; height: 20px" class="easyui-combobox" data-options=" multiple: true ">
                            <option value="" selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">建筑面积从</td>
                    <td class="TdContent">
                        <input id="BuildStartArea" name="BuildStartArea" runat="server" style="width: 150px; height: 20px" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="BuildEndArea" name="BuildEndArea" runat="server" style="width: 150px; height: 20px" /></td>
                    <td class="TdTitle">套内面积从</td>
                    <td class="TdContent">
                        <input id="InteriorStartArea" name="InteriorStartArea" runat="server" style="width: 150px; height: 20px" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="InteriorEndArea" name="InteriorEndArea" runat="server" style="width: 150px; height: 20px" /></td>

                </tr>
                <tr>
                    <td></td>
                </tr>

                <tr>
                    <td class="TdTitle">合同交房时间从</td>
                    <td class="TdContent">
                        <input id="ContSubStartDate" class="Wdate" onclick="WdatePicker()" name="ContSubStartDate" runat="server" style="width: 150px; height: 20px" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="ContSubEndDate" class="Wdate" onclick="WdatePicker()" name="ContSubEndDate" runat="server" style="width: 150px; height: 20px" /></td>
                    <td class="TdTitle">集中交房时间从</td>
                    <td class="TdContent">
                        <input id="GetHouseStartDate" class="Wdate" onclick="WdatePicker()" name="GetHouseStartDate" runat="server" style="width: 150px; height: 20px"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input id="GetHouseEndDate" class="Wdate" onclick="WdatePicker()" name="GetHouseEndDate" runat="server" style="width: 150px; height: 20px"></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr style="height: 10px;">
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
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
        <%--当前项目ID--%>
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input type="hidden" id="CommName" name="CommName" runat="server" />
        <%--房间ID--%>
        <input type="hidden" id="RoomIDs" name="RoomIDs" />
        <%--全选--%>
        <input type="hidden" id="CheckAll" name="CheckAll" value="0" runat="server" />

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; margin-left: 50px; margin-top: -70px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <script language="javascript" type="text/javascript">

            function GetParam() {
                var str = "";
                //项目 CommId
                str += "CommId=" + $("#CommId").val();

                //建筑面积 BuildStartArea BuildEndArea  套内面积 InteriorStartArea InteriorEndArea
                str += "&BuildStartArea=" + $("#BuildStartArea").val() + "&BuildEndArea=" + $("#BuildEndArea").val() + "&InteriorStartArea=" + $("#InteriorStartArea").val() + "&InteriorEndArea=" + $("#InteriorEndArea").val();
                //合同交房时间 ContSubStartDate ContSubEndDate 集中交房时间 GetHouseStartDate GetHouseEndDate
                str += "&ContSubStartDate=" + $("#ContSubStartDate").val() + "&ContSubEndDate=" + $("#ContSubEndDate").val() + "&GetHouseStartDate=" + $("#GetHouseStartDate").val() + "&GetHouseEndDate=" + $("#GetHouseEndDate").val();

                //组团区域 RegionSNum
                var strRegionSNum = $("input:hidden[name='RegionSNum']");
                var RegionSNum = '';
                $.each(strRegionSNum, function (index, item) {
                    RegionSNum += ',' + item.value;
                });
                if (RegionSNum.length > 0);
                {
                    str += '&RegionSNum=' + RegionSNum.substr(1, RegionSNum.length - 1);
                }

                ////楼宇名称 BuildSNum
                //var strBuildSNum = $("input:hidden[name='BuildSNum']");
                //var BuildSNum = '';
                //$.each(strBuildSNum, function (index, item) {
                //    BuildSNum += ',' + item.value;
                //});
                //if (BuildSNum.length > 0);
                //{
                //    str += '&BuildSNum=' + BuildSNum.substr(1, BuildSNum.length - 1)
                //}
                if ($("#BuildSNum").combobox("getValues").length > 0) {
                    str += '&BuildSNum=' + $("#BuildSNum").combobox("getValues")

                }

                //房屋编号 RoomID
                var strRoomID = $("input:hidden[name='RoomID']");
                var RoomID = '';
                $.each(strRoomID, function (index, item) {
                    RoomID += ',' + item.value;
                });
                if (RoomID.length > 0);
                {
                    str += '&RoomID=' + RoomID.substr(1, RoomID.length - 1)
                }
                //房屋户型 RoomModel
                var strRoomModel = $("input:hidden[name='RoomModel']");
                var RoomModel = '';
                $.each(strRoomModel, function (index, item) {
                    RoomModel += ',' + item.value;
                });
                if (RoomModel.length > 0);
                {
                    str += '&RoomModel=' + RoomModel.substr(1, RoomModel.length - 1)
                }
                //使用性质 PropertyUses
                var strPropertyUses = $("input:hidden[name='PropertyUses']");
                var PropertyUses = '';
                $.each(strPropertyUses, function (index, item) {
                    PropertyUses += ',' + item.value;
                });
                if (PropertyUses.length > 0);
                {
                    str += '&PropertyUses=' + PropertyUses.substr(1, PropertyUses.length - 1)
                }
                //房屋类型 RoomType
                var strRoomType = $("input:hidden[name='RoomType']");
                var RoomType = '';
                $.each(strRoomType, function (index, item) {
                    RoomType += ',' + item.value;
                });
                if (RoomType.length > 0);
                {
                    str += '&RoomType=' + RoomType.substr(1, RoomType.length - 1)
                }
                //交房状态 RoomState
                var strRoomState = $("input:hidden[name='RoomState']");
                var RoomState = '';
                $.each(strRoomState, function (index, item) {
                    RoomState += ',' + item.value;
                });
                if (RoomState.length > 0);
                {
                    str += '&RoomState=' + RoomState.substr(1, RoomState.length - 1)
                }
                return encodeURI(str);
            }

            function btnClear() {
                $("#PlanName").val("");
                $("#FrequencyTitle").val("");
                $("#RoleName").val("");
                $("#TaskRoleCode").val("");
                $("#LevelId").val("");
            }


            function RoomSeach() {
                HDialog.Open('650', '600', '../HouseInspect/RoomDlg.aspx?CommID=' + $("#CommId").val() + "&Type=1", '选择房屋', false, function callback(_Data) {
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
                LoadBuildSNum(str[2]);
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
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 20, align: 'left', sortable: true },
                { field: 'RegionName', title: '组团区域', width: 20, align: 'left', sortable: true },
                { field: 'BuildName', title: '楼宇', width: 20, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 20, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 20, align: 'left', sortable: true },
                { field: 'DictionaryName', title: '房屋户型', width: 20, align: 'left', sortable: true },
                { field: 'BuildArea', title: '建筑面积', width: 20, align: 'left', sortable: true },
                { field: 'InteriorArea', title: '套内面积', width: 20, align: 'left', sortable: true },
                { field: 'CommonArea', title: '公摊面积', width: 20, align: 'left', sortable: true },
                {
                    field: 'ZRUnitName', title: '责任/整改单位', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a sclass=\"HrefStyle\" onclick=\"ObjectUnitInfo('" + row.CommID + "','" + row.RoomID + "');\" href=\"#\">查看</a>";
                        return str;
                    }
                },
                {
                    field: 'Drawing', title: '查验图纸', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a sclass=\"HrefStyle\" onclick=\"DrawingInfo('" + row.RoomID + "','" + row.CommID + "');\" href=\"#\">查看</a>";
                        return str;
                    }
                },
            ]];

            //查看图纸详情
            function DrawingInfo(RoomID, CommID) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../HouseInspect/DrawingInfo.aspx?RoomID=' + RoomID + '&CommID=' + CommID, '查验图纸详情', false, function callback(_Data) {
                });
            }


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '设置',
                    iconCls: 'icon-filter',
                    handler: function () {
                        if ($("#RoomIDs").val() == "") {
                            HDialog.Info("请选择房屋!");
                            return;
                        }
                        SetUnit();
                    }
                }, '-',
                {
                    text: "全选",
                    iconCls: 'icon-ok',
                    handler: function () {
                        if ($("#CommId").val() == "" || $("#CommId").val() == "0") {
                            HDialog.Info("请先选择项目!");
                            return;
                        }
                        var canSet;//是否可以全选录入
                        $.ajax({
                            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=CheckUnitSetUpList&' + GetParam(),
                            type: 'POST',
                            dataType: 'text',
                            cache: false,
                            async: false,
                            success: function (_Data) {
                                if (_Data > "") {
                                    HDialog.Info(_Data);
                                    canSet = false;
                                } else {
                                    canSet = true;
                                }
                            },
                            complete: function (XMLHttpRequest, textStatus, errorThrown) {

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                HDialog.Info("数据读取错误");
                                bool = false;
                            }
                        });
                        if (canSet) {
                            $("#CheckAll").val("1");
                            SetUnit();
                        }
                    }
                }
            ];

            var pageRole = "<%=pageRole %>";


            function SetProgressObj(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj);
                $('#DivMsg').html('');
            }
            function LoadList() {
                var url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetUnitSetUpList&' + GetParam();

                $("#TableContainerPoint").datagrid({
                    url: url,
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: 200,
                    pageList: [200, 500, 1000],
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
                    },
                    sortOrder: "asc",
                    //onBeforeLoad: function (param) {
                    //    param = $.JQForm.GetParam("CsHouseInspect", "GetUnitSetUpList", "TableContainerPoint", param);
                    //},
                    onCheck: function (rowIndex, rowData) {
                        var Roomid = $("#RoomIDs").val();
                        Roomid += rowData.RoomID + ",";
                        $("#RoomIDs").val(Roomid);
                        $("#CheckAll").val("0");
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var kk = $("#RoomIDs").val();
                        var ff = "";
                        var jj = new Array();
                        jj = kk.split(',');
                        if (jj.length > 1) {
                            for (var i = 0; i < jj.length - 1; i++) {
                                if (jj[i] != rowData.RoomID) {
                                    ff += jj[i] + ",";
                                }
                            }
                        } else {
                            ff = "";
                        }

                        $("#RoomIDs").val(ff);
                        $("#CheckAll").val("0");
                    },
                    onCheckAll: function (rows) {
                        var data = "";
                        for (var i = 0; i < rows.length; i++) {
                            data += rows[i].RoomID + ",";
                        }
                        $("#RoomIDs").val(data);
                        $("#CheckAll").val("0");
                    },
                    onUncheckAll: function (rows) {

                        $("#RoomIDs").val("");
                        $("#CheckAll").val("0");
                    }
                });
                $("#SearchDlgSave").dialog("close");
                $("#SearchDlg").dialog("close");
            }

            ////新增责任单位
            //function Detail() {
            //    $('.easyui-dialog').parent().appendTo($("form:first"));
            //    HDialog.Open('740', '300', '../HouseInspect/AddUnitFiling.aspx?CommID=' + $("#CommId").val() , '新增责任单位', false, function callback(_Data) {
            //        if (_Data != '') {
            //            LoadList();
            //        }
            //    });
            //}

            //查看对象,责任/整改单位详情
            function ObjectUnitInfo(CommID, RoomID) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '600', '../HouseInspect/ObjectUnitInfo.aspx?CommID=' + $("#CommId").val() + "&RoomID=" + RoomID, '单位详情', false, function callback(_Data) {
                    if (_Data != '') {
                        // LoadList();
                    }
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

            //把筛选条件放进缓存
            function SetCache() {
                //建筑面积 BuildStartArea BuildEndArea  套内面积 InteriorStartArea InteriorEndArea
                Cache.SetData("BuildStartArea", $("#BuildStartArea").val());
                Cache.SetData("BuildEndArea", $("#BuildEndArea").val());
                Cache.SetData("InteriorStartArea", $("#InteriorStartArea").val());
                Cache.SetData("InteriorEndArea", $("#InteriorEndArea").val());

                //合同交房时间 ContSubStartDate ContSubEndDate 集中交房时间 GetHouseStartDate GetHouseEndDate
                Cache.SetData("ContSubStartDate", $("#ContSubStartDate").val());
                Cache.SetData("ContSubEndDate", $("#ContSubEndDate").val());
                Cache.SetData("GetHouseStartDate", $("#GetHouseStartDate").val());
                Cache.SetData("GetHouseEndDate", $("#GetHouseEndDate").val());

                //组团区域 RegionSNum
                var strRegionSNum = $("input:hidden[name='RegionSNum']");
                var RegionSNum = '';
                $.each(strRegionSNum, function (index, item) {
                    RegionSNum += ',' + item.value;
                });
                if (RegionSNum.length > 0);
                {
                    Cache.SetData("RegionSNum", RegionSNum.substr(1, RegionSNum.length - 1));
                }

                ////楼宇名称 BuildSNum
                //var strBuildSNum = $("input:hidden[name='BuildSNum']");
                //var BuildSNum = '';
                //$.each(strBuildSNum, function (index, item) {
                //    BuildSNum += ',' + item.value;
                //});
                //if (BuildSNum.length > 0);
                //{
                //    Cache.SetData("BuildSNum", BuildSNum.substr(1, BuildSNum.length - 1));
                //}
                if ($("#BuildSNum").combobox("getValues").length > 0) {
                    Cache.SetData("BuildSNum", $("#BuildSNum").combobox("getValues"));
                }

                //房屋编号 RoomID

                Cache.SetData("RoomID", $("#RoomID").val());

                //房屋编号 RoomID
                Cache.SetData("RoomIDs", $("#RoomIDs").val());

                //项目ID
                Cache.SetData("CommID", $("#CommId").val());
                //是否全选
                Cache.SetData("CheckAll", $("#CheckAll").val());

                var rows = $('#TableContainerPoint').datagrid("getChecked");
                Cache.SetData("rows", JSON.stringify(rows));

                //房屋户型 RoomModel
                var strRoomModel = $("input:hidden[name='RoomModel']");
                var RoomModel = '';
                $.each(strRoomModel, function (index, item) {
                    RoomModel += ',' + item.value;
                });
                if (RoomModel.length > 0);
                {
                    Cache.SetData("RoomModel", RoomModel.substr(1, RoomModel.length - 1));
                }
                //使用性质 PropertyUses
                var strPropertyUses = $("input:hidden[name='PropertyUses']");
                var PropertyUses = '';
                $.each(strPropertyUses, function (index, item) {
                    PropertyUses += ',' + item.value;
                });
                if (PropertyUses.length > 0);
                {
                    Cache.SetData("PropertyUses", PropertyUses.substr(1, PropertyUses.length - 1));
                }
                //房屋类型 RoomType
                var strRoomType = $("input:hidden[name='RoomType']");
                var RoomType = '';
                $.each(strRoomType, function (index, item) {
                    RoomType += ',' + item.value;
                });
                if (RoomType.length > 0);
                {
                    Cache.SetData("RoomType", RoomType.substr(1, RoomType.length - 1));
                }
                //交房状态 RoomState
                var strRoomState = $("input:hidden[name='RoomState']");
                var RoomState = '';
                $.each(strRoomState, function (index, item) {
                    RoomState += ',' + item.value;
                });
                if (RoomState.length > 0);
                {
                    Cache.SetData("RoomState", RoomState.substr(1, RoomState.length - 1));
                }
            }

            //设置
            function SetUnit() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                //全选时使用的筛选条件,放到缓存中
                SetCache();
                HDialog.Open('1000', '600', '../HouseInspect/SetUnitFrame.aspx?RoomIDs=' + $("#RoomIDs").val() + "&CommID=" + $("#CommId").val() + "&CheckAll=" + $("#CheckAll").val(), '设置', false, function callback(_Data) {
                    if (_Data != '') {
                        // LoadList();
                    }
                });
            }

            //加载楼宇
            function LoadBuildSNum(HiCommID) {
                var varObjects;
                $.tool.DataPostAsync('CsHouseInspect', 'GetBuildSNumList', 'CommID=' + HiCommID,
                    function Init() {
                    },
                    function callback(_Data) {
                        console.log(_Data)
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象

                        console.log(varObjects)
                        $("#BuildSNum").find("option:gt(0)").remove();
                        $("#BuildSNum").combobox({
                            width: 156,
                            valueField: "BuildSNum",
                            textField: "BuildName",
                            data: varObjects,
                            filter: function (q, row) {
                                var opts = $(this).combobox('options');
                                return row[opts.textField].indexOf(q) >= 1;
                            }
                        });
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }


        </script>
    </form>
</body>
</html>


