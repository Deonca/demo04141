package com.cykj.demo.entity;

import java.math.BigDecimal;

public class Level {
    private int id;
    private  String levelName;
    private BigDecimal uploadScale;
    private BigDecimal downloadScale;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    public BigDecimal getUploadScale() {
        return uploadScale;
    }

    public void setUploadScale(BigDecimal uploadScale) {
        this.uploadScale = uploadScale;
    }

    public BigDecimal getDownloadScale() {
        return downloadScale;
    }

    public void setDownloadScale(BigDecimal downloadScale) {
        this.downloadScale = downloadScale;
    }
}
