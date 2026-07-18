//
//  TSSwiftUIFeatureHomeView.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  测试 SwiftUI 的功能(1.SwiftUI首页 \n2.1SwiftUI as UIKit \n2.2UIKit as SwiftUI \n3.类型擦除)

import SwiftUI
import UIKit
import CQDemoKit_Swift

@available(iOS 14.0, *)
@objc public class TSSwiftUIFeatureHomeViewController: CQTSSwiftUIAsUIViewController {
    @objc public init() {
        super.init(swiftUIView: TSSwiftUIFeatureHomeView())
    }
}


// MARK: - 使用示例
@available(iOS 14.0, *)
public struct TSSwiftUIFeatureHomeView: View {
    public var body: some View {
        CQTSSwiftUIBaseHomeView(
            title: "SwiftUI",
            sectionDataModels: [
                CQDMSwiftSectionDataModel(
                    theme: "CQTSSwiftUIBaseHomeView 自身的测试",
                    values: [
                        CQDMSwiftModuleModel(
                            title: "点击后跳转到指定页面",
                            content: "点击后跳转到指定页面",
                            contentLines: 1,
                            viewGetterHandle: {
                                AnyView(Text("我是点击后跳转进去的页面"))
                            }
                        ),
                        CQDMSwiftModuleModel(
                            title: "点击后执行自定义事件",
                            actionBlock: {
                                debugPrint("点击")
                        }
                        )
                    ]
                ),
                CQDMSwiftSectionDataModel(
                    theme: "SwiftUI ↔ UIKit 互转(as)",
                    values: [
                        CQDMSwiftModuleModel(
                            title: "SwiftUI as UIKit",
                            viewGetterHandle: {
                                AnyView(TSSwiftUIAsUIKitHomeView())
                            }
                        ),
                        CQDMSwiftModuleModel(
                            title: "UIKit as SwiftUI\n(不额外提供，请使用 CJBaseUIKit-Swift 的 UIView+asSwiftUI)",
                            viewGetterHandle: {
                                AnyView(Text("UIKit as SwiftUI\n(不额外提供，请使用 CJBaseUIKit-Swift 的 UIView+asSwiftUI)"))
                            }
                        ),
                    ]
                ),
                CQDMSwiftSectionDataModel(
                    theme: "语法问题",
                    values: [
                        CQDMSwiftModuleModel(
                            title: "类型擦除（Type Erasure）",
                            viewGetterHandle: {
                                AnyView(TSSwiftUIExceDiffTypeView())
                            }
                        ),
                    ]
                )
            ]
        )
    }
}


// MARK: - Preview
@available(iOS 14.0, *)
#Preview {
    TSSwiftUIFeatureHomeView()
}
/* // 也可以直接预览 viewController
// ✅ iOS 17+ 预览
#if DEBUG
@available(iOS 17.0, *)
#Preview {
    TSSwiftUIFeatureHomeViewController()
}
#endif
*/
