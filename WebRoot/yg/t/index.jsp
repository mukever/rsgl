<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
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
{//String xm="";String yg="";String sj=""; String dd=""; String xx=""; 
	if(document.form1.xm.value==""||document.form1.yg.value==""||document.form1.sj.value==""||document.form1.dd.value==""||document.form1.xx.value=="")
	{
		alert("所有项目必须填写！"); 
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
	 
		 
%>
<BODY   scroll="yes">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR align="center"  >
			<TD height=23  class=gridViewHeader scope=col>信息统计</TD>
		  </TR>
		  <TR align="center" >
			<TD >
		 
		  <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>培训信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from px") %> 条</TD>
		  </TR>
		   <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>入职信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from rz") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>离职信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from lz") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>调动信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from dd") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>部门信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from wdml") %> 条</TD>
		  </TR>
		   <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>岗位信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from gw") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>工资信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from gz") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>考勤信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from kq") %> 条</TD>
		  </TR>
		  <TR  align="center"  >
			<TD width=40%   class=gridViewItem align=right>奖惩信息统计：</TD>
			<TD align=left><%=cb.getCount("select count(*) from jc") %> 条</TD>
		  </TR>
		  </TBODY>
	   </TABLE>
		  
		  </TD>
		  </TR>
		  </TBODY>
	   </TABLE>
</BODY>
<%} %>

</HTML>
