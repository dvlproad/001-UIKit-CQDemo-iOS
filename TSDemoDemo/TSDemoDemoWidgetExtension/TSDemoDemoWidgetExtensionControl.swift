//
//  TSDemoDemoWidgetExtensionControl.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import AppIntents
import SwiftUI
import WidgetKit
import CQDemoShareFramework_Swift

struct TSDemoDemoWidgetExtensionControl: ControlWidget {
    static let kind: String = "com.dvlproad.TSDemoDemo.TSDemoDemoWidgetExtension"

    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: Self.kind,
            provider: Provider()
        ) { value in
            ControlWidgetToggle(
                "Start Timer",
                isOn: value.isRunning,
                action: StartTimerIntent(value.name)
            ) { isRunning in
                //Label(isRunning ? "On" : "Off", systemImage: "timer")
                
                Label {
                    Text(isRunning ? "On" : "Off")
                    Text("副标题")
                } icon: {
                    // 系统SF图标
//                    Image(systemName: "timer")
//                        .foregroundStyle(.yellow)
                    // 自定义SF图标
                    let downloadBundle: Bundle? = TSWidgetExtensionDataUtil.getSymbolBundle()
                    let uiimage: UIImage? = UIImage(named: "icon_control_katong_6", in: downloadBundle, compatibleWith: nil)
                    Image(uiImage: uiimage ?? UIImage())
//                    Image("icon_control_katong_6", bundle: downloadBundle)
                    
//                    Image("cqts_bundle_symbolsvg_1")
//                        .resizable()
//                        .symbolEffect(.breathe.pulse.byLayer, options: .repeat(.continuous))
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30, height: 30)
                }
                .tint(Color.red)  // 设定开启状态的图标颜色
            }
        }
        .displayName("Timer")
        .description("A an example control that runs a timer.")
    }
}

extension TSDemoDemoWidgetExtensionControl {
    struct Value {
        var isRunning: Bool
        var name: String
    }

    struct Provider: AppIntentControlValueProvider {
        func previewValue(configuration: TimerConfiguration) -> Value {
            TSDemoDemoWidgetExtensionControl.Value(isRunning: false, name: configuration.timerName)
        }

        func currentValue(configuration: TimerConfiguration) async throws -> Value {
            let isRunning = true // Check if the timer is running
            return TSDemoDemoWidgetExtensionControl.Value(isRunning: isRunning, name: configuration.timerName)
        }
    }
}

struct TimerConfiguration: ControlConfigurationIntent {
    static let title: LocalizedStringResource = "Timer Name Configuration"

    @Parameter(title: "Timer Name", default: "Timer")
    var timerName: String
}

struct StartTimerIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Start a timer"

    @Parameter(title: "Timer Name")
    var name: String

    @Parameter(title: "Timer is running")
    var value: Bool

    init() {}

    init(_ name: String) {
        self.name = name
    }

    func perform() async throws -> some IntentResult {
        // Start the timer…
        return .result()
    }
}
