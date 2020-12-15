package com.course.server.domain;

import lombok.Data;
import org.aspectj.lang.annotation.DeclareAnnotation;

/**
 * @author huangmingtao
 */
@Data
public class Chapter {
    private String id;

    private String courseId;

    private String name;
}