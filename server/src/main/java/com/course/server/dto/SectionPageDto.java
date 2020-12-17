package com.course.server.dto;

import lombok.Data;

/**
 * @author huangmingtao
 */
@Data
public class SectionPageDto extends PageDto {

    private String courseId;

    private String chapterId;

}
