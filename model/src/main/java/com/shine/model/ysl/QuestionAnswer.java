package com.shine.model.ysl;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by luoxuan on 2017/4/11.
 * Description:问答bean
 */
@Entity
@Table
//@SequenceGenerator(name = "SEQ_QUESTION_ANSWER", sequenceName = "SEQ_QUESTION_ANSWER", allocationSize = 1)
public class QuestionAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String question;        //问题
    private String answer;  //答案
    private Date createTime;
    private Integer status;  //状态 1.在用  2.禁用   0.删除

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
