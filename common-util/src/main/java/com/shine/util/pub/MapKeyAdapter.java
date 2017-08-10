package com.shine.util.pub;

import java.util.Map;

/**
 * hashMap的hashlize适配器
 *
 */
public class MapKeyAdapter implements IHashKey {
	private String[] m_KeyFields;
	static final String m_FixKey = "FIXKEY#$@";

	/**
	 * VOHashKeyAdatper 构造子注解。
	 */
	public MapKeyAdapter(String[] keyFields) {
		super();
		m_KeyFields = keyFields;
	}
	
	@Override
	public String getKey(Object o) {
		if (m_KeyFields == null || m_KeyFields.length == 0)
			return m_FixKey;
		
		if (!(o instanceof Map))
			throw new RuntimeException("Object o is not java.util.Map instance");
		
		String key = "";
		for (int i = 0; i < m_KeyFields.length; i++) {
			key = key + ((Map)o).get(m_KeyFields[i]);
		}
		
		return key;
	}

}
