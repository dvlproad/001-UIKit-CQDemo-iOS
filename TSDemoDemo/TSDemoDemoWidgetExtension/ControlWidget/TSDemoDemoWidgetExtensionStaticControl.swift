
//
//  TSDemoDemoWidgetExtensionStaticControl.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import AppIntents
import SwiftUI
import WidgetKit
import CQDemoShareFramework_Swift

struct TSDemoDemoWidgetExtensionStaticControl: ControlWidget {
    static let kind: String = "com.dvlproad.TSDemoDemo.TSDemoDemoWidgetExtension.static"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton(
                "快捷启动",
                action: OpenURLIntentIOS180(openUrl: "calshow://")  // 日历（模拟器就有）
            ) { isRunning in
                //Label(isRunning ? "On" : "Off", systemImage: "timer")
                
                Label {
                    Text("主标题")
                    Text("副标题")
                } icon: {
                    // 系统SF图标
//                    Image(systemName: "timer")
//                        .foregroundStyle(.yellow)
                    Image("preview_button_inMain", bundle: nil)
                    // 自定义SF图标
                    let downloadBundle: Bundle? = CQDemoWidgetExtensionDataUtil.getSymbolBundleInMain()
                    let uiimage: UIImage? = UIImage(named: "preview_button", in: downloadBundle, compatibleWith: nil)
//                    Image(uiImage: uiimage ?? UIImage())
//                    Image("preview_button", bundle: downloadBundle)
                }
            }
        }
        .displayName("静态组件")
        .description("A an example control that runs a timer.")
        .promptsForUserConfiguration()
    }
}
