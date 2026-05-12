Pod::Spec.new do |s|
  #验证方法：pod lib lint CQDemoShareFramework-Swift.podspec --allow-warnings --verbose
  #提交方法(github公有库)： pod trunk push CQDemoShareFramework-Swift.podspec --allow-warnings --verbose
  s.name         = "CQDemoShareFramework-Swift"
  s.version      = "0.0.1"
  s.summary      = "主工程和其他Target某些工程下(WidgetExtension等)都需要依赖的库"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git"
  s.license      = "MIT"
  s.author       = "dvlproad"

  s.description  = <<-DESC
                 主工程和其他Target某些工程下(WidgetExtension等)都需要依赖的库，可按需独立引入：
                 • CQDemoShareFramework-Swift/WidgetExtension - 桌面组件

                 每个子库可独立引入，详见各子库描述。
                 DESC

  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "9.0"
  s.swift_version = '5.0'

  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoShareFramework-Swift_0.0.1" }
  # s.source_files  = "CJBaseUtil/*.{h,m}"
  # s.resources = "CJBaseUtil/**/*.{png}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  # 桌面组件
  s.subspec 'WidgetExtension' do |ss|
    ss.source_files = "CQDemoShareFramework-Swift/WidgetExtension/**/*.{swift}"
  end

end
