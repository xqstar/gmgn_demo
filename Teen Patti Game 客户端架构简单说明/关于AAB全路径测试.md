### 1、 环境准备
* Java环境变量配置
* 安装Hello GPlay工具
* 准备VPN
* AAB和bundletool.jar放到同一目录下

### 2、操作步骤

* 点击链接跳转
* 执行adb命令



java -jar bundletool-all-1.15.2.jar build-apks --bundle=目标.aab --output=输出路径.apks

java -jar bundletool-all-1.15.2.jar install-apks --apks=$路径.apks