<%--
  Created by IntelliJ IDEA.
  User: zhaohaiyang
  Date: 2020/5/16
  Time: 上午9:59
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
            <input type="text" name="adminName" lay-verify="adminName" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">验证必填项</label>
        <div class="layui-input-block">
            <input type="text" name="trueName" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
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
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        var $ = layui.jquery;


        //自定义验证规则
        form.verify({
            adminName: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }


        });





        //监听提交
        form.on('submit(demo1)', function(data){
            alert(JSON.stringify(data.field));
            $.ajax({
                url: "/demo040111/AddFormServlet",
                type: 'POST',
                dataType: 'text',//预期服务器返回的数据类型text、json
                data: data.field,
                success: function (data, textStatus, xhr) {
                    // if (data.code ==0) {
                    //     layer.alert(data.msg, {
                    //         title: '最终的提交信息'
                    //     });
                    // } else {
                    //     msg.show(data.msg);
                    // }
                },
                beforeSend: function(){


                },
                error: function (xhr, textStatus, errorThrown) {

                },
                complete: function () {

                }
            });


            return false;
        });



    });
</script>

</body>
</html>
