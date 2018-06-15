package com.action;
/**
 * 管理员登陆 增加 修改 删除 删除登陆日志
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.AdminBean;
import com.bean.ComBean;
import com.bean.GZBean;
import com.bean.SystemBean;
import com.config.Config;
import com.util.Constant;
import com.util.DBO;
import com.util.MD5;
import jxl.Workbook;
import jxl.format.*;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.*;

public class AdminAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		try{
			String method=request.getParameter("method").trim();
			AdminBean loginbean = new AdminBean();
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1200);
			SystemBean systembean = new SystemBean();
			String sysdir = systembean.getDir();
			if(method.equals("one")){//admin登录
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				if(username == null||username.trim().equals("")){
					request.setAttribute("message", "请正确输入用户名！");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else if(password == null||password.trim().equals("")){
					request.setAttribute("message", "请输入密码！");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else{
					String md5password = MD5.MD5(password);
					String agent = request.getHeader("user-agent"); 
					StringTokenizer st = new StringTokenizer(agent,";"); 
					String useros=st.nextToken();
					String loginip = request.getRemoteAddr();			
					int flag = loginbean.adminLogin(username,md5password, password,useros,loginip);
					switch (flag){
						case Constant.SUCCESS:
							List list = loginbean.getAdminInfo(username);
							session.setAttribute("user", username);
							session.setAttribute("list", list);
							request.getRequestDispatcher("admin/index.jsp").forward(request, response);
							break;
						case Constant.NAME_ERROR:
							request.setAttribute("message", "用户名错误！请确认管理权限！");
							request.getRequestDispatcher("admin/login.jsp").forward(request, response);
							break;
						case Constant.PASSWORD_ERROR:
							request.setAttribute("message", "密码错误，请确认管理权限！");
							request.getRequestDispatcher("admin/login.jsp").forward(request, response);
							break;
					}
				}
			}
			else if(method.equals("two")){
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				ComBean cb=new ComBean();
				String str=cb.getString("select id from rz where dlm='"+username+"' and mm='"+password+"'");
				if(str==null){
					request.setAttribute("message", "用户名错误！请确认管理权限！");
					request.getRequestDispatcher("admin/login.jsp").forward(request, response);
				}
				else{
					session.setAttribute("user", username);
					session.setAttribute("list", "");
					request.getRequestDispatcher("yg/index.jsp").forward(request, response);
				}
			}
			else if(method.equals("editpwd")){//admin edit password
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					String oldpwd = MD5.MD5(request.getParameter("oldpwd").trim());
					String newpwd = MD5.MD5(request.getParameter("newpwd").trim());
					String username = (String)session.getAttribute("user");
					int flag = loginbean.editPassword(username, oldpwd, newpwd);
					switch (flag){
						case Constant.SUCCESS:
							request.setAttribute("message", "密码修改成功！");
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);
							break;
						case Constant.PASSWORD_ERROR:
							request.setAttribute("message", "原始密码错误，请确认权限！");
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);
							break;
						case Constant.SYSTEM_ERROR:
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/editpwd.jsp").forward(request, response);
							break;
					}
				}		
			}
			else if(method.equals("exit")){//admin exit
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					session.removeAttribute("user");
					session.removeAttribute("list");
					System.gc();
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}			
			}
			else if(method.equals("manager")){//add,update manager
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					String ra = request.getParameter("ra").trim();
					if(ra.equals("add")){
						String username = request.getParameter("username").trim();
						String password = MD5.MD5(request.getParameter("password").trim());
						String sf = request.getParameter("sf").trim();
						String isuse = request.getParameter("isuse").trim();
						if(isuse.equals("在用"))
							isuse = "1";
						else
							isuse = "2";
						int flag = loginbean.addManager(username, password, "2", isuse,sf);
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "增加管理员成功！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}
						else if(flag == Constant.SAME_NAME){
							request.setAttribute("username", username);
							request.setAttribute("message", "该用户名已经存在！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}		
					}
					else if(ra.equals("update")){
						String username = request.getParameter("username").trim();
						String password = request.getParameter("password").trim();
						String isuse = request.getParameter("isuse").trim();
						if(!password.equals("")){
							password = MD5.MD5(password);
						}
						if(isuse.equals("在用"))
							isuse = "1";
						else
							isuse = "2";
						int flag = loginbean.updateManager(username, password, "2", isuse);
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "修改管理员信息成功！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}	
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}		
					}
				}
			}
			else if(method.equals("delm")){//delete manager
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					int id = Integer.parseInt(request.getParameter("id").trim());
					if(id == 1){
						request.setAttribute("message", "不能删除原始帐号！");
						request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
					}
					else{
						int flag = loginbean.delManager(id);
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "删除成功！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}	
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/user.jsp").forward(request, response);
						}	
					}
				}			
			}
			else if(method.equals("dellog")){//delete login note
				String username2 = (String)session.getAttribute("user");
				if(username2 == null){
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				else{
					String check[] = request.getParameterValues("checkit");
					if(check == null){
						request.setAttribute("message", "请选择要删除的记录！");
						request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
					}
					else{
						int id[]= new int[check.length];
						for(int i = 0;i<check.length;i++){
							int s = Integer.parseInt(check[i]);				
							id[i] = s;
						}
						int flag = loginbean.delLog(id);
						if(flag == Constant.SUCCESS){
							request.setAttribute("message", "删除记录成功！");
							request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "系统维护中，请稍后再试！");
							request.getRequestDispatcher(sysdir+"/system/log.jsp").forward(request, response);
						}
					}
				}			
			}else if(method.equals("exportexcel")){
                this.excel(request,response);
			}
			else{//无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

	public String excel(HttpServletRequest req,HttpServletResponse resp) throws Exception{

		String  name=req.getParameter("name");

		List<GZBean> xList= new ArrayList<>();
		//获取数据
        String ksj=req.getParameter("ksj");
        String esj=req.getParameter("esj");
        //链接数据库
        DBO dbo = new DBO();
        dbo.open();
        String sql = "select * from dy where sj>='"+ksj+"' and sj<='"+esj+"' order by id desc";
        ResultSet rs = dbo.executeQuery(sql);

        while (rs.next()){
            GZBean gzBean = new GZBean();

            /*
             private String xm;
            private double jiben;
            private double work;
            private double house;
            private double other;
            private double more;
            private double shui;
            private double kother;
            private String sj;

             */
            gzBean.setId(rs.getInt("id"));
            gzBean.setXm(rs.getString("xm"));
            gzBean.setTz(rs.getString("tz"));
            gzBean.setKqjj(rs.getDouble("kqjj"));
            gzBean.setKqfk(rs.getDouble("kqfk"));
            gzBean.setJljj(rs.getDouble("jljj"));
            gzBean.setJlfk(rs.getDouble("jlfk"));
            gzBean.setSj(rs.getTimestamp("sj"));


            xList.add(gzBean);
        }

		dbo.close();

		String 	fName = new String("123".getBytes("GBK"), "ISO8859-1");

		String path=req.getSession().getServletContext().getRealPath("upload");
		if (!"".equals(fName)&& null!=fName) {
			String fileName = path + "/" + fName + ".xls";

			File exportFile=this.excel(xList);


			resp.setContentType("multipart/form-data");
			resp.setHeader("Content-Disposition", "attachment;fileName="+new String(fileName.getBytes(), "iso-8859-1"));
			ServletOutputStream out;
			try {
				FileInputStream inputStream = new FileInputStream(exportFile);

				out = resp.getOutputStream();

				int b = 0;
				byte[] buffer = new byte[2048];
				while (b!=-1){

                    b = inputStream.read(buffer);
                    if(b!=-1){
                        out.write(buffer,0,b);
                    }


				}
				inputStream.close();
				out.close();
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;

	}

	public File excel(List<GZBean> xList) {

		File exportFile = null;
		String path = "/"+ Config.findHomeDir();

		String fileName = path + "//" + UUID.randomUUID()+ ".xls";

		try {
			exportFile = new File(fileName);
			if (!exportFile.exists()) {
				exportFile.createNewFile();
			}
			FileOutputStream os = new FileOutputStream(exportFile);
			WritableWorkbook book = null;
			book = Workbook.createWorkbook(os);

			WritableSheet sheet1 = book.createSheet("工资列表", 0);

			sheet1.getSettings().setTopMargin(1.0D);
			sheet1.getSettings().setBottomMargin(1.0D);
			sheet1.getSettings().setLeftMargin(0.2D);
			sheet1.getSettings().setRightMargin(0.2D);

			WritableFont wf = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK);

			WritableCellFormat wcf = new WritableCellFormat(wf);
			wcf.setBackground(Colour.WHITE);
			wcf.setAlignment(Alignment.CENTRE);
			wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcf.setBorder(Border.ALL, BorderLineStyle.THIN);
			wcf.setWrap(true);

			WritableFont wfTitle = new WritableFont(WritableFont.ARIAL, 30, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK);

			WritableCellFormat wcfTitle = new WritableCellFormat(wfTitle);
			wcfTitle.setBackground(Colour.WHITE);
			wcfTitle.setAlignment(Alignment.CENTRE);
			wcf.setVerticalAlignment(VerticalAlignment.CENTRE);

			wcfTitle.setWrap(true);
            /*序号	员工姓名	适用套帐	考勤奖金	考勤罚款	纪律奖金	纪律罚款	发薪时间	实际发放*/
			sheet1.setRowView(0, 1000);
			sheet1.setColumnView(0, 15);
			sheet1.addCell(new Label(0, 0, "序号", wcf));
			sheet1.setColumnView(1, 15);
			sheet1.addCell(new Label(1, 0, "员工姓名", wcf));
			sheet1.setColumnView(2, 15);
			sheet1.addCell(new Label(2, 0, "适用套帐", wcf));

            sheet1.setColumnView(3, 15);
            sheet1.addCell(new Label(3, 0, "考勤奖金", wcf));
            sheet1.setColumnView(4, 15);
            sheet1.addCell(new Label(4, 0, "考勤罚款", wcf));
            sheet1.setColumnView(5, 15);
            sheet1.addCell(new Label(5, 0, "纪律奖金", wcf));
            sheet1.setColumnView(6, 25);
            sheet1.addCell(new Label(6, 0, "纪律罚款", wcf));

            sheet1.setColumnView(7, 15);
            sheet1.addCell(new Label(7, 0, "发薪时间", wcf));
            sheet1.setColumnView(8, 15);
            sheet1.addCell(new Label(8, 0, "实际发放", wcf));

			/**
			 * 循环输出单元格内容
			 */
            DBO dbo = new DBO();
            dbo.open();
			Integer product_count = Integer.valueOf(1);
			int start =1;
			for (GZBean gzBean : xList) {

			    String sql = "select * from gz where id='"+gzBean.getTz()+"'";

			    ResultSet rs =  dbo.executeQuery(sql);


			    String tzname = "";

			    double tmp = 0;

			    while (rs.next()){
                    tzname=rs.getString("xm");
                    double tmp2 = rs.getDouble("jiben");
                    double tmp3 = rs.getDouble("work");
                    double tmp4 = rs.getDouble("house");
                    double tmp5 = rs.getDouble("other");
                    double tmp6 = rs.getDouble("more");
                    double tmp7 = rs.getDouble("shui");
                    double tmp8 = rs.getDouble("kother");

			        tmp = tmp2+tmp3+tmp4+tmp5+tmp6-tmp7-tmp8;
                }


				sheet1.addCell(new Label(0, product_count.intValue(), String.valueOf(start), wcf));
				sheet1.addCell(new Label(1, product_count.intValue(), gzBean.getXm(), wcf));
				sheet1.addCell(new Label(2, product_count.intValue(), tzname, wcf));
				sheet1.addCell(new Label(3, product_count.intValue(), String.valueOf(gzBean.getKqjj()), wcf));

                sheet1.addCell(new Label(4, product_count.intValue(), String.valueOf(gzBean.getKqfk()), wcf));
                sheet1.addCell(new Label(5, product_count.intValue(), String.valueOf(gzBean.getJljj()), wcf));

                sheet1.addCell(new Label(6, product_count.intValue(), String.valueOf(gzBean.getJlfk()), wcf));

                sheet1.addCell(new Label(7, product_count.intValue(), String.valueOf(gzBean.getSj()).substring(0,10), wcf));
                sheet1.addCell(new Label(8, product_count.intValue(), String.valueOf(tmp+gzBean.getJljj()+gzBean.getKqjj()-gzBean.getJlfk()-gzBean.getKqfk()), wcf));



				product_count++;
				start++;
			}
            dbo.close();
			book.write();
			os.flush();
			book.close();
			os.close();
			return exportFile;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {

		}
	}
}
