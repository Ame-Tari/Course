package com.course.server.service;

import com.course.server.domain.Chapter;
import com.course.server.domain.ChapterExample;
import com.course.server.mapper.ChapterMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huangmingtao
 */
@Service
public class ChapterService {
    /**
     *
     * wu
     * @return
     */
    @Resource
    private ChapterMapper chapterMapper;

    public List<Chapter> list() {
        ChapterExample chapterExample = new ChapterExample();
        chapterExample.createCriteria().andIdEqualTo("11");
        return chapterMapper.selectByExample(chapterExample);
    }

}
