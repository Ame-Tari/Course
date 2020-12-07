package com.course.server.service;

import com.course.server.domain.Test;
import com.course.server.domain.TestExample;
import com.course.server.mapper.TestMapper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * @author huangmingtao
 */
@Service
public class TestService {
    /**
     *
     * wu
     * @return
     */
    @Resource
    private TestMapper testMapper;

    public List<Test> list() {
        TestExample testExample = new TestExample();
        testExample.createCriteria().andIdEqualTo("11");
        return testMapper.selectByExample(testExample);
    }

}
