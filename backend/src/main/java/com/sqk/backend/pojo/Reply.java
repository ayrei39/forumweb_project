package com.sqk.backend.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data // Getter Setter toString ...
@NoArgsConstructor // 无参构造函数
@AllArgsConstructor // 有参构造函数
public class Reply {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer userId;
    private Integer articleId;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Shanghai")
    private Date createtime;
}
