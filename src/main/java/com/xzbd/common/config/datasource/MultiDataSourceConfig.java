package com.xzbd.common.config.datasource;

public class MultiDataSourceConfig {

    public static final String ACTIVITI_NAME = "activiti";
    public static final String ACTIVITI_BASE_PACKAGE = "com.xzbd.activiti.dao";
    public static final String ACTIVITI_MAPPER_LOCATION = "mybatis/activiti/*Mapper.xml";

    public static final String BLOG_NAME = "blog";
    public static final String BLOG_BASE_PACKAGE = "com.xzbd.blog.dao";
    public static final String BLOG_MAPPER_LOCATION = "mybatis/blog/*Mapper.xml";

    public static final String COMMON_NAME = "common";
    public static final String COMMON_BASE_PACKAGE = "com.xzbd.common.dao";
    public static final String COMMON_MAPPER_LOCATION = "mybatis/common/*Mapper.xml";

    public static final String OA_NAME = "oa";
    public static final String OA_BASE_PACKAGE = "com.xzbd.oa.dao";
    public static final String OA_MAPPER_LOCATION = "mybatis/oa/*Mapper.xml";

    public static final String SYSTEM_NAME = "system";
    public static final String SYSTEM_BASE_PACKAGE = "com.xzbd.system.dao";
    public static final String SYSTEM_MAPPER_LOCATION = "mybatis/system/*Mapper.xml";

}
