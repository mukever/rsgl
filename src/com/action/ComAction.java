package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComAction() {
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
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addmc")){ 
			 String mname = request.getParameter("mname"); 
			 int flag = cBean.comUp("insert into ssmc(mc)  values('"+mname+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/yao/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/yao/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delmc")){ 
			String id = request.getParameter("id");  
			 int flag = cBean.comUp("delete from ssmc where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/yao/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/yao/index.jsp").forward(request, response); 
				} 
		}
		//String xm="";String xb="";String nl="";String bm="";String dh="";String bz="";
		else if(method.equals("addStu")){  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl");  
			 String bm = request.getParameter("bm"); 
			 String dh = request.getParameter("dh"); 
			 String bz = request.getParameter("bz"); 
			 int flag = cBean.comUp("insert into stu(xm,xb,nl,bm,dh,bz) values('"+xm+"','"+xb+"','"+nl+"','"+bm+"','"+dh+"','"+bz+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upStu")){  
			String id = request.getParameter("id");  
			String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl");  
			 String bm = request.getParameter("bm"); 
			 String dh = request.getParameter("dh"); 
			 String bz = request.getParameter("bz"); 
			 int flag = cBean.comUp("update stu set xm='"+xm+"',xb='"+xb+"',nl='"+nl+"',bm='"+bm+"',dh='"+dh+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delStu")){ 
			String id = request.getParameter("id");  
			 String sql="delete from stu where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/stu/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("addCK")){ 
			//String ccmc="";String gmsj="";String jg="";String sccj="";String ssmc="";String bz="";
			 String mlmc = request.getParameter("mlmc");  
			 String cfnr = request.getParameter("cfnr");  
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("insert into wdml(mlmc,cfnr,bz,sj,rk,ck) values('"+mlmc+"','"+cfnr+"','"+bz+"','"+date2+"','禁止','禁止' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upCc")){  
			String id = request.getParameter("id");  
			String mlmc = request.getParameter("mlmc");  
			 String cfnr = request.getParameter("cfnr");  
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("update wdml set mlmc='"+mlmc+"',cfnr='"+cfnr+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delCc")){ 
			String id = request.getParameter("id");  
			 String sql="delete from wdml where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ck/index.jsp").forward(request, response); 
				} 
		}
		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		
		 
		
		 
		
		else if(method.equals("addHW")){ 
		 //String zl="";			String mc="";String xh="";String gg=""; String cj=""; String jg=""; String bz=""; 
			String zl = request.getParameter("zl");  
			 String mc = request.getParameter("mc");  
			 String xh = request.getParameter("xh");  
			 String gg = request.getParameter("gg");  
			 String cj = request.getParameter("cj");  
			 String jg = request.getParameter("jg");  
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("insert into hw(zl,mc,xh,gg,cj,jg,bz,kc) values('"+zl+"','"+mc+"','"+xh+"','"+gg+"','"+cj+"','"+jg+"','"+bz+"','0' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upHW")){  
			String id = request.getParameter("id");  
			String zl = request.getParameter("zl");  
			 String mc = request.getParameter("mc");  
			 String xh = request.getParameter("xh");  
			 String gg = request.getParameter("gg");  
			 String cj = request.getParameter("cj");  
			 String jg = request.getParameter("jg");  
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("update hw set zl='"+zl+"',mc='"+mc+"',xh='"+xh+"',gg='"+gg+"'" +
			 		",cj='"+cj+"',jg='"+jg+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delHW")){ 
			String id = request.getParameter("id");  
			 String sql="delete from hw where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hw/index.jsp").forward(request, response); 
				} 
		}
		
		
		else if(method.equals("rK")){ 
			String id = request.getParameter("id");  
			 String sql="select rk from wdml  where id='"+id+"'";
			 String sql2="update wdml set rk='禁止' where id='"+id+"'";
			 String str=cBean.getString(sql);
			 if(str.equals("禁止")){
				 sql2="update wdml set rk='允许' where id='"+id+"'";
			 }
			 int flag = cBean.comUp(sql2);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hw/jc.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hw/jc.jsp").forward(request, response); 
				} 
		}
		
		else if(method.equals("cK")){ 
			String id = request.getParameter("id");  
			 String sql="select ck from wdml  where id='"+id+"'";
			 String sql2="update wdml set ck='禁止' where id='"+id+"'";
			 String str=cBean.getString(sql);
			 if(str.equals("禁止")){
				 sql2="update wdml set ck='允许' where id='"+id+"'";
			 }
			 int flag = cBean.comUp(sql2);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hw/jc.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hw/jc.jsp").forward(request, response); 
				} 
		}
		
		
		
		
		else if(method.equals("addRK")){ 
			  //select cfnr from gz where mlmc=(select zl from hw where id='"+pagelist2.get(1).toString()+"') 
				String hwid = request.getParameter("zl");  
				 String rksl = request.getParameter("sl"); 
				 String str=cBean.getString("select rk from wdml where mlmc=" +
				 		"(select cfnr from gz where mlmc=(select zl from hw where id='"+hwid+"') )");
				 
				if(str.equals("禁止")){
					request.setAttribute("message", "对不起，当前仓库禁止入库，请先修改入库控制状态！");
					request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
				}
				else{
					int r=Integer.parseInt(rksl);
					 int flag = cBean.comUp("insert into rk(hwid,rksl,rksj) values('"+hwid+"','"+rksl+"','"+date2+"'  )");
						if(flag == Constant.SUCCESS){ 
							cBean.comUp("update hw set kc=kc+"+r+" where id='"+hwid+"'");
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
						} 
				}
				 
			}
		else if(method.equals("delRK")){ 
			String id = request.getParameter("id");  
			String hwid=cBean.getString("select hwid from rk where id='"+id+"'");
			int rksl=cBean.getCount("select rksl from rk where id='"+hwid+"'");
			int flag=cBean.comUp("update hw set kc=kc-"+rksl+" where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				String sql="delete from rk where id='"+id+"'";
				 int flag2 = cBean.comUp(sql);
					if(flag2 == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
					} 
			}
			else { 
				request.setAttribute("message", "系统障碍！");
				request.getRequestDispatcher("admin/hw/rk.jsp").forward(request, response); 
			} 
			 
		}
		
		
		
		
		else if(method.equals("addCKsss")){ 
			  //select cfnr from gz where mlmc=(select zl from hw where id='"+pagelist2.get(1).toString()+"') 
				String hwid = request.getParameter("zl");  
				 String cksl = request.getParameter("sl"); 
				 String str=cBean.getString("select ck from wdml where mlmc=" +
				 		"(select cfnr from gz where mlmc=(select zl from hw where id='"+hwid+"') )");
				 
				if(str.equals("禁止")){
					request.setAttribute("message", "对不起，当前仓库禁止出库，请先修改入库控制状态！");
					request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
				}
				else{
					int r=Integer.parseInt(cksl);
					int kc=cBean.getCount("select kc from hw where id='"+hwid+"'");
					if(r<=kc){
						int flag = cBean.comUp("insert into ck(hwid,cksl,cksj) values('"+hwid+"','"+cksl+"','"+date2+"'  )");
						if(flag == Constant.SUCCESS){ 
							cBean.comUp("update hw set kc=kc-"+r+" where id='"+hwid+"'");
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
						} 
					}
					else{
						request.setAttribute("message", "库存不足！");
						request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
					}
				}
				 
			}
		else if(method.equals("delCK")){ 
			String id = request.getParameter("id");  
			 
				String sql="delete from ck where id='"+id+"'";
				 int flag2 = cBean.comUp(sql);
					if(flag2 == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/hw/ck.jsp").forward(request, response); 
					} 
			 
			 
		}
		
		
		else if(method.equals("addGW")){ 
			//String ccmc="";String gmsj="";String jg="";String sccj="";String ssmc="";String bz="";
			 String mlmc = request.getParameter("mlmc");  
			 String cfnr = request.getParameter("cfnr");  
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("insert into gw(mlmc,cfnr,bz,sj,rk,ck) values('"+mlmc+"','"+cfnr+"','"+bz+"','"+date2+"','禁止','禁止' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upGW")){  
			String id = request.getParameter("id");  
			String mlmc = request.getParameter("mlmc");  
			 String cfnr = request.getParameter("cfnr");  
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("update gw set mlmc='"+mlmc+"',cfnr='"+cfnr+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delGW")){ 
			String id = request.getParameter("id");  
			 String sql="delete from gw where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gw/index.jsp").forward(request, response); 
				} 
		}
		
		
		///////////// ======================================================
		else if(method.equals("addPX")){  
			 String xm = request.getParameter("xm");  
			 String yg = request.getParameter("yg");  
			 String sj = request.getParameter("sj"); 
			 String dd = request.getParameter("dd");  
			 String xx = request.getParameter("xx");   
			 int flag = cBean.comUp("insert into px(xm,yg,sj,dd,xx) values('"+xm+"','"+yg+"','"+sj+"','"+dd+"','"+xx+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upPX")){  
			String id = request.getParameter("id");  
			String xm = request.getParameter("xm");  
			 String yg = request.getParameter("yg");  
			 String sj = request.getParameter("sj"); 
			 String dd = request.getParameter("dd");  
			 String xx = request.getParameter("xx");   
			 int flag = cBean.comUp("update px set xm='"+xm+"',yg='"+yg+"',sj='"+sj+"',dd='"+dd+"',xx='"+xx+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delPX")){ 
			String id = request.getParameter("id");  
			 String sql="delete from px where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/px/index.jsp").forward(request, response); 
				} 
		}
		
