package com.shine.util.pub;

/**
 * ftp信息vo
 * @author:Fisher
 * @email:zhuangcaijin@126.com
 * @version Revision 2.0.0
 */
public class FtpConfInfo {
	/**
	 * 用户名
	 */
	private String user;
	
	/**
	 * 密码
	 */
	private String password;
	
	/**
	 * 服务地址
	 */
	private String server;
	
	/**
	 * 路径 
	 */
	private String Location;
	
	/**
	 * 端口
	 */
	private int port;
	
	/**
	 * 文件名
	 */
	private String fileName;
	
	/**
	 * 最大工作时长
	 */
	private long maxWorkTime;
	
	/**
	 * 解码
	 */
	private String encoding;
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public long getMaxWorkTime() {
		return maxWorkTime;
	}
	public void setMaxWorkTime(long maxWorkTime) {
		this.maxWorkTime = maxWorkTime;
	}
	public String getEncoding() {
		return encoding;
	}
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	
}
