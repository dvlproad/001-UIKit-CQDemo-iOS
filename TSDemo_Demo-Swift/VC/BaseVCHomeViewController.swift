//
//  BaseVCHomeViewController.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

import UIKit
import TSDemo_Demo
import CQDemoKit
import CJBaseUIKit_Swift
import CJBaseUtil_Swift
import TSDemo_Demo_Swift

class BaseVCHomeViewController: CJUIKitBaseHomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("VC首页", comment: "")

        var sectionDataModels: [CQDMSectionDataModel] = []

        // 【测试方法的列表视图】
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "【测试方法的列表视图】"

            do {
                let module = CQDMModuleModel()
                module.title = "输入内容是单行的时候"
                module.classEntry = TSSingleLineTextViewController.self
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "输入内容可能多行的时候"
                module.classEntry = TSMultilineTextViewController.self
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "有加减操作的方法"
                module.classEntry = TSManualTestMethodViewController.self
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }

        // 测试 SwiftUI 的 View
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "测试 SwiftUI 的 View"

            do {
                let module = CQDMModuleModel()
                module.title = "测试 SwiftUI 的 View"
                module.viewGetterHandle = {
                    if let tsClass = NSClassFromStringCJHelper.swiftClass(from: "TSSFUIView", nameSpace: "TSDemo_Demo-Swift") {
                        return (tsClass as! UIView.Type).init()
                    } else {
                        let tsview = UIView()
                        tsview.cqdemo_addPromptText("❌: TSTSUIView 视图生成失败,请检查", layout: .center, height: 20)
                        return tsview
                    }
                }
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "测试 SwiftUI 的 View(as)"
                module.viewGetterHandle = {
                    if let tsClass = NSClassFromStringCJHelper.swiftClass(from: "TSSFUIView", nameSpace: "TSDemo_Demo-Swift") {
                        return (tsClass as! UIView.Type).init()
                    } else {
                        let tsview = UIView()
                        tsview.cqdemo_addPromptText("❌: TSTSUIView 视图生成失败,请检查", layout: .center, height: 20)
                        return tsview
                    }
                }
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "测试 SwiftUI 的 View(as)"
                // module.classEntry = MyContainerViewController.self
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "测试 CQDemoSwiftUIBaseUIView"
                module.content = "将 SwiftUI 的视图转为 UIKit 的 UIView"
                module.viewGetterHandle = {
                    if #available(iOS 14.0, *) {
                        return TSSUHomeUIView()
                    } else {
                        let tsview = UIView()
                        tsview.cqdemo_addPromptText("需要 iOS 14.0+", layout: .center, height: 20)
                        return tsview
                    }
                }
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "测试 CQDemoSwiftUIBaseUIViewController"
                module.content = "将 SwiftUI 的视图转为 UIKit 的 UIViewController"
                if #available(iOS 14.0, *) {
                    module.classEntry = TSSUHomeUIViewController.self
                } else {
                    module.classEntry = NSClassFromString("TSSUHomeUIViewController")
                }
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }

        self.sectionDataModels = NSMutableArray(array: sectionDataModels)
    }

    // MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}
