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
{//String xm="";String kqjj="";String kqfk="";String jljj="";String jlfk="";String sj="";
	if(document.form1.xm.value==""||document.form1.kqjj.value==""
	||document.form1.kqfk.value==""||document.form1.jljj.value==""
	||document.form1.jlfk.value==""||document.form1.sj.value=="" )
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
	String xm="";String tz="";String kqjj="";String kqfk="";String jljj="";String jlfk="";String sj="";
	if(method.equals("updy")){
		id=request.getParameter("id");
		List list=cb.get1Com("select * from dy where id='"+id+"'",8);
		xm=list.get(1).toString();tz=list.get(2).toString();
		kqjj=list.get(3).toString();
		kqfk=list.get(4).toString();
		jljj=list.get(5).toString();jlfk=list.get(6).toString();sj=list.get(7).toString(); 
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
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right >Ա��������<input type=hidden name=method value=<%=method %>><input type=hidden name=id value=<%=id %>></TD>
			<TD align=left><select  name=xm>
			<%List bmlist=cb.getCom("select * from rz order by id desc",3);
			if(!bmlist.isEmpty()){for(int i=0;i<bmlist.size();i++){List list2=(List)bmlist.get(i); %>
			<option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>			
			<%}} %>
			</select></TD>
		  </TR>
		   <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>�������ʣ�</TD>
			<TD align=left><select  name=tz>
			<%List tlist=cb.getCom("select * from gz order by id desc",3);
			if(!tlist.isEmpty()){for(int i=0;i<tlist.size();i++){List list2=(List)tlist.get(i); %>
			<option value="<%=list2.get(0).toString() %>"><%=list2.get(1).toString() %></option>			
			<%}} %>
			</select></TD>
		  </TR> 
		<TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>���ڽ���</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=kqjj value="<%=kqjj %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"> Ԫ </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>���ڷ��</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=kqfk value="<%=kqfk %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"> Ԫ </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>���ɽ���</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=jljj value="<%=jljj %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"> Ԫ </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>���ɷ��</TD>
			<TD align=left><input type=text size=10 maxlength=20 name=jlfk value="<%=jlfk %>"  onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('������������');this.value='';this.focus();}"> Ԫ </TD>
		  </TR>
		  <TR  align="center" bgColor=#ffffff>
			<TD width=40%  class=gridViewItem align=right>��нʱ�䣺</TD>
			<TD align=left><input type=text size=30 maxlength=50 name=sj value="<%=sj %>"  onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";> ʱ���ʽ��0000-00-00</TD>
		  </TR>
		   <TR  align="center" bgColor=#ffffff>
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
