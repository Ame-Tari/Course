package com.course.server.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author huangmingtao
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ChapterPageDto<T> extends PageDto<T> {

    /**
     * 课程id
     */
    private String courseId;

}
