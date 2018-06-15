<%@ page language="java" import="java.util.*,com.util.Common"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>
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
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
 
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

	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{
		 String mlmc=request.getParameter("mlmc");
		 mlmc=Common.toChineseAndTrim(mlmc);
%>
<BODY scroll="yes" style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<DIV>
  <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
      <TR style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_header.gif); BACKGROUND-REPEAT: repeat-x" height=47>
        <TD width=10>
        <SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
        <TD><SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
        <SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hb.gif); 
        PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; 
        HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">档案信息管理 </SPAN>
        <SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
        </TD>
        <TD style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rc.gif)" width=10></TD>
      </TR>
      <TR>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_ls.gif)">&nbsp;</TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white" vAlign=top align=middle>
          <DIV>
          
            <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
                <TR>
                  <TH class=gridViewHeader style="WIDTH: 50px" scope=col>序号</TH>
                  <TH class=gridViewHeader scope=col>员工姓名</TH> 
                  <TH class=gridViewHeader scope=col>性别</TH>
                  <TH class=gridviewHeader scope=col>出生日期</TH>
                  <TH class=gridviewHeader scope=col>学历</TH>
                  <TH class=gridviewHeader scope=col>所属部门</TH>
                  <TH class=gridviewHeader scope=col>岗位</TH> 
                  <TH class=gridviewHeader scope=col>登录名</TH> 
                </TR>
            <%
			List pagelist3=cb.getCom("select * from rz where bm like '%"+mlmc+"%'",11);	
			for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%>
                <TR>
                  <TD class=gridViewItem style="WIDTH: 50px"><%=i+1 %> </TD>
                  <TD class=gridViewItem><%=pagelist2.get(1).toString() %></TD> 
                  <TD class=gridViewItem><%=pagelist2.get(2).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(3).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(4).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(5).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(6).toString() %></TD>  
                  <TD class=gridViewItem><%=pagelist2.get(10).toString() %></TD> 
                </TR>
                <%}%>	
                
              </TBODY>
            </TABLE>
            
            
            
          </DIV>
        </TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rs.gif)"></TD>
      </TR>
      <TR style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_fs.gif); BACKGROUND-REPEAT: repeat-x" height=10>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_lf.gif)"></TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_fs.gif)"></TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rf.gif)"></TD>
      </TR>
    </TBODY>
  </TABLE>
  
</DIV>
</BODY>
<%} %>
</HTML>

