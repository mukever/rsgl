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
    <SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
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
        if(document.form1.xm.value==""||document.form1.nl.value==""
            ||document.form1.xl.value==""||document.form1.bm.value==""
            ||document.form1.gw.value==""||document.form1.bz.value==""||document.form1.dlm.value==""||document.form1.mm.value=="")
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

        String xm="";String xb="";String nl="";String xl="";String bm="";String gw="";String bz="";String dlm="";String mm="";


        List list=cb.get1Com("select * from rz where dlm='"+username+"'",11);
        xm=list.get(1).toString();
        xb=list.get(2).toString();
        nl=list.get(3).toString();
        xl=list.get(4).toString();bm=list.get(5).toString();gw=list.get(6).toString();bz=list.get(7).toString();dlm=list.get(9).toString();
        mm=list.get(10).toString();


%>
<BODY   scroll="yes">
<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
    <TBODY>
    <TR align="center"  >
        <TD height=23  class=gridViewHeader scope=col>Ա��������Ϣ</TD>
    </TR>
    <TR align="center" >
        <TD >
            <form name="form1" action="<%=basePath %>ComAction.do" method="post" onsubmit="return check()">
                <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
                    <TBODY>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>Ա��������<input type=hidden name=method value=ygup></TD>
                        <TD align=left><%=xm %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>�Ա�</TD>
                        <TD align=left><%=xb %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>�������ڣ�</TD>
                        <TD align=left><%=nl %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>ѧ����</TD>
                        <TD align=left><%=xl %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>�������ţ�</TD>
                        <TD align=left><%=bm %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>��λ��</TD>
                        <TD align=left><%=gw %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>��ע��</TD>
                        <TD align=left><%=bz %></TD>
                    </TR>
                    <TR  align="center"  >
                        <TD width=40%   class=gridViewItem align=right>Ա����¼����</TD>
                        <TD align=left><%=dlm %></TD>
                    </TR>
                    <%--<TR  align="center"  >--%>
                        <%--<TD width=40%   class=gridViewItem align=right>��¼���룺</TD>--%>
                        <%--<TD align=left><%=mm %></TD>--%>
                    <%--</TR>--%>

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
