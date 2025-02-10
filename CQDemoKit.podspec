Pod::Spec.new do |s|
  #查看本地已同步的pod库：pod repo
  #清除缓存：pod cache clean CQDemoKit
  
#  pod trunk register 邮箱地址 '用户名' --description='描述信息'
#  pod trunk register dvlproad@163.com 'dvlproad' --description='homeMac'
#  pod trunk me

  # 旧方法（本库不依赖swift库的时候）
  # 上传到github公有库:
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=master --allow-warnings --use-libraries --verbose
  #提交方法(github公有库)： pod trunk push CQDemoKit.podspec --allow-warnings
  
  # 上传到私有库 gitee上的私有项目: dvlproadSpecs
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproad CQDemoKit.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose

  # 上传到开源库 gitee上的公开项目: Specs
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/Specs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproadPublicSpec CQDemoKit.podspec --sources=master,dvlproadPublicSpec --allow-warnings --use-libraries --verbose

  # 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers
  #验证方法1(含Swift的时候）：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-modular-headers --verbose
  #验证方法2(含Swift的时候）：pod lib lint CQDemoKit.podspec --sources=master,dvlproad --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push dvlproad CQDemoKit.podspec --sources=master,dvlproad --allow-warnings --use-modular-headers --verbose


  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoKit"
  s.version      = "0.7.2"
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
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoKit_0.7.2" }
  # s.source_files  = "CQDemoKit/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CQDemoKit/**/*.{png,xib}"
  
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
    'CQDemoKit' => ['CQDemoKit/Demo_Resource/**/*.{png,jpg,jpeg,gif,svg}', 'CQDemoKit/BaseVC/**/*.{png,jpg,jpeg}'] # CQDemoKit 为生成boudle的名称，可以随便起，但要记住，库里要用
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

  # 悬浮的视图
  # s.subspec 'BaseWindow' do |ss|
  #   ss.source_files = "CQDemoKit/BaseWindow/**/*.{h,m}"
  # end

  s.subspec 'BaseUtil' do |ss|
    ss.source_files = "CQDemoKit/BaseUtil/**/*.{h,m}"
  end

  # Demo 工程中基本都需要的 DemoResource
  s.subspec 'Demo_Resource' do |ss|
    ss.source_files = "CQDemoKit/Demo_Resource/**/*.{h,m}"
    ss.dependency 'CQDemoKit/Helper'    # 需要使用到 NSError+CQTSErrorString.h
    ss.dependency 'CQDemoKit/BaseUIKit' # 需要使用到 CQTSImageLoader.h 和 UIImageView+CQTSBaseUtil.h
  end

  # 为了快速构建完整 Demo 工程提供的一些成熟的DemoRipeView(已含内容和事件)
  s.subspec 'Demo_RipeView' do |ss|
    ss.source_files = "CQDemoKit/Demo_RipeView/**/*.{h,m}"
    ss.dependency 'CQDemoKit/BaseUtil'    # 因为 CQTSRipeButton 需要使用 CJUIKitToastUtil
    ss.dependency 'CQDemoKit/BaseUIKit'   # 因为 CQTSRipeButton 需要使用 CQTSButtonFactory
    ss.dependency 'CQDemoKit/Demo_Resource'
  end

  # 为了快速构建完整 Demo 工程提供的一些成熟的DataSource和Delegate(已含内容和事件)
  s.subspec 'Demo_DataSourceAndDelegate' do |ss|
    ss.source_files = "CQDemoKit/Demo_DataSourceAndDelegate/**/*.{h,m}"
    # ss.dependency 'CQDemoKit/BaseUtil'    # 因为 CQTSRipeButton 需要使用 CJUIKitToastUtil
    # ss.dependency 'CQDemoKit/BaseUIKit'   # 因为 CQTSRipeButton 需要使用 CQTSButtonFactory
    ss.dependency 'CQDemoKit/BaseVC'
    ss.dependency 'CQDemoKit/Demo_Resource'
  end

  s.subspec 'Auxiliary' do |ss|
    ss.source_files = "CQDemoKit/Auxiliary/**/*.{h,m}"
    ss.dependency 'Masonry'
  end
  
  s.subspec 'Monitor' do |ss|
    ss.source_files = "CQDemoKit/Monitor/**/*.{h,m}"
  end


end
