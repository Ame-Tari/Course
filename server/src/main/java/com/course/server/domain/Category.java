package com.course.server.domain;

import lombok.Data;

/**
 * @author huangmingtao
 */
@Data
public class Category {
    private String id;

    private String parent;

    private String name;

    private Integer sort;

}