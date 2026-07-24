# ------------------------------------------------
#  pod trunk register 邮箱地址 '用户名' --description='描述信息'
#  pod trunk register dvlproad@163.com 'dvlproad' --description='homeMac'
#  pod trunk me

# ------------------------------------------------
# 库的弃用：
# 弃用库(标记某个版本或整个库为“已弃用”): pod trunk deprecate CQDemoProtocol

# 库的删除
# 删除指定版本:                                   pod trunk delete CJMedia 1.0.0
# 全删除后，验证远程的是否正确删掉了                  pod trunk info CJMedia
# 清除缓存(解决pod search查本地还搜得到delete的问题): pod cache clean CQDemoProtocol

# 本地查找(pod repo update trunk不会自动清理本地已下载后，才在远程删除掉的pod)
# 在本地 spec 仓库中查找指定库的缓存位置
# 本地精确查找    find ~/.cocoapods/repos/trunk -name "CJMedia.podspec.json" -type f
# 本地模糊查找    find ~/.cocoapods/repos/trunk -name "CJMedia.*" -type f

# ------------------------------------------------
# 查看本地已同步的pod库：pod repo
# 库的上传
  # 旧方法（本库不依赖swift库的时候）
  # 上传到github公有库:
  #验证方法1：pod lib lint CQDemoProtocol.podspec --sources='https://github.com/CocoaPods/Specs.git' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoProtocol.podspec --sources=cocoapods --allow-warnings --use-libraries --verbose
  #提交方法(github公有库)： pod trunk push CQDemoProtocol.podspec --allow-warnings --use-libraries --verbose   # 临时添加 --use-libraries 用来解决没错，还是报错的问题
  
  # 上传到私有库 gitee上的私有项目: dvlproadSpecs
  #验证方法1：pod lib lint CQDemoProtocol.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoProtocol.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push gitee-dvlproad-dvlproadspecs CQDemoProtocol.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose

  # 上传到开源库 gitee上的公开项目: Specs
  #验证方法1：pod lib lint CQDemoProtocol.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/Specs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoProtocol.podspec --sources=cocoapods,dvlproadPublicSpec --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproadPublicSpec CQDemoProtocol.podspec --sources=cocoapods,dvlproadPublicSpec --allow-warnings --use-libraries --verbose

  # 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers
  #验证方法1(含Swift的时候）：pod lib lint CQDemoProtocol.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-modular-headers --verbose
  #验证方法2(含Swift的时候）：pod lib lint CQDemoProtocol.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push gitee-dvlproad-dvlproadspecs CQDemoProtocol.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-modular-headers --verbose

Pod::Spec.new do |s|
  s.name         = "CQDemoProtocol"
  s.version      = "0.0.2"
  s.summary      = "CQDemoProtocol 基础协议库 - 包含 AppDelegate 等通用协议"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 DemoProtocol，可按需独立引入：
                 • CQDemoProtocol/AppDelegate - 子库定义的 AppDelegate 协议。用于在子库中获取主 app 里的 AppDelegate

                 每个子库可独立引入，详见各子库描述。
                 DESC
  

  #s.license      = {
  #  :type => 'Copyright',
  #  :text => <<-LICENSE
  #            © 2008-2016 Dvlproad. All rights reserved.
  #  LICENSE
  #}
  s.license      = "MIT"

  s.author   = { "dvlproad" => "" }

  s.platform     = :ios, "9.0"
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoProtocol_0.0.2" }
  # s.source_files  = "CQDemoProtocol/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.frameworks = "MediaPlayer"
  
  # 子库定义的 AppDelegate 协议。用于在子库中获取主 app 里的 AppDelegate
  s.subspec 'AppDelegate' do |ss|
    ss.source_files = "CQDemoProtocol/AppDelegate/**/*.{h,m}"  # 包含UIImage+CQDemoProtocol
  end

end
