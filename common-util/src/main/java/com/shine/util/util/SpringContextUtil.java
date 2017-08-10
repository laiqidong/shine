package com.shine.util.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


/**
 * 
 * @description：
 * @author：wucx
 * Create Date: 2014年4月25日 下午12:33:14
 */
public class SpringContextUtil implements ApplicationContextAware {
	
	private static ApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		context = ctx;
	}

	public static Object getBean(String beanName){
        return context.getBean(beanName);
    }
	
	/**
	 * 根据类型获取spring容器里的bean实例
	 * @param clazz 类型
	 * @return bean实例
	 */
	public static <T> T getBean(Class<T> clazz){
        return context.getAutowireCapableBeanFactory().getBean(clazz);
    }
	
}
