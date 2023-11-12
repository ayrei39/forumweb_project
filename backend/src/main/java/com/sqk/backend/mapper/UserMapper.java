package com.sqk.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sqk.backend.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> { // 继承mybatis-plus
}
