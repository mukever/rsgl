<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<jsp:useBean id="yzm" scope="page" class="com.util.CheckCode"/>
<jsp:useBean id="sdir" scope="page" class="com.bean.SystemBean"/>
<%
List list = sdir.getSiteInfo();
String str = list.get(0).toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
 	String code=yzm.getCheckCode();
 	String dir=sdir.getDir();
%>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=str %></title>
<LINK href="<%=basePath %>admin/images/public.css" type=text/css rel=stylesheet />
<LINK href="<%=basePath %>admin/images/login.css" type=text/css rel=stylesheet />
</HEAD>
<BODY onload=document.form1.username.focus();>
<DIV id=div1>
  <TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 align=center>
    <TBODY>
      <TR id=main>
        <TD>
        <form action="<%=basePath %>Admin.do" name=form1 method=post onSubmit="return checkform(form1)" autocomplete="off">
          <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
            <TBODY>
              <TR>
                <TD colSpan=4 align=center><h1><%=str %></h1></TD>
              </TR>
              <TR height=30>
                <TD width=380>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>�û�����</TD>
                <TD><INPUT class=textbox id=username name=username /></TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>�ܡ��룺</TD>
                <TD><INPUT class=textbox id=password type=password name=password /></TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>��¼�û���</TD>
                <TD vAlign=center colSpan=2><select name=method>
                <option value="one">����Ա</option>
                 <option value="two">Ա��</option>
                </select></TD>
              </TR>
              <TR height=40>
                <TD></TD>
                <TD align=right><INPUT id=btnLogin type=submit value=" �� ¼ " name=btnLogin /></TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
            </TBODY>
          </TABLE>
         </form>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
</BODY>
</HTML>

<script language=Javascript>
	function checkform(form)
	{
		var flag=true;
		if(form("username").value==""){alert("�������û���!");form("username").focus();return false};
		if(form("password").value==""){alert("���������!");form("password").focus();return false}; 
		return flag;
	}
</script>