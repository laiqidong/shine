package com.shine.model.system;


import com.shine.util.pub.PubUtil;

import java.util.Date;

/**
 * Created by luoxuan on 2017/3/2.
 * Description:映射数据库视图user_job,查看用户下的定时器
 */
public class DataBaseJobs {

    private Integer job;//数据库定时器ID，由数据库创建定时器的时候生成
    private String logUser;  //数据库用户
    private Date lastDate; //最后运行时间
    private Date lastDate2;
    private Date nextDate;  //下次运行时间
    private Date nextDate2;

    public Date getLastDate2() {
        return lastDate2;
    }

    public void setLastDate2(Date lastDate2) {
        this.lastDate2 = lastDate2;
    }

    public Date getNextDate2() {
        return nextDate2;
    }

    public void setNextDate2(Date nextDate2) {
        this.nextDate2 = nextDate2;
    }

    private String interval; //执行间隔
    private String what;   //执行的存储过程。
    private String nextDateStr;

    public Integer getJob() {
        return job;
    }

    public void setJob(Integer job) {
        this.job = job;
    }

    public String getLogUser() {
        return logUser;
    }

    public void setLogUser(String logUser) {
        this.logUser = logUser;
    }

    public Date getLastDate() {
        return lastDate;
    }

    public void setLastDate(Date lastDate) {
        this.lastDate = lastDate;
    }

    public Date getNextDate() {
        return nextDate;
    }

    public void setNextDate(Date nextDate) {
        this.nextDate = nextDate;
    }

    public String getInterval() {
        return interval;
    }

    public void setInterval(String interval) {
        this.interval = interval;
    }

    public String getWhat() {
        return what;
    }

    public void setWhat(String what) {
        this.what = what;
    }

    public String getNextDateStr() {
        if (this.nextDateStr == null)
            return PubUtil.dateTimeToString(this.nextDate);
        else
            return nextDateStr;
    }

    public void setNextDateStr(String nextDateStr) {
        this.nextDateStr = nextDateStr;
    }
}
