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
# 清除缓存(解决pod search查本地还搜得到delete的问题): pod cache clean CQDemoKit

# 本地查找(pod repo update trunk不会自动清理本地已下载后，才在远程删除掉的pod)
# 在本地 spec 仓库中查找指定库的缓存位置
# 本地精确查找    find ~/.cocoapods/repos/trunk -name "CJMedia.podspec.json" -type f
# 本地模糊查找    find ~/.cocoapods/repos/trunk -name "CJMedia.*" -type f

# ------------------------------------------------
# 查看本地已同步的pod库：pod repo
# 库的上传
  # 旧方法（本库不依赖swift库的时候）
  # 上传到github公有库:
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=cocoapods --allow-warnings --use-libraries --verbose
  #提交方法(github公有库)： pod trunk push CQDemoKit.podspec --allow-warnings --use-libraries --verbose   # 临时添加 --use-libraries 用来解决没错，还是报错的问题
  
  # 上传到私有库 gitee上的私有项目: dvlproadSpecs
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push gitee-dvlproad-dvlproadspecs CQDemoKit.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose

  # 上传到开源库 gitee上的公开项目: Specs
  #验证方法1：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/Specs' --allow-warnings --use-libraries --verbose
  #验证方法2：pod lib lint CQDemoKit.podspec --sources=cocoapods,dvlproadPublicSpec --allow-warnings --use-libraries --verbose
  #提交方法(私有库)： pod repo push dvlproadPublicSpec CQDemoKit.podspec --sources=cocoapods,dvlproadPublicSpec --allow-warnings --use-libraries --verbose

  # 含swift文件时候上传到私有库的方法（本类要依赖swift库的时候）将--use-libraries去掉，或者改成--use-modular-headers
  #验证方法1(含Swift的时候）：pod lib lint CQDemoKit.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitee.com/dvlproad/dvlproadSpecs' --allow-warnings --use-modular-headers --verbose
  #验证方法2(含Swift的时候）：pod lib lint CQDemoKit.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-libraries --verbose
  #提交方法 (含Swift的时候）：pod repo push gitee-dvlproad-dvlproadspecs CQDemoKit.podspec --sources=cocoapods,gitee-dvlproad-dvlproadspecs --allow-warnings --use-modular-headers --verbose

