<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
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
<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%>yg/dy/index.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>yg/dy/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>yg/dy/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>yg/dy/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>yg/dy/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>yg/dy/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>yg/dy/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>yg/dy/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>yg/dy/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}

function del()
{
	pageform.submit();
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

	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{
		 
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
        HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">���ʹ��� </SPAN>
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
                  <TH class=gridViewHeader style="WIDTH: 50px" scope=col>���</TH>
                  <TH class=gridViewHeader scope=col>Ա������</TH> 
                  <TH class=gridViewHeader scope=col>��������</TH>
                  <TH class=gridviewHeader scope=col>���ڽ���</TH>
                  <TH class=gridviewHeader scope=col>���ڷ���</TH>
                  <TH class=gridviewHeader scope=col>���ɽ���</TH>
                  <TH class=gridviewHeader scope=col>���ɷ���</TH>
                  <TH class=gridviewHeader scope=col>��нʱ��</TH> 
                  <TH class=gridviewHeader scope=col>ʵ�ʷ���</TH>  
                </TR>
            <%String xm=cb.getString("select xm from rz where dlm='"+username+"'");
			cb.setEVERYPAGENUM(6);
			int cou = cb.getMessageCount("select count(*) from dy  where xm ='"+xm+"'");//�õ���Ϣ����			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from dy  where xm ='"+xm+"' order by id desc",8); //����һ��ҳ���������ظ�ҳ��Ҫ��ʾ����Ϣ 
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //�õ�ҳ��  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq");
			
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
            
            
            <TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="right">
			 <TD >
			 <form action="" method="post" name="form3">	
			  <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
			  <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
			  <a href="#" onClick="top()"><img src="<%=basePath %>admin/images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="pre()"><img src="<%=basePath %>admin/images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,
				 ����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="next()"><img src="<%=basePath %>admin/images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="last()"><img src="<%=basePath %>admin/images/last.gif" border="0" /></a>
			  ��<input name="busjump" type="text" size="3" />ҳ
			  <a href="#" onClick="bjump()"><img src="<%=basePath %>admin/images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
             </TD>
             </TR>
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

