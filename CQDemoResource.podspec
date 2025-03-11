Pod::Spec.new do |s|
  #查看本地已同步的pod库：pod repo
  #清除缓存：pod cache clean CQDemoResource
  
#  pod trunk register 邮箱地址 '用户名' --description='描述信息'
#  pod trunk register dvlproad@163.com 'dvlproad' --description='homeMac'
#  pod trunk me

  # 旧方法（本库不依赖swift库的时候）
  # 上传到github公有库:
  #验证方法1：pod lib lint CQDemoResource.podspec --sources='https://github.com/CocoaPods/Specs.git' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoResource.podspec --sources=master --allow-warnings --use-libraries --verbose
  #提交方法(github公有库)： pod trunk push CQDemoResource.podspec --allow-warnings --verbose
  
  # 上传到私有库 gitee上的私有项目: dvlproadSpecs
  #验证方法1：pod lib lint CQDemoResource.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoResource.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproad CQDemoResource.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose

  # 上传到开源库 gitee上的公开项目: Specs
  #验证方法1：pod lib lint CQDemoResource.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/Specs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoResource.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproadPublicSpec CQDemoResource.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose

  # 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers
  #验证方法1(含Swift的时候）：pod lib lint CQDemoResource.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-modular-headers --verbose
  #验证方法2(含Swift的时候）：pod lib lint CQDemoResource.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push dvlproad CQDemoResource.podspec --sources=master,dvlproad --allow-warnings --use-modular-headers --verbose


  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoResource"
  s.version      = "0.1.0"
  s.summary      = "Demo"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 - CQDemoResource/xxx：Demo最基础类

                   A longer description of CJHook in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC
  

  #s.license      = {
  #  :type => 'Copyright',
  #  :text => <<-LICENSE
  #            © 2008-2016 Dvlproad. All rights reserved.
  #  LICENSE
  #}
  s.license      = "MIT"

  s.author   = { "dvlproad" => "" }

  s.platform     = :ios, "8.0"
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoResource_0.1.0" }
  # s.source_files  = "CQDemoResource/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CQDemoResource/**/*.{png,xib}"
  
  # s.resource_bundle 指定一个目录下的所有png图片为一个资源包
  # s.resource_bundle = {
  #   'MapBox' => 'MapView/Map/Resources/*.png'
  # }
  # s.resource_bundles 指定多个资源包
  # s.resource_bundles = {
  #    'MapBox' => ['MapView/Map/Resources/*.png'],
  #    'OtherResources' => ['MapView/Map/OtherResources/*.png']
  #  }
  s.resource_bundle = {
    'CQDemoResource' => [      # CQDemoResource 为生成boudle的名称，可以随便起，但要记住，库里要用
      'CQDemoResource/**/*.{png,jpg,jpeg,gif,svg,mov,mp4}',
      'CQDemoResource/**/*.{heic}',
      'CQDemoResource/**/*.{xcassets}'
    ]
  }
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下

  # s.frameworks = "MediaPlayer"

  s.source_files = "CQDemoResource/**/*.{h,m}"
  # Demo 工程中基本都需要的 DemoResource
  # s.subspec 'Demo_Resource' do |ss|
  #   ss.source_files = "CQDemoResource/Demo_Resource/**/*.{h,m}"
  #   ss.dependency 'CQDemoResource/Helper'    # 需要使用到 NSError+CQTSErrorString.h
  #   ss.dependency 'CQDemoResource/BaseUIKit' # 需要使用到 CQTSImageLoader.h 和 UIImageView+CQTSBaseUtil.h
  # end


end
