<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/commons/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/skin/js/models/login.js"></script>
		<style type="text/css">
			body {
				background-image: url("${pageContext.request.contextPath }/skin/image/321.jpg");
			}
		</style>
		<style type="text/css">   
        *{   
            margin: 0;   
            padding: 0;   
        }    
        .center-in-center{   
            position: absolute;   
            top: 35%;   
            left: 40%;   
        }   
    </style>   
	
	</head>
	<body>
		<div class="center-in-center">
			<h4 style="text-align:center">用户登录</h4>
			<form id="login-form" method="POST">
				<table  cellpadding="4" cellspacing="4"
					style="margin: 0 auto;">
					<tr>
						<td>用户名：</td>
						<td><input id="login-user" name="username"/></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input id="login-password" name="password" /></td>
					</tr>
				</table>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="plain:true"></a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="plain:true"></a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-ok',plain:true" onClick="login()">登录</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel',plain:true" onClick="quxiao()">取消</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onClick="zc()">注册新账号</a>
			</form>
		</div>
		
		
		
		<script type="text/javascript">
			function login(){
				debugger
				$("#login-form").form('submit',{
		        	url:contextPath+'/login/login.do',
		        	onSubmit:function(param){
		        		return $(this).form('validate');
		        	},
		        	success:function(data){
		        		alert(data)
		        		var json = $.parseJSON(data);
		        		alert(json)
		        		if(json.code==200){
		        			window.location.href=contextPath+"/login/index.do";
		        		}else{
		        			$.messager.alert("错误",json.msg);
		        		}
		        	}
		        });
			}	
			
			function quxiao(){
				$("#login-form").form('reset');
			}
			
			
			/* 注册的弹窗  */
			function zc(){
				dialog("zhuce-dialog").dialog({
        			title:'用户注册',
        			width:450,
        			height:350,
        			href:contextPath+'/pages/models/user/user-add-update.jsp',
        			buttons:[
        				      {
        					text:'提交信息',
        					iconCls:'icon-ok',
        					handler:function(){
        						$("#user-form").form('submit',{
        							url:contextPath+"/user/zhuce.do",
        							onSubmit : function(param){
        								return $(this).form("validate");
        							},
        							
        							success : function(data){
        								debugger
        								var json = $.parseJSON(data);
        								$.messager.alert("提示",json.msg);
        									
        								if(json.code==200){
        									$("#user-tab").datagrid("reload");
        									$("#zhuce-dialog").dialog("close");
        								}
        							}
        						});
        					}
        				      },
        				      {
        						text:'取消',
        						iconCls:'icon-cancel',
        						handler:function(){
        							$("#add-dialog").dialog("close");
        						}
        						
        					  },
        				  ]
        		});
			}
			
			
			function dialog(id){
				var objId  = $("#"+id);
				if(objId.size()>0){
					return objId;
				}
				var html_ = '<div id="'+id+'" data-options="modal:true,closed:false,cache:false"></div>';
				objId = $(html_).appendTo(document.body);
				return objId;
			}
		</script>
		
		
		
		
		
		
		
		
		
		
	</body>
</html>