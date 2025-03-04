//
//  OpenURLIntentIOS180.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/1/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import AppIntents
import SwiftUI


@available(iOS 18.0, *)
struct OpenURLIntentIOS180: AppIntent {
    init() {
        
    }
    
    static let title: LocalizedStringResource = "OpenURLIntentIOS180"

    static let openAppWhenRun = true
    static let isDiscoverable = true
    
    @Parameter(title: "openUrl") var openUrl: String?
    init(openUrl: String? = nil) {
        self.openUrl = openUrl
    }

    func perform() async throws -> some IntentResult & OpensIntent {
        let appUrl: String = self.openUrl ?? "noexsitApp://"
        
        let appURL: URL? = URL(string: appUrl)
        if let appURL = appURL {
            await EnvironmentValues().openURL(appURL) // kn:使用此行修复使用 OpenURLIntent 打开非系统应用无效问题
        }
#if Main_TARGET
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            if let url = URL(string: "https://www.apple.com/notes") {
//                if UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                } else {
//                    print("无法打开备忘录 app")
//                }
//            }
//        }
        
//        if let url = URL(string: "mobilenotes://") {
//                // 使用后台任务或其他方法来尝试打开 URL
//                DispatchQueue.global(qos: .background).async {
//                    if UIApplication.shared.canOpenURL(url) {
//                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                    }
//                }
//            }
#endif
        return .result()
        
//        return .result(opensIntent: appURL != nil ? OpenURLIntent(appURL!) : OpenURLIntent())   //(181上 日历有效，微信无效)
    }
}



@available(iOS 18.0, *)
struct NoOpenURLIntentIOS180: AppIntent {
    init() {
        
    }
    
    static let title: LocalizedStringResource = "NOOpenURLIntentIOS180"

    static let openAppWhenRun = false
    static let isDiscoverable = true

    func perform() async throws -> some IntentResult & OpensIntent {
        return .result()
    }
}
