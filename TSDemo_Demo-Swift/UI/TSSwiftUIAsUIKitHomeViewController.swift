//
//  TSSwiftUIAsUIKitHomeViewController.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  Swift as UIKit

import UIKit
import CJBaseUIKit_Swift
import CQDemoKit_Swift
import TSDemo_Demo

public class TSSwiftUIAsUIKitHomeViewController: CJUIKitBaseHomeViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("SwiftUI 与 UIKit 互转首页", comment: "")

        var sectionDataModels: [CQDMSectionDataModel] = []
        
        if #available(iOS 14.0, *) {
            let swiftUIAndUIKitModels = getSwiftUIAndUIKitModels()
            sectionDataModels.append(contentsOf: swiftUIAndUIKitModels)
        }
        
        self.sectionDataModels = NSMutableArray(array: sectionDataModels)
    }
    
    
    @available(iOS 14.0, *)
    func getSwiftUIAndUIKitModels() -> [CQDMSectionDataModel] {
        var sectionDataModels: [CQDMSectionDataModel] = []
        
        // 测试 SwiftUI 转 UIKit
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "测试 SwiftUI 转 UIKit"
            
            do {
                let module = CQDMModuleModel()
                module.title = "SwiftUI 转 UIKit(CQTSSwiftUIAsUIView 可在oc使用) => UIView"
                module.content = "let tsview = CQTSSwiftUIAsUIView(swiftUIView: TestView1())\nlet tsview = CQTSSwiftUIAsUIView.init(swiftUIView: TestView1())"
                module.contentLines = 4
                module.viewGetterHandle = {
                    let tsview = CQTSSwiftUIAsUIView(swiftUIView: TestView1())
                    //let tsview = CQTSSwiftUIAsUIView.init(swiftUIView: TestView1())
                    return tsview
                }
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "SwiftUI 转 UIKit(as) => UIView"
                module.content = "let tsview = TestView1().asUIKit()"
                module.contentLines = 4
                module.viewGetterHandle = {
                    let tsview = TestView1().asUIKit()
                    return tsview
                }
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }
        
        // 测试 SwiftUI 转 UIKit 的 ViewController
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "测试 SwiftUI 转 UIKit 的 ViewController"
            
            do {
                let module = CQDMModuleModel()
                module.title = "SwiftUI 转 UIKit 的 ViewController(CQTSSwiftUIAsUIViewController) => UIViewController"
                module.content = "let viewController = CQTSSwiftUIAsUIViewController(swiftUIView: TSUIKitAsSwiftUIHomePage())"
                module.contentLines = 4
                module.viewControllerGetterHandle = {
                    let viewController = CQTSSwiftUIAsUIViewController(swiftUIView: TSUIKitAsSwiftUIHomePage())
                    return viewController
                }
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }
        
        // 测试 UIKit 转 SwiftUI
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "测试 UIKit 转 SwiftUI"
            do {
                let module = CQDMModuleModel()
                module.title = "进入【测试 UIKit 转 SwiftUI】 的 SwiftUI 首页"
                module.content = "因为【测试 UIKit 转 SwiftUI】要再 SwiftUI 页面中测试"
                module.contentLines = 4
                module.classEntry = TSUIKitAsSwiftUIHomeViewController.self
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }

        
        return sectionDataModels
    }

    // MARK: - Touch
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}


//if #available(iOS 14.0, *) {
//    
//} else {
//    let tsview = UIView()
//    tsview.cqdemo_addPromptText("需要 iOS 14.0+", layout: .center, height: 20)
//    return tsview
//}
