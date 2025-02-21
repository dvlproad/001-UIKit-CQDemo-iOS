Pod::Spec.new do |s|
  #查看本地已同步的pod库：pod repo
  #清除缓存：pod cache clean CQDemoKit-Swift
  
#  pod trunk register 邮箱地址 '用户名' --description='描述信息'
#  pod trunk register dvlproad@163.com 'dvlproad' --description='homeMac'
#  pod trunk me

  # 旧方法（本库不依赖swift库的时候）
  # 上传到github公有库 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers:
  #验证方法1：pod lib lint CQDemoKit-Swift.podspec --sources='https://github.com/CocoaPods/Specs.git' --allow-warnings --verbose
  #验证方法2：pod lib lint CQDemoKit-Swift.podspec --sources=master --allow-warnings --verbose
  #提交方法(github公有库)： pod trunk push CQDemoKit-Swift.podspec --allow-warnings
  
  # 上传到私有库 gitee上的私有项目: dvlproadSpecs
  #验证方法1：pod lib lint CQDemoKit-Swift.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit-Swift.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproad CQDemoKit-Swift.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose

  # 上传到开源库 gitee上的公开项目: Specs
  #验证方法1：pod lib lint CQDemoKit-Swift.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/Specs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit-Swift.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproadPublicSpec CQDemoKit-Swift.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose

  # 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers
  #验证方法1(含Swift的时候）：pod lib lint CQDemoKit-Swift.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-modular-headers --verbose
  #验证方法2(含Swift的时候）：pod lib lint CQDemoKit-Swift.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push dvlproad CQDemoKit-Swift.podspec --sources=master,dvlproad --allow-warnings --use-modular-headers --verbose


  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoKit-Swift"
  s.version      = "0.0.1"
  s.summary      = "Demo"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 - CQDemoKit-Swift/xxx：Demo最基础类
                 - CQDemoKit-Swift/SwiftUI：SwiftUI Demo最基础类

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

  s.platform     = :ios, "9.0"
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoKit-Swift_0.0.1" }
  #s.source_files  = "CQDemoKit-Swift/*.{h,m}"
  s.swift_version = '5.0'

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CJHook/**/*.{png,xib}"
  # s.frameworks = "MediaPlayer"
  

#  s.subspec 'BaseVC' do |ss|
#    ss.source_files = "CQDemoKit-Swift/BaseVC/**/*.{swift}"
#    ss.dependency 'SnapKit'
#
#    # ss.subspec 'TextView' do |sss|
#    #   sss.source_files = "CQDemoKit-Swift/BaseVC/TextView/**/*.{h,m}"
#    #   sss.dependency 'CQDemoKit-Swift/BaseVC/Base'
#    #   sss.dependency 'CQDemoKit-Swift/BaseUtil'
#    # end
#  end
  
  s.subspec 'CQDemoKit-OC' do |ss|
    s.dependency "CQDemoKit"
  end

  s.subspec 'SwiftUI' do |ss|
    ss.source_files = "CQDemoKit-Swift/SwiftUI/**/*.{swift}"
  end

 #  s.subspec 'Auxiliary' do |ss|
 #   ss.source_files = "CQDemoKit-Swift/Auxiliary/**/*.{swift}"
 #   ss.dependency 'SnapKit'
 # end


  # # Demo 工程中基本都需要的 Resource
  # s.subspec 'Demo_Resource' do |ss|
  #   ss.source_files = "CQDemoKit-Swift/Demo_Resource/**/*.{h,m}"
  #   ss.resource_bundle = {
  #     'CQDemoKit-Swift' => ['CQDemoKit-Swift/Demo_Resource/**/*.{png,jpg}'] # CQDemoKit-Swift 为生成boudle的名称，可以随便起，但要记住，库里要用
  #   }
  # end

  # s.subspec 'BaseUIKit' do |ss|
  #   ss.source_files = "CQDemoKit-Swift/BaseUIKit/**/*.{h,m}"
  #   ss.dependency 'Masonry'
  # end

  # s.subspec 'BaseUtil' do |ss|
  #   ss.source_files = "CQDemoKit-Swift/BaseUtil/**/*.{h,m}"
  # end


end
