<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
.gridView {
	BORDER-RIGHT: #bad6ec 1px; BORDER-TOP: #bad6ec 1px; BORDER-LEFT: #bad6ec 1px; COLOR: #566984; BORDER-BOTTOM: #bad6ec 1px; FONT-FAMILY: Courier New
}
.gridViewHeader {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BACKGROUND-IMAGE: url(../images/bg_th.gif); BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 27px; BORDER-BOTTOM: #bad6ec 1px solid
}
.gridViewItem {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 32px; BORDER-BOTTOM: #bad6ec 1px solid; TEXT-ALIGN: center
}
.cmdField {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(../images/bg_rectbtn.png); OVERFLOW: hidden; BORDER-LEFT: 0px; WIDTH: 67px; COLOR: #364c6d; LINE-HEIGHT: 27px; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 27px; BACKGROUND-COLOR: transparent; TEXT-DECORATION: none
}
.buttonBlue {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(../images/bg_button_blue.gif); BORDER-LEFT: 0px; WIDTH: 78px; COLOR: white; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px
}
</STYLE>
</HEAD>

<script type="text/javascript">
function check()
{//String xm="";String xb="";String nl="";String xl="";String bm="";String gw="";String bz="";
	if(document.form1.xm.value==""||document.form1.bz.value=="")
	{
		alert("�������ݱ�����д��");
		document.form1.xm.focus();
		return false;
	}
	 
}

</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	String method=request.getParameter("method");
	String id="";
	String xm="";String lx="";String bz=""; 
	if(method.equals("upJC")){
		id=request.getParameter("id");
		List list=cb.get1Com("select * from jc where id='"+id+"'",4);
		xm=list.get(1).toString();
		lx=list.get(2).toString();
		bz=list.get(3).toString(); 
	}	 
		 	
%>
<BODY   scroll="yes">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR align="center"  >
			<TD height=23  class=gridViewHeader scope=col>����¼�� ������Ŀ������д</TD>
		  </TR>
		  <TR align="center" >
			<TD >
		<form name="form1" action="<%=basePath %>ComAction.do" method="post" onsubmit="return check()">
		  <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>Ա��������<input type=hidden name=method value=<%=method %>><input type=hidden name=id value=<%=id %>></TD>
			<TD align=left><select  name=xm>
			<%List bmlist=cb.getCom("select * from rz order by id desc",3);
			if(!bmlist.isEmpty()){for(int i=0;i<bmlist.size();i++){List list2=(List)bmlist.get(i); %>
			<option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>			
			<%}} %>
			</select></TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>�������ͣ�</TD>
			<TD align=left><select  name=lx>
			<option value="����">����</option>
			<option value="�ͷ�">�ͷ�</option>
			</select></TD>
		  </TR>
		   <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>��</TD>
			<TD align=left><input name=bz size=10 value=<%=bz %>> </TD>
		  </TR>
		   <TR  align="center"  >
			<TD colspan=2 align=center><input type=submit value="�ύ"></TD>
		  </TR>
		  </TBODY>
	   </TABLE>
		  </form>
		  </TD>
		  </TR>
		  </TBODY>
	   </TABLE>
</BODY>
<%} %>

</HTML>
