package com.course.business.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author huangmingtao
 */
@Data
@Entity
public class Chapter {


    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Character id;

    /**
     * 课程id
     */
    private Character courseId;

    /**
     * 名称
     */
    private String name;

}
