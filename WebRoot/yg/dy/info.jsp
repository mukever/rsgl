<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="bean" uri="http://jakarta.apache.org/struts/tags-bean" %>
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
		 String ksj=request.getParameter("ksj");
		 String esj=request.getParameter("esj");


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
        HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">待遇信息管理 </SPAN>
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
                  <TH class=gridViewHeader scope=col>适用套帐</TH>
                  <TH class=gridviewHeader scope=col>考勤奖金</TH>
                  <TH class=gridviewHeader scope=col>考勤罚款</TH>
                  <TH class=gridviewHeader scope=col>纪律奖金</TH>
                  <TH class=gridviewHeader scope=col>纪律罚款</TH>
                  <TH class=gridviewHeader scope=col>发薪时间</TH> 
                  <TH class=gridviewHeader scope=col>实际发放</TH>
                </TR>
            <%
			List pagelist3=cb.getCom("select * from dy where sj>='"+ksj+"' and sj<='"+esj+"' order by id desc",8);	
			for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			List tlist=cb.get1Com("select *  from gz where id='"+pagelist2.get(2).toString()+"'",10);
					float f=Float.parseFloat(tlist.get(2).toString())+Float.parseFloat(tlist.get(3).toString())+Float.parseFloat(tlist.get(4).toString())+Float.parseFloat(tlist.get(5).toString())+Float.parseFloat(tlist.get(6).toString())-Float.parseFloat(tlist.get(7).toString())-Float.parseFloat(tlist.get(8).toString());
			%>
                <TR>
                  <TD class=gridViewItem style="WIDTH: 50px"><%=i+1 %> </TD>
                  <TD class=gridViewItem><%=pagelist2.get(1).toString() %></TD> 
                  <TD class=gridViewItem><%=cb.getString("select xm from gz where id='"+pagelist2.get(2).toString()+"'") %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(3).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(4).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(5).toString() %></TD>
                  <TD class=gridViewItem><%=pagelist2.get(6).toString() %></TD> 
                  <TD class=gridViewItem><%=pagelist2.get(7).toString().substring(0,10) %></TD>   
                  <TD class=gridViewItem>
                  <%=Float.parseFloat(pagelist2.get(3).toString())-Float.parseFloat(pagelist2.get(4).toString())+Float.parseFloat(pagelist2.get(5).toString())- Float.parseFloat(pagelist2.get(6).toString())+f %></TD> 
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

