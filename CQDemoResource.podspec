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
  s.version      = "0.2.1"
  s.summary      = "Demo"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 DemoResource，可按需独立引入：
                 • CQDemoResource/Core - Core - 源码，不含资源
                 • CQDemoResource/Images - Images - jpg, png, webp, heic
                 • CQDemoResource/Images_Big - Images - jpg_big
                 • CQDemoResource/GIF - GIF - GIF
                 • CQDemoResource/SVG - SVG - SVG 文件
                 • CQDemoResource/Videos - Videos - mp4, mov

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

  s.platform     = :ios, "11.0"
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoResource_0.2.1" }
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
      'CQDemoResource/Resources/*.{xcassets}',
    ]
  }
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下

  # s.frameworks = "MediaPlayer"
  
  # Core - 源码，不含资源
  s.subspec 'Core' do |ss|
    ss.source_files = "CQDemoResource/**/*.{h,m}"
    
    # 因为 CQTSAssetModelGetter.m 需要使用 CQTSLocImageDataModel\CQTSNetImageDataModel\CQTSIconDataModel
    # 因为 CQTSAssetSourceUtil.m 需要使用 CQTSGitUtil
    ss.dependency 'CQDemoKit/Demo_Resource'
    # ss.dependency 'CQDemoKit/BaseUIKit'  # 因为 CQTSIconsUtil.m 需要使用 CQTSImageLoader
  end
  
  # Images - jpg, png, webp, heic
  s.subspec 'Images' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource' => [
        'CQDemoResource/Resources/jpg/**/*',
        'CQDemoResource/Resources/png/**/*',
        'CQDemoResource/Resources/webp/**/*',
        'CQDemoResource/Resources/heic/**/*',
      ]
    }
  end

  # Images - jpg_big
  s.subspec 'Images_Big' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource' => [
        'CQDemoResource/Resources/jpg_big/**/*',
      ]
    }
  end

  # GIF - GIF
  s.subspec 'GIF' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource' => [
        'CQDemoResource/Resources/GIF/**/*',
      ]
    }
  end

  # SVG - SVG 文件
  s.subspec 'SVG' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource' => [
        'CQDemoResource/Resources/SVG/**/*',
      ]
    }
  end
  
  # Videos - mp4, mov
  s.subspec 'Videos' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource' => [
        'CQDemoResource/Resources/mp4/**/*',
        'CQDemoResource/Resources/mov/**/*',
      ]
    }
  end

end
