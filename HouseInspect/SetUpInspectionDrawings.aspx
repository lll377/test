<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetUpInspectionDrawings.aspx.cs" Inherits="M_Main.HouseInspect.SetUpInspectionDrawings" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>查验图纸设置</title>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <div style="width: 100%; height: 100%; display:none">
        <div id="SearchDlg" class="easyui-dialog" title="新增批次图纸" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 125px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                   <td class="TdTitle">适用查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 74%;height:20px">
                        </select>
                    </td>
                    <td class="TdTitle">添加数量</td>
                    <td class="TdContent">
                        <input id="Num" name="Num" type="number" value="1" style="height:18px"/>
                    </td>
                </tr>
                
                
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Add();">确定</a>
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="btnClear();">清空</a>--%>
                        </td>
                </tr>
            </table>
        </div>
        </div>
    <form id="FrmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
        <input type="hidden" id="Index" name="Index" />

        <%--全选--%>
        <input type="hidden" id="CheckAll" name="CheckAll" value="0" runat="server" />


        <input id="index" name="index" type="hidden" />
        <div style="width: 100%; height: 100%;" id="TableContainer">
        </div>
        <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />
        <script type="text/javascript" src="../jscript/Cache.js"></script>
        <script language="javascript" type="text/javascript">

            function load() {
                $("#CommID").val(Cache.GetData("CommID"))

                $("#RoomID").val(Cache.GetData("RoomIDs"))
                $("#CheckAll").val(Cache.GetData("CheckAll"))

                //var rows = Cache.GetData("rows");
                //var arrRet = JSON.parse(rows);

                //var RoomID = "";
                //for (var i = 0; i < arrRet.length; i++) {
                //    RoomID += arrRet[i].RoomID + ",";
                //}
                //$("#RoomID").val(RoomID)
            }
            load();

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Name', title: '查验批次', width: 50, align: 'left', sortable: true },
                {
                    field: 'CYTZ', title: '查验图纸', width: 50, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a sclass=\"HrefStyle\" onclick=\"AddDrawings(parseInt('" + index + "'));\" href=\"#\"> 添加 </a><span style=\"width:20px\">&nbsp;&nbsp;&nbsp;&nbsp;</span><a sclass=\"HrefStyle\" onclick=\"Delete('" + index + "');\" href=\"#\"> 删除 </a>";

                        return str;
                    }
                },
                { field: 'ImageUrlShow', title: '图纸地址', width: 50, align: 'left', sortable: true },
                { field: 'ImageUrl', title: '图纸地址', width: 50, align: 'left', sortable: true, hidden: true }
            ]];

            function AddDrawings(index) {
                $("#index").val(index);
                $("#UpFile").click();
            }
            $("#UpFile").change(function (e) {

                UpLoadFile($("#index").val());
            });
            function getFileName(o) {
                var pos = o.lastIndexOf("\\");
                return o.substring(pos + 1);
            }

            function UpLoadFile(index) {
                var file = $("#UpFile").val();
                var fileName = getFileName(file);

                var fd = new FormData();
                fd.append("UpFileData", $("#UpFile")[0].files[0]);

                $.tool.pageLoadInfo("上传中，请等待");
                $.ajax({
                    url: "../UpLoad/UpFile.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        $.tool.pageUnLoading();
                        console.log(addr)
                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                        } else {
                            var addrindex = addr.lastIndexOf("\/");
                            var str = addr.substring(addrindex + 1, addr.length);
                            //addr = "http://wyyth-app.hongkun.com.cn/" + addr.substring(addr.indexOf("\H"), addr.length);
                            //insertImage(addr);
                            $('#TableContainer').datagrid('updateRow', {
                                index: parseInt(index),
                                row: {
                                    //CYTZ: "<a sclass=\"HrefStyle\" onclick=\"AddDrawings('"+index+"');\" href=\"#\"> 添加 </a><span style=\"width:20px\">&nbsp;&nbsp;&nbsp;&nbsp;</span><a sclass=\"HrefStyle\" onclick=\"Delete('"+row.Id+"');\" href=\"#\"> 删除 </a><span style=\"width:20px\">&nbsp;&nbsp;&nbsp;&nbsp;(已上传)</span>",
                                    ImageUrlShow: str,
                                    ImageUrl: addr
                                }
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }

            function insertImage(addr) {
                var imageUrl = $("#ImageUrl").val();
                if (imageUrl != "") {
                    imageUrl = imageUrl + "," + addr;
                } else {
                    imageUrl = addr;
                }
                $("#ImageUrl").val(imageUrl);

                var html = "<div class=\"div-container\"><img class=\"xximg\" src=\"" + addr + "\">"
                html += "<input onclick=\"delImage(this)\" type=\"button\" class=\"button abscenter\" value=\"删除\"></div>";
                $("#imageContainer").prepend(html);
            }

            function Save() {
                var Index = $("#Index").val();
                var rows = $("#TableContainer").datagrid("getRows");
                var data = "";
                if (Index == "") {
                    HDialog.Info("请勾选数据!");
                    return;
                }
                var Sort = Index.split(",");
                var k = "";
                for (var i = 0; i < Sort.length - 1; i++) {
                    k = Sort[i];
                    if (rows[k]["ImageUrl"] > '') {
                        data += rows[k]["Id"] + ",";
                        data += rows[k]["ImageUrl"] + "|";
                    } else {
                        HDialog.Info("请选择上传了图纸的数据!");
                        return;
                    }
                }
                //  RegionSNum BuildSNum RoomID RoomModel PropertyUses RoomType RoomState BuildStartArea BuildEndArea InteriorStartArea InteriorEndArea ContSubStartDate ContSubEndDate GetHouseStartDate GetHouseEndDate
                //拿到缓存中的筛选条件 
                var CheckAllData = Cache.GetData("RegionSNum") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildSNum") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomIDs") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomModel") + "|";
                CheckAllData = CheckAllData + Cache.GetData("PropertyUses") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomType") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomState") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildStartArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildEndArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("InteriorStartArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("InteriorEndArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("ContSubStartDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("ContSubEndDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("GetHouseStartDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("GetHouseEndDate");

                $.tool.DataPost('CsHouseInspect', 'SetUpInspectionDrawings', 'data=' + data + '&CommID=' + $("#CommID").val() + '&RoomID=' + $("#RoomID").val() + '&CheckAll=' + $("#CheckAll").val() + '&CheckAllData=' + CheckAllData,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

                return true;
            }

            function Delete(index) {
                $('#TableContainer').datagrid('deleteRow', parseInt(index));
            }

            function Add() {
                var BatchName = $("#Batch").find("option:selected").text();
                var BatchId = $("#Batch").val();
                var rows = $("#TableContainer").datagrid("getRows");
                var count = rows.length;
                var Num = $("#Num").val();
                for (var i = 0; i < Num;i++) {
                    $('#TableContainer').datagrid('insertRow', {
                        index: parseInt(count),
                        row: {
                            Id: BatchId,
                            Name: BatchName,
                            CYTZ: "<a sclass=\"HrefStyle\" onclick=\"AddDrawings(parseInt('" + parseInt(count) + "'));\" href=\"#\"> 添加 </a><span style=\"width:20px\">&nbsp;&nbsp;&nbsp;&nbsp;</span><a sclass=\"HrefStyle\" onclick=\"Delete('" + index + "');\" href=\"#\"> 删除 </a>",
                            ImageUrl: '',
                            ImageUrlShow: '',
                        }
                    });
                    count = parseInt(count) + 1;
                }
                $("#SearchDlg").dialog("close");
            }

            var toolbar = [
                {
                     text: '选择查验批次',
                    iconCls: 'icon-add',
                    handler: function () {
                       $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        Save();
                    }
                }
            ];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetInspectionDrawings&' + $('#FrmForm').serialize(),
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
                    rownumbers: true,
                    sortOrder: "asc",
                    toolbar: toolbar,
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onLoadSuccess: function (data) {
                    },
                    onClickCell: function (rowIndex, field, value) {
                        $('#TableContainer').datagrid('endEdit', rowIndex);
                        if (field == "CYTZ") {
                            editIndex = rowIndex;
                            $('#TableContainer').datagrid('beginEdit', rowIndex);
                        }


                        //移除当前编辑状态
                        //$("#TableContainer").datagrid('acceptChanges', editIndex);
                        //var rows = $("#TableContainer").datagrid("getRows");

                        //for (var i = 0; i < rows.length; i++) {
                        //    $('#TableContainer').datagrid('endEdit', i);
                        //}
                    },
                    onCheck: function (rowIndex, rowData) {
                        var Index = $("#Index").val();
                        Index += rowIndex + ",";
                        $("#Index").val(Index);
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var kk = $("#Index").val();
                        var ff = "";
                        var jj = new Array();
                        jj = kk.split(',');
                        if (jj.length > 1) {
                            for (var i = 0; i < jj.length - 1; i++) {
                                if (jj[i] != rowIndex) {
                                    ff += jj[i] + ",";
                                }
                            }
                        } else {
                            ff = "";
                        }

                        $("#Index").val(ff);
                    },
                    onCheckAll: function (rows) {
                        var data = "";
                        for (var i = 0; i < rows.length; i++) {
                            data += i + ",";
                        }
                        $("#Index").val(data);
                    },
                    onUncheckAll: function (rows) {

                        $("#Index").val("");
                    }
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>



