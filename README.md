dubbo-coffee
============

批量生成所有dubbo直连接口的属性文件

使用tcp连接dubbo的console服务自动获取所有的dubbo服务接口

问题大量直连接口？
本地直连dubbo接口有三种方式见官方文档，通常选择少量接口使用-Dxxxx.provider=dubbo://localhost:20880来解决。

但是如果大量的接口使用这种方式就苦逼了，so dubbo给我们的解决方式是可以-Ddubbo.resolve.file=xx.properties.

本脚本就是可以快速的帮助我们生成xx.properties.
