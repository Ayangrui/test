<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



java开发接口利用http协议传输数据
这个接口主要用来登录，java服务器提供一个接口，移动设备客户端（android和ios）能通过这个接口把用户名和密码之类的东东传过来到服务器验证，然后服务器返回数据告诉客户端是否登录成功。比如0是成功，1是失败。中间数据的传递都是通过http协议完成.这个接口该怎么写？
以上是百度中搜到的问题，得到了回复。重新整理总结一下：
接口执行过程是这样的：以客户端登录为例——从客户端界面得到用户名，密码。传到后台（解释下此处所说的后台，一个程序一般是MVC模式，V视图层，C控制层），就是说从视图层得到数据传输到控制层，控制层中有如下代码，请看1.1。再由控制层通过http协议向服务器发送数据，代码中接收报文的地址就是服务器地址，其中“TestTransfers” 是服务器web.xml中配置的Servlet
[html] view plain copy
<servlet>  
    <display-name>TestTransfers</display-name>  
    <servlet-name>TestTransfers</servlet-name>  
    <servlet-class>com.servlet.TestTransfers</servlet-class>  
    <!-- 启动优先级 -->  
    <load-on-startup>4</load-on-startup>  
  </servlet>  
  <servlet-mapping>  
    <servlet-name>TestTransfers</servlet-name>  
    <url-pattern>/TestTransfers</url-pattern>  
  </servlet-mapping>  


1.1客户端请求程序代码：
[java] view plain copy
public void sendMessage() throws Exception {  
    System.out.println("调用servlet开始=================");  
    StringBuffer sendStr = new StringBuffer();  
    sendStr.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");  
    sendStr.append("<report_data>");  
    sendStr.append("<request_req>953943547334</request_req>");  
    sendStr.append("<request_time>2012040211394324</request_time>");  
    sendStr.append("<request_param>");  
    sendStr.append("<query_month>201203</query_month>");  
    sendStr.append("</request_param>");  
    sendStr.append("</report_data>");  
    BufferedReader reader = null;  
    try {  
        String strMessage = "";  
        StringBuffer buffer = new StringBuffer();  
        // 接报文的地址  
        URL uploadServlet = new URL(  
               "http://localhost:9090/TestTransfers");  
        HttpURLConnection servletConnection = (HttpURLConnection) uploadServlet  
               .openConnection();  
        // 设置连接参数  
        servletConnection.setRequestMethod("POST");  
        servletConnection.setDoOutput(true);  
        servletConnection.setDoInput(true);  
        servletConnection.setAllowUserInteraction(true);  
        // 开启流，写入XML数据  
        OutputStream output = servletConnection.getOutputStream();  
        System.out.println("发送的报文：");  
        System.out.println(sendStr.toString());  
        output.write(sendStr.toString().getBytes());  
        output.flush();  
        output.close();  
        // 获取返回的数据  
        InputStream inputStream = servletConnection.getInputStream();  
        reader = new BufferedReader(new InputStreamReader(inputStream));  
        while ((strMessage = reader.readLine()) != null) {  
           buffer.append(strMessage);  
        }  
        System.out.println("接收返回值:" + buffer);  
    } catch (java.net.ConnectException e) {  
        throw new Exception();  
    } finally {  
        if (reader != null) {  
           reader.close();  
        }  
    }  
 }  


 
代码1.2为服务器接口，接收到客户端的信息解析验证，并返回需要的信息。
1.2响应程序代码

[java] view plain copy
public class TestTransfers extends HttpServlet {  
       
    private static final long serialVersionUID = 1L;  
   
    protected void doGet(HttpServletRequest request,  
           HttpServletResponse response) throws ServletException, IOException {  
    }  
   