///////////// ======================================================
		//String xm="";String xb="";String nl="";String xl="";String bm="";String gw="";String bz="";
		else if(method.equals("addRZ")){  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 String dlm = request.getParameter("dlm");   
			 String mm = request.getParameter("mm");   
			 String str=cBean.getString("select id from rz where dlm='"+dlm+"'");
			 if(str==null){
				 int flag = cBean.comUp("insert into rz(xm,xb,nl,xl,bm,gw,bz,zz,dlm,mm) " +
					 		"values('"+xm+"','"+xb+"','"+nl+"','"+xl+"','"+bm+"','"+gw+"','"+bz+"','试用期','"+dlm+"','"+mm+"' )");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
						} 
			 }
			 else{
				 request.setAttribute("message", "登录名重复");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
			 }
			 
		}
		else if(method.equals("upRZ")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 String dlm = request.getParameter("dlm");   
			 String mm = request.getParameter("mm");  
			 String str=cBean.getString("select id from rz where dlm='"+dlm+"' and id!='"+id+"'");
			 if(str==null){
				 int flag = cBean.comUp("update rz set xm='"+xm+"',xb='"+xb+"',nl='"+nl+"',xl='"+xl+"',bm='"+bm+"'," +
					 		"gw='"+gw+"',bz='"+bz+"',dlm='"+dlm+"',mm='"+mm+"' where id='"+id+"'");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
						} 
			 }
			 else{
				 request.setAttribute("message", "登录名重复");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
			 }
			 
		}
		else if(method.equals("infoRZ")){

			request.getRequestDispatcher("yg/rz/index.jsp").forward(request, response);
		}


		else if(method.equals("ygup")){  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 String dlm = request.getParameter("dlm");   
			 String mm = request.getParameter("mm");  
			 
				 int flag = cBean.comUp("update rz set xm='"+xm+"',xb='"+xb+"',nl='"+nl+"',xl='"+xl+"',bm='"+bm+"'," +
					 		"gw='"+gw+"',bz='"+bz+"',mm='"+mm+"' where dlm='"+dlm+"'");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("yg/rz/add.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("yg/rz/add.jsp").forward(request, response); 
						} 
			 
			 
		}
		else if(method.equals("delRZ")){ 
			String id = request.getParameter("id");  
			 String sql="delete from rz where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("zzRZ")){ 
			String id = request.getParameter("id");  
			 String sql="update rz set zz='正式员工' where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/index.jsp").forward(request, response); 
				} 
		}
		
