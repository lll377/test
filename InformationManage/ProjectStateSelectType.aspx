<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectStateSelectType.aspx.cs" Inherits="M_Main.InformationManage.ProjectStateSelectType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择合法合规类型</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <input type="hidden" id="Ismultiple" name="Ismultiple" value="0" />
    <input type="hidden" id="WithParent" name="WithParent" value="-1" />
    <ul id="tree" class="easyui-tree"></ul>
    <div style="height: 60px"></div>
    <div class="btnFixed">
        <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
        <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            var ParamIsmultiple = $.getUrlParam("Ismultiple"); // 是否是单选
            if (ParamIsmultiple) {
                $('#Ismultiple').val(ParamIsmultiple);
            }
            var ParamWithParent = $.getUrlParam("WithParent"); // 是否是需要带出父节点 【单选】0:带出父节点  【多选】（1:只选父节点  2:只选子节点)
            if (ParamWithParent) {
                $('#WithParent').val(ParamWithParent);
            }
            InitDataTree();
        });
        function InitDataTree() {
            var IsCheckbox = false;
            if ($('#Ismultiple').val() == "1") {
                IsCheckbox = true;
            }
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                checkbox: IsCheckbox,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "ProjectStateSeeting";
                    param.Command = "GetList";
                },
                onDblClick: function (row) {
                    //单选才能双击返回
                    if (!IsCheckbox) {
                        Save();
                    }
                }
            });
        }
        function Save() {
            //单选
            if ($('#Ismultiple').val() == "0") {
                var row = $("#tree").tree("getSelected");
                var isLeaf = $("#tree").tree('isLeaf', row.target);
                if (isLeaf && row.attributes.ParentID != "") {
                    if ($('#WithParent').val() == "0") {
                        //获取父节点 并且存放到返回结果中
                        var ReturnRow = [];
                        ReturnRow.push(row); // 将子节点放入返回结果中
                        var ParentNode = $("#tree").tree('getParent', row.target);
                        if (ParentNode != null) {
                            ReturnRow.push(ParentNode);
                            Close(ReturnRow);
                        } else {
                            HDialog.Info("当前节点没有父节点，请重新选择");
                        }

                    } else {
                        Close(row);
                    }
                } else {
                    HDialog.Info('请选择第二级节点!');
                }
            } else {
                //多选 需要判断 【多选】WithParent（1:只选父节点  2:只选子节点)
                var rows = $("#tree").tree("getChecked");
                if (rows.length == 0) {
                    HDialog.Info('请至少勾选一个节点!');
                    return;
                }
                var NameList = "";
                var IdList = "";
                $.each(rows, function (i, item) {
                    if ($('#WithParent').val() == "1") {
                        if (item.attributes.ParentID == "") {
                            NameList += item.text + ",";
                            IdList += item.id + ",";
                        }
                    } else if ($('#WithParent').val() == "2") {
                        if ($("#tree").tree('isLeaf', item.target)) {
                            NameList += item.text + ",";
                            IdList += item.id + ",";
                        }
                    }
                });
                if ($('#WithParent').val() == "1") {
                    //只选择父节点的时候需要将不确定选择节点也算进去
                    var indeterminatenodes = $('#tree').tree('getChecked', 'indeterminate');
                    $.each(indeterminatenodes, function (i, item) {
                        if (item.attributes.ParentID == "") {
                            NameList += item.text + ",";
                            IdList += item.id + ",";
                        }
                    });
                    if (NameList == "" || IdList == "") {
                        HDialog.Info('请至少勾选一个第一级节点!');
                        return;
                    }
                }
                if ($('#WithParent').val() == "2") {
                    if (NameList == "" || IdList == "") {
                        HDialog.Info('请至少勾选一个子节点!');
                        return;
                    }
                }

                if ($('#WithParent').val() == "0") {
                    $.each(rows, function (i, item) {
                        if (item.attributes.ParentID != "") {
                            var ParentNode = $("#tree").tree('getParent', item.target);
 
                                    NameList += ParentNode.text + "-" + item.text + ",";
                                    IdList += ParentNode.id + "-" + item.id + ",";       
                        }
                        //if ($("#tree").tree('isLeaf', item.target)) {
                        //    var children = item.text;
                        //    $.each(rows, function (j, item2) {
                        //        if (item2.attributes.id == item.ParentID) {
                        //            if (item2.text != item.text) {
                        //                NameList += item2.text + "-" + item.text + ",";
                        //            }
                        //            if (item2.id != item.id) {
                        //                IdList += item2.id + "-" + item.id + ",";
                        //            }

                        //        }
                        //    });
                        //}
                    });

                }


                NameList = NameList.substring(0, NameList.length - 1);
                IdList = IdList.substring(0, IdList.length - 1);
                var ItemRow = {
                    name: NameList,
                    id: IdList
                }
                console.log(NameList);
                Close(ItemRow);
            }
        }

        function Close(row) {
            HDialog.ReturnIsJson = true;
            HDialog.Close(row);
        }

    </script>
</body>
</html>
