package com.config;

import java.io.*;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

public class Config {
	private static Config c = new Config();

	/*******************************************************************************************************
	 * 取得系统安装的WEB根目录。
	 * 
	 * @return 安装的WEB根目录，如G:\HighCOM_PRJ\yichun\product\webapp\default-ear\default-war
	 ******************************************************************************************************/
	public static String findHomeDir() {
		String home_path = "";
		if (c == null) {
			c = new Config();
		}
		try {
			String s = "" + c.getClass().getResource("Config" + ".class");
			File f = new File(s);
			File home = f.getParentFile().getParentFile().getParentFile()
					.getParentFile().getParentFile().getParentFile();
			home_path = home.getPath().substring(5, home.getPath().length());
		} catch (Exception e) {
			e.printStackTrace();
		}
		home_path = home_path.replaceAll("%20", " ");
		if (home_path.toLowerCase().startsWith("jar:file:")) {
			home_path.substring(9);
		}
		if (home_path.startsWith("\\")) {
			home_path = home_path.substring(1, home_path.length());
		} else if (home_path.startsWith("/")) {
			home_path = home_path.substring(1, home_path.length());
		}
		return home_path;
	}

	/*****************************************************************************************************
	 * 从HTTP请求中取得HTTP请求的协议(http,https)，以及服务器的名字、端口号，并组成一个字符串，形为http://127.0.0.1:8101
	 * 
	 * @param request  HTTP请求
	 * @return 访问本服务器根目录的HTTP地址。
	 ******************************************************************************************************/
	public static String findRootURL(HttpServletRequest request) {
		String scheme = request.getScheme();
		String host = request.getServerName();
		int port = request.getServerPort();
		return scheme + "://" + host + ":" + port;
	}

	public static void main(String[] args) {
		//JOptionPane.showMessageDialog(null, Config.findHomeDir());
		System.out.println(Config.findHomeDir());
	}
}