//////	 ======================================================
		//String xm="";String sj="";String yy="";String bz=""; 
		else if(method.equals("addLZ")){  
			 String xm = request.getParameter("xm");  
			 String sj = request.getParameter("sj");  
			 String yy = request.getParameter("yy"); 
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("insert into lz(xm,sj,yy,bz) values('"+xm+"','"+sj+"','"+yy+"','"+bz+"'  )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upLZ")){  
			String id = request.getParameter("id");  
			String xm = request.getParameter("xm");  
			 String sj = request.getParameter("sj");  
			 String yy = request.getParameter("yy"); 
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("update lz set xm='"+xm+"',sj='"+sj+"',yy='"+yy+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delLZ")){ 
			String id = request.getParameter("id");  
			 String sql="delete from lz where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/lz/index.jsp").forward(request, response); 
				} 
		}
		 ///------------------------------------------------------------------------------------------------------------
		//String xm="";String jiben="";String work="";String house="";String other="";String more="";String shui="";String kother="";String sj="";
		else if(method.equals("addGZ")){  
			 String xm = request.getParameter("xm");  
			 String jiben = request.getParameter("jiben");  
			 String work = request.getParameter("work"); 
			 String house = request.getParameter("house"); 
			 String other = request.getParameter("other"); 
			 String sj = request.getParameter("sj"); 
			 String more = request.getParameter("more"); 
			 String shui = request.getParameter("shui"); 
			 String kother = request.getParameter("kother"); 
			 int flag = cBean.comUp("insert into gz(xm,jiben,work,house,other,more,shui,kother,sj) " +
			 		"values('"+xm+"','"+jiben+"','"+work+"','"+house+"' ,'"+other+"','"+more+"','"+shui+"','"+kother+"','"+sj+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upGZ")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String jiben = request.getParameter("jiben");  
			 String work = request.getParameter("work"); 
			 String house = request.getParameter("house"); 
			 String other = request.getParameter("other"); 
			 String sj = request.getParameter("sj"); 
			 String more = request.getParameter("more"); 
			 String shui = request.getParameter("shui"); 
			 String kother = request.getParameter("kother"); 
			 int flag = cBean.comUp("update gz set xm='"+xm+"',jiben='"+jiben+"',work='"+work+"',house='"+house+"'," +
			 		"other='"+other+"',more='"+more+"',shui='"+shui+"',kother='"+kother+"',sj='"+sj+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delGZ")){ 
			String id = request.getParameter("id");  
			 String sql="delete from gz where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				} 
		}
		
		
		
		else if(method.equals("addDD")){  
			 String id = request.getParameter("id");  
			 String bm = request.getParameter("bm");  
			 String gw = request.getParameter("gw"); 
			 String xm=cBean.getString("select xm from rz where id='"+id+"'");
			 String bm2=cBean.getString("select bm from rz where id='"+id+"'");
			 String gw2=cBean.getString("select gw from rz where id='"+id+"'");
			 int flag = cBean.comUp("insert into dd(xm,bm2,gw2,bm,gw ,sj) " +
			 		"values('"+xm+"','"+bm2+"','"+gw2+"','"+bm+"' ,'"+gw+"','"+date2+"'  )");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update rz set bm='"+bm+"',gw='"+gw+"' where id='"+id+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upDD")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String jiben = request.getParameter("jiben");  
			 String work = request.getParameter("work"); 
			 String house = request.getParameter("house"); 
			 String other = request.getParameter("other"); 
			 String sj = request.getParameter("sj"); 
			 String more = request.getParameter("more"); 
			 String shui = request.getParameter("shui"); 
			 String kother = request.getParameter("kother"); 
			 int flag = cBean.comUp("update gz set xm='"+xm+"',jiben='"+jiben+"',work='"+work+"',house='"+house+"'," +
			 		"other='"+other+"',more='"+more+"',shui='"+shui+"',kother='"+kother+"',sj='"+sj+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/gz/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delDD")){ 
			String id = request.getParameter("id");  
			 String sql="delete from dd where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/dd/index.jsp").forward(request, response); 
				} 
		}
		//--------------------------===================================================================
		else if(method.equals("addJC")){  
			 
			 String xm = request.getParameter("xm");  
			 String lx = request.getParameter("lx"); 
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("insert into jc(xm,lx,bz) " +
			 		"values('"+xm+"','"+lx+"','"+bz+"' )");
				if(flag == Constant.SUCCESS){ 
					 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upJC")){  
			String id = request.getParameter("id");  
			String xm = request.getParameter("xm");  
			 String lx = request.getParameter("lx"); 
			 String bz = request.getParameter("bz");  
			 int flag = cBean.comUp("update jc set xm='"+xm+"',lx='"+lx+"',bz='"+bz+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delJC")){ 
			String id = request.getParameter("id");  
			 String sql="delete from jc where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/index.jsp").forward(request, response); 
				} 
		}
		
		
		
		else if(method.equals("addKQ")){  
			 
			 String xm = request.getParameter("xm");  
			 String lx = request.getParameter("lx"); 
			 String sj = request.getParameter("sj"); 
			 String bz = request.getParameter("bz"); 
			 String jlje = request.getParameter("jlje");  
			 String cfje = request.getParameter("cfje");  
			 int flag = cBean.comUp("insert into kq(xm,lx,sj,bz,jlje,cfje) " +
			 		"values('"+xm+"','"+lx+"','"+sj+"','"+bz+"','"+jlje+"','"+cfje+"' )");
				if(flag == Constant.SUCCESS){ 
					 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upKQ")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String lx = request.getParameter("lx"); 
			 String sj = request.getParameter("sj"); 
			 String bz = request.getParameter("bz");  
			 String jlje = request.getParameter("jlje");  
			 String cfje = request.getParameter("cfje");  
			 int flag = cBean.comUp("update kq set xm='"+xm+"',lx='"+lx+"',sj='"+sj+"',bz='"+bz+"',jlje='"+jlje+"',cfje='"+cfje+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delKQ")){ 
			String id = request.getParameter("id");  
			 String sql="delete from kq where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/kq/index.jsp").forward(request, response); 
				} 
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		else if(method.equals("addRCK")){  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("insert into rck(xm,xb,nl,xl,bm,gw,bz,zz) values('"+xm+"','"+xb+"','"+nl+"','"+xl+"','"+bm+"','"+gw+"','"+bz+"','试用期' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upRCK")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("update rck set xm='"+xm+"',xb='"+xb+"',nl='"+nl+"',xl='"+xl+"',bm='"+bm+"',gw='"+gw+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delRCK")){ 
			String id = request.getParameter("id");  
			 String sql="delete from rck where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jc/rck.jsp").forward(request, response); 
				} 
		}
		
		
		
		
		//=======================================================================================================================
		else if(method.equals("addLS")){  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("insert into ls(xm,xb,nl,xl,bm,gw,bz,zz) values('"+xm+"','"+xb+"','"+nl+"','"+xl+"','"+bm+"','"+gw+"','"+bz+"','试用期' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upLS")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String nl = request.getParameter("nl"); 
			 String xl = request.getParameter("xl");  
			 String bm = request.getParameter("bm"); 
			 String gw = request.getParameter("gw");   
			 String bz = request.getParameter("bz");   
			 int flag = cBean.comUp("update ls set xm='"+xm+"',xb='"+xb+"',nl='"+nl+"',xl='"+xl+"',bm='"+bm+"',gw='"+gw+"',bz='"+bz+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delLS")){ 
			String id = request.getParameter("id");  
			 String sql="delete from ls where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/rz/ls.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("csh")){ 
			 
			// String sql="delete from ls ";
			  cBean.comUp("delete from dd");
			  cBean.comUp("delete from dy");
			  cBean.comUp("delete from gw");
			  cBean.comUp("delete from gz");
			  cBean.comUp("delete from jc");
			  cBean.comUp("delete from kq");
			  cBean.comUp("delete from ls");
			  cBean.comUp("delete from lz");
			  cBean.comUp("delete from px");
			  cBean.comUp("delete from rck");
			  cBean.comUp("delete from stu"); 
			  cBean.comUp("delete from wdml"); 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/csh.jsp").forward(request, response); 
				 
		}
		
		
		
		
		
		
		
		
		//String xm="";String kqjj="";String kqfk="";String jljj="";String jlfk="";String sj="";
		else if(method.equals("addDY")){  
			 String xm = request.getParameter("xm"); 
			 String tz = request.getParameter("tz"); 
			 String kqjj = request.getParameter("kqjj");  
			 String kqfk = request.getParameter("kqfk"); 
			 String jljj = request.getParameter("jljj");  
			 String jlfk = request.getParameter("jlfk"); 
			 String sj = request.getParameter("sj");    
			 int flag = cBean.comUp("insert into dy(xm,tz,kqjj,kqfk,jljj,jlfk,sj)" +
			 		" values('"+xm+"','"+tz+"','"+kqjj+"','"+kqfk+"','"+jljj+"','"+jlfk+"','"+sj+"'  )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("updy")){  
			String id = request.getParameter("id");  
			String xm = request.getParameter("xm"); 
			 String tz = request.getParameter("tz"); 
			 String kqjj = request.getParameter("kqjj");  
			 String kqfk = request.getParameter("kqfk"); 
			 String jljj = request.getParameter("jljj");  
			 String jlfk = request.getParameter("jlfk"); 
			 String sj = request.getParameter("sj");    
			 int flag = cBean.comUp("update dy set xm='"+xm+"',tz='"+tz+"',kqjj='"+kqjj+"'," +
			 		"kqfk='"+kqfk+"',jljj='"+jljj+"',jlfk='"+jlfk+"',sj='"+sj+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("deldy")){ 
			String id = request.getParameter("id");  
			 String sql="delete from dy where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/dy/index.jsp").forward(request, response); 
				} 
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
