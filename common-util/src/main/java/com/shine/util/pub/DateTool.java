package com.shine.util.pub;

import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang.time.FastDateFormat;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;


/**
 * 功能：日期工具类
 * 作者：Cyndy
 * 日期：2014年4月17日 上午10:25:40
 */
public class DateTool {
	public static final FastDateFormat DATE_FORMAT_HHMMSS 		= FastDateFormat.getInstance("HH:mm:ss");
    public static final FastDateFormat DATE_FORMAT_YYMMDDHHMMSS = FastDateFormat.getInstance("yyMMddHHmmss");
    public static final SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
    /**
     * 日期带时分秒默认格式
     */
    private static final String TIMEZONE_FORMAT_DEFAULT      = "yyyy-MM-dd HH:mm:ss";
    
    public static final FastDateFormat	 formatDate                   = FastDateFormat.getInstance(TIMEZONE_FORMAT_DEFAULT);
    
    public static final int              TIME_UNIT_DAY                = 0;
    
    public static final int              TIME_UNIT_HOUR               = 1;
    
    public static final int              TIME_UNIT_MINS               = 2;
    
    public static final int              TIME_UNIT_SECONDS            = 3;
    
    /**
     * 日期不带时分秒默认标准格式
     */
    private static final String STANDARD_DATE_FORMAT_DEFAULT = "yyyy-MM-dd";
    public static final FastDateFormat	 SHORT_DATE_FORMAT = FastDateFormat.getInstance(STANDARD_DATE_FORMAT_DEFAULT);
    
    /**
     * 日期不带时分秒  无横杠格式
     */
    private static final String STANDARD_DATE_FORMAT_SPECIAL = "yyyyMMdd";
    public static final FastDateFormat	 SHORT_DATE_FORMAT_SPECIAL = FastDateFormat.getInstance(STANDARD_DATE_FORMAT_SPECIAL);
    
    
    public static final FastDateFormat   XSDJ_DATE_FORMAT_SPECIAL = FastDateFormat.getInstance("yyMMdd");
    /**
     * 功能：日期年运算
     * 
     * @param d
     * @param amount
     * @return
     */
    public static Date calculateByYear(Date d, int amount) {
        return calculate(d, GregorianCalendar.YEAR, amount);
    }
    
    /**
     * 功能：日期月运算
     * 
     * @param d
     * @param amount
     * @return
     */
    public static Date calculateByMonth(Date d, int amount) {
        return calculate(d, GregorianCalendar.MONTH, amount);
    }
    
    /**
     * 对日期(时间)中的日进行加减计算. <br>
     * 例子: <br>
     * 如果Date类型的d为 2005年8月20日,那么 <br>
     * calculateByDate(d,-10)的值为2005年8月10日 <br>
     * 而calculateByDate(d,+10)的值为2005年8月30日 <br>
     * 
     * @param d
     * 日期(时间).
     * @param amount
     * 加减计算的幅度.+n=加n天;-n=减n天.
     * @return 计算后的日期(时间).
     */
    public static Date calculateByDate(Date d, int amount) {
        return calculate(d, GregorianCalendar.DATE, amount);
    }
    
    /**
     * @param d
     * @param amount
     * @return
     * @author:JeffXu
     * @throws ParseException
     * @email:835264047@qq.com
     * @创建日期:2014-10-30
     * @功能说明：对日期(时间)中的日进行加减计算
     */
    public static String calculateByDate(String d, int amount) throws ParseException {
        Calendar cd = Calendar.getInstance();
        Date date = DateUtils.parseDate(d, new String[]{STANDARD_DATE_FORMAT_DEFAULT});
        cd.setTime(date);
        cd.add(Calendar.DATE, amount);// 增加一天
        // cd.add(Calendar.MONTH, n);//增加一个月
        return date2StringDefault(cd.getTime());
    }

    public static Date calculateByMinute(Date d, int amount) {
        return calculate(d, GregorianCalendar.MINUTE, amount);
    }
    
    /**
     * 对日期(时间)中由field参数指定的日期成员进行加减计算. <br>
     * 例子: <br>
     * 如果Date类型的d为 2005年8月20日,那么 <br>
     * calculate(d,GregorianCalendar.YEAR,-10)的值为1995年8月20日 <br>
     * 而calculate(d,GregorianCalendar.YEAR,+10)的值为2015年8月20日 <br>
     * 
     * @param d
     * 日期(时间).
     * @param field
     * 日期成员. <br>
     * 日期成员主要有: <br>
     * 年:GregorianCalendar.YEAR <br>
     * 月:GregorianCalendar.MONTH <br>
     * 日:GregorianCalendar.DATE <br>
     * 时:GregorianCalendar.HOUR <br>
     * 分:GregorianCalendar.MINUTE <br>
     * 秒:GregorianCalendar.SECOND <br>
     * 毫秒:GregorianCalendar.MILLISECOND <br>
     * @param amount
     * 加减计算的幅度.+n=加n个由参数field指定的日期成员值;-n=减n个由参数field代表的日期成员值.
     * @return 计算后的日期(时间).
     */
    private static Date calculate(Date d, int field, int amount) {
        if (d == null)
            return null;
        GregorianCalendar g = new GregorianCalendar();
        g.setGregorianChange(d);
        g.add(field, amount);
        return g.getTime();
    }
    
