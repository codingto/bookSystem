# bookSystem
ssm，ajax，jquery，杨帅17080902090
<h2>注意！这是一个Maven项目！！！！！！注意！这是一个Maven项目！！！！！！注意！这是一个Maven项目！！！！！！<h2>

<h2>部署说明</h2>

1、部署时请运行sql文件mybatis.sql(已在项目根目录中添加）<br><br>
2、在src/main/resource/spring-dao.xml中修改mysql用户名密码
例如：
'''
<!--data source-->
    <bean id="datasource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/mybatis?userSSL=true&amp;
                userUnicode=true&amp;characterEncoding=UTF-8"/>
        <property name="username" value="你的mysql用户名"/>
        <property name="password" value="你的mysql密码"/>
    </bean>
'''

<h3>1、localhost   404</h3>
  解决方法：[点击查看](https://blog.csdn.net/weixin_44812278/article/details/98619004)


