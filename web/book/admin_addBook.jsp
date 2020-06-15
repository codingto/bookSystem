<%--
  Created by IntelliJ IDEA.
  User: yangshuai
  Date: 2020/6/14 0014
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../JQ.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#id").val("id自动生成");
            $("#allBook").click(function () {
                window.location.href = "/book/admin_allBook.jsp";
            })
            $("#add").click(function () {


                var name = $("#name").val();
                var author = $("#author").val();
                var describe = $("#describe").val();
                var numbers = $("#numbers").val();
                $.ajax(
                    {
                        type:"POST",
                        url:"/addBook",
                        data:{

                            "book_name":name,
                            "book_author":author,
                            "book_describe":describe,
                            "book_numbers":numbers
                        },
                        success:function (data) {
                            console.log(data)
                            alert("添加成功！");
                        },error:function (data) {
                            alert("插入失败！")
                        }
                    }
                )
            })
        })
    </script>
</head>
<body>
<h2 align="center">添加图书</h2>
<div>
    id: <input id="id" readonly type="text">
    <info style="color: red"></info>
    <br>
    name: <input id="name" type="text"><br>
    作者: <input id="author" type="text"><br>
    描述: <input id="describe" type="text"><br>
    库存数量: <input id="numbers" type="text">
</div>
<button id="add">添加</button>
<button id="allBook">查看所有图书</button>
</body>
</html>
