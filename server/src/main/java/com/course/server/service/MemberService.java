package com.course.server.service;

import com.course.server.domain.Member;
import com.course.server.domain.MemberExample;
import com.course.server.dto.MemberDto;
import com.course.server.dto.PageDto;
import com.course.server.mapper.MemberMapper;
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
        import java.util.Date;

@Service
public class MemberService {

    @Resource
    private MemberMapper memberMapper;

    /**
    * 列表查询
    */
    public void list(PageDto pageDto){
        PageHelper.startPage(pageDto.getPage(), pageDto.getSize());
        MemberExample memberExample = new MemberExample();
        List<Member> memberList = memberMapper.selectByExample(memberExample);
        PageInfo<Member> pageInfo = new PageInfo<>(memberList);
        pageDto.setTotal(pageInfo.getTotal());
        List<MemberDto> memberDtoList = CopyUtil.copyList(memberList,MemberDto.class);
        pageDto.setList(memberDtoList);
    }

    /**
    * 保存
    */
    public void save(MemberDto memberDto){
        Member member = CopyUtil.copy(memberDto,Member.class);
        if (!StringUtils.hasText(memberDto.getId())){
            this.insert(member);
        }
        else {
            this.update(member);
        }
    }

    /**
     * 插入
     */
    private void insert(Member member){
        Date now = new Date();
        member.setId(UuidUtil.getShortUuid());
        member.setRegisterTime(now);
        memberMapper.insert(member);
    }

    /**
     * 更新
     */
    private void update(Member member) {
        memberMapper.updateByPrimaryKey(member);
    }

    /**
     * 删除
     */
    public void delete(String id) {
        memberMapper.deleteByPrimaryKey(id);
    }
}