<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<form id="user-form" method="post">
	
		<input type="hidden" name="id" value="${u.id }"/> 
	
		<table style="margin: 0 auto" cellpadding="4" cellspacing="4">
			<tr>
				<td>用户名：</td>
				<td><input id="username" name="username" value="${u.username }"
					class="easyui-textbox" data-options="
						required:true,windth:180
					"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input id="password" name="password" value="${u.password }"
					class="easyui-textbox" data-options="
						required:true,windth:180,type:'password'
					"/></td>
			</tr>
			<tr>
				<td>昵称：</td>
				<td><input id="nickname" name="nickname" value="${u.nickname }"
					class="easyui-textbox" data-options="
						required:true,windth:180
					"/></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td><input id="email" name="email" value="${u.email }"
					class="easyui-textbox" data-options=" 
						required:true,windth:180,validType:'email'
					"/></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input id="tel" name="tel" value="${u.tel }"
					class="easyui-textbox" data-options="
						required:true,windth:180,type:'number'
					"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input id="status" name="status" value="${u.status }"
					class="easyui-combobox" data-options="
						required:true,windth:180,
						valueField:'value',textField:'label',
						data:[{
							label:'激活',
							value:'1'
						},{
							label:'冻结',
							value:'0'
						}]
					"/></td>
			</tr>
		</table>

	</form>
	
</body>