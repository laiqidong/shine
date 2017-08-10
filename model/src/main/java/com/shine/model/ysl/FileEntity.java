package com.shine.model.ysl;

import javax.persistence.*;

@Entity
@Table(name = "t_file")
//@SequenceGenerator(name = "SEQ_FILE", sequenceName = "SEQ_FILE", allocationSize = 1)
public class FileEntity {
    private Long id;
    private String yslywh;//预受理业务号
    private String datumId;
    private String datumName;
    private String fileName;
    private String fileUrl;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getDatumId() {
        return datumId;
    }

    public void setDatumId(String datumId) {
        this.datumId = datumId;
    }

    public String getDatumName() {
        return datumName;
    }

    public void setDatumName(String datumName) {
        this.datumName = datumName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    @Column(length = 30)
    public String getYslywh() {
        return yslywh;
    }

    public void setYslywh(String yslywh) {
        this.yslywh = yslywh;
    }

}

