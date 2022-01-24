# rbac-demo
Demo for rbac-spring-boot-starter

+ 本Demo通过DemoController中的三个接口简单演示了如何使用 @RbacAuthorization 结合数据库中 rbac表 的配置来鉴权，详见DemoController中的注释内容。
+ 本Demo通过CustomizeRbacTokenService演示了如何通过重写rbac-spring-boot-starter的组件来自定义服务功能。  
  rbac-spring-boot-starter可重写的基础组件都可进行重写，完成功能扩展：  
  例如，还可通过继承DefaultRbacAuthUserServiceImpl或实现RbacAuthUserService，重写passwordVerification方法实现密码加密等操作。
+ 可重写组件：  
  
  | 组件 | 
  | ----|
  | RbacAuthorizationAspect |
  | RbacAuthUserService |
  | RbacTokenService |
  
+ 每个类都有注释解释，如有疑问请提Issue或Comment，一起探讨，谢谢。
+ Tips: 运行Demo前先填充 application.yml 中的数据库和Redis连接信息。