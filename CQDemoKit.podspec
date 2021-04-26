Pod::Spec.new do |s|
  #查看本地已同步的pod库：pod repo
  #验证方法：pod lib lint CQDemoKit.podspec --sources=master --allow-warnings
  #上传方法：pod trunk push CQDemoKit.podspec --allow-warnings
  #清除缓存：pod cache clean CQDemoKit
  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoKit"
  s.version      = "0.6.1"
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
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoKit_0.6.1" }
  # s.source_files  = "CQDemoKit/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CQDemoKit/**/*.{png,xib}"
  s.resource_bundle = {
    'CQDemoKit' => ['CQDemoKit/Demo_Resource/**/*.{png,jpg,jpeg}', 'CQDemoKit/BaseVC/**/*.{png,jpg,jpeg}'] # CQDemoKit 为生成boudle的名称，可以随便起，但要记住，库里要用
  }
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下

  # s.frameworks = "MediaPlayer"
  
  # 本库中的资源获取帮助类
  s.subspec 'Helper' do |ss|
    ss.source_files = "CQDemoKit/Helper/**/*.{h,m}"  # 包含UIImage+CQDemoKit
  end

  s.subspec 'BaseVC' do |ss|
    ss.subspec 'Base' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/Base/**/*.{h,m}"
      sss.dependency 'Masonry'
      sss.dependency 'CQDemoKit/BaseUIKit'  # 因为 CJUIKitBaseViewController 需要使用到 CQTSButtonFactory
    end

    ss.subspec 'ScrollView' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/ScrollView/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'
    end

    ss.subspec 'TableView' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/TableView/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'	# 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
    end

    ss.subspec 'Collection' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/Collection/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'	# 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
    end

    ss.subspec 'TextView' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/TextView/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'	# 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
      sss.dependency 'CQDemoKit/BaseUtil'
    end

    ss.subspec 'TabBar' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/TabBar/**/*.{h,m}"
      sss.resources = ['CQDemoKit/BaseVC/TabBar/Resources/**/*.{png,jpg,jpeg}']
      ss.dependency 'CQDemoKit/Helper'
      # s.resources = 会拷贝到mainBundle下
      # s.resource_bundle = 会放在指定的customBundle下
    end
  end

  s.subspec 'BaseUIKit' do |ss|
    ss.source_files = "CQDemoKit/BaseUIKit/**/*.{h,m}"
    ss.dependency 'Masonry'
  end

  s.subspec 'BaseUtil' do |ss|
    ss.source_files = "CQDemoKit/BaseUtil/**/*.{h,m}"
  end

  # Demo 工程中基本都需要的 DemoResource
  s.subspec 'Demo_Resource' do |ss|
    ss.source_files = "CQDemoKit/Demo_Resource/**/*.{h,m}"
    ss.dependency 'CQDemoKit/Helper'
  end

  # 为了快速构建完整 Demo 工程提供的一些成熟的DemoRipeView(已含内容和事件)
  s.subspec 'Demo_RipeView' do |ss|
    ss.source_files = "CQDemoKit/Demo_RipeView/**/*.{h,m}"
    ss.dependency 'CQDemoKit/BaseUtil'    # 因为 CQTSRipeButton 需要使用 CJUIKitToastUtil
    ss.dependency 'CQDemoKit/BaseUIKit'   # 因为 CQTSRipeButton 需要使用 CQTSButtonFactory
  end


end
