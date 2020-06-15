<%--
  Created by IntelliJ IDEA.
  User: yangshuai
  Date: 2020/6/15 0015
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询图书</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>




        $(function () {

            var name = "${userSession.name}";
            //用户未登录，转跳登录页面
            if (name == "") {
                window.location.href = "../";
            }
            //清空input
            $("#clear").click(function () {
                $("#divId input").val("");
            })

            $("#query").click(function () {
                // $("#divId input").val("");

                $("#tb tbody").empty();
                // var child=document.getElementById('p');//找到子元素
                // child.parentNode.removeChild(child);
                var id = $("#id").val();
                var name = $("#name").val();
                var author = $("#author").val();
                var describe = $("#describe").val();
                var numbers = $("#numbers").val();
                $.ajax(
                    {
                        type: "POST",
                        url: "/queryBook",
                        data: {
                            "book_id": id,
                            "book_name": name,
                            "book_author": author,
                            "book_describe": describe,
                            "book_numbers": numbers
                        },
                        success: function (data) {
                            var dataObj = JSON.parse(data)
                            console.log(dataObj);
                            var length = Object.keys(dataObj).length;
                            if(length==0){
                                alert("未查到相关图书");
                            }
                            console.log(length);
                            // 动态添加元素
                            for (var i = 0; i < length; i++) {
                                var id = dataObj[i].book_id;
                                var ch = '<tr>' +
                                    '<td>' + dataObj[i].book_id + '</td>' +
                                    '<td>' + dataObj[i].book_name + '</td>' +
                                    '<td>' + dataObj[i].book_author + '</td>' +
                                    '<td>' + dataObj[i].book_describe + '</td>' +
                                    '<td>' + dataObj[i].book_numbers + '</td>' +
                                    '<td><button class="' + id + '">修改</button><button class="' + id + '">删除</button></td>' +
                                    '</tr>';
                                //这里动态指定按钮的class=对应的BoookId（这招帅炸了哈哈哈（可能之后会学到更方便的方法

                                $("#tb tbody").append(ch);

                                //为所有删除按钮绑定事件
                                document.getElementsByClassName(id)[1].addEventListener("click",function (event) {
                                    deleteBook(event);
                                });
                                //为所有修改按钮绑定事件
                                document.getElementsByClassName(id)[0].addEventListener("click",function (event) {
                                    updateBook(event);
                                });
                            }
                        }
                    }
                )
            })
        })
        function deleteBook(event) {
            if(confirm("确实要删除吗？")){
                alert("已删除！");
                //获取点击事件的按钮元素
                var message = event.toElement;
                //获取按钮元素的classname,即为BookId
                var book_id = message.className;
                $.ajax({
                    type:"POST",
                    url:"/deleteBook",
                    data: {
                        "book_id": book_id
                    },
                    success:function (data) {
                        window.location.reload();//刷新页面
                    }
                })

            }else {
                alert("已取消");
            }

        }

        function updateBook(event) {
            //获取元素
            var message = event.toElement;
            //获取按钮元素的classname,即为BookId
            var book_id = message.className;
            $.ajax({
                type:"POST",
                url:"/toUpdataBook",

                data: {
                    "book_id": book_id
                },
                success: function () {
                    window.location.href = "/book/admin_updataBook.jsp";
                },
                error:function () {
                    console.log("updataBook请求失败");
                }
            })
        }
    </script>
</head>
<body>
<h2 align="center">查询图书</h2>
<div id="divId">
    <info style="color: red">支持模糊查询</info>
    <br>
    id: <input id="id" type="text">
    name: <input id="name" type="text"><br>
    作者: <input id="author" type="text"><br>
    描述: <input id="describe" type="text"><br>
    库存数量: <input id="numbers" type="text">
</div>
<button id="query">查询</button>
<button id="clear">清空所有条件</button>

<h2>结果显示：</h2>
<table id="tb" border="1">
    <thead>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>author</th>
        <th>describe</th>
        <th>number</th>
        <th>option</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
</body>
</html>
