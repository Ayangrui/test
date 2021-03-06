package com.etoak.models.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

public class HttpClinetTest {

	@Test
	public void doGet() throws Exception{
		//创建一个浏览器
		CloseableHttpClient httpClinet = HttpClients.createDefault();
		//在浏览器地址栏输入地址
		URIBuilder uri = new URIBuilder("http://localhost:8080/S-S-M/http/doGetParams");
		uri.addParameter("username","etoak");
		uri.addParameter("password","et1702");
		//发送Get请求
		HttpGet get = new HttpGet(uri.build());
		
		//回车发送请求 找到服务端 返回相应数据
		CloseableHttpResponse response = httpClinet.execute(get);
		//返回响应状态
		int statusCode = response.getStatusLine().getStatusCode();
		//判断状态码是否为200   SC_OK == 200
		if(statusCode == HttpStatus.SC_OK){
			//返回响应数据  （HttpEntity就是一个二进制的流信息）
			HttpEntity e = response.getEntity();
			// 把返回的数据转换成字符串，把二进制信息转换成字符串
			String r = EntityUtils.toString(e);
			System.out.println("返回结果集"+r);
			
		}else{
			System.out.println("GET-失败");
		}
		//关闭响应
		response.close();
		//关闭浏览器
		httpClinet.close();
	}
	
	@Test
	public void doPost()throws Exception{
		CloseableHttpClient httpClinet = HttpClients.createDefault();
		
		HttpPost post = new HttpPost("http://localhost:8080/S-S-M/http/doPostParams");
		
		RequestConfig rc = RequestConfig.custom().setConnectTimeout(5000).setSocketTimeout(5000).build();
		//设置POST请求超时
		post.setConfig(rc);
		
		
		//设置请求参数
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("name", "张三"));
		params.add(new BasicNameValuePair("cardId", "37292619xxxxxx5733"));
		
		//设置一个表单
		HttpEntity httpEntity = new UrlEncodedFormEntity(params,"UTF-8");
		//把参数实体放入POST请求中
		post.setEntity(httpEntity);
		            
		//回车发送请求，并返回响应信息
		CloseableHttpResponse response = httpClinet.execute(post);
		//返回响应状态码
		int r = response.getStatusLine().getStatusCode();
		
		if(r==HttpStatus.SC_OK){
			HttpEntity e = response.getEntity();
			String s = EntityUtils.toString(e);
			System.out.println("POST返回响应"+s);
		}else{
			System.out.println("POST返回响应-失败");
		}
	}
	
	@Test
	public void doPostJson() throws Exception{
		//创建一个浏览器
		CloseableHttpClient httpClinet = HttpClients.createDefault();
		
		HttpPost post = new HttpPost("http://localhost:8080/S-S-M/http/doPostJson");
		//发送json请求
		post.addHeader("Content-Type","application/json");
		//发送json数据
		String json = "{\"name\":\"李四\",\"cardId\":\"37292619xxxxxx5733\"}";
		//定义一个字符串实体
		StringEntity strEntity = new StringEntity(json,Consts.UTF_8);
		//将字符串实体加入到POST请求中
		post.setEntity(strEntity);
		
		CloseableHttpResponse response = httpClinet.execute(post);
		int s = response.getStatusLine().getStatusCode();
		
		if(s==HttpStatus.SC_OK){
			String result = EntityUtils.toString(response.getEntity(),Consts.UTF_8);
			System.out.println(result);
		}else{
			System.out.println("┗|｀O′|┛ 嗷~~失败了");
		}
	}
	
}



















