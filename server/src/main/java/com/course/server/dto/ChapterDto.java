package com.course.server.dto;

import lombok.Data;
import lombok.NonNull;

/**
 * @author huangmingtao
 */
@Data
public class ChapterDto {

    private String id;

    @NonNull
    private String courseId;

    @NonNull
    private String name;

}