    /**
     * 作者：wucx
     * 功能：标准日期格式不带时分秒
     * 
     * @param aDate
     * @return
     * 日期：2014年4月17日 上午10:46:00
     */
    public static String date2StringDefault(Date aDate) {
        return date2String(STANDARD_DATE_FORMAT_DEFAULT, aDate);
    }
    
    /**
     * 日期(时间)转化为字符串.
     * 
     * @param formater
     * 日期或时间的格式.
     * @param aDate
     * java.util.Date类的实例.
     * @return 日期转化后的字符串.
     */
    public static String date2String(String formater, Date aDate) {
        if (PubUtil.isEmpty(formater))
            return null;
        if (aDate == null)
            return null;
        return (new SimpleDateFormat(formater)).format(aDate);
    }
    
    /**
     * 当前日期(时间)转化为字符串.
     * 
     * @param formater
     * 日期或时间的格式.
     * @return 日期转化后的字符串.
     */
    public static String date2String(String formater) {
        return date2String(formater, new Date());
    }
    
    /**
     * 获取当前日期对应的星期数. <br>
     * 1=星期天,2=星期一,3=星期二,4=星期三,5=星期四,6=星期五,7=星期六
     * 
     * @return 当前日期对应的星期数
     */
    public static int dayOfWeek() {
        GregorianCalendar g = new GregorianCalendar();
        int ret = g.get(Calendar.DAY_OF_WEEK);
        g = null;
        return ret;
    }
    
    /**
     * 将日期时间字符串根据转换为指定时区的日期时间.
     * 
     * @param srcFormater
     * 待转化的日期时间的格式.
     * @param srcDateTime
     * 待转化的日期时间.
     * @param dstFormater
     * 目标的日期时间的格式.
     * @param dstTimeZoneId
     * 目标的时区编号.
     * @return 转化后的日期时间.
     */
    public static String string2Timezone(String srcFormater, String srcDateTime, String dstFormater, String dstTimeZoneId) {
        if (PubUtil.isEmpty(srcFormater))
            return null;
        if (srcDateTime == null || "".equals(srcDateTime))
            return null;
        if (dstFormater == null || "".equals(dstFormater))
            return null;
        if (dstTimeZoneId == null || "".equals(dstTimeZoneId))
            return null;
        SimpleDateFormat sdf = new SimpleDateFormat(srcFormater);
        try {
            int diffTime = getDiffTimeZoneRawOffset(dstTimeZoneId);
            Date d = sdf.parse(srcDateTime);
            long nowTime = d.getTime();
            long newNowTime = nowTime - diffTime;
            d = new Date(newNowTime);
            return date2String(dstFormater, d);
        } catch (ParseException e) {
            return null;
        } finally {
            sdf = null;
        }
    }
    
    /**
     * 获取系统当前默认时区与指定时区的时间差.(单位:毫秒)
     * 
     * @param timeZoneId
     * 时区Id
     * @return 系统当前默认时区与指定时区的时间差.(单位:毫秒)
     */
    private static int getDiffTimeZoneRawOffset(String timeZoneId) {
        return TimeZone.getDefault().getRawOffset() - TimeZone.getTimeZone(timeZoneId).getRawOffset();
    }
    
    /**
     * 将日期时间字符串根据转换为指定时区的日期时间.
     * 
     * @param srcDateTime
     * 待转化的日期时间.
     * @param dstTimeZoneId
     * 目标的时区编号.
     * @return 转化后的日期时间.
     * @see #string2Timezone(String, String, String, String)
     */
    public static String string2TimezoneDefault(String srcDateTime, String dstTimeZoneId) {
        return string2Timezone(TIMEZONE_FORMAT_DEFAULT, srcDateTime, TIMEZONE_FORMAT_DEFAULT, dstTimeZoneId);
    }
    
    /**
     * @author：wucx
     * @description：
     * @param date1
     * @param date2
     * @param timeUtil: TIME_DAY_UNIT 返回天， TIME_HOUR_UNIT 返回小时
     * TIME_MINS_UNIT 返回分钟， TIME_SECONDS_UNIT 返回秒
     * @return
     * @date：2014年6月24日 下午3:41:09
     */
    public static double calculateTimeForTimeUnit(Date date1, Date date2, int timeUnit) {
        BigDecimal dateTime = new BigDecimal(Long.toString(date1.getTime()));
        BigDecimal dateTime2 = new BigDecimal(Long.toString(date2.getTime()));
        dateTime = dateTime2.subtract(dateTime);
        BigDecimal tmpTime = new BigDecimal("1000");
        switch (timeUnit) {
        // 返回单位为天
            case TIME_UNIT_DAY:
                tmpTime = tmpTime.multiply(new BigDecimal("60").multiply(new BigDecimal("60")).multiply(new BigDecimal("24")));
                break;
            
            // 返回单位为小时
            case TIME_UNIT_HOUR:
                tmpTime = tmpTime.multiply(new BigDecimal("60").multiply(new BigDecimal("60")));
                break;
            
            // 返回单位为分钟
            case TIME_UNIT_MINS:
                tmpTime = tmpTime.multiply(new BigDecimal("60"));
                break;
            
            // 返回单位为秒
            case TIME_UNIT_SECONDS:
                break;
        }
        dateTime = dateTime.divide(tmpTime, 2, BigDecimal.ROUND_HALF_UP);
        return dateTime.doubleValue();
    }
    
