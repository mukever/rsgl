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
<TITLE>ϵͳ����</TITLE>
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
var root = new TreeNode('ϵͳ�˵�');
 <%if(username.equals("admin")){ %>
var fun1 = new TreeNode('ϵͳ�û�����');
var fun2 = new TreeNode('ϵͳ�û�����', '<%=basePath %><%=dir %>/system/user.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun1.add(fun2);
 

root.add(fun1);

<%}%>
 
var fun13 = new TreeNode('��ҵ�ܹ�����');
var fun14 = new TreeNode('������Ϣ����', '<%=basePath %><%=dir %>/ck/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun14);
var fun15 = new TreeNode('���Ӳ�����Ϣ', '<%=basePath %><%=dir %>/ck/add.jsp?method=addCK', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun15);
var fun15 = new TreeNode('��ѯ������Ϣ', '<%=basePath %><%=dir %>/ck/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun15);

var fun16 = new TreeNode('��λ��Ϣ����', '<%=basePath %><%=dir %>/gw/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun16);
var fun17 = new TreeNode('���Ӹ�λ��Ϣ', '<%=basePath %><%=dir %>/gw/add.jsp?method=addGW', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun17);
var fun18 = new TreeNode('��ѯ��λ��Ϣ', '<%=basePath %><%=dir %>/gw/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun18);
root.add(fun13);



 


var fun21 = new TreeNode('Ա����Ϣ����');
var fun22 = new TreeNode('Ա����Ϣ����', '<%=basePath %><%=dir %>/rz/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun22);
var fun23 = new TreeNode('����Ա����Ϣ', '<%=basePath %><%=dir %>/rz/add.jsp?method=addRZ', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun23);
var fun23 = new TreeNode('��ѯԱ����Ϣ', '<%=basePath %><%=dir %>/rz/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun23);


 
root.add(fun21);


 

var fun27 = new TreeNode('���ʱ�׼����');
var fun28 = new TreeNode('���ʱ�׼����', '<%=basePath %><%=dir %>/gz/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun27.add(fun28);
var fun29 = new TreeNode('���ӹ��ʱ�׼', '<%=basePath %><%=dir %>/gz/add.jsp?method=addGZ', 'tree_node.gif', null, 'tree_node.gif', null);
fun27.add(fun29);
var fun29 = new TreeNode('��ѯ���ʱ�׼', '<%=basePath %><%=dir %>/gz/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun27.add(fun29);
root.add(fun27);


var fun20 = new TreeNode('Ա�����ʹ���');
var fun28 = new TreeNode('Ա�����ʹ���', '<%=basePath %><%=dir %>/dy/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun20.add(fun28);
var fun29 = new TreeNode('���ӹ��ʼ�¼', '<%=basePath %><%=dir %>/dy/add.jsp?method=addDY', 'tree_node.gif', null, 'tree_node.gif', null);
fun20.add(fun29);
var fun29 = new TreeNode('������Ϣͳ��', '<%=basePath %><%=dir %>/dy/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun20.add(fun29);
root.add(fun20);

 

 

 



tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
<%} %>
</HTML>
