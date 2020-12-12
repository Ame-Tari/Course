package com.course.server.dto;

import lombok.Data;

import java.util.List;

/**
 * @author huangmingtao
 */
@Data
public class PageDto<T> {
    /**
     * 当前页码
     */
    protected int page;

    /**
     * 每页条数
     */
    protected int size;

    /**
     *总条数
     */
    protected long total;


    protected List<T> list;


}