Pod::Spec.new do |s|
  # 关于resource：
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下
  s.name         = "CQDemoKit"
  s.version      = "0.9.19"
  s.summary      = "CQDemoKit 基础库 - 包含 Helper、BaseVC、BaseUIKit、BaseUtil、Demo_Resource、TestMethod、Monitor 等通用 Demo 组件"
  s.homepage     = "https://github.com/dvlproad/001-UIKit-CQDemo-iOS"

  s.description  = <<-DESC
                 Demo，可按需独立引入：
                 • CQDemoKit/Helper - 本库中的资源获取帮助类
                 
                 • CQDemoKit/BaseVC - 基础模块VC
                 • CQDemoKit/BaseVC/Base - 基础模块
                 • CQDemoKit/BaseVC/ScrollView - 滚动视图
                 • CQDemoKit/BaseVC/TableView - 表格视图
                 • CQDemoKit/BaseVC/Collection - 集合视图
                 • CQDemoKit/BaseVC/TabBar - TabBar
                 
                 • CQDemoKit/BaseUIKit - 基础模块UIKit(Button \ Container \ ImageLoader \ Segment)
                 • CQDemoKit/BaseUIKit/Button - 各种按钮(主题按钮:themeBGButton \ themeBorderButton; 状态按钮:submitButton; bug按钮:bugButton; 【单行或者单列】的单选按钮的组合:CQTSRadioButtonsView； 【多行或者多列】的单选按钮的组合见:CQDemoKit/Demo_RipeView/RipeCollectionView)
                 • CQDemoKit/BaseUIKit/Container - 创建子视图均分的containerView
                 • CQDemoKit/BaseUIKit/ImageLoader - 图片加载

                 • CQDemoKit/BaseUtil - 基础工具
                 
                 • CQDemoKit/Demo_Resource - Demo 工程中基本都需要的 DemoResource
                 
                 • CQDemoKit/Demo_RipeView - 为了快速构建完整 Demo 工程提供的一些成熟的DemoRipeView(已含内容和事件)
                 • CQDemoKit/Demo_DataSourceAndDelegate - 为了快速构建完整 Demo 工程提供的一些成熟的DataSource和Delegate(已含内容和事件)
                 • CQDemoKit/Auxiliary - 辅助模块(①添加辅助文本(含删除)、添加任意辅助视图；②为 present 出来的视图，添加 NavigationBar)
                 • CQDemoKit/TestMethod - 验证方法是否正确的基类(CompareHopeResult:输入支持单行和多行，如测试获取字符串长度的方法、测试获取字符串、日期计算等方法；MinusAddFeedback:中间是文本框，左侧"-"按钮，右侧"+"按钮 ，下面是方法执行结果的 的方法列表测试视图（常用于时间加减、数值加减))
                 

                 • CQDemoKit/StateUI - 状态相关的UI(如：没有数据的视图 CQTSDataEmptyView ，没有网络的弹窗 CQTSAlertManager)
                 • CQDemoKit/Monitor - 监控

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
 
  s.source       = { :git => "https://github.com/dvlproad/001-UIKit-CQDemo-iOS.git", :tag => "CQDemoKit_0.9.19" }
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
    s.resource_bundles = {
      'CQDemoKit_Privacy' => ['CQDemoKit/PrivacyInfo.xcprivacy'],
    }
  # s.resource_bundle = {
  #   'CQDemoKit' => [      # CQDemoKit 为生成boudle的名称，可以随便起，但要记住，库里要用
  #     'CQDemoKit/BaseVC/**/*.{png,jpg,jpeg}'
  #   ]
  # }
  # s.resources = 会拷贝到mainBundle下
  # s.resource_bundle = 会放在指定的customBundle下

  # s.frameworks = "MediaPlayer"
  
  # 本库中的资源获取帮助类
  s.subspec 'Helper' do |ss|
    ss.source_files = "CQDemoKit/Helper/**/*.{h,m}"  # 包含UIImage+CQDemoKit
  end

  # 基础模块VC
  s.subspec 'BaseVC' do |ss|
    # 基础模块
    ss.subspec 'Base' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/Base/**/*.{h,m}"
      sss.dependency 'Masonry'
      sss.dependency 'CQDemoKit/BaseUIKit'  # 因为 CJUIKitBaseViewController 需要使用到 CQTSButtonFactory
    end

    # 滚动视图
    ss.subspec 'ScrollView' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/ScrollView/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'
    end

    # 表格视图
    ss.subspec 'TableView' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/TableView/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'	# 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
    end

    # 集合视图
    ss.subspec 'Collection' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/Collection/**/*.{h,m}"
      sss.dependency 'CQDemoKit/BaseVC/Base'	# 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
    end

    # TabBar
    ss.subspec 'TabBar' do |sss|
      sss.source_files = "CQDemoKit/BaseVC/TabBar/**/*.{h,m}"
      #sss.resources = ['CQDemoKit/BaseVC/TabBar/Resources/**/*.{png,jpg,jpeg}']
      sss.dependency 'CQDemoKit/Helper'
      # s.resources = 会拷贝到mainBundle下
      # s.resource_bundle = 会放在指定的customBundle下
    end
  end

  # 基础模块UIKit(Button \ Container \ ImageLoader \ Segment)
  s.subspec 'BaseUIKit' do |ss|
    # 各种按钮(主题按钮:themeBGButton \ themeBorderButton; 状态按钮:submitButton; bug按钮:bugButton; 【单行或者单列】的单选按钮的组合:CQTSRadioButtonsView； 【多行或者多列】的单选按钮的组合见:CQDemoKit/Demo_RipeView/RipeCollectionView; 【单行或者单列】的普通功能按钮的组合:CQTSActionButtonsBuilder)
    ss.subspec 'Button' do |sss|
      sss.source_files = "CQDemoKit/BaseUIKit/Button/**/*.{h,m}"
      sss.dependency 'Masonry'
    end

    # 创建子视图均分的containerView
    ss.subspec 'Container' do |sss|
      sss.source_files = "CQDemoKit/BaseUIKit/Container/**/*.{h,m}"
      sss.dependency 'Masonry'
    end

    # 图片加载
    ss.subspec 'ImageLoader' do |sss|
      sss.source_files = "CQDemoKit/BaseUIKit/ImageLoader/**/*.{h,m}"
    end

    # Segment
    ss.subspec 'Segment' do |sss|
      sss.source_files = "CQDemoKit/BaseUIKit/Segment/**/*.{h,m}"
    end
  end

  # 悬浮的视图
  # s.subspec 'BaseWindow' do |ss|
  #   ss.source_files = "CQDemoKit/BaseWindow/**/*.{h,m}"
  # end

  # 基础工具
  s.subspec 'BaseUtil' do |ss|
    ss.source_files = "CQDemoKit/BaseUtil/**/*.{h,m}"
    ss.dependency 'Masonry'
  end

  # Demo 工程中基本都需要的 DemoResource
  s.subspec 'Demo_Resource' do |ss|
