package com.course.server.service;

import com.course.server.domain.Section;
import com.course.server.domain.SectionExample;
import com.course.server.dto.SectionDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.SectionMapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class SectionService {

    @Resource
    private SectionMapper sectionMapper;

    public void list(PageDto pageDto){
        PageHelper.startPage(pageDto.getPage(), pageDto.getSize());
        SectionExample sectionExample = new SectionExample();
        List<Section> sectionList = sectionMapper.selectByExample(sectionExample);
        PageInfo<Section> pageInfo = new PageInfo<>(sectionList);
        pageDto.setTotal(pageInfo.getTotal());
//        for (int i = 0; i < sectionList.size(); i++) {
//            Section section = sectionList.get(i);
//            SectionDto sectionDto = new SectionDto();
//            BeanUtils.copyProperties(section,sectionDto);
//            sectionDtoList.add(sectionDto);
//        }
        List<SectionDto> sectionDtoList = CopyUtil.copyList(sectionList,SectionDto.class);
        pageDto.setList(sectionDtoList);
    }

    public void save(SectionDto sectionDto){
        Section section = CopyUtil.copy(sectionDto,Section.class);
        if (!StringUtils.hasText(sectionDto.getId())){
            this.insert(section);
        }
        else {
            this.update(section);
        }
    }

    /**
     * 插入
     */
    private void insert(Section section){
        section.setId(UuidUtil.getShortUuid());
//        Section section = new Section();
//        BeanUtils.copyProperties(sectionDto,section);
        sectionMapper.insert(section);
    }

    /**
     * 更新
     */
    private void update(Section section) {
        sectionMapper.updateByPrimaryKey(section);
    }

    /**
     * 删除
     */
    public void delete(String id) {
        sectionMapper.deleteByPrimaryKey(id);
    }
}
