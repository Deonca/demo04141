<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/4/29
  Time: 上午11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>管理员管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">  <input type="text" class="input-text" style="width:250px" placeholder="输入姓名" id="trueName" name="trueName"><button type="button" class="btn btn-success" id="btnSearch" name=""><i class="icon-search"></i> 搜用户</button>

    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onclick="del()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
    <a href="javascript:;" onclick="user_add('添加用户','admin-add.jsp','550','')" class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span>

    </div>
    <table id="example" class="table table-border table-bordered table-hover table-bg table-sort">

    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    /*全局变量  弹出加载层的序列*/
    var layer_index = null;
    /*
     *加载层 type传值0~2图标变化 也可不传
     * */
    function layer_wait(type){
        if(typeof(type)=="undefined"){
            type=1;
        }
        layer_index = layer.load(type, {
            shade: [0.1,'#fff']
        });
    };


    /*关闭弹出框口*/
    function layer_close(){
        layer.close(layer_index);
    }



    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份

            "d+": this.getDate(), //日

            "h+": this.getHours(), //小时

            "m+": this.getMinutes(), //分

            "s+": this.getSeconds(), //秒

            "q+": Math.floor((this.getMonth() + 3) / 3), //季度

            "S": this.getMilliseconds() //毫秒

        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    };
    /* 全选/反选 */
    function checkedClean() {
        if ($("[name='checkAll']").is(":checked")) {
            $("[name='checkitems']").prop("checked", true);
        } else {
            $("[name='checkitems']").prop("checked", false);
        }

    }
    var table = null;
    //DOM加载完毕后即可被调用
    $(document).ready(function() {
        initTable();
        $("#btnSearch").on('click',function(){
            table.draw();
        });
    });

    function initTable() {
        var columns = [
            {
                sClass: "text-c",
                data: "id",
                title: '<input type="checkbox" name="checkAll" onclick="checkedClean();"/>',
                "render": function (data, type, row, meta) {
                    return data = '<input type="checkbox" name="checkitems" value="'
                        + data + '" class="checkchild"/>';
                }
            }, {
                sClass: "text-c",
                data: "id",
                title: "ID"
            },{
                sClass: "text-c",
                data: "level.levelName",
                title: "等级名称"
            }, {
                sClass: "text-c",
                data: "adminName",
                title: "账号"
            }, {
                sClass: "text-c",
                data: "pwd",
                title: "密码"
            }, {
                sClass: "text-c",
                data: "trueName",
                title: "姓名"
            }, {
                sClass: "text-c",
                data: "createTime",
                title: "开通时间",
                render: function (data, type, row, meta) {
                    if (data){   // data不为空进行转换
                        return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss");
                    } else {
                        return data = ''; //data为空时不转换
                    }
                }
            },
            {
                sClass:"text-c",
                data:"id",
                title:"操作",
                render: function (data, type, row, meta) {
                       return "<a title=\"编辑\" href=\"javascript:;\" onclick=\"user_add('编辑','admin-add.jsp?type=edit&id="+data+"','550','')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6df;</i></a>";
                    }
            }];

        table = $('#example').DataTable({
            ajax: {
                url: "/demo040111/AdminServlet",
                type: "POST",
                dataSrc: 'resultData',
                data: function (d) {
                    d.trueName = $("#trueName").val();
                }
            },
            "lengthMenu": [10, 20, 50],//显示数量选择
            "bFilter": false,//过滤功能
            "bPaginate": true,//翻页信息
            searching: false,
            serverSide : true,// 服务器查询数据分页draw时自动刷新
            columns: columns,
            autoWidth: false,
            "bInfo": true,//数量信息
            dom: 'rt<"bottom"ilp><"clear">',
            paginationType : 'full_numbers',
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0]}// 制定列不参与排序
            ],"oLanguage": { //国际化配置

                "sInfoFiltered": "     ",
            }
            });
    }


    /* 删除 */
    function del() {
        var ids = "";
        if ($("[name='checkitems']:checked").length > 0) {
            $("[name='checkitems']:checked").each(function(i) {
                if (0 == i) {
                    ids = $(this).val();
                } else {
                    ids += "," + $(this).val();
                }
            })
        } else {
            return layer.msg('请至少选中一行进行删除!', {
                icon : 5,
                time : 2000
            });
        }
        layer.confirm('确认要删除吗？', function(index) {
            $.ajax({
                type : 'POST',
                dateType : 'JSON',
                data : {
                    ids : ids,
                    type:"del"
                },
                url : 'adminList',
                beforeSend : function() {
                    layer_wait();
                },
                success : function(json) {
                    layer_close();
                    layer.msg("删除成功", {
                        icon : 6,
                        time : 2000
                    });
                    table.draw(false);
                },
                error : function() {
                    layer_close();
                }
            });
        });
    }


</script>
<script type="text/javascript">
    /*用户-添加*/
    function user_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

</script>



</body>
</html>

