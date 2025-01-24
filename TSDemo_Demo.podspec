Pod::Spec.new do |s|
	#验证方法1：pod lib lint TSDemo_Demo.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint TSDemo_Demo.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法： pod trunk push TSDemo_Demo.podspec --allow-warnings --use-libraries --verbose
  s.name         = "TSDemo_Demo"
  s.version      = "0.5.2"
  s.summary      = "浮层弹窗Overlay演示示例"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git"

  #s.license      = "MIT"
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
              © 2008-2016 dvlproad. All rights reserved.
    LICENSE
  }

  s.author   = { "dvlproad" => "" }
  

  s.description  = <<-DESC
 				          -、演示示例

                   A longer description of TSDemo_Demo in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC
  

  s.platform     = :ios, "8.0"
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "TSDemo_Demo_0.5.2" }
  #s.source_files  = "CJDemoCommon/*.{h,m}"
  #s.source_files = "CJChat/TestOSChinaPod.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"


  # TSDemo_Demo
  s.source_files = "TSDemo_Demo/**/*.{h,m}"
  # s.resource_bundle = {
  #   'TSDemo_Demo' => ['TSDemo_Demo/**/*.xcassets', 'TSDemo_Demo/**/*.{png,jpg}'] # CQShareSheet 为生成boudle的名称，可以随便起，但要记住，库里要用
  # }
  #多个依赖就写多行
  s.dependency 'CQDemoKit'
#  s.dependency 'CQDemoKit-Swift'
  s.dependency 'SSZipArchive'     # 模拟下载 zip 到沙盒的示例


  
end
