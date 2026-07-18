//
//  TSUIKitAsSwiftUIHomePage.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  UIKit as SwiftUI

import SwiftUI
import UIKit
import CQDemoKit_Swift

@available(iOS 14.0, *)
@objc public class TSUIKitAsSwiftUIHomeViewController: CQTSSwiftUIAsUIViewController {
    @objc public init() {
        super.init(swiftUIView: TSUIKitAsSwiftUIHomePage())
    }
}


// MARK: - 使用示例
@available(iOS 14.0, *)
public struct TSUIKitAsSwiftUIHomePage: View {
    public var body: some View {
        CQTSSwiftUIBaseHomeView(
            title: "SwiftUI",
            sectionDataModels: [
                CQDMSwiftSectionDataModel(
                    theme: "点击后跳转到指定页面",
                    values: [
                        CQDMSwiftModuleModel(title: "点击后跳转到指定页面", content: "点击后跳转到指定页面", contentLines: 1, viewGetterHandle: {
                            AnyView(Text("我是点击后跳转进去的页面"))
                        })
                    ]
                ),
                CQDMSwiftSectionDataModel(
                    theme: "点击后执行自定义事件",
                    values: [
                        CQDMSwiftModuleModel(title: "点击后执行自定义事件", content: "点击后执行自定义事件", contentLines: 1,  actionBlock: {
                            debugPrint("点击")
                        })
                    ]
                )
            ]
        )
    }
}


// MARK: - Preview
@available(iOS 14.0, *)
#Preview {
    TSUIKitAsSwiftUIHomePage()
}
