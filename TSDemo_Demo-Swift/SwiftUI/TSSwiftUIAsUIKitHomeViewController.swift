//
//  TSSwiftUIAsUIKitHomeViewController.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  SwiftUI as UIKit

import UIKit
import CJBaseUIKit_Swift
import CQDemoKit_Swift
import TSDemo_Demo

struct TSSwiftUIAsUIKitHomeView: UIViewControllerRepresentable {
    
    // 初始化或传参（如果有）
    init(someParameter: String = "") {
        // 可以在这里接收 SwiftUI 传来的参数
    }
    
    // 必须实现：创建 UIKit 控制器实例
    func makeUIViewController(context: Context) -> TSSwiftUIAsUIKitHomeViewController {
        // 如果控制器在 Storyboard 中，需要从 Storyboard 加载
        // 如果是纯代码，直接 return TSSwiftUIAsUIKitHomeViewController()
        return TSSwiftUIAsUIKitHomeViewController()
    }
    
    // 必须实现：更新控制器（当 SwiftUI 状态变化时调用）
    func updateUIViewController(_ uiViewController: TSSwiftUIAsUIKitHomeViewController, context: Context) {
        // 在这里将 SwiftUI 的最新数据传递给 UIKit 控制器
        // 例如: uiViewController.updateData(newData)
    }
    
    // 可选：如果需要协调器处理代理或事件回传
    // func makeCoordinator() -> Coordinator { ... }
}

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
                module.content = "let tsview = CQTSSwiftUIAsUIView(swiftUIView: CQTSView())\nlet tsview = CQTSSwiftUIAsUIView.init(swiftUIView: CQTSView())"
                module.contentLines = 4
                module.viewGetterHandle = {
                    let tsview = CQTSSwiftUIAsUIView(swiftUIView: CQTSView())
                    //let tsview = CQTSSwiftUIAsUIView.init(swiftUIView: CQTSView())
                    return tsview
                }
                sectionDataModel.values.add(module)
            }
            do {
                let module = CQDMModuleModel()
                module.title = "SwiftUI 转 UIKit(as) => UIView"
                module.content = "let tsview = CQTSView().asUIKit()"
                module.contentLines = 4
                module.viewGetterHandle = {
                    let tsview = CQTSView().asUIKit()
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
                module.content = "let viewController = CQTSSwiftUIAsUIViewController(swiftUIView: TSSwiftUIFeatureHomeView())"
                module.contentLines = 4
                module.viewControllerGetterHandle = {
                    let viewController = CQTSSwiftUIAsUIViewController(swiftUIView: TSSwiftUIFeatureHomeView())
                    return viewController
                }
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


import SwiftUI
// 模拟的目标视图1
@available(iOS 13.0, *)
struct CQTSView: View {
    var body: some View {
        VStack {
            Text("This is CQTSView")
                .font(.largeTitle)
                .padding()
        }
    }
}


//if #available(iOS 14.0, *) {
//    
//} else {
//    let tsview = UIView()
//    tsview.cqdemo_addPromptText("需要 iOS 14.0+", layout: .center, height: 20)
//    return tsview
//}
