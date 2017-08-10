package com.shine.model.ysl;

import javax.persistence.*;

@Entity
@Table(name = "document")
//@SequenceGenerator(name = "SEQ_DOCUMENT", sequenceName = "SEQ_DOCUMENT", allocationSize = 1)
public class DocumentEntity {
    private Long id;
    private String documentName;
    private String url;
    private String desc;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