#    ss.dependency 'CQDemoKit/BaseUIKit' # 需要使用到 CQTSImageLoader.h 和 UIImageView+CQTSBaseUtil.h
    
    # 获取资源的信息(文件名、扩展名、类型等)
    ss.subspec 'ResourceInfoUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/CQTSResourceInfoUtil.{h,m}"
    end
    
    # 获取app沙盒的路径信息(含获取资源在app沙盒中的各种路径信息)
    ss.subspec 'SandboxPathUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/SandboxUtil/CQTSSandboxPathUtil.{h,m}"
      sss.dependency 'CQDemoKit/Demo_Resource/ResourceInfoUtil' # 获取文件沙盒路径信息时会额外提供文件名、扩展名信息
    end
    
    # 从主工程中拷贝 / 从后台下载download文件 到app沙盒中
    ss.subspec 'SandboxFileUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/SandboxUtil/CQTSSandboxFileUtil.{h,m}"
      sss.dependency 'CQDemoKit/Demo_Resource/SandboxPathUtil' # 提供app沙盒的存放位置时候需要
      sss.dependency 'CQDemoKit/Helper'    # 下载出错打印错误信息时候需要
    end
    
    # 将下载到 app 沙盒中的媒体文件保存到相册中
    ss.subspec 'SandboxPhotoUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/SandboxUtil/CQTSSandboxPhotoUtil.{h,m}"
      sss.dependency 'CQDemoKit/Demo_Resource/ResourceInfoUtil' # 如果要尝试假智能的根据路径的后缀名保存任意媒体文件的时候需要
    end
    
    # 本地\网络\Icon 图片的模型
    ss.subspec 'ImageModel' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/ImageModel/**/*.{h,m}"
    end
    
    # 获取随机值的工具(颜色、字符串、中文名字等)
    ss.subspec 'RandomUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/String/CJUIKitRandomUtil.{h,m}"
    end
    
    # 从git中获取指定资源Url的工具
    ss.subspec 'GitUtil' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/String/CQTSGitUtil.{h,m}"
    end
    
    # InFramework中的操作(获取resourceBundle等)
    ss.subspec 'InFramework' do |sss|
      sss.source_files = "CQDemoKit/Demo_Resource/UIImage+CQTSInFramework.{h,m}"
    end
    
  end

  # 为了快速构建完整 Demo 工程提供的一些成熟的DemoRipeView(已含内容和事件)
  s.subspec 'Demo_RipeView' do |ss|
    ss.source_files = "CQDemoKit/Demo_RipeView/*.{h,m}"
    ss.dependency 'CQDemoKit/BaseUtil'    # 因为 CQTSRipeButton 需要使用 CJUIKitToastUtil
    ss.dependency 'CQDemoKit/BaseUIKit'   # 因为 CQTSRipeButton 需要使用 CQTSButtonFactory
    ss.dependency 'CQDemoKit/Demo_Resource'
    ss.dependency 'CQDemoKit/Demo_DataSourceAndDelegate'  # 使用 DataSource 或 Delegate

    # 集合视图(CQTSRipeButtonCollectionViewCell \ CQTSRipeImageCollectionViewCell \ 【多行或者多列】的单选按钮的组合:CQTSRipeButtonCollectionView)
    ss.subspec 'RipeCollectionView' do |sss|
      sss.source_files = "CQDemoKit/Demo_RipeView/RipeCollectionView/**/*.{h,m}"
      sss.dependency 'Masonry'

      # CQTSRipeButtonCollectionViewCell 需要使用 CQTSButtonFactory.h
      # CQTSRipeImageCollectionViewCell 需要使用 UIImageView+CQTSBaseUtil.h
      sss.dependency 'CQDemoKit/BaseUIKit'
    end

    # 图片选择器
    ss.subspec 'ImagePicker' do |sss|
      sss.source_files = "CQDemoKit/Demo_RipeView/ImagePicker/**/*.{h,m}"
      sss.dependency 'Masonry'
    end
  end

  # 为了快速构建完整 Demo 工程提供的一些成熟的DataSource和Delegate(已含内容和事件)
  s.subspec 'Demo_DataSourceAndDelegate' do |ss|
    ss.source_files = "CQDemoKit/Demo_DataSourceAndDelegate/**/*.{h,m}"
    
    ss.dependency 'CQDemoKit/BaseVC'        # 因为 CQTSRipeBaseCollectionViewDataSource 需要使用 CQDMSectionDataModel
  end

  # 辅助模块(①添加辅助文本(含删除)、添加任意辅助视图；②为 present 出来的视图，添加 NavigationBar)
  s.subspec 'Auxiliary' do |ss|
    ss.source_files = "CQDemoKit/Auxiliary/**/*.{h,m}"
    ss.dependency 'Masonry'
  end

  # 验证方法是否正确的基类(CompareHopeResult:输入支持单行和多行，如测试获取字符串长度的方法、测试获取字符串、日期计算等方法；MinusAddFeedback:中间是文本框，左侧"-"按钮，右侧"+"按钮 ，下面是方法执行结果的 的方法列表测试视图（常用于时间加减、数值加减))
  s.subspec 'TestMethod' do |ss|
    ss.source_files = "CQDemoKit/TestMethod/**/*.{h,m}"
    ss.resource_bundles = {
      'CQDemoKit_TestMethod' => ['CQDemoKit/TestMethod/**/*.{png,jpg,jpeg}']
    }
    ss.dependency 'CQDemoKit/BaseVC/Base'  # 该库内还已含 CQDMSectionDataModel 和 CQDMModuleModel
    ss.dependency 'CQDemoKit/BaseUtil'
  end
  

  # 状态相关的UI(如：没有数据的视图 CQTSDataEmptyView ，没有网络的弹窗 CQTSAlertManager)
  s.subspec 'StateUI' do |ss|
    ss.source_files = "CQDemoKit/StateUI/**/*.{h,m}"
    ss.resource_bundles = {
      'CQDemoKit_StateUI' => ['CQDemoKit/StateUI/**/*.{png,jpg,jpeg}']
    }
    ss.dependency 'Masonry'
  end
  
  # 监控
  s.subspec 'Monitor' do |ss|
    ss.source_files = "CQDemoKit/Monitor/**/*.{h,m}"
  end


end