    /**
     * 根据输入秒数，输入日期格式换算
     * 日期格式：
     * HH:MI:SS
     * HH'MI'SS''
     * HH小时MI分钟SS秒
     * @param Seconds 秒数
     * @param timeUnit
     * @return
     */
    public static String transformTimeForTimeUnit(BigDecimal Seconds, String timeUnit) {
    	if(PubUtil.isEmpty(Seconds))
    		return "00'00'00''";
    	
    	String formatTime=null;
    	BigDecimal hour = Seconds.divide(new BigDecimal("3600"),0, BigDecimal.ROUND_FLOOR);
    	BigDecimal min = Seconds.subtract(new BigDecimal("3600").multiply(hour)).divide(new BigDecimal("60"),0, BigDecimal.ROUND_FLOOR);
    	BigDecimal sec = Seconds.subtract(new BigDecimal("3600").multiply(hour).add(new BigDecimal("60").multiply(min)));
    	formatTime=timeUnit.replace("HH", String.format("%02d",hour.longValue()));
    	formatTime=formatTime.replace("MI", String.format("%02d", min.longValue()));
    	formatTime=formatTime.replace("SS", String.format("%02d",sec.longValue()));
        return formatTime;
    }
    
    /**
     * @author：wucx
     * @description：
     * @param dateStr1
     * @param dateStr2
     * @param timeUtil: TIME_DAY_UNIT 返回天， TIME_HOUR_UNIT 返回小时
     * TIME_MINS_UNIT 返回分钟， TIME_SECONDS_UNIT 返回秒
     * @return
     * @throws ParseException
     * @date：2014年6月24日 下午3:55:37
     */
    public static double calculateTimeForTimeUnit(String dateStr1, String dateStr2, int timeUnit) throws ParseException {
        Date date1 = DateUtils.parseDate(dateStr1, new String[]{TIMEZONE_FORMAT_DEFAULT});
        Date date2 = DateUtils.parseDate(dateStr2, new String[]{TIMEZONE_FORMAT_DEFAULT});
        return calculateTimeForTimeUnit(date1, date2, timeUnit);
    }
    
    /**
     * 比较两个日期的大小
     * @param date1
     * 开始日期
     * @param dat2
     * 结束日期
     * @return 如果date1 大于date2则返回1,等于返回0,小于返回-1
     */
    public static int compareDate(Date date1, Date date2) {
        long interval = 0;
        int result = 0;
        interval = date1.getTime() - date2.getTime();
        if (interval < 0){
            result = -1;
        }else if(interval == 0){
            result = 0;
        }else if(interval > 0){
            result = 1;
        }
        return result;
    }
    
    /**
     * 比较两个日期的大小
     * @author:jeffxu
     * @param date1
     * 开始日期
     * @param dat2
     * 结束日期
     * @return 如果date1 大于date2则返回true,反之返回false
     */
    public static int compareDate(String dateStr1, String dateStr2) throws ParseException {
        if(dateStr1.length() == 10){
            dateStr1 = dateStr1 + " 00:00:00";
        }
        if(dateStr2.length() == 10){
            dateStr2 = dateStr2 + " 00:00:00";
        }
        
        
        Date date1 = DateUtils.parseDate(dateStr1, new String[]{TIMEZONE_FORMAT_DEFAULT});
        Date date2 = DateUtils.parseDate(dateStr2, new String[]{TIMEZONE_FORMAT_DEFAULT});
        return compareDate(date1, date2);
    }
    
    /**
     * 返回两个日期的相隔天数
     * @param dateStr1
     * @param dateStr2
     * @return
     * @throws ParseException
     * @author:Fisher
     * @email:zhuangcaijin@126.com
     */
    public static int duringDate(String dateStr1, String dateStr2) throws ParseException {
        Date date1 = DateUtils.parseDate(dateStr1, new String[]{STANDARD_DATE_FORMAT_DEFAULT});
        Date date2 = DateUtils.parseDate(dateStr2, new String[]{STANDARD_DATE_FORMAT_DEFAULT});
        long interval = 0;
        interval = (date1.getTime() - date2.getTime())/(24*60*60*1000) + 1;
        return (int) interval;
    }
    
    public static String getCurrentSysDate() {
        return DateTool.formatDate.format(new Date());
    }
    
    public static void main(String[] args) throws Exception {
		System.out.println(compareDate("2015-12-15", "2015-12-15"));
	}
}
