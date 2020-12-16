package com.course.server.domain;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author huangmingtao
 */
@Data
public class Course {
    private String id;

    private String name;

    private String summary;

    private Integer time;

    private BigDecimal price;

    private String image;

    private String level;

    private String charge;

    private String status;

    private Integer enroll;

    private Integer sort;

    private Date createdAt;

    private Date updatedAt;

}