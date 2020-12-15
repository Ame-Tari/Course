package com.course.server.domain;

import lombok.Data;

import java.util.Date;

/**
 * @author huangmingtao
 */
@Data
public class Section {
    private String id;

    private String title;

    private String courseId;

    private String chapterId;

    private String video;

    private Integer time;

    private String charge;

    private Integer sort;

    private Date createdAt;

    private Date updatedAt;

    private String vod;

}