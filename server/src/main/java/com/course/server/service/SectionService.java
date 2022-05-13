package com.course.server.service;

import com.course.server.domain.Section;
import com.course.server.domain.SectionExample;
import com.course.server.dto.SectionDto;
import com.course.server.dto.PageDto;
import com.course.server.dto.SectionPageDto;
import com.course.server.enums.SectionChargeEnum;
import com.course.server.mapper.SectionMapper;
import com.course.server.util.CopyUtil;
import com.course.server.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Date;

@Service
public class SectionService {

    @Resource
    private SectionMapper sectionMapper;

    @Resource
    @Lazy
    private CourseService courseService;

    /**
    * 列表查询
    */
    public void list(SectionPageDto sectionPageDto){
        PageHelper.startPage(sectionPageDto.getPage(), sectionPageDto.getSize());
        SectionExample sectionExample = new SectionExample();
        SectionExample.Criteria criteria = sectionExample.createCriteria();
        if (StringUtils.hasText(sectionPageDto.getCourseId())&&StringUtils.hasLength(sectionPageDto.getChapterId())) {
            criteria.andCourseIdEqualTo(sectionPageDto.getCourseId());
        }
        if (StringUtils.hasText(sectionPageDto.getChapterId())&&StringUtils.hasLength(sectionPageDto.getChapterId())) {
            criteria.andChapterIdEqualTo(sectionPageDto.getChapterId());
        }
        sectionExample.setOrderByClause("sort asc");
        List<Section> sectionList = sectionMapper.selectByExample(sectionExample);
        PageInfo<Section> pageInfo = new PageInfo<>(sectionList);
        sectionPageDto.setTotal(pageInfo.getTotal());
        List<SectionDto> sectionDtoList = CopyUtil.copyList(sectionList,SectionDto.class);
        sectionPageDto.setList(sectionDtoList);
    }

    /**
    * 保存
    */
//    @Transactional(rollbackFor = Exception.class)  //Exception异常回滚
    @Transactional
    public void save(SectionDto sectionDto){
        Section section = CopyUtil.copy(sectionDto,Section.class);
        if (!StringUtils.hasText(sectionDto.getId())){
            this.insert(section);
        }
        else {
            this.update(section);
        }
        courseService.updateTime(section.getCourseId());
    }

    /**
     * 新增
     */
    private void insert(Section section){
        Date now = new Date();
        section.setCreatedAt(now);
        section.setUpdatedAt(now);
        section.setId(UuidUtil.getShortUuid());
        section.setCharge(SectionChargeEnum.FREE.getCode());
        sectionMapper.insert(section);
    }

    /**
     * 更新
     */
    private void update(Section section) {
        section.setUpdatedAt(new Date());
        sectionMapper.updateByPrimaryKey(section);
    }

    /**
     * 删除
     */
    public void delete(String id) {
        sectionMapper.deleteByPrimaryKey(id);
    }

    public List<SectionDto> listByCourse(String id) {
        SectionExample example = new SectionExample();
        example.createCriteria().andCourseIdEqualTo(id);
        List<Section> sectionList = sectionMapper.selectByExample(example);
        List<SectionDto> sectionDtoList = CopyUtil.copyList(sectionList, SectionDto.class);
        return sectionDtoList;
    }
}