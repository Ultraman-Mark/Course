package com.course.server.util;

import com.course.server.exception.ValidatorException;
import org.springframework.util.StringUtils;

import java.util.Objects;

public class ValidatorUtil {

    /**
     * 空校验（null or ""）
     */
    public static void require(Object str, String fieldName) {
        if (Objects.isNull(str)) {
            throw new ValidatorException(fieldName + "不能为空");
        }
    }

    /**
     * 长度校验
     */
    public static void length(String str, String fieldName, int min, int max) {
        if (!StringUtils.hasText(str)) {
            return;
        }
        int length = 0;
        if (StringUtils.hasText(str)) {
            length = str.length();
        }
        if (length < min || length > max) {
            throw new ValidatorException(fieldName + "长度" + min + "~" + max + "位");
        }
    }
}
