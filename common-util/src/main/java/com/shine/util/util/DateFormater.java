package com.shine.util.util;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Component
public class DateFormater implements Formatter<Date> {

	private SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public String print(Date value, Locale arg1) {
		if ( String.valueOf(value.getTime()).endsWith("00000") ) {
			return dateFormat.format(value);
		} else {
			return datetimeFormat.format(value);
		}
	}

	@Override
	public Date parse(String value, Locale arg1) throws ParseException {
		if (StringUtils.hasText(value)) {
			try {
				if (value.indexOf(":") == -1 && value.length() == 10) {
					return this.dateFormat.parse(value);
				} else if (value.indexOf(":") > 0 && value.length() == 19) {
					return this.datetimeFormat.parse(value);
				}else{
					throw new IllegalArgumentException("Could not parse date, date format is error ");
				}
			} catch (ParseException ex) {
				IllegalArgumentException iae = new IllegalArgumentException("Could not parse date: " + ex.getMessage());
				iae.initCause(ex);
				throw iae;
			}
		} else {
			return null;
		}
	}


}
