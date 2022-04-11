package com.course.generator.server;

import com.course.generator.util.FreemarkerUtil;

public class ServerGenerator {
    static String MODULE = "business";
    static String toDtoPath = "generator\\src\\main\\java\\com\\course\\generator\\test\\";
//    static String toDtoPath = "server\\src\\main\\java\\com\\course\\server\\dto\\";
//    static String toServicePath = "server\\src\\main\\java\\com\\course\\server\\service\\";
//    static String toControllerPath = MODULE + "\\src\\main\\java\\com\\course\\" + MODULE + "\\controller\\admin\\";
//    static String generatorConfigPath = "server\\src\\main\\resources\\generator\\generatorConfig.xml";


    public static void main(String[] args) throws Exception {
        // 生成dto
        FreemarkerUtil.initConfig("test.ftl");
        FreemarkerUtil.generator(toDtoPath +  "Test.java");

//        // 生成service
//        FreemarkerUtil.initConfig("service.ftl");
//        FreemarkerUtil.generator(toServicePath + Domain + "Service.java", map);
//
//        // 生成controller
//        FreemarkerUtil.initConfig("controller.ftl");
//        FreemarkerUtil.generator(toControllerPath + Domain + "Controller.java", map);
    }

}
