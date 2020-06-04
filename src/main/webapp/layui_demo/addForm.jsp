<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/5/16
  Time: 上午5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>表单集合演示</legend>
</fieldset>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">单行输入框</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">验证必填项</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">验证手机</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone"  autocomplete="off" class="layui-input">
<%--                lay-verify="required|phone"--%>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">验证邮箱</label>
            <div class="layui-input-inline">
<%--                lay-verify="email"--%>
                <input type="text" name="email" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ;
        var $ = layui.jquery;




        // //自定义验证规则
        // form.verify({
        //     title: function(value){
        //         if(value.length < 5){
        //             return '标题至少得5个字符啊';
        //         }
        //     }
        //     ,pass: [
        //         /^[\S]{6,12}$/
        //         ,'密码必须6到12位，且不能出现空格'
        //     ]
        //
        // });


        var loading;
        //监听提交
        form.on('submit(demo1)', function(data){


            $.post("/demo040111/AddFormServlet", data.field,function (ret) {
                if (ret.code == 0) {  //添加失败
                    layer.alert(ret.msg, {
                                       title: 'msg提交信息'
                                     })
                } else { //添加成功
                    layer.alert(ret.msg, {
                        title: 'msg提交信息'
                    })
                }
            },'json')



            // $.ajax({
            //     url: "/demo040111/AddFormServlet",
            //     type: 'post',
            //     async: false,
            //     data: data.field,  //data: {"postname":postname,"industryid":industryid},
            //     dataType: 'json',//预期服务器返回的数据类型text、json
            //     beforeSend: function(){
            //         //  loading = layer.load(0, {  //icon:0,1,2 　　loading风格
            //         //     shade: false//是否有遮罩，true表示有遮罩
            //         //     ,time: 2*1000//设定最长等待时间,设置时间之后，loading会在时间到之后自动关闭
            //         // });
            //     },
            //     success: function (ret) {
            //         // if(ret.code==0)
            //         // {
            //         //     layer.alert(ret.msg, {
            //         //         title: 'msg提交信息'
            //         //     })
            //         // }
            //         // else
            //         // {
            //         //     layer.alert(ret.msg, {
            //         //         title: 'msg返回错误'
            //         //     })
            //         // }
            //     }, error: function (err) {
            //         console.log(err);
            //     },
            //     complete: function () {
            //        // layer.close(loading);
            //     }
            // });



            return false;
        });



    });
</script>

</body>
</html>
