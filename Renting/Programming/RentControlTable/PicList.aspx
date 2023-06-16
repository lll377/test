<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PicList.aspx.cs" Inherits="M_Main.Renting.Programming.RentControlTable.PicList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-租控表图形设置</title>
    <link href="/HM/M_Main/css/button.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>

    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/layer/layer.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/context/drag.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/context/context.js"></script>
    <link href="/HM/M_Main/Jscript-Ui/context/context.standalone.css" rel="stylesheet" />
    <style type="text/css">
        #layout_center {
            margin: 0;
            padding: 0;
            font: 14px/1.5em simsun;
            overflow: hidden;
            width: 100%;
            height: 100%;
        }

        .pagination-info {
            display: none;
        }

        .button {
            height: 26px;
            line-height: 26px;
            width: 80px;
        }

        #canvas {
            position: absolute;
            left: 0px;
            top: 0px;
            z-index: 9;
            border: 2px dashed #ccc;
            padding: 10px;
            background: #fff;
        }

        .transparent {
            filter: alpha(opacity=50);
            -moz-opacity: 0.5;
            -khtml-opacity: 0.5;
            opacity: 0.5;
        }

        .box {
            width: 200px;
            height: 100px;
            cursor: move;
            position: absolute;
            top: 30px;
            left: 30px;
            z-index: 99;
        }

            .box .bg {
                width: 100%;
                height: 100%;
                background-color: orange;
            }

            .box .coor {
                width: 10px;
                height: 10px;
                overflow: hidden;
                cursor: se-resize;
                position: absolute;
                right: 0;
                bottom: 0;
                background-color: red;
            }

            .box .content {
                position: absolute;
                left: 50%;
                top: 50%;
                z-index: 99;
                text-align: center;
                font: bold 14px/1.5em simsun;
                background-color: transparent;
                border: none;
            }

        #toolbar {
            position: absolute;
            left: 10px;
            top: 10px;
            z-index: 88;
        }
    </style>
