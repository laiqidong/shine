package com.shine.util.pub;

import java.math.BigDecimal;

/**
 * 
 */
public class SafeCompute {
	
	/**
	 * SafeCompute 构造子注解。
	 */
	public SafeCompute() {
		super();
	}
	
	
	public static BigDecimal add(BigDecimal d1, BigDecimal d2) {
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		return d1.add(d2);
	}
	
	public static BigDecimal div(BigDecimal d1, BigDecimal d2, Integer power){
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		
		if (d2.compareTo(BigDecimal.ZERO) == 0)
			return BigDecimal.ZERO;
		
		if (d1.compareTo(BigDecimal.ZERO) == 0)
			return BigDecimal.ZERO;
		
		if (power == null)
			power = 8;
		
		return d1.divide(d2, BigDecimal.ROUND_HALF_UP, power);
	}
	
	public static BigDecimal div(BigDecimal d1, BigDecimal d2){
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		
		if (d2.compareTo(BigDecimal.ZERO) == 0)
			return BigDecimal.ZERO;
		
		if (d1.compareTo(BigDecimal.ZERO) == 0)
			return BigDecimal.ZERO;
		
		return d1.divide(d2);
	}
	
	
	public static BigDecimal multiply(BigDecimal d1, BigDecimal d2) {
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		return d1.multiply(d2);
	}
	
	public static BigDecimal sub(BigDecimal d1, BigDecimal d2){
		d1 = (d1==null)?new BigDecimal(0):d1;
		d2 = (d2==null)?new BigDecimal(0):d2;
		return d1.subtract(d2);
	}
	
	public static BigDecimal abs(BigDecimal d){
		return d == null? BigDecimal.ZERO:d.abs();
	}
}
