<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.SysNew.EmpowerModule.List" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>模块授权</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
     <%--授权专用easyui.js 改过源码--%>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.empower.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <style type="text/css">
        .ulRole {
            display: block;
        }

            .ulRole li {
                float: left;
                list-style: none;
                padding: 0;
                width: 176px;
                padding-left: 5px;
                display: block;
                /*border-right: 1px solid red;
            border-bottom: 1px solid red;*/
            }

        .ulSelect li {
            border: 0px solid #036;
            width: 203px;
        }

        .ulRole li checkbox {
            vertical-align: middle;
        }

        .ulRole li label {
            margin: 0 5px;
            border-radius: 2px;
            padding: 0 3px;
            vertical-align: middle;
            overflow-y: auto;
        }

        .div_mian {
            height: 205px;
            overflow-y: auto;
        }

        .frame-fieldset {
            margin-bottom: 0px;
            border: 1px solid #e5e5e5;
            padding: 10px;
        }

            .frame-fieldset .frame-legend {
                width: auto;
                display: block;
                margin: 0 0 0 0px;
                font-size: 13px;
                font-weight: bold;
                border-bottom: 0;
                padding: 0 5px;
                color: #333;
            }

        .dlg_utils_mian {
            width: 1010px;
            overflow: hidden;
            display: block;
        }

        .dlg_utils_table {
            width: 100%;
        }

            .dlg_utils_table tr td.title {
                width: 75%;
                text-align: left;
                color: #666;
                padding: 5px;
            }

            .dlg_utils_table tr td.text {
                width: 25%;
                text-align: left;
                color: #666;
                padding: 5px;
            }

        .pagination_table {
            margin: 0;
            padding: 0;
        }

            .pagination_table tr td.content {
                padding: 0 5px;
            }

        .btn_icon_clear {
            background: url('icons/clear.png') no-repeat left center;
        }

        a.btnClear {
            vertical-align: middle;
            display: inline-block;
            color: #036;
            width: 50px;
            text-indent: 19px;
            text-decoration: none;
            border-color: transparent;
            box-shadow: none;
            border-radius: 2px;
            color: #036;
            background: url(../../Jscript-Ui/jquery-easyui-1.4.4/themes/icons/clear.png) no-repeat 2px center;
        }

            a.btnClear:hover {
                background: url(../../Jscript-Ui/jquery-easyui-1.4.4/themes/icons/clear.png) no-repeat 2px center #f1f1f1;
            }

        .selected {
            background: #339933;
            color: #fff;
        }

        .cbx {
            vertical-align: text-bottom;
        }

        .lbl {
            padding-left: 3px;
        }
    </style>
</head>

