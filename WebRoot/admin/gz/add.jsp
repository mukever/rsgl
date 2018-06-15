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
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/calendar.js"></SCRIPT>
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
{//String xm="";String jiben="";String work="";String house="";String other="";String more="";String shui="";String kother="";String sj="";
	if(document.form1.xm.value==""||document.form1.jiben.value==""
	||document.form1.work.value==""||document.form1.house.value==""
	||document.form1.other.value==""||document.form1.more.value==""
	||document.form1.shui.value==""||document.form1.kother.value==""
	||document.form1.sj.value=="")
	{
		alert("所有内容必须填写！");
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
	String xm="";String jiben="";String work="";String house="";String other="";String more="";String shui="";String kother="";String sj="";
	if(method.equals("upGZ")){
		id=request.getParameter("id");
		List list=cb.get1Com("select * from gz where id='"+id+"'",10);
		xm=list.get(1).toString();
		jiben=list.get(2).toString();
		work=list.get(3).toString();
		house=list.get(4).toString();other=list.get(5).toString();more=list.get(6).toString();shui=list.get(7).toString();
		kother=list.get(8).toString();sj=list.get(9).toString();
	}	 
		 	
%>
<BODY   scroll="yes">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR align="center"  >
			<TD height=23  class=gridViewHeader scope=col>数据录入 所有项目必须填写</TD>
		  </TR>
		  <TR align="center" >
			<TD >
		<form name="form1" action="<%=basePath %>ComAction.do" method="post" onsubmit="return check()">
		  <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
          <TBODY>	  
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right >套帐名称：<input type=hidden name=method value=<%=method %>><input type=hidden name=id value=<%=id %>></TD>
			<TD align=left><input type=text size=30 maxlength=50 name=xm value=<%=xm %>></TD>
		  </TR>
		   <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>基本工资：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=jiben value="<%=jiben %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>岗位津贴：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=work value="<%=work %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>住房基金：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=house value="<%=house %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元</TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>其他补助：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=other value="<%=other %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元</TD>
		  </TR>
		<TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>奖&nbsp;&nbsp;&nbsp;&nbsp;金：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=more value="<%=more %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>扣所得税：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=shui value="<%=shui %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>扣除其他：</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=kother value="<%=kother %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>录入时间：</TD>
			<TD align=left><input type=text size=30 maxlength=50 name=sj value="<%=sj %>"  onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";> </TD>
		  </TR>
		   <TR  align="center" bgColor=#ffffff>
			<TD colspan=2 align=center><input type=submit value="提交"></TD>
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
