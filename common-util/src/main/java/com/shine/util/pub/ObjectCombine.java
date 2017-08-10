package com.shine.util.pub;

import java.math.BigDecimal;


public class ObjectCombine implements ICombine {
	private static ObjectCombine m_objCombine=new ObjectCombine();
/**
 * ObjectCombine 构造子注解。
 */
private ObjectCombine() {
	super();
}

public Object combine(Object obj1, Object obj2)  {
	//暂时只处理obj1与obj2数据类型相同的情况

	//如果两项都为空则结果为空
	if (obj1 == null && obj2 == null)
	{
		return null;
	}
	if (obj1 == null && obj2 != null)
	{
		return obj2;
	}
	if (obj1 != null && obj2 == null)
	{
		return obj1;
	}

	if (obj1.getClass().equals(Integer.class))
	{
		int data1 = ((Integer) obj1).intValue();
		int data2 = ((Integer) obj2).intValue();
		return new Integer(data1 + data2);
	}
	if (obj1.getClass().equals(BigDecimal.class))
	{
		obj1 = ((BigDecimal) obj1).add((BigDecimal) obj2);
		return obj1;
	}
	if (obj1.getClass().equals(Double.class))
	{
		double data1 = ((Double) obj1).doubleValue();
		double data2 = ((Double) obj2).doubleValue();
		return new Double(data1 + data2);
	}
	return null;
}
/**
 * 此处插入方法说明。
 * 创建日期：(2004-4-5 17:24:40)
 */
public static ICombine getInstance()
{
	return m_objCombine;
}
}