<body>
    <input type="hidden" id="hdRoleValue" name="hdRoleValue" />
    <input type="hidden" id="hdSortDepCode" name="hdSortDepCode" />
    <input type="hidden" id="hdDepCode" name="hdDepCode" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'机构列表'">
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'',">
            <table id="tg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选岗位" style="width: 1024px; height: 423px; padding: 0px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <div class="dlg_utils_mian">
            <table class="dlg_utils_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <fieldset class="frame-fieldset">
                            <legend class="frame-legend">操作栏</legend>
                            上级:
                    <input id="txtSearchDepName" class="easyui-textbox" data-options="prompt:'搜索公司/片区/部门...',width:160,
                                                    icons:[{
                                                        iconCls:'icon-clear',
                                                        handler: function(e){
                                                        $(e.data.target).textbox('clear');
                                                    }}] " />
                            岗位:
                    <input id="txtSearchRoleName" class="easyui-textbox" data-options="prompt:'搜索岗位...',width:165,
                                                    icons:[{
                                                        iconCls:'icon-clear',
                                                        handler: function(e){
                                                        $(e.data.target).textbox('clear');
                                                    }}] " />
                            <a href="javascript:SearchRole()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:false,width:65">搜索</a>
                            <input id="searchCbAllPost" name="searchCbAllPost" class="easyui-checkbox" title="搜索全部岗位" data-options="labelAlign:'left',labelPosition:'after',labelWidth:53,label:'全部岗位'" />
                            <a href="javascript:void(0)" id="btnGeneralPost" class="easyui-linkbutton" onclick="javascript:SearchGeneralPost()" data-options="iconCls:'icon-reload',width:110">加载通用岗位</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:SaveRole()" data-options="iconCls:'icon-save',width:65">确定</a>
                        </fieldset>
                    </td>
                    <td class="text" valign="top" rowspan="2">
                        <fieldset class="frame-fieldset">
                            <legend class="frame-legend">
                                <label style="color: #339933" id="lblRoleSelect">已勾选岗位(0)</label>&nbsp;&nbsp;<a class="btnClear" href="javascript:ClearRole();">清空</a></legend>
                            <div class="div_mian" style="height: 328px">
                                <ul id="ulRoleSelect" class="ulRole ulSelect"></ul>
                            </div>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td class="title" valign="top">
                        <fieldset class="frame-fieldset">
                            <legend class="frame-legend" style="vertical-align: middle;">选择岗位&nbsp;&nbsp;<input id="cbPostAll" style="vertical-align: sub;" type="checkbox" onclick="SetRoleValueAll()" />&nbsp;<label for="cbPostAll" style="vertical-align: top;">全选</label></legend>
                            <div class="div_mian" style="border: 1px solid #e5e5e5">
                                <ul id="ulRole" class="ulRole"></ul>
                            </div>
                            <div style="height: 10px"></div>
                            <div class="easyui-panel">
                                <div id="pp" class="easyui-pagination" data-options=""></div>
                            </div>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        //(岗位选择)全选岗位
        function SetRoleValueAll() {
            if ($('#ulRole input[type="checkbox"]').length >= 30) { $.messager.alert('温馨提示', "防止数据过多造成页面渲染时卡死,勾选岗位总数不能超过30个!"); $("#cbPostAll").prop("checked", false); return; }
            var isCbAll = $('#cbPostAll').is(':checked');
            $('#ulRole input[type="checkbox"]').prop('checked', isCbAll);
            var roleValue = $("#hdRoleValue").val();
            var roleValueHtmlLi = $("#ulRoleSelect").html();
            var value, array, allDepName;
            $('#ulRole input[type="checkbox"]').each(function () {
                //$(this).val()获取的值是:  004576,出纳
                value = "|" + $(this).val();
                array = $(this).val().split(',');
                allDepName = $(this).prop("title");
                if (isCbAll) {
                    if (roleValue.indexOf(value) == -1) {
                        roleValue = roleValue + value;
                        roleValueHtmlLi = roleValueHtmlLi + "<li roleSel=" + array[0] + "><input id=\"cbSel" + array[0] + "\" roleSel=" + array[0] + " checked=\"checked\" type=\"checkbox\" class=\"cbPost\" onclick=\"RemoveRoleValue(this)\" value=\"" + $(this).val() + "\" /><label title=\"" + allDepName + "\" for=\"cbSel" + array[0] + "\" >" + array[1] + "</label></li>";
                    }
                } else {
                    roleValue = roleValue.replace(value, "");
                    //var d = "<li role=\"" + array[0] + "\"><input id=\"cbSel" + array[0] + "\" role=\"" + array[0] + "\" checked=\"checked\" type=\"checkbox\" class=\"cbPost\" onclick=\"SetRoleValue(this)\" value=\"\" /><label for=\"cbSel" + array[0] + "\" >" + array[1] + "</label></li>";
                    //console.log(roleValue.indexOf(value),);
                    //roleValueHtmlLi = roleValueHtmlLi.replace(d,"");
                    $("#ulRoleSelect li[roleSel^='" + array[0] + "']").remove();
                }
            });
            if (isCbAll) {
                $("#ulRole li label").addClass('selected');
                $("#ulRoleSelect").html(roleValueHtmlLi);
            } else {
                $("#ulRole li label").removeClass('selected');
            }
            $("#hdRoleValue").val(roleValue);
            $("#lblRoleSelect").text("已勾选岗位(" + $("#ulRoleSelect li").length + ")");

        }
        //(岗位选择)单个选择岗位
        function SetRoleValue(cb) {
            if ($("#ulRoleSelect li").length >= 30) { $.messager.alert('温馨提示', "防止数据过多造成页面渲染时卡死,勾选岗位总数不能超过30个!"); return; }
            var roleValue = $("#hdRoleValue").val();
            var roleValueHtmlLi = $("#ulRoleSelect").html();
            //cb.value 获取的值是:  004576,出纳
            var value = "|" + cb.value, array = cb.value.split(','), allDepName = $(cb).prop("title");
            if (cb.checked) {
                if (roleValue.indexOf(value) == -1) {
                    roleValue = roleValue + value;
                    roleValueHtmlLi = roleValueHtmlLi + "<li roleSel=" + array[0] + "><input id=\"cbSel" + array[0] + "\" roleSel=" + array[0] + " checked=\"checked\" type=\"checkbox\" class=\"cbPost\" onclick=\"RemoveRoleValue(this)\" value=\"" + cb.value + "\" /><label title=\"" + allDepName + "\" for=\"cbSel" + array[0] + "\" >" + array[1] + "</label></li>";
                    $("#ulRoleSelect").html(roleValueHtmlLi);
                }
                $(cb).next('label').addClass('selected')
            }
            else {
                roleValue = roleValue.replace(value, "");
                $("#ulRoleSelect li[roleSel^='" + array[0] + "']").remove();
                $(cb).next('label').removeClass('selected')
            }
            $("#hdRoleValue").val(roleValue);
            $("#lblRoleSelect").text("已勾选岗位(" + $("#ulRoleSelect li").length + ")");


        }

        //(已勾选岗位)清空已选择的岗位
        function ClearRole() {
            $('#ulRole input[type="checkbox"]').prop("checked", false);
            $("#cbPostAll").prop("checked", false);
            $("#ulRole li label").removeClass('selected')
            $("#ulRoleSelect").empty();
            $("#hdRoleValue").val("");
            $("#lblRoleSelect").text("已勾选岗位(" + $("#ulRoleSelect li").length + ")");
        }
        //(已勾选岗位)移除岗位
        function RemoveRoleValue(cb) {
            var role = $(cb).attr("roleSel");
            $("#ulRole input[role^='" + role + "']").prop("checked", false);
            $("#ulRole li[role^='" + role + "'] label").removeClass('selected');
            $("#ulRoleSelect li[roleSel^='" + role + "']").remove();
            $("#lbl" + role).tooltip("destroy");

            var roleValue = $("#hdRoleValue").val();
            value = "|" + $(cb).value;
            roleValue = roleValue.replace(value, "");
            $("#hdRoleValue").val(roleValue);
            $("#lblRoleSelect").text("已勾选岗位(" + $("#ulRoleSelect li").length + ")");

        }

        //搜索通用岗位
        function SearchGeneralPost() {
            $("#hdDepCode").val("加载通用岗位");
            $("#hdSortDepCode").val(""); //部门编号(短)
            $('#frm').form('clear');
            $('#pp').pagination({ pageNumber: 1 });
            GetListRole();
        }
        //搜索岗位
        function SearchRole() {
            //初始化数据
            $('#cbPostAll').prop('checked', false);
            $('#pp').pagination({ pageNumber: 1 });
            $("#hdDepCode").val("");
            if ($("input[name='searchCbAllPost']").eq(0).is(':checked')) {
                //全部岗位
                $("#hdSortDepCode").val(''); //部门编号(短)
            } else {
                var row = $('#tree').tree('getSelected');
                if (row) {
                    if (isValueNull(row.id)) {
                        $("#hdSortDepCode").val(row.id); //部门编号(短)
                    }
                }
            }
            GetListRole();
        }
        //查询岗位
        function GetListRole() {
            $('.lblPostText').tooltip('destroy');
            var time1 = new Date().getTime();
            var options = $('#pp').pagination('options');
            var param = { "SortDepCode": $("#hdSortDepCode").val(), "UpLevelName": $('#txtSearchDepName').textbox('getValue'), "RoleName": $('#txtSearchRoleName').textbox('getValue'), "DepCode": $("#hdDepCode").val(), "page": options.pageNumber, "rows": options.pageSize };
            $.dataPostJson('Empower_Utils', 'GetListRoleData', param, true, false,
                function Init() {
                },
                function callback(data) {
                    var time2 = new Date().getTime();
                    console.log("查询时间：" + (time2 - time1) + "毫秒");
                    var html = "<li><p>未检索到数据...<p></li>";
                    var value = "";
                    var checked = "";
                    var cssClass = "";
                    var roleValue = $("#hdRoleValue").val();
                    var total = 0;
                    $('#ulRole').empty();

                    if (data.rows.length > 0) {
                        html = "";
                        total = data.total;
                        var rows = data.rows;
                        var allDepName;
                        for (var i = 0; i < rows.length; i++) {
                            checked = "";
                            cssClass = "";
                            value = rows[i].RoleCode + ',' + rows[i].RoleName;
                            //console.log(roleValue.indexOf("_" + value));
                            if (roleValue.indexOf("|" + value) > -1) {
                                checked = "checked='checked'";
                                cssClass = "selected";
                            }
                            allDepName = rows[i].RoleName;
                            if (!!rows[i].UpLevelName) { allDepName = rows[i].UpLevelName + "--" + rows[i].RoleName };
                            html += '<li class="liPostText" role=' + rows[i].RoleCode + ' ><input ' + checked + ' id="cb' + rows[i].RoleCode + '" role="' + rows[i].RoleCode + '" type="checkbox" class="cbPost" onclick="SetRoleValue(this)"  value="' + value + '"  title=\"' + allDepName + '\" /><label title=\"' + allDepName + '\" class="lblPostText ' + cssClass + '" for="cb' + rows[i].RoleCode + '" >' + rows[i].RoleName + '</label></li>';
                        }
                    }
                    $('#pp').pagination({ total: total });
                    $('#ulRole').html(html);

                    //提示
                    $('.lblPostText').tooltip({
                        onShow: function () {
                            $(this).tooltip('tip').css({
                                backgroundColor: '#0070a9',
                                borderColor: '#0070a9',
                                color: '#fff',
                            });
                        },
                        position: 'top'
                    });

                    var time3 = new Date().getTime();
                    console.log("界面渲染时间：" + (time3 - time2) + "毫秒");
                },
                function completeCallback() {
                }, function errorCallback() {

                });
        }
        $(function () {
            InitControl();
            InitDataTree();
            InitTreeGrid();
        });

        //初始化控件
        function InitControl() {
            //$("#ulRole input[type='checkbox']").change(function () {
            //    if ($(this).is(":checked")) {
            //        $(this).next('label').addClass('selected')
            //    } else {
            //        $(this).next('label').removeClass("selected");
            //    }
            //});
            $('#pp').pagination({
                 pageList: [40, 80,120],
                pageSize: 40,
                pageNumber: 1,
                showPageInfo: true,
                //layout: ["list", "sep", "first", "prev", "sep", "manual", "sep", "next", "sep", "refresh", "info"],
                onSelectPage: function (pageNumber, pageSize) {
                    $(this).pagination('loading');
                    GetListRole();
                    $(this).pagination('loaded');
                },
                //beforePageText:'Page',
                afterPageText: '/{pages}',
                displayMsg: '共{total}个岗位'
            });

            $('.textbox-label-after').tooltip({
                position: 'top',
                content: '<div>温馨提示:<br/><p>1、勾选:搜索全部岗位</p><p>2、未勾选:搜索选择机构节点下的岗位(如果未选择机构则搜索全部岗位)</p></div>',
            });

            $('#btnGeneralPost').tooltip({
                position: 'top',
                content: '<div>温馨提示:<br/><p>1、不支持模糊查询</p></div>',
            });


        }

        //机构树
        function InitDataTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length == 1) {
                        //默认展开第一个节点
                        $("#tree").tree("expand", $("#tree").tree("getChildren")[0].target)
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "Empower_Utils";
                    param.Method = "GetTreeDepartment";
                },
                onBeforeSelect: function (node) {
                    //if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                    //    return false;
                    //}
                    ClearRole();
                    LoadRoleColumn(function () {
                        InitTreeGrid();
                    });
                },
                onSelect: function (row) {
                    $('#layout_center').panel('setTitle', '授权列表-' + row.text);
                    $('#frm').form('clear');
                    //InitDataGrid();
                }
            });
        }

        var toolbar = [
            {
                text: '筛选岗位',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#dlg_search').dialog('open');
                    SearchRole();

                }
            }, '-',
            {
                text: '保存权限',
                iconCls: 'icon-save',
                handler: function () {
                    $.messager.confirm('温馨提示', '确认保存吗？', function (r) {
                        if (r) {
                            Save();
                        }
                    });
                }
            }
        ];

        //加载岗位列表
        function SaveRole() {
            var role = $("#hdRoleValue").val();
            if (isValueNull(role)) {
                $('#dlg_search').dialog('close');
                LoadRoleColumn(function () {
                    InitTreeGrid();
                });
            } else {
                $.messager.alert('温馨提示', "请选择岗位!");
            }
        }
        //保存
        function Save() {
            var value = '';
            $("input[submitvalue]").each(function (i) {
                if ($(this).is(':checked') == true) {
                    value += "|" + $(this).attr("submitvalue") + ",1";
                }
                else {
                    value += "|" + $(this).attr("submitvalue") + ",0";
                }

            });
            if (!isValueNull(value)) { $.messager.alert("温馨提示", "请勾选授权岗位!"); return; }

            $.dataPostJson('Empower_Module', 'Save', { "ListRoleData": value.substr(1) }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $.messager.alert('温馨提示', "保存成功!");
                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }


        var frozenColumns = [[
            { field: 'text', title: '模块/功能', width: 500, align: 'left', halign: 'center', sortable: false }
        ]];
        var column = [[{
            field: "all", width: 400, title: "<input id=\"_\" type=\"checkbox\" onclick=\"SelTgCheckBox(this);\" class=\"cbx\" /><label for=\"_\" class=\"lbl\" >全选</label>", width: 55, align: "center",
            formatter: function (value, row, rowIndex) {
                return "<input id='cbRow_" + row.id + "' type=\"checkbox\" onclick=\"SelTgCheckBox(this);\" />";
            }
        }]];
        function LoadRoleColumn(callback) {
            column = [[]];
            // $("#hdRoleValue").val('|011698,财务部/会计|011694,熊猫仓/项目主管|011690,成都中央郡/餐饮岗');
            var roleValue = $("#hdRoleValue").val();
            if (isValueNull(roleValue)) {
                roleValue = roleValue.substr(1);
                column[0].push({
                    field: "all", width: 400, title: "<input id=\"_\" type=\"checkbox\" onclick=\"SelTgCheckBox(this);\" class=\"cbx\" /><label for=\"_\" class=\"lbl\" >全选</label>", width: 55, align: "center",
                    formatter: function (value, row, rowIndex) {
                        return "<input id='cbRow_" + row.id + "' type=\"checkbox\" onclick=\"SelTgCheckBox(this);\" />";
                    }
                });
                var arrayList = "";
                $.each(roleValue.split('|'), function (i, value) {
                    arrayList = value.split(',');
                    column[0].push({
                        field: arrayList[0], title: "<input type=\"checkbox\" id='cbCol_" + arrayList[0] + "'  onclick=\"SelTgCheckBox(this);\" class=\"cbx\"/><label for='cbCol_" + arrayList[0] + "' class=\"lbl\" >" + arrayList[1] + "</label>", align: "center",
                        formatter: function (value, row, index) {
                            var roleValue = $(this)[0].field;
                            var checkValue = row.attributes[roleValue];
                            //var checkValue = row[roleValue];
                            var checked = "";
                            if (checkValue == 1) { checked = "checked='true'"; };
                            return "<input " + checked + " type=\"checkbox\" submitvalue='" + roleValue + "," + row.id + "'  id='cbCol_" + roleValue + "_cbRow_" + row.id + "' onclick=\"SelTgCheckBox(this);\" value=" + checkValue + " />";
                        }
                    });
                });
            }
            callback();
        }
        function SelTgCheckBox(cb) {
            //  console.log(cb.id);
            $("input[id*='" + cb.id + "']").prop("checked", $(cb).is(':checked'))
        }
        function InitTreeGrid() {
            //LoadRoleColumn();
            $("#tg").treegrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                frozenColumns: frozenColumns,
                columns: column,
                idField: 'id',
                treeField: 'text',
                collapsible: true,
                toolbar: toolbar,
                nowrap: false,
                rownumbers: true,
                animate: true,
                //pagination: true,
                //pageSize: 100,
                //pageList: [100, 200, 400],
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: true,
                fit: true,
                IsColumnCheck: true,
                border: false,
                //sortOrder: "desc",
                //remoteSort: false,
                onClickCell: function (field, row) {
                    //点击单元格 勾选复选框
                    // $("tr[node-id='" + row.id + "'] td[field='" + field + "'] input[type='checkbox']").prop('checked', true);
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "Empower_Module";
                    param.Method = "GetList";
                    param.r = Math.random();
                    param.hdRoleValue = $("#hdRoleValue").val();
                    //param = $.getDataGridParam("Empower_Module", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });

            //$.dataPostJson('Empower_Module', 'GetList', { "hdRoleValue": $("#hdRoleValue").val() }, true, false,
            //    function Init() {
            //    },
            //    function callback(data) {
            //        //$('#tg').treegrid("loadData", data);
            //         $('#tg').treegrid('loadData', data);
            //        //  $('#tg').datagrid({ data: data }).datagrid('clientPaging');
            //        // setTimeout(function(){ $('#tg').treegrid().treegrid('clientPaging');},5000);
            //    },
            //    function completeCallback() {

            //    }, function errorCallback() {
            //    }
            //);


            $("#dlg_search").dialog("close");
        }


    </script>
</body>
</html>
