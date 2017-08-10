package com.shine.ysl.constants;


/**<p>名称：DescribableEnum.java</p>
 * <p>描述：可描述枚举</p>
 * <pre>
 *         
 * </pre>
 */
public enum DescribableEnum implements Describable
{
	// 1-10000 系统描述枚举
	UNAUTHENTICATION("-1", "登录超时"),
	WS_COLSE("0", "此接口功能已关闭，请调用其他接口"),
	SUCCESS("1", "成功"),
	FAIL("2", "失败"),
	SYSTEM_ERROR("3", "系统异常"),
	PARAMES_ERROR("4", "参数异常"),
	TOKEN_ERROR("5", "TOKEN错误"),
	PARAMES_ERROR_ISNULL("41", "缺少参数"),
	WX_AUTH_ERROR("5", "微信授权凭证无效"),
	SMS_CODE_ERROR("6","验证码错误"),
	NO_JURISDICTION("7","权限不足"),
	NOT_OPEN("8","该功能暂未开放"),
	// 10001-20000  业务描述枚举
	TABLE_EXIST("1001", "表已存在"),
	TABLE_NOT_EXIST("1002", "表不存在"),
	BUSINESS_NO_NOT_EXIST("1003", "业务编码不存在"),
	BUSINESS_STATUS_COLSE("1003", "业务功能已被禁用，请联系管理员"),
	ROLE_STATUS_OPEN("1004", "角色可用"),
	ROLE_STATUS_CLOSE("1005", "角色已被禁用，请联系管理员"),
	USER_IS_REG("1006","该账号已注册"),
	USER_IS_NOT_REG("1007","该账号未注册"),
	USER_IS_EXIST("1008","用户不存在"),
	PASSWORD_ERROR("1009","密码有误"),
	OLD_PASSWORD_ERROR("1010","原密码有误!"),
	SMS_CODE_IS_SEND("1011","验证码已发送!"),

	;
	
	private String code;// 描述编码
	private String msg;// 描述信息
	
	private DescribableEnum(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public String getMsg() {
		return msg;
	}
}
