package com.shine.util.pub;

public interface IHashKey {

	/**
	 * Hash化一组对象时，取得一个给定对象的Key的方法
	 * @throws Exception 
	 */
	public String getKey(Object o) ;
}