    protected void doPost(HttpServletRequest request,  
           HttpServletResponse response) throws ServletException, IOException {  
   
       //判断请求报文是否来自代维系统的ip地址  
       String ip = request.getRemoteHost();  
// 获取收到的报文  
        BufferedReader reader = request.getReader();  
         String line = "";  
        StringBuffer inputString = new StringBuffer();  
        while ((line = reader.readLine()) != null) {  
        inputString.append(line);  
        }  
          
       //如有必要，可以在报文中增加其他验证和加密的参数  
       //解析获取到的报文，根据ip地址、其他验证、加密等等来判断请求报文的服务器是否有权限  
        
       //如果请求验证合格，则根据请求的参数装配返回的报文  
   
       // 要返回的报文  
       StringBuffer resultBuffer = new StringBuffer();  
       resultBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");  
       resultBuffer.append("<report_data>");  
       resultBuffer.append("<respon_req>953947334</respon_req>");  
       resultBuffer.append("<respon_time>20120402113943</respon_time>");  
       resultBuffer.append("<result>");  
       resultBuffer.append("<id>0000</id>");  
       resultBuffer.append("<comment>成功</comment>");  
       resultBuffer.append("</result>");  
       resultBuffer.append("<items>");  
       resultBuffer.append("<item>");  
       resultBuffer.append("<county>长治县</county>");  
       resultBuffer.append("<company>铁通</company>");  
       resultBuffer.append("<speciality>线路</speciality>");  
       resultBuffer.append("<personnel>王加和</personnel>");  
       resultBuffer.append("<begin_time>20120301000000</begin_time>");  
       resultBuffer.append("<end_time>20120331235959</end_time>");  
       resultBuffer.append("<plan_quantity>50</plan_quantity>");  
       resultBuffer.append("<checkout_quantity>40</checkout_quantity>");  
       resultBuffer.append("<patrol_rate>0.80</patrol_rate>");  
       resultBuffer.append("</item>");  
       //......  
       //......  
       //......  
       //循环组装响应的报文  
        
       resultBuffer.append("</items>");  
       resultBuffer.append("</report_data>");  
   
       // 设置发送报文的格式  
       response.setContentType("text/xml");  
       response.setCharacterEncoding("UTF-8");  
   
       PrintWriter out = response.getWriter();  
       out.println(resultBuffer.toString());  
       out.flush();  
       out.close();  
    }  
}  



上一篇 内省、JavaBean、PropertyDescriptor类、Introspector类、BeanUtils工具包、注解、Rentention、Target、注解的基本属性和高级属性
下一篇 Java WebService 简单实例

您还没有登录,请[登录]或[注册]
查看评论
3楼 MatinBell 2018-01-12 18:00发表 [回复] [引用] [举报]新手菜鸟，copy了下你的代码。客户端，访问服务器，返回值{"logintimeout":true}，代表啥意思？Re: MatinBell 2018-01-16 00:08发表 [回复] [引用] [举报]回复MatinBell：{"logintimeout":true}，是我的登录拦截器拦截了，谢谢！
2楼 yixin605691235 2017-12-13 15:15发表 [回复] [引用] [举报]学习了，赞一个，谢谢分享
1楼 Iowy 2017-02-08 18:13发表 [回复] [引用] [举报]BufferedReader reader = request.getReader(); 
String line = ""; 
StringBuffer inputString = new StringBuffer(); 
while ((line = reader.readLine()) != null) { 
inputString.append(line); 
} 
读不到呀
查看更多评论
简易http接口实现 komyluokomyluo2017年04月03日 17:4511465
http接口是什么，我一直没找到比较明确的定义（如果有哪位可以提点一下，我将非常感谢），今天就自己来总结一下吧。个人认为，http接口就是一种基于http服务的api，是系统之间交互的一种约定，所谓的...
java创建http接口 b422761838b4227618382015年12月22日 17:1010369
1.修改web.xml文件             TestHTTPServer         com.atoz.http.SmsHTTPServer         ...
 广告
