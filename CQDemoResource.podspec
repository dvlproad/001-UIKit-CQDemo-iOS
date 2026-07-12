# ------------------------------------------------
#  pod trunk register 邮箱地址 '用户名' --description='描述信息'
#  pod trunk register dvlproad@163.com 'dvlproad' --description='homeMac'
#  pod trunk me

# ------------------------------------------------
# 库的弃用：
# 弃用库(标记某个版本或整个库为“已弃用”): pod trunk deprecate CQDemoKit

# 库的删除
# 删除指定版本:                                   pod trunk delete CJMedia 1.0.0
# 全删除后，验证远程的是否正确删掉了                  pod trunk info CJMedia
# 清除缓存(解决pod search查本地还搜得到delete的问题): pod cache clean CQDemoResource
# 在 spec 仓库中查找指定库的缓存位置                 find ~/.cocoapods/repos -name "CQDemoResource" -type f

# ------------------------------------------------
# 查看本地已同步的pod库：pod repo
# 库的上传
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
  #验证方法2(含Swift的时候）：pod lib lint CQDemoResource.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push gitee-dvlproad-dvlproadspecs CQDemoResource.podspec --sources=master,gitee-dvlproad-dvlproadspecs --allow-warnings --use-modular-headers --verbose

Pod::Spec.new do |s|
  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoResource"
  s.version      = "0.2.5"
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
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoResource_0.2.5" }
  # s.source_files  = "CQDemoResource/*.{h,m}"

  s.frameworks = "UIKit"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  # s.resources = "CQDemoResource/**/*.{png,xib}"
  
  # 注意：在根级别的 resource_bundle，因为不在任何 subspec 中。且 Podfile 在 pod 'CQDemoResource', :subspecs => ['Images'] 时只加载指定 subspec 及其依赖，所以根级资源被忽略，无法加载到Pod中。
  # 注意：在根级别的 resource_bundle，因为不在任何 subspec 中。且 Podfile 在 pod 'CQDemoResource', :subspecs => ['Images'] 时只加载指定 subspec 及其依赖，所以根级资源被忽略，无法加载到Pod中。
  # 注意：在根级别的 resource_bundle，因为不在任何 subspec 中。且 Podfile 在 pod 'CQDemoResource', :subspecs => ['Images'] 时只加载指定 subspec 及其依赖，所以根级资源被忽略，无法加载到Pod中。
  # 所以，若要让某个资源在依赖任何subspec的时候都能够被加载进去，应该将其放到 subspec 中
  # 所以，若要让某个资源在依赖任何subspec的时候都能够被加载进去，应该将其放到 subspec 中
  # 所以，若要让某个资源在依赖任何subspec的时候都能够被加载进去，应该将其放到 subspec 中

  # s.resource_bundle 指定一个目录下的所有png图片为一个资源包
  # s.resource_bundle = {
  #   'MapBox' => 'MapView/Map/Resources/*.png'
  # }
  # s.resource_bundles 指定多个资源包
  # s.resource_bundles = {
  #    'MapBox' => ['MapView/Map/Resources/*.png'],
  #    'OtherResources' => ['MapView/Map/OtherResources/*.png']
  #  }
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下

  # s.frameworks = "MediaPlayer"
  
  # Core - 源码，不含资源
  s.subspec 'Core' do |ss|
    ss.source_files = "CQDemoResource/**/*.{h,m}"
    # CQDemoResource 为生成boudle的名称，可以随便起，但要记住，库里要用
    # ss.resource_bundle = {
    #   'CQDemoResource' => [
    #     'CQDemoResource/Resources/**/*.{xcassets}',
    #   ]
    # }
    # 因为 CQTSAssetModelGetter.m 需要使用 CQTSLocImageDataModel\CQTSNetImageDataModel\CQTSIconDataModel
    # 因为 CQTSAssetSourceUtil.m 需要使用 CQTSGitUtil
    ss.dependency 'CQDemoKit/Demo_Resource'
    # ss.dependency 'CQDemoKit/BaseUIKit'  # 因为 CQTSIconsUtil.m 需要使用 CQTSImageLoader
  end

  # 📢 注意：
  # resource_bundle 下的 bundle 名不能一样，否则容易出现执行 pod install 时，
  # 因为其中含有相同bundle名(如ss.resource_bundle 下的都是 CQDemoResource) ，出现警告提示 [!] [Xcodeproj] Generated duplicate UUIDs: ，从而导致本来能够加载到的图片突然就加载不到了。
  # 为了解决这个问题，应该
  # 方法1(⭐️    )：绝对避免同时加载含相同 bundle 名的 subspec
  # 方法2(⭐️⭐️  )：删除到所有资源放只用一个 bundle
  # 方法3(⭐️⭐️⭐️)：把他们的 bundle 名区分开
  
  # Images - jpg, png, webp, heic
  s.subspec 'Images' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      # CQDemoResource 为生成boudle的名称，可以随便起，但要记住，库里要用
      'CQDemoResource' => [
        'CQDemoResource/Resources/jpg/**/*',
        'CQDemoResource/Resources/png/**/*',
        'CQDemoResource/Resources/webp/**/*',
        'CQDemoResource/Resources/heic/**/*',
        'CQDemoResource/Resources/**/*.{xcassets}',
      ]
    }
  end

  # Images - jpg_big
  s.subspec 'Images_Big' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource_Images_Big' => [
        'CQDemoResource/Resources/jpg_big/**/*',
      ]
    }
  end

  # GIF - GIF
  s.subspec 'GIF' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource_GIF' => [
        'CQDemoResource/Resources/GIF/**/*',
      ]
    }
  end

  # SVG - SVG 文件
  s.subspec 'SVG' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource_SVG' => [
        'CQDemoResource/Resources/SVG/**/*',
      ]
    }
  end
  
  # Videos - mp4, mov
  s.subspec 'Videos' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource_Videos' => [
        'CQDemoResource/Resources/mp4/**/*',
        'CQDemoResource/Resources/mov/**/*',
      ]
    }
  end

  # Zip - zip
  s.subspec 'Zip' do |ss|
    ss.dependency 'CQDemoResource/Core'
    ss.resource_bundle = {
      'CQDemoResource_Zip' => [
        'CQDemoResource/Resources/zip/**/*',
      ]
    }
  end

end
