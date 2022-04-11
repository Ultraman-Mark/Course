package com.course.generator.server;

import com.course.generator.util.FreemarkerUtil;

import java.util.HashMap;
import java.util.Map;

public class ServerGenerator {
    static String MODULE = "business";
//    static String toDtoPath = "server\\src\\main\\java\\com\\course\\server\\dto\\";
    static String toServicePath = "server\\src\\main\\java\\com\\course\\server\\service\\";
    static String toControllerPath = MODULE + "\\src\\main\\java\\com\\course\\" + MODULE + "\\controller\\admin\\";
//    static String generatorConfigPath = "server\\src\\main\\resources\\generator\\generatorConfig.xml";


    public static void main(String[] args) throws Exception {
        String Domain = "Section";
        String domain = "section";
        String tableNameCn = "小节";
        String module = MODULE;
        Map<String, Object> map = new HashMap<>();
        map.put("Domain", Domain);
        map.put("domain", domain);
        map.put("module",module);
//        // 生成dto
//        FreemarkerUtil.initConfig("dto.ftl");
//        FreemarkerUtil.generator(toDPath + Domain + "Dto.java", map);

        // 生成service
        FreemarkerUtil.initConfig("service.ftl");
        FreemarkerUtil.generator(toServicePath + Domain + "Service.java", map);

        // 生成controller
        FreemarkerUtil.initConfig("controller.ftl");
        FreemarkerUtil.generator(toControllerPath + Domain + "Controller.java", map);
    }

}