http接口开发及调用 henryzhang2009henryzhang20092014年07月24日 14:3258332
一般用post； package com.XXXX.XXXX.service; import java.io.File; import java.io.IOException; import ja...
http接口开发与调用案例 quwenzhequwenzhe2016年11月14日 09:483231
http接口开发与调用案例
HTTP接口的服务端和客户端的实现 dianzijinglindianzijinglin2016年11月16日 15:474945
Json大量字段案例（300多个key），需要做一个客户中心抽调各个系统的客户信息的功能，在每个系统中需要写客户端代码，在客户中心系统需要写服务端代码。 客户端： json串截图如下，注意在jso...
 
springmvc 实现http接口 接受json参数 zhen340417593zhen3404175932016年05月05日 12:049897
使用springmvc实现http接口时，发现问题。将参数直接放入url里面参数能被正常解析到如下： public void test(  Long roleId,  Integer roleCod...
http接口开发几种工具简单介绍 xiongyouqiangxiongyouqiang2018年01月26日 18:02718
背景  相信大家在开发过程中，多少都会遇到对接别人系统接口，或者提供接口给他人使用（供应商、公司其他内部系统）。回顾我这几年的项目开发，http接口的开发从未间断，起初刚毕业的是就参与一个项目开...
不懂接口的程序员就不懂开发 skyshoreskyshore2016年03月28日 02:319972
开发人员的面试中，面试者常常描述不清做过的项目。原因很简单，要么你不懂接口，要么你描述不清接口。描述接口有两个重点，称为2P：一是协议（Protocol），二是原型（Prototype），它们分别描述...
http接口开发及调用 w2222288w22222882016年02月19日 15:142763
一般用http的post，尽量不用get； 开发中一般都使用org.apache.http的jar包，比较成熟，方便，易用；当然了，直接用java提供的也行 package com.XXXX.XX...
HTTP接口测试还可以这么玩 n8765n87652016年06月27日 16:103609
1、背景 　　随着H5在各行业领域的运用，无论是在APP内嵌入H5页面的hybrid应用还是直接在微信公众号或者轻应用中使用H5页面都是非常的常见（比如前端页面通过HTTP 接口调用拉取数据进行交互...
 
使用httpclient实现http接口调用实例 5iasp5iasp2013年03月05日 17:0370643
使用httpclient实现http接口调用实例 假设服务接口如下： 接口地址： http://192.168.0.1/service/sendsms 请求方式： post 需要传递参数：...
JAVA发送http get/post请求，调用http接口、方法
三个例子 —JAVA发送http get/post请求，调用http接口、方法例1：使用 HttpClient （commons-httpclient-3.0.jar jar下载地址：h...
CapMiachaelCapMiachael2016年07月05日 17:5653316
java创建http接口 evilcry2012evilcry20122017年10月11日 14:31520
java创建http接口 标签： javahttp接口 2015-12-22 17:10 7330人阅读 评论(1) 收藏 举报  分类： java（13）  ...
java调用http接口 woshizhangliang999woshizhangliang9992015年08月13日 10:2120375
最近几天因为项目需求，做一个门禁管理。而门禁信息来源则是妙兜。所以我们这边需要调用妙兜的接口，主要是“设备安装登记接口”和“钥匙凭证发放接口”。 因为之前没有做过“java调用http接口”类似功能，...
 
使用httpclient传递java参数调用http接口 nanjing0412nanjing04122017年04月19日 15:513276
使用的Jar包： org.apache.httpcomponents httpclient 4.3.5 代码： public class HttpClientTest { ...
java创建http接口,及调用 yang_aiyang_ai2017年04月26日 09:412145
1.修改web.xml文件 TestHTTPServer com.atoz.http.SmsHTTPServer T...
Java http 请求三种形式 CSDN_G_YCSDN_G_Y2018年03月20日 12:0199
JavaHttp接口交互的两种方式     JavaHttp接口开发针对表单提交跟Json提交的两种方式     表单提交(post、get)         get表单参数提交 /*...
JAVA发送http get/post请求，调用http接口、方法
import java.io.BufferedReader; import java.io.IOException; import java.io.InputStream; import ja...
java173842219java1738422192017年01月04日 15:4810974

</body>
</html>