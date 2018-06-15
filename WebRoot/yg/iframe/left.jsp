<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>系统管理</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="<%=basePath %>admin/images/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="<%=basePath %>admin/images/Tree.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{ 
%>
<BODY style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="<%=basePath %>admin/images/bg_left_tl.gif"></TD>
      <TD style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">Main Menu</TD>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_ls.gif)"></TD>
      <TD id=menuTree style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" vAlign=top></TD>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_rs.gif)"></TD>
    </TR>
    <TR>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_br.gif"></TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT type=text/javascript>
var tree = null;
var root = new TreeNode('系统菜单');
 
 
 


 


var fun21 = new TreeNode('查看个人信息');
 
var fun23 = new TreeNode('查看个人信息', '<%=basePath %>yg/rz/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun23);
 


 
root.add(fun21);


 
 
 


var fun20 = new TreeNode('查看工资信息');
var fun28 = new TreeNode('查看工资信息', '<%=basePath %>yg/dy/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun20.add(fun28);
 
root.add(fun20);

 

 

 



tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
<%} %>
</HTML>