</head>
<body id="layout" class="easyui-layout" data-options="fit:true" style="padding: 0px; margin: 0px; overflow: auto;">
    <div data-options="region:'west',border:false,title:'平面图信息',expandMode:'dock'" style="overflow: hidden; width: 340px">
        <div id="TableContainerPic" style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: #cccccc;"></div>
    </div>
    <div id="layout_center" data-options="region:'center',border:false">
        <div id="toolbar">
            <input type="button" value="添加区域" class="button" id="btn_Add" onclick="AddPlanarGraphArea()" />
            <input type="button" value="锁定区域" class="button" id="btn_Lock" onclick="LockPlanarGraphArea()" />
            <input type="button" value="保存设计" class="button" id="btn_Save" onclick="SavePlanarGraphArea()" />
        </div>
        <div id="canvas">
            <p>您的系统不支持此程序!</p>
        </div>
    </div>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitDataGrid();
        });

        //加载 列表
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var guid = new GUID();
                    Edit(guid.newGUID(), 'add');
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerPic").datagrid("getSelected");
                    if (row) {
                        Edit(row.ID, 'edit');
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerPic").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的平面图数据?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_RentControlTable', 'DelPic', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        InitDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }
        ];
        var column = [[
            { field: 'PlanarGraphName', title: '平面图名称', width: 100, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainerPic").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_RentControlTable", "GetPicList", param);
                },
                onSelect: function (rowIndex, rowData) {
                    //选择平面图加载平面图和平面图区块
                    LoadPlanarGraph(rowData);
                },
                onLoadSuccess: function (data) {
                    if (data.rows.length > 0) {
                        $(this).datagrid("selectRow", "0");
                    }
                },
                onLoadError: function (data) {
                }
            });
        }
        function Edit(id, OpType) {
            var param = { "OpType": OpType, "ID": id };
            LayerDialog.OpenWin('500', '420', '/HM/M_Main/Renting/Programming/RentControlTable/PicEdit.aspx?' + $.param(param), "平面图编辑", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitDataGrid();
                }
            });
        }

        /* 加载平面图设计和平面图 */

        //初始化计数器
        //区块锁定标识
        var lock = false;

        //右键菜单参数
        context.init({
            fadeSpeed: 100,
            filter: function ($obj) { },
            above: 'auto',
            preventDoubleContext: true,
            compress: false
        });

        function LoadPlanarGraph(rowData) {
            lock = false;
            //加载平面图
            $('#canvas').html('<img class="PicImg" src="' + rowData.PlanarGraphUrl + '" />');
            //创建拖拽方法
            $("#canvas").mousedown(function (e) {
                var canvas = $(this);
                e.preventDefault();
                var pos = $(this).position();
                this.posix = { 'x': e.pageX - pos.left, 'y': e.pageY - pos.top };
                $.extend(document, {
                    'move': true, 'move_target': this, 'call_down': function (e, posix) {
                        canvas.css({
                            'cursor': 'move',
                            'top': e.pageY - posix.y,
                            'left': e.pageX - posix.x
                        });
                    }, 'call_up': function () {
                        canvas.css('cursor', 'default');
                    }
                });
            }).on('mousedown', '.box', function (e) {
                if (lock) return;
                var pos = $(this).position();
                this.posix = { 'x': e.pageX - pos.left, 'y': e.pageY - pos.top };
                $.extend(document, { 'move': true, 'move_target': this });
                e.stopPropagation();
            }).on('mousedown', '.box .coor', function (e) {
                var $box = $(this).parent();
                var posix = {
                    'w': $box.width(),
                    'h': $box.height(),
                    'x': e.pageX,
                    'y': e.pageY
                };
                $.extend(document, {
                    'move': true, 'call_down': function (e) {
                        $box.css({
                            'width': Math.max(30, e.pageX - posix.x + posix.w),
                            'height': Math.max(30, e.pageY - posix.y + posix.h)
                        });
                    }
                });
                e.stopPropagation();
            });

            //获取平面图上的区块数据
            $.dataPostJson('Renting_RentControlTable', 'GetAllPlanarGraphDetail', { "PlanarGraphID": rowData.ID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        var ResultData = $.parseJSON(data.data);
                        ResultData.forEach((itemRow) => {
                            createBox(itemRow);
                        });
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //创建区块
        function createBox(data) {
            var guid = new GUID();
            var dataId = data.ID || guid.newGUID();
            var value = data.Text || '';
            var color = data.Color || '';
            var height = data.Height || 0;
            var width = data.Width || 0;
            var pageX = parseInt(data.PageX) || 0;
            var pageY = parseInt(data.PageY) || 0;
            var ItemData = data.ItemData.replaceAll('"', "'");
            //更新计数器并记录当前计数
            //创建区域块
            var pos = $("#canvas").position();
            var box = $('<div class="box" dataId="' + dataId + '" ItemData="' + ItemData + '" ><pre class="content">' + value + '</pre><div class="bg transparent" style="background-color:' + color + '"></div><div class="coor transparent"></div></div>').css({
                width: width,
                height: height,
                top: pageY > 0 ? pageY : (pos.top > 0 ? 0 : pos.top * -1 + 50),
                left: pageX > 0 ? pageX : (pos.left > 0 ? 0 : pos.left * -1 + 30)
            }).appendTo("#canvas");

            //计算文本位置
            box.find('.content').css({
                marginLeft: box.find('.content').width() / 2 * -1,
                marginTop: box.find('.content').height() / 2 * -1
            });
            //创建右键菜单
            context.attach('.box[dataId=' + dataId + ']', [
                {
                    text: '修改',
                    action: function (e) {
                        e.preventDefault();
                        localStorage.setItem("PlanarGraphData", JSON.stringify(data));
                        let param = { "ID": dataId };
                        LayerDialog.OpenWin('700', '540', '/HM/M_Main/Renting/Programming/RentControlTable/PlanarGraphDetail.aspx?' + $.param(param), "平面图区域新增", true, function callback(_Data) {
                            if (_Data != "") {
                                var Obj = $.parseJSON(_Data);
                                data = Obj;
                                //设置文本
                                var curCont = $('.box[dataId=' + dataId + '] .content');
                                curCont.text(Obj.Text).css({
                                    marginLeft: curCont.width() / 2 * -1,
                                    marginTop: curCont.height() / 2 * -1
                                });
                                //设置颜色
                                var Curbg = $('.box[dataId=' + dataId + '] .bg');
                                Curbg.css({ "background-color": Obj.Color });
                                //设置房屋数据
                                $('.box[dataId=' + dataId + ']').attr('ItemData', Obj.ItemData);
                            }
                        });
                    }
                },
                {
                    text: '删除', action: function (e) {
                        e.preventDefault();
                        $('.box[dataId=' + dataId + ']').remove();
                    }
                }
            ]);
        }

        //添加平面图区块
        function AddPlanarGraphArea() {
            let param = { "ID": "" };
            LayerDialog.OpenWin('700', '540', '/HM/M_Main/Renting/Programming/RentControlTable/PlanarGraphDetail.aspx?' + $.param(param), "平面图区域新增", true, function callback(_Data) {
                if (_Data != "") {
                    createBox($.parseJSON(_Data));
                }
            });
        }

        //锁定解锁平面图区块
        function LockPlanarGraphArea() {
            if (lock) {
                $('#btn_Lock').val("锁定区域");
                lock = false;
                $('.box .coor').show();
            } else {
                $('#btn_Lock').val("解锁区域");
                lock = true;
                $('.box .coor').hide();
            }
        }
        //保存平面图区块数据
        function SavePlanarGraphArea() {
            //获取平面图区块数据
            var ResultData = [];
            $('.box').each(function () {
                var ItemBox = {
                    ID: $(this).attr("dataId"),
                    Text: $(this).find('.content').text(),
                    Color: $(this).find('.bg').css('background-color'),
                    Height: $(this).height(),
                    Width: $(this).width(),
                    PageX: $(this).position().left,
                    PageY: $(this).position().top,
                    ItemData: []
                };
                if ($(this).attr('ItemData') != "" && $(this).attr('ItemData') != "[]") {
                    ItemBox.ItemData = $.parseJSON($(this).attr('ItemData').replaceAll("'", '"'));
                }
                ResultData.push(ItemBox);
            });
            var SelectRow = $('#TableContainerPic').datagrid("getSelected");
            if (!SelectRow) {
                $.messager.alert("温馨提示", '请选择平面图!');
                return;
            }
            $.dataPostJson('Renting_RentControlTable', 'SavePlanarGraphDetail', { "ResultData": JSON.stringify(ResultData), "PlanarGraphID": SelectRow.ID }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $.messager.alert("温馨提示", "保存成功！");
                    } else { $.messager.alert("温馨提示", data.msg); }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

    </script>
</body>
</html>
