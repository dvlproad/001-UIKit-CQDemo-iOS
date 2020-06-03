Pod::Spec.new do |s|
  #验证方法：pod lib lint CQDemoKit.podspec --sources=cocoapods --allow-warnings
  #查看本地已同步的pod库：pod repo
  #上传方法：pod repo push cocoapods CQDemoKit.podspec --sources=cocoapods --allow-warnings
  s.name         = "CQDemoKit"
  s.version      = "0.4.0"
  s.summary      = "Demo"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 - CQDemoKit/xxx：Demo最基础类

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
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoKit_0.4.0" }
  #s.source_files  = "CQDemoKit/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CJHook/**/*.{png,xib}"
  # s.frameworks = "MediaPlayer"
  

  s.subspec 'Home_Base' do |ss|
    ss.source_files = "CQDemoKit/Base/**/*.{h,m}"
    ss.dependency 'Masonry'
    ss.dependency "CJBaseUtil/CJDataUtil"
  end

  s.subspec 'Home_TextView' do |ss|
    ss.source_files = "CQDemoKit/TextView/**/*.{h,m}"

    ss.dependency 'CQDemoKit/Home_Base'
  end

  s.subspec 'Home_Collection' do |ss|
    ss.source_files = "CQDemoKit/Collection/**/*.{h,m}"

    ss.dependency 'CQDemoKit/Home_Base'
  end

  # Demo 工程中基本都需要的 Resource
  s.subspec 'Demo_Resource' do |ss|
    ss.source_files = "CQDemoKit/Demo_Resource/**/*.{h,m}"
    ss.resource_bundle = {
      'CQDemoKit' => ['CQDemoKit/Demo_Resource/**/*.{png,jpg}'] # CQDemoKit 为生成boudle的名称，可以随便起，但要记住，库里要用
    }
  end

end
