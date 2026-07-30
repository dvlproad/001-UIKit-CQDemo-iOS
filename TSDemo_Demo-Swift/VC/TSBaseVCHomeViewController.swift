//
//  TSSwiftUIAsUIKitHomeViewController.swift
//  CJUIKitDemo
//
//  Created by ciyouzen on 2017/2/25.
//  Copyright © 2017年 dvlproad. All rights reserved.
//
//  一些 BaseVC 的测试

import UIKit
import CJBaseUIKit_Swift
import CQDemoKit_Swift
import TSDemo_Demo

class TSBaseVCHomeViewController: CJUIKitBaseHomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("VC首页", comment: "")

        var sectionDataModels: [CQDMSectionDataModel] = []

        // 【测试首页列表视图】
        do {
            let sectionDataModel = CQDMSectionDataModel()
            sectionDataModel.theme = "首页列表"

            do {
                let module = CQDMModuleModel()
                module.title = "CJUIKitBaseHomeViewController"
                module.classEntry = TSTableHomeViewController.self
                sectionDataModel.values.add(module)
            }
            sectionDataModels.append(sectionDataModel)
        }
        
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
        
        self.sectionDataModels = NSMutableArray(array: sectionDataModels)
    }

    // MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}


//if #available(iOS 14.0, *) {
//    
//} else {
//    let tsview = UIView()
//    tsview.cqts_addPromptText("需要 iOS 14.0+", layout: .center, height: 20)
//    return tsview
//}
